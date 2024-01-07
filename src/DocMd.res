// NOTE: how are aliases/references to different files handled?

module Lang = {
  let deprecated = "DEPRECATED"
}

let title: (string, ~level: int=?) => Markdown.t = (txt, ~level=1) => {
  Markdown.heading(level)(txt)
}

let renderId: (~stripRoot: bool=?, string) => string = (~stripRoot=false, txt) => {
  stripRoot ? txt->String.substringToEnd(~start=txt->String.indexOf(".") + 1) : txt
}

let deprecationWarning: (Markdown.t, option<string>) => Markdown.t = (md, deprecated) => {
  open Markdown
  md->append(
    deprecated->Option.mapOr(empty(), deprecated =>
      `${Lang.deprecated}: ${deprecated}`->bold->line->line
    ),
  )
}

let corretDocStringHeadingLevel: (~level: int=?, string) => string = (~level=0, txt) => {
  txt
  ->String.split("\n")
  ->Array.map(line => {
    let trimmedLine = line->String.trimStart
    let headingLevel = trimmedLine->Markdown.headingLevel
    let missingLevels = {
      let diff = level - headingLevel + 1
      headingLevel <= 0 || diff < 0 ? 0 : diff
    }

    String.repeat("#", missingLevels) ++ trimmedLine
  })
  ->Array.joinWith("\n")
}

let moduleDocs: (Markdown.t, ~level: int=?, array<string>) => Markdown.t = (md, ~level=0, docs) => {
  open Markdown

  md->append(
    // NOTE: has Core.Array.reduce wrong docs??? f / init switched?
    docs->Array.reduce(empty(), (md, txt) =>
      md->append(txt->corretDocStringHeadingLevel(~level)->p)
    ),
  )
}

let renderItem: (
  ~id: string,
  ~name: string,
  ~level: int,
  ~docstrings: array<string>,
  ~deprecated: string=?,
  ~detail: RescriptTools.Docgen.detail=?,
  ~signature: string=?,
  unit,
) => Markdown.t = (
  ~id as _,
  ~name,
  ~level,
  ~docstrings,
  ~deprecated=?,
  ~detail as _=?,
  ~signature=?,
  _unit,
) => {
  open Markdown

  title(name, ~level)
  ->deprecationWarning(deprecated)
  ->appendO(signature->Option.map(s => s->quote))
  ->moduleDocs(docstrings, ~level)
  // TODO: fully implement
}

let rec itemDoc: RescriptTools.Docgen.item => Markdown.t = item =>
  switch item {
  | Value({id, docstrings, signature, name: _, ?deprecated}) =>
    renderItem(
      ~id,
      ~name=`let ${id->renderId}`,
      ~deprecated?,
      ~docstrings,
      ~signature,
      ~level=3,
      (),
    )
  | Type({id, docstrings, signature, name: _, ?deprecated, ?detail}) =>
    renderItem(
      ~id,
      ~name=`type ${id->renderId}`,
      ~deprecated?,
      ~docstrings,
      ~signature,
      ~detail?,
      ~level=3,
      (),
    )
  | Module({id, docstrings, ?deprecated, name: _, items}) =>
    renderItem(
      ~id,
      ~name=`module ${id->renderId}`,
      ~deprecated?,
      ~docstrings,
      ~level=2,
      (),
    )->itemDocs(items)
  | ModuleAlias({id, docstrings, name: _, items}) =>
    renderItem(~id, ~name=`module ${id->renderId} \`alias\``, ~docstrings, ~level=2, ())->itemDocs(
      items,
    )
  }
and itemDocs: (Markdown.t, array<RescriptTools.Docgen.item>) => Markdown.t = (md, items) => {
  open Markdown
  md->append(items->Array.reduce(empty(), (md, item) => md->append(itemDoc(item))))
}

let render = ({RescriptTools.Docgen.name: name, deprecated, docstrings, items}) => {
  title(name)
  ->deprecationWarning(deprecated)
  ->moduleDocs(docstrings)
  ->itemDocs(items)
}

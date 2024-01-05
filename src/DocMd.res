// NOTE: how are aliases/references to different files handled?

module Lang = {
  let deprecated = "DEPRECATED"
}

let title: (string, ~level: int=?) => Markdown.t = (txt, ~level=0) => {
  open Markdown
  switch level {
  | 0 => txt->h1
  | 1 => txt->h2
  | 2 => txt->h3
  | 3 => txt->h4
  | 4 => txt->h5
  | _ => txt->h6
  }
}

let renderId: (~stripRoot: bool=?, string) => string = (~stripRoot=false, txt) => {
  stripRoot ? txt->String.substringToEnd(~start=txt->String.indexOf(".") + 1) : txt
}

let deprecationWarning: (Markdown.t, option<string>) => Markdown.t = (md, deprecated) => {
  md->Markdown.cmb(
    deprecated->Option.mapOr(Markdown.empty(), deprecated =>
      `${Lang.deprecated}: ${deprecated}`->Markdown.bold->Markdown.line->Markdown.line
    ),
  )
}

let moduleDocs: (Markdown.t, array<string>) => Markdown.t = (md, docs) =>
  md->Markdown.cmb(
    // NOTE: has Core.Array.reduce wrong docs??? f / init switched?
    docs->Array.reduce(Markdown.empty(), (md, txt) => md->Markdown.cmb(txt->Markdown.p)),
  )

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
  ->cmbO(signature->Option.map(s => s->quote))
  ->moduleDocs(docstrings)
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
      ~level=2,
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
      ~level=2,
      (),
    )
  | Module({id, docstrings, ?deprecated, name: _, items}) =>
    renderItem(
      ~id,
      ~name=`module ${id->renderId}`,
      ~deprecated?,
      ~docstrings,
      ~level=1,
      (),
    )->itemDocs(items)
  | ModuleAlias({id, docstrings, name: _, items}) =>
    renderItem(~id, ~name=`module ${id->renderId} \`alias\``, ~docstrings, ~level=1, ())->itemDocs(
      items,
    )
  }
and itemDocs: (Markdown.t, array<RescriptTools.Docgen.item>) => Markdown.t = (md, items) => {
  md->Markdown.cmb(
    items->Array.reduce(Markdown.empty(), (md, item) => md->Markdown.cmb(itemDoc(item))),
  )
}

let toMd = ({RescriptTools.Docgen.name: name, deprecated, docstrings, items}) => {
  // TODO: ensure ordering of items: value/type first and then module(aliases)
  title(name)->deprecationWarning(deprecated)->moduleDocs(docstrings)->itemDocs(items)
}

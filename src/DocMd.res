// NOTE: how are aliases/references to different files handled?

module type RenderTemplates = {
  type t
  let empty: unit => t
  let append: (t, t) => t
  let appendO: (t, option<t>) => t
  let heading: int => string => t
  let line: t => t
  let p: string => t
  let bold: string => t
  let quote: string => t
}

module Lang = {
  let deprecated = "DEPRECATED"
}

let title:
  type target. (
    string,
    ~templates: module(RenderTemplates with type t = target),
    ~level: int=?,
  ) => target =
  (txt, ~templates, ~level=1) => {
    module Templates = unpack(templates)
    Templates.heading(level)(txt)
  }

let renderId: (~stripRoot: bool=?, string) => string = (~stripRoot=false, txt) => {
  stripRoot ? txt->String.substringToEnd(~start=txt->String.indexOf(".") + 1) : txt
}

let deprecationWarning:
  type target. (
    target,
    ~templates: module(RenderTemplates with type t = target),
    option<string>,
  ) => target =
  (md, ~templates, deprecated) => {
    module Templates = unpack(templates)
    md->Templates.append(
      deprecated->Option.mapOr(Templates.empty(), deprecated =>
        `${Lang.deprecated}: ${deprecated}`->Templates.bold->Templates.line->Templates.line
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

let moduleDocs:
  type target. (
    target,
    ~templates: module(RenderTemplates with type t = target),
    ~level: int=?,
    array<string>,
  ) => target =
  (md, ~templates, ~level=0, docs) => {
    module Templates = unpack(templates)

    md->Templates.append(
      // NOTE: has Core.Array.reduce wrong docs??? f / init switched?
      docs->Array.reduce(Templates.empty(), (md, txt) =>
        md->Templates.append(txt->corretDocStringHeadingLevel(~level)->Templates.p)
      ),
    )
  }

let renderItem:
  type target. (
    ~templates: module(RenderTemplates with type t = target),
    ~id: string,
    ~name: string,
    ~level: int,
    ~docstrings: array<string>,
    ~deprecated: string=?,
    ~detail: RescriptTools.Docgen.detail=?,
    ~signature: string=?,
    unit,
  ) => target =
  (
    ~templates,
    ~id as _,
    ~name,
    ~level,
    ~docstrings,
    ~deprecated=?,
    ~detail as _=?,
    ~signature=?,
    _unit,
  ) => {
    module Templates = unpack(templates)

    title(name, ~templates, ~level)
    ->deprecationWarning(deprecated, ~templates)
    ->Templates.appendO(signature->Option.map(s => s->Templates.quote))
    ->moduleDocs(docstrings, ~templates, ~level)
    // TODO: fully implement
  }

let rec itemDoc:
  type target. (
    RescriptTools.Docgen.item,
    ~templates: module(RenderTemplates with type t = target),
  ) => target =
  (item, ~templates) =>
    switch item {
    | Value({id, docstrings, signature, name: _, ?deprecated}) =>
      renderItem(
        ~templates,
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
        ~templates,
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
        ~templates,
        ~id,
        ~name=`module ${id->renderId}`,
        ~deprecated?,
        ~docstrings,
        ~level=2,
        (),
      )->itemDocs(items, ~templates)
    | ModuleAlias({id, docstrings, name: _, items}) =>
      renderItem(
        ~templates,
        ~id,
        ~name=`module ${id->renderId} \`alias\``,
        ~docstrings,
        ~level=2,
        (),
      )->itemDocs(items, ~templates)
    }
and itemDocs:
  type target. (
    target,
    ~templates: module(RenderTemplates with type t = target),
    array<RescriptTools.Docgen.item>,
  ) => target =
  (md, ~templates, items) => {
    module Templates = unpack(templates)
    md->Templates.append(
      items->Array.reduce(Templates.empty(), (md, item) =>
        md->Templates.append(itemDoc(item, ~templates))
      ),
    )
  }

let render = ({RescriptTools.Docgen.name: name, deprecated, docstrings, items}, ~templates) => {
  title(name, ~templates)
  ->deprecationWarning(deprecated, ~templates)
  ->moduleDocs(docstrings, ~templates)
  ->itemDocs(items, ~templates)
}

let renderMd = doc => render(doc, ~templates=module(Markdown))

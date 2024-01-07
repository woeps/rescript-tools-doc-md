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

let render: (
  RescriptTools.Docgen.doc,
  ~templates: module(RenderTemplates with type t = 'target),
) => 'target

let renderMd: RescriptTools.Docgen.doc => Markdown.t

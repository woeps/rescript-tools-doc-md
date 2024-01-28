/*
 * NOTE: how are aliases/references to different files handled?
 * - see: https://github.com/rescript-lang/rescript-vscode/issues/886
 */

module Lang = {
  let deprecated = "DEPRECATED"
}

let title: (string, ~level: int=?) => Markdown.t = (txt, ~level=1) => {
  open Markdown
  heading(level)(txt->make)
}

let renderId: (~stripRoot: bool=?, string) => string = (~stripRoot=false, txt) => {
  stripRoot ? txt->String.substringToEnd(~start=txt->String.indexOf(".") + 1) : txt
}

let renderDeprecationWarning: (Markdown.t, option<string>) => Markdown.t = (md, deprecated) => {
  open Markdown
  md->append(
    deprecated->Option.mapOr(empty(), deprecated =>
      `${Lang.deprecated}:`->make->emph->append(` ${deprecated}`->make)->forceLine
    ),
  )
}

let corretDocStringHeadingLevel: (~level: int=?, string) => string = (~level=0, txt) => {
  txt
  ->String.split("\n")
  ->Array.map(line => {
    let headingLevel = line->Markdown.headingLevel
    let missingLevels = {
      let diff = level - headingLevel + 1
      headingLevel <= 0 || diff < 0 ? 0 : diff
    }

    String.repeat("#", missingLevels) ++ line
  })
  ->Array.joinWith("\n")
}

let renderDocStrings: (Markdown.t, ~level: int=?, array<string>) => Markdown.t = (
  md,
  ~level=0,
  docs,
) => {
  open Markdown

  md->append(
    // NOTE: has Core.Array.reduce wrong docs??? f / init switched?
    docs->Array.reduce(empty(), (md, txt) =>
      md->append(txt->corretDocStringHeadingLevel(~level)->make->p)
    ),
  )
}

let renderSignature: string => Markdown.t = sig => {
  open Markdown
  sig
  ->make(~escape=false)
  //->String.split("\n")
  //->Array.map(line => line->make->forceLine)
  //->Array.reduce(empty(), append)
  ->codeBlock(~syntax="rescript")
}

let renderRecordFields: array<RescriptTools.Docgen.field> => Markdown.t = fields => {
  open Markdown
  fields->Array.reduce(empty(), (md, {name, docstrings, signature, optional, ?deprecated}) => {
    md->append(
      "Record Field:"
      ->make
      ->bold
      ->p
      ->append(
        renderSignature(`${name}: ${signature}`)
        ->appendO(optional ? " "->make->append("optional"->make->emph->forceLine)->Some : None)
        ->renderDeprecationWarning(deprecated)
        ->renderDocStrings(~level=4, docstrings),
      ),
    )
  })
}

let renderVariantConstructorPayload: RescriptTools.Docgen.constructorPayload => Markdown.t = payload => {
  switch payload {
  | InlineRecord({fields}) => fields->renderRecordFields
  }
}

let renderVariantConstructors: array<
  RescriptTools.Docgen.constructor,
> => Markdown.t = constructors => {
  open Markdown

  constructors->Array.reduce(empty(), (
    md,
    {name: _, docstrings, signature, ?deprecated, ?payload},
  ) => {
    md->append(
      "Variant Constructor:"
      ->make
      ->bold
      ->p
      ->append(
        renderSignature(signature)
        ->renderDeprecationWarning(deprecated)
        ->renderDocStrings(~level=4, docstrings)
        ->appendO(payload->Option.map(payload => payload->renderVariantConstructorPayload)),
      ),
    )
  })
}

let renderDetails: RescriptTools.Docgen.detail => Markdown.t = details => {
  switch details {
  | Record({items}) => items->renderRecordFields
  | Variant({items}) => items->renderVariantConstructors
  }
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
  ~detail=?,
  ~signature=?,
  _unit,
) => {
  open Markdown

  title(name, ~level)
  ->renderDeprecationWarning(deprecated)
  ->appendO(signature->Option.map(renderSignature))
  ->renderDocStrings(docstrings, ~level)
  ->appendO(detail->Option.map(d => d->renderDetails))
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
  ->renderDeprecationWarning(deprecated)
  ->renderDocStrings(docstrings)
  ->itemDocs(items)
}

type t

let make: (~escape: bool=?, string) => t
let makeUnescaped: string => t
external toString: t => string = "%identity"

let append: (t, t) => t
let appendO: (t, option<t>) => t

let empty: unit => t
let line: t => t
let forceLine: t => t

let heading: int => t => t

let headingLevel: string => int
let mdHeadingLevel: t => int

let bold: t => t
let emph: t => t
let p: t => t
let quote: t => t
let inlineCode: t => t
let codeBlock: (~syntax: string=?, t) => t

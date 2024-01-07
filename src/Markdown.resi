type t

external make: string => t = "%identity"
external toString: t => string = "%identity"

let append: (t, t) => t
let appendO: (t, option<t>) => t

let empty: unit => t
let line: t => t

let heading: int => string => t

let headingLevel: string => int
let mdHeadingLevel: t => int

let bold: string => t
let p: string => t
let quote: string => t

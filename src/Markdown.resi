type t

external make: string => t = "%identity"
external toString: t => string = "%identity"

let cmb: (t, t) => t
let cmbO: (t, option<t>) => t

let empty: unit => t
let line: t => t

let h1: string => t
let h2: string => t
let h3: string => t
let h4: string => t
let h5: string => t
let h6: string => t

let bold: string => t
let p: string => t
let quote: string => t

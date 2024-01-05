type t = string

external make: string => t = "%identity"
external toString: t => string = "%identity"

let cmb = (a, b) =>
  switch (a, b) {
  | ("", b) => b
  | (a, "") => a
  | _ => a ++ b
  }
let cmbO = (a, b) => b->Belt.Option.mapWithDefault(a, b => cmb(a, b))

let empty = () => ""

let br = "\n"
let line: t => t = line => line ++ br

let bold = txt => `**${txt}**`
let p = txt => txt->line->line
let quote = txt => txt->String.split("\n")->Array.map(line => `> ${line}`)->Array.joinWith("\n")->p

let h1 = txt => `# ${txt}`->p
let h2 = txt => `## ${txt}`->p
let h3 = txt => `### ${txt}`->p
let h4 = txt => `#### ${txt}`->p
let h5 = txt => `##### ${txt}`->p
let h6 = txt => `###### ${txt}`->p

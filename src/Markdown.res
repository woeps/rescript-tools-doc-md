type t = string

let make = txt => txt->String.replaceAll("<", "\\<")->String.replaceAll(">", "\\>")
let makeUnescaped = txt => txt

external toString: t => string = "%identity"

let append = (a, b) =>
  switch (a, b) {
  | ("", b) => b
  | (a, "") => a
  | _ => a ++ b
  }
let appendO = (a, b) => b->Belt.Option.mapWithDefault(a, b => append(a, b))

let empty = () => ""

let br = "\n"
let line = line => line ++ br
let forceLine = line => line ++ "  " ++ br

let bold = txt => `**${txt}**`
let emph = txt => `*${txt}*`
let p = txt => txt->line->line
let quote = txt => txt->String.split("\n")->Array.map(line => `> ${line}`)->Array.joinWith("\n")->p
let inlineCode = txt => "`" ++ txt ++ "`"

let h1 = txt => `# ${txt}`->p
let h2 = txt => `## ${txt}`->p
let h3 = txt => `### ${txt}`->p
let h4 = txt => `#### ${txt}`->p
let h5 = txt => `##### ${txt}`->p
let h6 = txt => `###### ${txt}`->p
let heading = level => {
  switch level {
  | 0 => p
  | 1 => h1
  | 2 => h2
  | 3 => h3
  | 4 => h4
  | 5 => h5
  | 6 => h6
  | _ => txt => txt->bold->p
  }
}

let headingLevel = (txt: string) => {
  let level = ref(0)
  let break = ref(false)
  while level.contents <= txt->String.length && !break.contents {
    if txt->String.charAt(level.contents) == "#" {
      level := level.contents + 1
    } else {
      break := true
    }
  }
  level.contents
}

let mdHeadingLevel = headingLevel

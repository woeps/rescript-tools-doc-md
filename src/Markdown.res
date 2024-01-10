type t = string

let make = (~escape=true, txt) => {
  // TODO: don't escape inside of md codeblocks
  let escaped = if escape {
    let inCodeBlock = ref(false)

    txt
    ->String.split("\n")
    ->Array.map(line => {
      line->String.startsWith("```") ? inCodeBlock := !inCodeBlock.contents : ()
      inCodeBlock.contents
        ? line
        : line
          ->String.replaceAll("<", "\\<")
          ->String.replaceAll(">", "\\>")
    })
    ->Array.joinWith("\n")
  } else {
    txt
  }
  escaped->String.replaceAll("\\n", "\n")
}

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
let codeBlock = (~syntax=?, txt) => "```" ++ syntax->Option.getOr("") ++ "\n" ++ txt ++ "\n```"->p

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

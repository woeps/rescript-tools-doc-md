if Node.process.argv->Array.length < 4 || Node.process.argv->Array.length > 5 {
  Console.log("you need to pass 2-3 arguments! [res(i) file to parse and output file]")
  Console.log("e.g: node GenerateDocsMd.bs.js <rescript-file> <output-file>")
  Node.process.exit(1)
}

let resFile = Node.process.argv->Array.getUnsafe(2)
let outFile = Node.process.argv->Array.getUnsafe(3)

let outputJson = Node.process.argv->Array.get(4)->Option.mapOr(false, flag => flag == "-json")

let res = Node.spawnSync("npx", ["rescript-tools", "doc", resFile], {encoding: "utf-8"})

if res.error->Option.isSome {
  Console.error2("ERROR:", res.error->Option.getExn)
} else {
  let doc = res.stdout->JSON.parseExn->RescriptTools.Docgen.decodeFromJson->DocMd.render

  Node.writeFileSync(
    outFile,
    ` ${doc->Markdown.toString}

# JSON

\`\`\`json
${res.stdout}
\`\`\`
`,
  )
}

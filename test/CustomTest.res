open Node
let path = join(__dirname, "./ExampleDoc.json")

let doc = readFileSync(path)->JSON.parseExn->RescriptTools.Docgen.decodeFromJson->DocMd.render
Console.log(doc)

open Node
let path = join(__dirname, "./CoreDoc.json")

let doc = readFileSync(path)->JSON.parseExn->RescriptTools.Docgen.decodeFromJson->DocMd.toMd
Console.log(doc)

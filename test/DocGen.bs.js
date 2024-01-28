// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var DocMd = require("../src/DocMd.bs.js");
var Core__Option = require("@rescript/core/src/Core__Option.bs.js");
var Tools_Docgen = require("@rescript/tools/npm/Tools_Docgen.bs.js");
var Child_process = require("child_process");

if (process.argv.length < 4 || process.argv.length > 5) {
  console.log("you need to pass 2-3 arguments! [res(i) file to parse and output file]");
  console.log("e.g: node GenerateDocsMd.bs.js <rescript-file> <output-file>");
  process.exit(1);
}

var resFile = process.argv[2];

var outFile = process.argv[3];

var outputJson = Core__Option.mapOr(process.argv[4], false, (function (flag) {
        return flag === "-json";
      }));

var res = Child_process.spawnSync("npx", [
      "rescript-tools",
      "doc",
      resFile
    ], {
      encoding: "utf-8"
    });

if (Core__Option.isSome(res.error)) {
  console.error("ERROR:", Core__Option.getExn(res.error));
} else {
  var doc = DocMd.render(Tools_Docgen.decodeFromJson(JSON.parse(res.stdout)));
  Fs.writeFileSync(outFile, " " + doc + "\n\n# JSON\n\n\`\`\`json\n" + res.stdout + "\n\`\`\`\n");
}

exports.resFile = resFile;
exports.outFile = outFile;
exports.outputJson = outputJson;
exports.res = res;
/*  Not a pure module */
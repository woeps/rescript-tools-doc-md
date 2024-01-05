// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Path = require("path");
var DocMd = require("../src/DocMd.res.js");
var Tools_Docgen = require("@rescript/tools/src/Tools_Docgen.res.js");

var path = Path.join(__dirname, "./CoreDoc.json");

var doc = DocMd.toMd(Tools_Docgen.decodeFromJson(JSON.parse(Fs.readFileSync(path, "utf8"))));

console.log(doc);

exports.path = path;
exports.doc = doc;
/* path Not a pure module */
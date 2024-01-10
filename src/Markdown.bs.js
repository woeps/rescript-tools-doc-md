// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Belt_Option = require("rescript/lib/js/belt_Option.js");

function make(txt) {
  return txt.replaceAll("<", "\\<").replaceAll(">", "\\>");
}

function makeUnescaped(txt) {
  return txt;
}

function append(a, b) {
  if (a === "") {
    return b;
  } else if (b === "") {
    return a;
  } else {
    return a + b;
  }
}

function appendO(a, b) {
  return Belt_Option.mapWithDefault(b, a, (function (b) {
                return append(a, b);
              }));
}

function empty() {
  return "";
}

var br = "\n";

function line(line$1) {
  return line$1 + br;
}

function forceLine(line) {
  return line + "  " + br;
}

function bold(txt) {
  return "**" + txt + "**";
}

function emph(txt) {
  return "*" + txt + "*";
}

function p(txt) {
  return line(line(txt));
}

function quote(txt) {
  return p(txt.split("\n").map(function (line) {
                    return "> " + line;
                  }).join("\n"));
}

function inlineCode(txt) {
  return "`" + txt + "`";
}

function h1(txt) {
  return p("# " + txt);
}

function h2(txt) {
  return p("## " + txt);
}

function h3(txt) {
  return p("### " + txt);
}

function h4(txt) {
  return p("#### " + txt);
}

function h5(txt) {
  return p("##### " + txt);
}

function h6(txt) {
  return p("###### " + txt);
}

function heading(level) {
  switch (level) {
    case 0 :
        return p;
    case 1 :
        return h1;
    case 2 :
        return h2;
    case 3 :
        return h3;
    case 4 :
        return h4;
    case 5 :
        return h5;
    case 6 :
        return h6;
    default:
      return function (txt) {
        return p(bold(txt));
      };
  }
}

function headingLevel(txt) {
  var level = 0;
  var $$break = false;
  while(level <= txt.length && !$$break) {
    if (txt.charAt(level) === "#") {
      level = level + 1 | 0;
    } else {
      $$break = true;
    }
  };
  return level;
}

var mdHeadingLevel = headingLevel;

exports.make = make;
exports.makeUnescaped = makeUnescaped;
exports.append = append;
exports.appendO = appendO;
exports.empty = empty;
exports.line = line;
exports.forceLine = forceLine;
exports.heading = heading;
exports.headingLevel = headingLevel;
exports.mdHeadingLevel = mdHeadingLevel;
exports.bold = bold;
exports.emph = emph;
exports.p = p;
exports.quote = quote;
exports.inlineCode = inlineCode;
/* No side effect */
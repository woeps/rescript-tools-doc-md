// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';


function toString(x) {
  return x;
}

var $$String = {
  toString: toString
};

function toString$1(x) {
  return x.toString();
}

var Int = {
  toString: toString$1
};

function MakeLogger(I) {
  var log = function (x) {
    console.log(I.toString(x));
  };
  return {
          log: log
        };
}

function log(x) {
  console.log(x);
}

var StringLogger = {
  log: log
};

function log$1(x) {
  console.log(x.toString());
}

var IntLogger = {
  log: log$1
};

function toString$2(x) {
  if (x === "Yes") {
    return "Yes";
  } else {
    return "No";
  }
}

var Var = {
  toString: toString$2
};

function log$2(x) {
  console.log(toString$2(x));
}

var Included = {
  log: log$2
};

exports.$$String = $$String;
exports.Int = Int;
exports.MakeLogger = MakeLogger;
exports.StringLogger = StringLogger;
exports.IntLogger = IntLogger;
exports.Var = Var;
exports.Included = Included;
/* No side effect */
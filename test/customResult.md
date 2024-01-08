
> rescript-tools-doc-md@0.0.0 customTest
> node ./test/CustomTest.res.js

# ExampleModule

This is an example module.

## module ExampleModule.Variants

### type ExampleModule.Variants.t

> type t =\n  | First\n  | Second(int)\n  | Third({hello: string, goodbye: bool})\n  | Fourth(bool, string, int)

represents the variant

> First

first variant constructor without payload

> Second(int)

second variant with int payload

> Third

third constructor with inline record

> Fourth(bool, string, int)

with several payload arguments

## module ExampleModule.Record

### type ExampleModule.Record.sub

> type sub = {x: bool}

this is a record

> x: bool

representing a bool value

### type ExampleModule.Record.t

> type t = {\n  a: string,\n  b: int,\n  optRecord?: sub,\n  optStr?: string,\n}

this is another record

> a: string

prop a

> b: int

*DEPRECATED:* use sub instead  
deprecated prop

> optRecord: option\<sub\>

 *optional*  
this is an optional field of another record

> optStr: option\<string\>

 *optional*  
this is an optional string

## module ExampleModule.Minimal_OptionalRecord

### type ExampleModule.Minimal_OptionalRecord.t

> type t = {optStr?: string}

> optStr: option\<string\>

 *optional*  


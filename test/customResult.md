
> rescript-tools-doc-md@0.0.0 customTest
> node ./test/CustomTest.bs.js

# ExampleModule

This is an example module.

## module ExampleModule.Variants

module of variants

### type ExampleModule.Variants.t

> type t =
>   | First
>   | Second(int)
>   | Third({hello: string, goodbye: bool})
>   | Fourth(bool, string, int)

represents the variant

> First

first variant constructor without payload

> Second(int)

second variant with int payload

> Third({hello: string, goodbye: bool})

third constructor with inline record

> hello: string

hello prop

> goodbye: bool

goddbye prop

> Fourth(bool, string, int)

with several payload arguments

## module ExampleModule.Record

module to test record docs

### type ExampleModule.Record.sub

> type sub = {x: bool}

this is a record

> x: bool

representing a bool value

### type ExampleModule.Record.t

> type t = {
>   a: string,
>   b: int,
>   optRecord?: sub,
>   optStr?: string,
> }

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


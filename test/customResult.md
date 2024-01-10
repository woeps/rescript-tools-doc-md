
> rescript-tools-doc-md@0.0.0 customTest
> node ./test/CustomTest.bs.js

# ExampleModule

This is an example module.

## module ExampleModule.Variants

module of variants

### type ExampleModule.Variants.t

```rescript
type t =
  | First
  | Second(int)
  | Third({hello: string, goodbye: bool})
  | Fourth(bool, string, int)
```

represents the variant

**Variant Constructor:**

```rescript
First
```

first variant constructor without payload

**Variant Constructor:**

```rescript
Second(int)
```

second variant with int payload

**Variant Constructor:**

```rescript
Third({hello: string, goodbye: bool})
```

third constructor with inline record

**Record Field:**

```rescript
hello: string
```

hello prop

**Record Field:**

```rescript
goodbye: bool
```

goddbye prop

**Variant Constructor:**

```rescript
Fourth(bool, string, int)
```

with several payload arguments

## module ExampleModule.Record

module to test record docs

### type ExampleModule.Record.sub

```rescript
type sub = {x: bool}
```

this is a record

**Record Field:**

```rescript
x: bool
```

representing a bool value

### type ExampleModule.Record.t

```rescript
type t = {
  a: string,
  b: int,
  optRecord?: sub,
  optStr?: string,
}
```

this is another record

**Record Field:**

```rescript
a: string
```

prop a

**Record Field:**

```rescript
b: int
```

*DEPRECATED:* use sub instead  
deprecated prop

**Record Field:**

```rescript
optRecord: option<sub>
```

 *optional*  
this is an optional field of another record

**Record Field:**

```rescript
optStr: option<string>
```

 *optional*  
this is an optional string

## module ExampleModule.Minimal_OptionalRecord

### type ExampleModule.Minimal_OptionalRecord.t

```rescript
type t = {optStr?: string}
```

**Record Field:**

```rescript
optStr: option<string>
```

 *optional*  


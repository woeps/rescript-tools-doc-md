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


# JSON

```json

{
  "name": "ExampleModule",
  "docstrings": ["This is an example module."],
  "items": [
  {
    "id": "ExampleModule.Variants",
    "name": "Variants",
    "kind": "module",
    "docstrings": ["module of variants"],
    "items": [
    {
      "id": "ExampleModule.Variants.t",
      "kind": "type",
      "name": "t",
      "signature": "type t =\n  | First\n  | Second(int)\n  | Third({hello: string, goodbye: bool})\n  | Fourth(bool, string, int)",
      "docstrings": ["represents the variant"],
      "detail": 
      {
        "kind": "variant",
        "items": [
        {
          "name": "First",
          "docstrings": ["first variant constructor without payload"],
          "signature": "First"
        }, 
        {
          "name": "Second",
          "docstrings": ["second variant with int payload"],
          "signature": "Second(int)"
        }, 
        {
          "name": "Third",
          "docstrings": ["third constructor with inline record"],
          "signature": "Third({hello: string, goodbye: bool})",
          "payload": {
            "kind": "inlineRecord",
            "fields": [{
              "name": "hello",
              "optional": false,
              "docstrings": ["hello prop"],
              "signature": "string"
            }, {
              "name": "goodbye",
              "optional": false,
              "docstrings": ["goddbye prop"],
              "signature": "bool"
            }]
          }
        }, 
        {
          "name": "Fourth",
          "docstrings": ["with several payload arguments"],
          "signature": "Fourth(bool, string, int)"
        }]
      }
    }]
  }, 
  {
    "id": "ExampleModule.Record",
    "name": "Record",
    "kind": "module",
    "docstrings": ["module to test record docs"],
    "items": [
    {
      "id": "ExampleModule.Record.sub",
      "kind": "type",
      "name": "sub",
      "signature": "type sub = {x: bool}",
      "docstrings": ["this is a record"],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "x",
          "optional": false,
          "docstrings": ["representing a bool value"],
          "signature": "bool"
        }]
      }
    }, 
    {
      "id": "ExampleModule.Record.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = {\n  a: string,\n  b: int,\n  optRecord?: sub,\n  optStr?: string,\n}",
      "docstrings": ["this is another record"],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "a",
          "optional": false,
          "docstrings": ["prop a"],
          "signature": "string"
        }, {
          "name": "b",
          "deprecated": "use sub instead",
          "optional": false,
          "docstrings": ["deprecated prop"],
          "signature": "int"
        }, {
          "name": "optRecord",
          "optional": true,
          "docstrings": ["this is an optional field of another record"],
          "signature": "option<sub>"
        }, {
          "name": "optStr",
          "optional": true,
          "docstrings": ["this is an optional string"],
          "signature": "option<string>"
        }]
      }
    }]
  }, 
  {
    "id": "ExampleModule.Minimal_OptionalRecord",
    "name": "Minimal_OptionalRecord",
    "kind": "module",
    "docstrings": [],
    "items": [
    {
      "id": "ExampleModule.Minimal_OptionalRecord.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = {optStr?: string}",
      "docstrings": [],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "optStr",
          "optional": true,
          "docstrings": [],
          "signature": "option<string>"
        }]
      }
    }]
  }]
}

```

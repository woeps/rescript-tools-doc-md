 # ModuleType

extracted docs don't give a hint, that Example is not an implementation, but a module type

module M is missing in extracted docs

## module ModuleType.Example

### type ModuleType.Example.t

```rescript
type t
```

main type of this module

### let ModuleType.Example.f

```rescript
let f: (. t) => t
```

function from t to t

## module ModuleType.Z

### type ModuleType.Z.t

```rescript
type t = string
```

### let ModuleType.Z.toString

```rescript
let toString: (. 'a) => 'a
```



# JSON

```json

{
  "name": "ModuleType",
  "docstrings": ["extracted docs don't give a hint, that Example is not an implementation, but a module type\n\nmodule M is missing in extracted docs"],
  "items": [
  {
    "id": "ModuleType.Example",
    "name": "Example",
    "kind": "module",
    "docstrings": [],
    "items": [
    {
      "id": "ModuleType.Example.t",
      "kind": "type",
      "name": "t",
      "signature": "type t",
      "docstrings": ["main type of this module"]
    }, 
    {
      "id": "ModuleType.Example.f",
      "kind": "value",
      "name": "f",
      "signature": "let f: (. t) => t",
      "docstrings": ["function from t to t"]
    }]
  }, 
  {
    "id": "ModuleType.Z",
    "name": "Z",
    "kind": "module",
    "docstrings": [],
    "items": [
    {
      "id": "ModuleType.Z.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = string",
      "docstrings": []
    }, 
    {
      "id": "ModuleType.Z.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. 'a) => 'a",
      "docstrings": []
    }]
  }]
}

```

 # Functor

this module provides "convenient" utilities for logging  
NOTE: this is not a good example of a functor,
    but just to test docgen for functors

## module Functor.Input

### type Functor.Input.t

```rescript
type t
```

type of the input

### let Functor.Input.toString

```rescript
let toString: (. t) => string
```

converts the input to a string

## module Functor.Logger

### type Functor.Logger.t

```rescript
type t
```

type of the input

### let Functor.Logger.log

```rescript
let log: (. t) => unit
```

logs the input

## module Functor.String

input module of the functor to hanle strings

### type Functor.String.t

```rescript
type t = string
```

type of the input

### let Functor.String.toString

```rescript
let toString: (. t) => t
```

converts the input to a string

## module Functor.Int

input module of the functor to handle integers

### type Functor.Int.t

```rescript
type t = int
```

type of the input

### let Functor.Int.toString

```rescript
let toString: (. t) => string
```

converts the input to a string

## module Functor.MakeLogger

### let Functor.MakeLogger.log

```rescript
let log: (. I.t) => unit
```

logs the input

## module Functor.StringLogger `alias`

* the module that contains the functions to log strings

## module Functor.IntLogger `alias`

* the module that contains the functions to log integers

## module Functor.Var

another input module for the Logger functor to handle a Variant of type type

### type Functor.Var.t

```rescript
type t = Yes | No
```

type of the input

**Variant Constructor:**

```rescript
Yes
```

**Variant Constructor:**

```rescript
No
```

### let Functor.Var.toString

```rescript
let toString: (. t) => string
```

converts the input to a string

## module Functor.Included

module which includes the Var Logger!

### let Functor.Included.log

```rescript
let log: (. Var.t) => unit
```

logs the input



# JSON

```json

{
  "name": "Functor",
  "docstrings": ["this module provides \"convenient\" utilities for logging  \nNOTE: this is not a good example of a functor,\n    but just to test docgen for functors"],
  "items": [
  {
    "id": "Functor.Input",
    "name": "Input",
    "kind": "module",
    "docstrings": [],
    "items": [
    {
      "id": "Functor.Input.t",
      "kind": "type",
      "name": "t",
      "signature": "type t",
      "docstrings": ["type of the input"]
    }, 
    {
      "id": "Functor.Input.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t) => string",
      "docstrings": ["converts the input to a string"]
    }]
  }, 
  {
    "id": "Functor.Logger",
    "name": "Logger",
    "kind": "module",
    "docstrings": [],
    "items": [
    {
      "id": "Functor.Logger.t",
      "kind": "type",
      "name": "t",
      "signature": "type t",
      "docstrings": ["type of the input"]
    }, 
    {
      "id": "Functor.Logger.log",
      "kind": "value",
      "name": "log",
      "signature": "let log: (. t) => unit",
      "docstrings": ["logs the input"]
    }]
  }, 
  {
    "id": "Functor.String",
    "name": "String",
    "kind": "module",
    "docstrings": ["input module of the functor to hanle strings"],
    "items": [
    {
      "id": "Functor.String.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = string",
      "docstrings": ["type of the input"]
    }, 
    {
      "id": "Functor.String.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t) => t",
      "docstrings": ["converts the input to a string"]
    }]
  }, 
  {
    "id": "Functor.Int",
    "name": "Int",
    "kind": "module",
    "docstrings": ["input module of the functor to handle integers"],
    "items": [
    {
      "id": "Functor.Int.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = int",
      "docstrings": ["type of the input"]
    }, 
    {
      "id": "Functor.Int.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t) => string",
      "docstrings": ["converts the input to a string"]
    }]
  }, 
  {
    "id": "Functor.MakeLogger",
    "name": "MakeLogger",
    "kind": "module",
    "docstrings": [],
    "items": [
    {
      "id": "Functor.MakeLogger.log",
      "kind": "value",
      "name": "log",
      "signature": "let log: (. I.t) => unit",
      "docstrings": ["logs the input"]
    }]
  }, 
  {
    "id": "Functor.StringLogger",
    "kind": "moduleAlias",
    "name": "StringLogger",
    "docstrings": ["* the module that contains the functions to log strings"],
    "items": []
  }, 
  {
    "id": "Functor.IntLogger",
    "kind": "moduleAlias",
    "name": "IntLogger",
    "docstrings": ["* the module that contains the functions to log integers"],
    "items": []
  }, 
  {
    "id": "Functor.Var",
    "name": "Var",
    "kind": "module",
    "docstrings": ["another input module for the Logger functor to handle a Variant of type type"],
    "items": [
    {
      "id": "Functor.Var.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Yes | No",
      "docstrings": ["type of the input"],
      "detail": 
      {
        "kind": "variant",
        "items": [
        {
          "name": "Yes",
          "docstrings": [],
          "signature": "Yes"
        }, 
        {
          "name": "No",
          "docstrings": [],
          "signature": "No"
        }]
      }
    }, 
    {
      "id": "Functor.Var.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t) => string",
      "docstrings": ["converts the input to a string"]
    }]
  }, 
  {
    "id": "Functor.Included",
    "name": "Included",
    "kind": "module",
    "docstrings": ["module which includes the Var Logger!"],
    "items": [
    {
      "id": "Functor.Included.log",
      "kind": "value",
      "name": "log",
      "signature": "let log: (. Var.t) => unit",
      "docstrings": ["logs the input"]
    }]
  }]
}

```

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


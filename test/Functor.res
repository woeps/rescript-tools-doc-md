/***
this module provides "convenient" utilities for logging  
NOTE: this is not a good example of a functor,
    but just to test docgen for functors
*/

module type Input = {
  /***
  input module type of the functor
  */

  /**
  type of the input
  */
  type t
  /**
  converts the input to a string
  */
  let toString: t => string
}

module type Logger = {
  /***
  returned type of the functor
  */

  /**
  type of the input
  */
  type t
  /**
  logs the input
  */
  let log: t => unit
}

module String = {
  /***
  input module of the functor to hanle strings
  */

  /**
  type of the input
  */
  type t = string

  /**
  converts the input to a string
  */
  let toString = (x: t) => x
}

module Int = {
  /***
  input module of the functor to handle integers
  */

  /**
  type of the input
  */
  type t = int

  /**
  converts the input to a string
  */
  let toString = (x: t) => x->Int.toString
}

/**
 * functor that logs the input
 */
module MakeLogger = (I: Input): (Logger with type t := I.t) => {
  /***
  functor that logs the input
  */

  /**
   * logs the Input
   */
  let log = (x: I.t) => I.toString(x)->Console.log
}

/**
 * the module that contains the functions to log strings
 */
module StringLogger = MakeLogger(String)
/**
 * the module that contains the functions to log integers
 */
module IntLogger = MakeLogger(Int)

module Var = {
  /***
  another input module for the Logger functor to handle a Variant of type type 
  */

  /**
  type of the input
  */
  type t = Yes | No

  /**
  converts the input to a string
  */
  let toString = x =>
    switch x {
    | Yes => "Yes"
    | No => "No"
    }
}

module Included = {
  /***
  module which includes the Var Logger!
  */
  include MakeLogger(Var)
}

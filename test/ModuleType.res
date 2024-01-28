/***
extracted docs don't give a hint, that Example is not an implementation, but a module type

module M is missing in extracted docs
*/

module type Example = {
  /***
  this is an example module type 
  */

  /**
  main type of this module 
  */
  type t

  /**
  function from t to t
  */
  let f: t => t
}

module M: Example = {
  /***
  implementation of Example module type
  */

  /**
  main type 
  */
  type t = int

  /**
  identity function
  */
  let f = (x: int) => x
}

module Z = {
  type t = string
  let toString = x => x
}

/***
 This is an example module.
 */

module Variants = {
  /***
 module of variants
 */

  /**
    represents the variant
   */
  type t =
    | /** first variant constructor without payload */ First
    | /** second variant with int payload */ Second(int)
    | /** third constructor with inline record */
    Third({
        /** hello prop */
        hello: string,
        /** goddbye prop */
        goodbye: bool,
      })
    | /** with several payload arguments */ Fourth(bool, string, int)
}

module Record = {
  /***
   module to test record docs
   */

  /**
   this is a record
   */
  type sub = {
    /**
     representing a bool value
     */
    x: bool,
  }

  /**
   this is another record
   */
  type t = {
    /** prop a */
    a: string,
    /** deprecated prop */
    @deprecated("use sub instead")
    b: int,
    /** this is an optional field of another record */
    optRecord?: sub,
    /** this is an optional string */
    optStr?: string,
  }
}

module Minimal_OptionalRecord = {
  type t = {optStr?: string}
}

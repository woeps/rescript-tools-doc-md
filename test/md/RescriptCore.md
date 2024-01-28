 # RescriptCore

### type RescriptCore.timeoutId

```rescript
type timeoutId = Js.Global.timeoutId
```

An `id` representing a timeout started via `setTimeout`.

See [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN.

### let RescriptCore.setTimeout

```rescript
let setTimeout: (. (. unit) => unit, int) => timeoutId
```

`setTimeout(callback, durationInMilliseconds)` starts a timer that will execute `callback` after `durationInMilliseconds`.

See [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN.

#### Examples
```rescript
// Log to the console after 2 seconds (2000 milliseconds).
let timeoutId = setTimeout(() => {
  Console.log("This prints in 2 seconds.")
}, 2000)
```

### let RescriptCore.setTimeoutFloat

```rescript
let setTimeoutFloat: (. (. unit) => unit, float) => timeoutId
```

`setTimeoutFloat(callback, durationInMilliseconds)` starts a timer that will execute `callback` after `durationInMilliseconds`.

The same as `setTimeout`, but allows you to pass a `float` instead of an `int` for the duration.

See [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN.

#### Examples
```rescript
// Log to the console after 2 seconds (2000 milliseconds).
let timeoutId = setTimeoutFloat(() => {
  Console.log("This prints in 2 seconds.")
}, 2000.)
```

### let RescriptCore.clearTimeout

```rescript
let clearTimeout: (. timeoutId) => unit
```

`clearTimeout(timeoutId)` clears a scheduled timeout if it hasn't already executed.

See [`clearTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/clearTimeout) on MDN.

#### Examples
```rescript
let timeoutId = setTimeout(() => {
  Console.log("This prints in 2 seconds.")
}, 2000)

// Clearing the timeout right away, before 2 seconds has passed, means that the above callback logging to the console will never run.
clearTimeout(timeoutId)
```

### type RescriptCore.intervalId

```rescript
type intervalId = Js.Global.intervalId
```

An `id` representing an interval started via `setInterval`.

See [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.

### let RescriptCore.setInterval

```rescript
let setInterval: (. (. unit) => unit, int) => intervalId
```

`setInterval(callback, intervalInMilliseconds)` starts an interval that will execute `callback` every `durationInMilliseconds` milliseconds.

See [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.

#### Examples
```rescript
// Log to the console ever 2 seconds (2000 milliseconds).
let intervalId = setInterval(() => {
  Console.log("This prints every 2 seconds.")
}, 2000)
```

### let RescriptCore.setIntervalFloat

```rescript
let setIntervalFloat: (. (. unit) => unit, float) => intervalId
```

`setIntervalFloat(callback, intervalInMilliseconds)` starts an interval that will execute `callback` every `durationInMilliseconds` milliseconds.

The same as `setInterval`, but allows you to pass a `float` instead of an `int` for the duration.

See [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.

#### Examples
```rescript
// Log to the console ever 2 seconds (2000 milliseconds).
let intervalId = setIntervalFloat(() => {
  Console.log("This prints every 2 seconds.")
}, 2000.)
```

### let RescriptCore.clearInterval

```rescript
let clearInterval: (. intervalId) => unit
```

`clearInterval(intervalId)` clears a scheduled interval.

See [`clearInterval`](https://developer.mozilla.org/en-US/docs/Web/API/clearInterval) on MDN.

#### Examples
```rescript
let intervalId = setInterval(() => {
  Console.log("This prints in 2 seconds.")
}, 2000)

// Stop the interval after 10 seconds
let timeoutId = setTimeout(() => {
  clearInterval(intervalId)
}, 10000)
```

### let RescriptCore.encodeURI

```rescript
let encodeURI: (. string) => string
```

Encodes a URI by replacing characters in the provided string that aren't valid in a URL.

This is intended to operate on full URIs, so it encodes fewer characters than what `encodeURIComponent` does.
If you're looking to encode just parts of a URI, like a query parameter, prefer `encodeURIComponent`.

See [`encodeURI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) on MDN.

#### Examples
```rescript
Console.log(encodeURI("https://rescript-lang.org?array=[someValue]"))
// Logs "https://rescript-lang.org?array=%5BsomeValue%5D" to the console.
```

### let RescriptCore.decodeURI

```rescript
let decodeURI: (. string) => string
```

Decodes a previously encoded URI back to a regular string.

This is intended to operate on full URIs, so it decodes fewer characters than what `decodeURIComponent` does.
If you're looking to decode just parts of a URI, like a query parameter, prefer `decodeURIComponent`.

See [`decodeURI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURI) on MDN.

#### Examples
```rescript
Console.log(decodeURI("https://rescript-lang.org?array=%5BsomeValue%5D"))
// Logs "https://rescript-lang.org?array=[someValue]" to the console.
```

### let RescriptCore.encodeURIComponent

```rescript
let encodeURIComponent: (. string) => string
```

Encodes a string so it can be used as part of a URI.

See [`encodeURIComponent`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) on MDN.

#### Examples
```rescript
Console.log(encodeURIComponent("array=[someValue]"))
// Logs "array%3D%5BsomeValue%5D" to the console.
```

### let RescriptCore.decodeURIComponent

```rescript
let decodeURIComponent: (. string) => string
```

Decodes a previously URI encoded string back to its original form.

See [`decodeURIComponent`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURIComponent) on MDN.

#### Examples
```rescript
Console.log(decodeURIComponent("array%3D%5BsomeValue%5D"))
// Logs "array=[someValue]" to the console.
```

## module RescriptCore.Array `alias`

### let RescriptCore.Array.fromIterator

```rescript
let fromIterator: (. Core__Iterator.t<'a>) => array<'a>
```

`fromIterator(iterator)`

  Creates an array from the provided `iterator`

  ```res example
  let map = Map.fromArray([("foo", 1), ("bar", 2)])

  Array.fromIterator(map-\>Map.values) // [1, 2]
  ```

### let RescriptCore.Array.fromArrayLike

```rescript
let fromArrayLike: (. Js.Array2.array_like<'a>) => array<'a>
```

### let RescriptCore.Array.fromArrayLikeWithMap

```rescript
let fromArrayLikeWithMap: (. Js.Array2.array_like<'a>, (. 'a) => 'b) => array<'b>
```

### let RescriptCore.Array.make

```rescript
let make: (. ~length: int, 'a) => array<'a>
```

`make(~length, init)`

  Creates an array of length `length` initialized with the value of `init`.

  ```res example
  Array.make(~length=3, #apple) == [#apple, #apple, #apple]
  ```

### let RescriptCore.Array.fromInitializer

```rescript
let fromInitializer: (. ~length: int, (. int) => 'a) => array<'a>
```

`fromInitializer(~length, f)`

  Creates an array of length `length` initialized with the value returned from `f ` for each index.

  ```res example
  Array.make(~length=3, i =\> i + 3) == [3, 4, 5]
  ```

### let RescriptCore.Array.equal

```rescript
let equal: (. array<'a>, array<'a>, (. 'a, 'a) => bool) => bool
```

### let RescriptCore.Array.compare

```rescript
let compare: (.
  array<'a>,
  array<'a>,
  (. 'a, 'a) => Core__Ordering.t,
) => Core__Ordering.t
```

### let RescriptCore.Array.isArray

```rescript
let isArray: (. 'a) => bool
```

### let RescriptCore.Array.length

```rescript
let length: (. array<'a>) => int
```

`length(array)` returns the length of (i.e. number of items in) the array.

See [`Array.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]

Console.log(someArray->Array.length) // 2
```

### let RescriptCore.Array.copyAllWithin

```rescript
let copyAllWithin: (. array<'a>, ~target: int) => array<'a>
```

### let RescriptCore.Array.copyWithinToEnd

```rescript
let copyWithinToEnd: (. array<'a>, ~target: int, ~start: int) => array<'a>
```

### let RescriptCore.Array.copyWithin

```rescript
let copyWithin: (.
  array<'a>,
  ~target: int,
  ~start: int,
  ~end: int,
) => array<'a>
```

### let RescriptCore.Array.fillAll

```rescript
let fillAll: (. array<'a>, 'a) => unit
```

`fillAll(array, value)` fills the entire `array` with `value`.

Beware this will *mutate* the array.

See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]
myArray->Array.fillAll(9)

Console.log(myArray) // [9, 9, 9, 9]
```

### let RescriptCore.Array.fillToEnd

```rescript
let fillToEnd: (. array<'a>, 'a, ~start: int) => unit
```

`fillToEnd(array, value, ~start)` fills `array` with `value` from the `start` index.

Beware this will *mutate* the array.

See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]
myArray->Array.fillToEnd(9, ~start=1)

Console.log(myArray) // [1, 9, 9, 9]
```

### let RescriptCore.Array.fill

```rescript
let fill: (. array<'a>, 'a, ~start: int, ~end: int) => unit
```

`fill(array, value, ~start, ~end)` fills `array` with `value` from `start` to `end`.

Beware this will *mutate* the array.

See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]
myArray->Array.fill(9, ~start=1, ~end=2)

Console.log(myArray) // [1, 9, 9, 4]
```

### let RescriptCore.Array.pop

```rescript
let pop: (. array<'a>) => option<'a>
```

`pop(array)` removes the last item from `array` and returns it.

Beware this will *mutate* the array.

See [`Array.pop`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
let lastItem = someArray->Array.pop // "hello"

Console.log(someArray) // ["hi"]. Notice last item is gone.
```

### let RescriptCore.Array.push

```rescript
let push: (. array<'a>, 'a) => unit
```

`push(array, item)` appends `item` to the end of `array`.

Beware this will *mutate* the array.

See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.push("yay")

Console.log(someArray) // ["hi", "hello", "yay"]
```

### let RescriptCore.Array.pushMany

```rescript
let pushMany: (. array<'a>, array<'a>) => unit
```

`pushMany(array, itemsArray)` appends many new items to the end of the array.

Beware this will *mutate* the array.

See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.pushMany(["yay", "wehoo"])

Console.log(someArray) // ["hi", "hello", "yay", "wehoo"]
```

### let RescriptCore.Array.reverse

```rescript
let reverse: (. array<'a>) => unit
```

`reverse(array)` reverses the order of the items in `array`.

Beware this will *mutate* the array.

See [`Array.reverse`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.reverse

Console.log(someArray) // ["hello", "h1"]
```

### let RescriptCore.Array.shift

```rescript
let shift: (. array<'a>) => option<'a>
```

`shift(array)` removes the first item in the array, and returns it.

Beware this will *mutate* the array.

See [`Array.shift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
let lastItem = someArray->Array.shift // "hi"

Console.log(someArray) // ["hello"]. Notice first item is gone.
```

### let RescriptCore.Array.toSorted

```rescript
let toSorted: (. array<'a>, (. 'a, 'a) => Core__Ordering.t) => array<'a>
```

`toSorted(array, comparator)` returns a new, sorted array from `array`, using the `comparator` function.

See [`Array.toSorted`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted) on MDN.

#### Examples
```rescript
let someArray = [3, 2, 1]
let sorted = someArray->Array.toSorted(Int.compare)

Console.log(sorted) // [1, 2, 3]
Console.log(someArray) // [3, 2, 1]. Original unchanged
```

### let RescriptCore.Array.sort

```rescript
let sort: (. array<'a>, (. 'a, 'a) => Core__Ordering.t) => unit
```

`sort(array, comparator)` sorts `array` in-place using the `comparator` function.

Beware this will *mutate* the array.

See [`Array.sort`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on MDN.

#### Examples
```rescript
let someArray = [3, 2, 1]
someArray->Array.sort((a, b) => float(a - b))

Console.log(someArray) // [1, 2, 3]
```

### let RescriptCore.Array.splice

```rescript
let splice: (.
  array<'a>,
  ~start: int,
  ~remove: int,
  ~insert: array<'a>,
) => unit
```

### let RescriptCore.Array.toSpliced

```rescript
let toSpliced: (.
  array<'a>,
  ~start: int,
  ~remove: int,
  ~insert: array<'a>,
) => array<'a>
```

### let RescriptCore.Array.with

```rescript
let with: (. array<'a>, int, 'a) => array<'a>
```

### let RescriptCore.Array.unshift

```rescript
let unshift: (. array<'a>, 'a) => unit
```

`unshift(array, item)` inserts a new item at the start of the array.

Beware this will *mutate* the array.

See [`Array.unshift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.unshift("yay")

Console.log(someArray) // ["yay", "hi", "hello"]
```

### let RescriptCore.Array.unshiftMany

```rescript
let unshiftMany: (. array<'a>, array<'a>) => unit
```

`unshiftMany(array, itemsArray)` inserts many new items to the start of the array.

Beware this will *mutate* the array.

See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.unshiftMany(["yay", "wehoo"])

Console.log(someArray) // ["yay", "wehoo", "hi", "hello"]
```

### let RescriptCore.Array.concat

```rescript
let concat: (. array<'a>, array<'a>) => array<'a>
```

`concat(array1, array2)` concatenates the two arrays, creating a new array.

See [`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) on MDN.

#### Examples
```rescript
let array1 = ["hi", "hello"]
let array2 = ["yay", "wehoo"]

let someArray = array1->Array.concat(array2)

Console.log(someArray) // ["hi", "hello", "yay", "wehoo"]
```

### let RescriptCore.Array.concatMany

```rescript
let concatMany: (. array<'a>, array<array<'a>>) => array<'a>
```

`concatMany(array1, arrays)` concatenates array1 with several other arrays, creating a new array.

See [`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) on MDN.

#### Examples
```rescript
let array1 = ["hi", "hello"]
let array2 = ["yay"]
let array3 = ["wehoo"]

let someArray = array1->Array.concatMany([array2, array3])

Console.log(someArray) // ["hi", "hello", "yay", "wehoo"]
```

### let RescriptCore.Array.flat

```rescript
let flat: (. array<array<'a>>) => array<'a>
```

`flat(arrays)` concatenates an array of arrays into a single array.

See [`Array.flat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) on MDN.

#### Examples
```rescript
Console.log([[1], [2], [3, 4]]->Array.flat) // [1, 2, 3, 4]
```

### let RescriptCore.Array.includes

```rescript
let includes: (. array<'a>, 'a) => bool
```

`includes(array, item)` checks whether `array` includes `item`, by doing a [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).

See [`Array.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) on MDN.

#### Examples
```rescript
Console.log([1, 2]->Array.includes(1)) // true
Console.log([1, 2]->Array.includes(3)) // false
Console.log([{"language": "ReScript"}]->Array.includes({"language": "ReScript"})) // false, because of strict equality
```

### let RescriptCore.Array.indexOf

```rescript
let indexOf: (. array<'a>, 'a) => int
```

`indexOf(array, item)` returns the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

Returns `-1` if the item doesn not exist. Check out `Array.indexOfOpt` for a version that returns `None` instead of `-1` if the item does not exist.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

#### Examples
```rescript
Console.log([1, 2]->Array.indexOf(2)) // 1
Console.log([1, 2]->Array.indexOf(3)) // -1
Console.log([{"language": "ReScript"}]->Array.indexOf({"language": "ReScript"})) // -1, because of strict equality
```

### let RescriptCore.Array.indexOfOpt

```rescript
let indexOfOpt: (. array<'a>, 'a) => option<int>
```

`indexOfOpt(array, item)` returns an option of the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

#### Examples
```rescript
Console.log([1, 2]->Array.indexOfOpt(2)) // Some(1)
Console.log([1, 2]->Array.indexOfOpt(3)) // None
Console.log([{"language": "ReScript"}]->Array.indexOfOpt({"language": "ReScript"})) // None, because of strict equality
```

### let RescriptCore.Array.indexOfFrom

```rescript
let indexOfFrom: (. array<'a>, 'a, int) => int
```

### let RescriptCore.Array.joinWith

```rescript
let joinWith: (. array<string>, string) => string
```

`joinWith(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Array items must be strings, to join number or other arrays, use `joinWithUnsafe`. Under the hood this will run JavaScript's `toString` on all the array items.

#### Examples
```rescript
let array = ["One", "Two", "Three"]

Console.log(array->Array.joinWith(" -- ")) // One -- Two -- Three
```

### let RescriptCore.Array.joinWithUnsafe

```rescript
let joinWithUnsafe: (. array<'a>, string) => string
```

`joinWithUnsafe(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Under the hood this will run JavaScript's `toString` on all the array items.

#### Examples
```rescript
let array = [1, 2, 3]

Console.log(array->Array.joinWithUnsafe(" -- ")) // 1 -- 2 -- 3
```

### let RescriptCore.Array.lastIndexOf

```rescript
let lastIndexOf: (. array<'a>, 'a) => int
```

### let RescriptCore.Array.lastIndexOfOpt

```rescript
let lastIndexOfOpt: (. array<'a>, 'a) => option<int>
```

### let RescriptCore.Array.lastIndexOfFrom

```rescript
let lastIndexOfFrom: (. array<'a>, 'a, int) => int
```

### let RescriptCore.Array.slice

```rescript
let slice: (. array<'a>, ~start: int, ~end: int) => array<'a>
```

`slice(array, ~start, ~end)` creates a new array of items copied from `array` from `start` until (but not including) `end`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.slice(~start=1, ~end=3)) // [2, 3]
```

### let RescriptCore.Array.sliceToEnd

```rescript
let sliceToEnd: (. array<'a>, ~start: int) => array<'a>
```

`sliceToEnd(array, start)` creates a new array from `array`, with all items from `array` starting from `start`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.sliceToEnd(~start=1)) // [2, 3, 4]
```

### let RescriptCore.Array.copy

```rescript
let copy: (. array<'a>) => array<'a>
```

`copy(array)` makes a copy of the array with the items in it, but does not make copies of the items themselves.

#### Examples
```rescript
let myArray = [1, 2, 3]
let copyOfMyArray = myArray->Array.copy

Console.log(copyOfMyArray) // [1, 2, 3]
Console.log(myArray === copyOfMyArray) // false
```

### let RescriptCore.Array.toString

```rescript
let toString: (. array<'a>) => string
```

`toString(array)` stringifies `array` by running `toString` on all of the array elements and joining them with ",".

See [`Array.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.toString) // "1,2,3,4"
```

### let RescriptCore.Array.toLocaleString

```rescript
let toLocaleString: (. array<'a>) => string
```

### let RescriptCore.Array.every

```rescript
let every: (. array<'a>, (. 'a) => bool) => bool
```

`every(array, predicate)` returns true if `predicate` returns true for all items in `array`.

See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.every(num => num > 4)) // true
Console.log(array->Array.every(num => num === 1)) // false
```

### let RescriptCore.Array.everyWithIndex

```rescript
let everyWithIndex: (. array<'a>, (. 'a, int) => bool) => bool
```

`everyWithIndex(array, checker)` returns true if all items in `array` returns true when running the provided `checker` function.

See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.everyWithIndex((num, index) => index < 2 && num <= 2)) // true
Console.log(array->Array.everyWithIndex((num, index) => index < 2 && num >= 2)) // false
```

### let RescriptCore.Array.filter

```rescript
let filter: (. array<'a>, (. 'a) => bool) => array<'a>
```

`filter(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.

See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.filter(num => num > 2)) // [3, 4]
```

### let RescriptCore.Array.filterWithIndex

```rescript
let filterWithIndex: (. array<'a>, (. 'a, int) => bool) => array<'a>
```

`filterWithIndex(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.

See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.filterWithIndex((num, index) => index === 0 || num === 2)) // [1, 2]
```

### let RescriptCore.Array.find

```rescript
let find: (. array<'a>, (. 'a) => bool) => option<'a>
```

`find(array, checker)` returns the first element of `array` where the provided `checker` function returns true.

See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

#### Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, TypeScript, JavaScript]

switch array->Array.find(item => item == ReScript) {
| None => Console.log("No item...")
| Some(_) => Console.log("Yay, ReScript!")
}
```

### let RescriptCore.Array.findWithIndex

```rescript
let findWithIndex: (. array<'a>, (. 'a, int) => bool) => option<'a>
```

`findWithIndex(array, checker)` returns the first element of `array` where the provided `checker` function returns true.

See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

#### Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [TypeScript, JavaScript, ReScript]

switch array->Array.findWithIndex((item, index) => index > 1 && item == ReScript) {
| None => Console.log("No item...")
| Some(_) => Console.log("Yay, ReScript exists in a later position!")
}
```

### let RescriptCore.Array.findIndex

```rescript
let findIndex: (. array<'a>, (. 'a) => bool) => int
```

`findIndex(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.

Returns `-1` if the item does not exist. Consider using `Array.findIndexOpt` if you want an option instead (where `-1` would be `None`).

See [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.

#### Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, JavaScript]

Console.log(array->Array.findIndex(item => item == ReScript)) // 0
Console.log(array->Array.findIndex(item => item == TypeScript)) // -1
```

### let RescriptCore.Array.findIndexWithIndex

```rescript
let findIndexWithIndex: (. array<'a>, (. 'a, int) => bool) => int
```

`findIndexWithIndex(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.

Returns `-1` if the item does not exist. Consider using `Array.findIndexOpt` if you want an option instead (where `-1` would be `None`).

See [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.

#### Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, JavaScript]

Console.log(array->Array.findIndexWithIndex((item, index) => index === 0 && item == ReScript)) // 0
Console.log(array->Array.findIndex((item, index) => index === 0 && item == TypeScript)) // -1
```

### let RescriptCore.Array.forEach

```rescript
let forEach: (. array<'a>, (. 'a) => unit) => unit
```

`forEach(array, fn)` runs the provided `fn` on every element of `array`.

See [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.forEach(item => {
  Console.log(item)
})
```

### let RescriptCore.Array.forEachWithIndex

```rescript
let forEachWithIndex: (. array<'a>, (. 'a, int) => unit) => unit
```

`forEachWithIndex(array, fn)` runs the provided `fn` on every element of `array`.

See [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.forEachWithIndex((item, index) => {
  Console.log("At item " ++ Int.toString(index) ++ ": " ++ item)
})
```

### let RescriptCore.Array.map

```rescript
let map: (. array<'a>, (. 'a) => 'b) => array<'b>
```

`map(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.

See [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let mappedArray = array->Array.map(greeting => greeting ++ " to you")

Console.log(mappedArray) // ["Hello to you", "Hi to you", "Good bye to you"]
```

### let RescriptCore.Array.mapWithIndex

```rescript
let mapWithIndex: (. array<'a>, (. 'a, int) => 'b) => array<'b>
```

`mapWithIndex(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.

See [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let mappedArray =
  array->Array.mapWithIndex((greeting, index) =>
    greeting ++ " at position " ++ Int.toString(index)
  )

Console.log(mappedArray) // ["Hello at position 0", "Hi at position 1", "Good bye at position 2"]
```

### let RescriptCore.Array.reduce

```rescript
let reduce: (. array<'a>, 'b, (. 'b, 'a) => 'b) => 'b
```

`reduce(xs, fn, init)`

  Applies `fn` to each element of `xs` from beginning to end. Function `fn` has two parameters: the item from the list and an “accumulator”; which starts with a value of `init`. `reduce` returns the final value of the accumulator.

  ```res example
  Array.reduce([2, 3, 4], (a, b) =\> a + b, 1) == 10

  Array.reduce(["a", "b", "c", "d"], (a, b) =\> a ++ b, "") == "abcd"
  ```

### let RescriptCore.Array.reduceWithIndex

```rescript
let reduceWithIndex: (. array<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b
```

`reduceWithIndex(xs, fn, init)`

  Applies `fn` to each element of `xs` from beginning to end. Function `fn` has three parameters: the item from the array and an “accumulator”, which starts with a value of `init` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.

  ```res example
  Array.reduceWithIndex([1, 2, 3, 4], (acc, x, i) =\> acc + x + i, 0) == 16
  ```

### let RescriptCore.Array.reduceRight

```rescript
let reduceRight: (. array<'a>, 'b, (. 'b, 'a) => 'b) => 'b
```

`reduceRight(xs, fn, init)`

  Works like `Array.reduce`; except that function `fn` is applied to each item of `xs` from the last back to the first.

  ```res example
  Array.reduceRight(["a", "b", "c", "d"], (a, b) =\> a ++ b, "") == "dcba"
  ```

### let RescriptCore.Array.reduceRightWithIndex

```rescript
let reduceRightWithIndex: (. array<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b
```

`reduceRightWithIndex(xs, f, init)`

  Like `reduceRight`, but with an additional index argument on the callback function.

  ```res example
  Array.reduceRightWithIndex([1, 2, 3, 4], (acc, x, i) =\> acc + x + i, 0) == 16
  ```

### let RescriptCore.Array.some

```rescript
let some: (. array<'a>, (. 'a) => bool) => bool
```

`some(array, predicate)` returns true if `predicate` returns true for any element in `array`.

See [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.some(greeting => greeting === "Hello")) // true
```

### let RescriptCore.Array.someWithIndex

```rescript
let someWithIndex: (. array<'a>, (. 'a, int) => bool) => bool
```

`someWithIndex(array, checker)` returns true if running the provided `checker` function on any element in `array` returns true.

See [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.someWithIndex((greeting, index) => greeting === "Hello" && index === 0)) // true
```

### let RescriptCore.Array.get

```rescript
let get: (. array<'a>, int) => option<'a>
```

`get(array, index)` returns the element at `index` of `array`.

Returns `None` if the index does not exist in the array. Equivalent to doing `array[index]` in JavaScript.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.get(0) == Some("Hello") // true
array->Array.get(3) == None // true
```

### let RescriptCore.Array.set

```rescript
let set: (. array<'a>, int, 'a) => unit
```

`set(array, index, item)` sets the provided `item` at `index` of `array`.

Beware this will *mutate* the array.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
array->Array.set(1, "Hello")

Console.log(array[1]) // "Hello"
```

### let RescriptCore.Array.getSymbol

```rescript
let getSymbol: (. array<'a>, Core__Symbol.t) => option<'b>
```

### let RescriptCore.Array.getSymbolUnsafe

```rescript
let getSymbolUnsafe: (. array<'a>, Core__Symbol.t) => 'b
```

### let RescriptCore.Array.setSymbol

```rescript
let setSymbol: (. array<'a>, Core__Symbol.t, 'b) => unit
```

### let RescriptCore.Array.getUnsafe

```rescript
let getUnsafe: (. array<'a>, int) => 'a
```

`getUnsafe(array, index)` returns the element at `index` of `array`.

This is _unsafe_, meaning it will return `undefined` value if `index` does not exist in `array`.

Use `Array.getUnsafe` only when you are sure the `index` exists (i.e. when using for-loop).

#### Examples
```rescript
for index in 0 to array->Array.length - 1 {
  let value = array->Array.getUnsafe(index)
  Console.log(value)
}
```

### let RescriptCore.Array.setUnsafe

```rescript
let setUnsafe: (. array<'a>, int, 'a) => unit
```

`setUnsafe(array, index, item)` sets the provided `item` at `index` of `array`.

Beware this will *mutate* the array, and is *unsafe*.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
array->Array.setUnsafe(1, "Hello")

Console.log(array[1]) // "Hello"
```

### let RescriptCore.Array.findIndexOpt

```rescript
let findIndexOpt: (. array<'a>, (. 'a) => bool) => option<int>
```

`findIndexOpt(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.

Returns `None` if no item matches.

See [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.

#### Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, TypeScript, JavaScript]

switch array->Array.findIndexOpt(item => item == ReScript) {
| None => Console.log("Ahh, no ReScript...")
| Some(index) => Console.log("Yay, ReScript at index " ++ Int.toString(index))
}
```

### let RescriptCore.Array.toReversed

```rescript
let toReversed: (. array<'a>) => array<'a>
```

`toReversed(array)` creates a new array with all items from `array` in reversed order.

See [`Array.toReversed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toReversed) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]
let reversed = someArray->Array.toReversed

Console.log(reversed) // ["hello", "h1"]
Console.log(someArray) // ["h1", "hello"]. Original unchanged
```

### let RescriptCore.Array.filterMap

```rescript
let filterMap: (. array<'a>, (. 'a) => option<'b>) => array<'b>
```

`filterMap(array, fn)`

Calls `fn` for each element and returns a new array containing results of the `fn` calls which are not `None`.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(
  array->Array.filterMap(item =>
    switch item {
    | "Hello" => Some(item->String.length)
    | _ => None
    }
  ),
) // [5]
```

### let RescriptCore.Array.keepSome

```rescript
let keepSome: (. array<option<'a>>) => array<'a>
```

`keepSome(arr)`

  Returns a new array containing `value` for all elements that are `Some(value)`
  and ignoring every value that is `None`

  ```res example
  Array.keepSome([Some(1), None, Some(3)]) == [1, 3]
  ```

### let RescriptCore.Array.toShuffled

```rescript
let toShuffled: (. array<'a>) => array<'a>
```

`toShuffled(array)` returns a new array with all items in `array` in a random order.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let shuffledArray = array->Array.toShuffled

Console.log(shuffledArray)
```

### let RescriptCore.Array.shuffle

```rescript
let shuffle: (. array<'a>) => unit
```

`shuffle(array)` randomizes the position of all items in `array`.

Beware this will *mutate* the array.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
array->Array.shuffle

Console.log(array)
```

### let RescriptCore.Array.flatMap

```rescript
let flatMap: (. array<'a>, (. 'a) => array<'b>) => array<'b>
```

`flatMap(array, mapper)` returns a new array concatenating the arrays returned from running `mapper` on all items in `array`.

#### Examples
```rescript
type language = ReScript | TypeScript | JavaScript

let array = [ReScript, TypeScript, JavaScript]

Console.log(
  array->Array.flatMap(item =>
    switch item {
    | ReScript => [1, 2, 3]
    | TypeScript => [4, 5, 6]
    | JavaScript => [7, 8, 9]
    }
  ),
)
// [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

### let RescriptCore.Array.findMap

```rescript
let findMap: (. array<'a>, (. 'a) => option<'b>) => option<'b>
```

`findMap(arr, fn)`

  Calls `fn` for each element and returns the first value from `fn` that is `Some(_)`.
  Otherwise returns `None`

  ```res example
  Array.findMap([1, 2, 3], n =\> mod(n, 2) ? Some(n - 2) : None) == 0
  ```

### let RescriptCore.Array.at

```rescript
let at: (. array<'a>, int) => option<'a>
```

`at(array, index)`

  Get an element by its index. Negative indices count backwards from the last item.

  ## Examples
  ```rescript
  ["a", "b", "c"]-\>Array.at(0) // Some("a")
  ["a", "b", "c"]-\>Array.at(2) // Some("c")
  ["a", "b", "c"]-\>Array.at(3) // None
  ["a", "b", "c"]-\>Array.at(-1) // Some("c")
  ["a", "b", "c"]-\>Array.at(-3) // Some("a")
  ["a", "b", "c"]-\>Array.at(-4) // None
  ```

### let RescriptCore.Array.last

```rescript
let last: (. array<'a>) => option<'a>
```

`last(array)` returns the last element of `array`.

Returns `None` if the array is empty.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.last == Some("Good bye") // true
[]->Array.last == None // true
```

## module RescriptCore.Console `alias`

Functions for interacting with JavaScript console.

See: [`console`](https://developer.mozilla.org/en-US/docs/Web/API/Console).

### let RescriptCore.Console.assert_

```rescript
let assert_: (. bool, 'a) => unit
```

`assert_(assertion, value)` print a message to console if `assertion` evaluates `false`. Does nothing if it's `true`.

See [`console.assert`](https://developer.mozilla.org/en-US/docs/Web/API/console/assert)
on MDN.

#### Examples

```rescript
Console.assert_(false, "Hello World!")
Console.assert_(n == 42, "The answer")
```

### let RescriptCore.Console.assert2

```rescript
let assert2: (. bool, 'a, 'b) => unit
```

`assert2(v1, v2)`. Like `assert_`, but with two arguments.

#### Examples

```rescript
Console.assert2(false, "Hello", "World")
Console.assert2(n == 42, [1, 2, 3], '4')
```

### let RescriptCore.Console.assert3

```rescript
let assert3: (. bool, 'a, 'b, 'c) => unit
```

`assert3(v1, v2, v3)`. Like `assert_`, but with three arguments.

#### Examples

```rescript
Console.assert3(false, "Hello", "World", "ReScript")
Console.assert3(n == 42, "One", 2, #3)
```

### let RescriptCore.Console.assert4

```rescript
let assert4: (. bool, 'a, 'b, 'c, 'd) => unit
```

`assert4(v1, v2, v3, v4)`. Like `assert_`, but with four arguments.

#### Examples

```rescript
Console.assert4(false, "Hello", "World", "ReScript", "!!!")
Console.assert4(m == 42, [1, 2], (3, 4), [#5, #6], #"polyvar")
```

### let RescriptCore.Console.assert5

```rescript
let assert5: (. bool, 'a, 'b, 'c, 'd, 'e) => unit
```

`assert5(v1, v2, v3, v4, v5)`. Like `assert_`, but with five arguments.

#### Examples

```rescript
Console.assert5(false, "Hello", "World", "JS", '!', '!')
Console.assert5(n == 42, [1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.assert6

```rescript
let assert6: (. bool, 'a, 'b, 'c, 'd, 'e, 'f) => unit
```

`assert6(v1, v2)`. Like `assert_`, but with six arguments.

#### Examples

```rescript
Console.assert6(false, "Hello", "World", "JS", '!', '!', '?')
Console.assert6(n == 42, [1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.assertMany

```rescript
let assertMany: (. bool, array<'a>) => unit
```

`assertMany(assertion, arr)`. Like `assert_`, but variadic.

#### Examples

```rescript
Console.assertMany(false, ["Hello", "World"])
Console.assertMany(n == 42, [1, 2, 3])
```

### let RescriptCore.Console.clear

```rescript
let clear: (. unit) => unit
```

`clear()` clears the console, if allowed.

See [`console.clear`](https://developer.mozilla.org/en-US/docs/Web/API/console/clear)
on MDN.

#### Examples

```rescript
Console.clear()
```

### let RescriptCore.Console.count

```rescript
let count: (. string) => unit
```

`count(label)` prints to the console the number of times it's been called with the given label.

See [`console.count`](https://developer.mozilla.org/en-US/docs/Web/API/console/count)
on MDN.

#### Examples

```rescript
Console.count("rescript")
```

### let RescriptCore.Console.countReset

```rescript
let countReset: (. string) => unit
```

`countReset(label)` resets the count for the given label to 0.

See [`console.countReset`](https://developer.mozilla.org/en-US/docs/Web/API/console/countReset)
on MDN.

#### Examples

```rescript
Console.countReset("rescript")
```

### let RescriptCore.Console.debug

```rescript
let debug: (. 'a) => unit
```

`debug(value)` print a debug message to console.

See [`console.debug`](https://developer.mozilla.org/en-US/docs/Web/API/console/debug)
on MDN.

#### Examples

```rescript
Console.debug("Hello")
let obj = {"name": "ReScript", "version": 10}
Console.debug(obj)
```

### let RescriptCore.Console.debug2

```rescript
let debug2: (. 'a, 'b) => unit
```

`debug2(v1, v2)`. Like `debug`, but with two arguments.

#### Examples

```rescript
Console.debug2("Hello", "World")
Console.debug2([1, 2, 3], '4')
```

### let RescriptCore.Console.debug3

```rescript
let debug3: (. 'a, 'b, 'c) => unit
```

`debug3(v1, v2, v3)`. Like `debug`, but with three arguments.

#### Examples

```rescript
Console.debug3("Hello", "World", "ReScript")
Console.debug3("One", 2, #3)
```

### let RescriptCore.Console.debug4

```rescript
let debug4: (. 'a, 'b, 'c, 'd) => unit
```

`debug4(v1, v2, v3, v4)`. Like `debug`, but with four arguments.

#### Examples

```rescript
Console.debug4("Hello", "World", "ReScript", "!!!")
Console.debug4([1, 2], (3, 4), [#5, #6], #"polyvar")
```

### let RescriptCore.Console.debug5

```rescript
let debug5: (. 'a, 'b, 'c, 'd, 'e) => unit
```

`debug5(v1, v2, v3, v4, v5)`. Like `debug`, but with five arguments.

#### Examples

```rescript
Console.debug5("Hello", "World", "JS", '!', '!')
Console.debug5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.debug6

```rescript
let debug6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit
```

`debug6(v1, v2, v3, v4, v5, v6)`. Like `debug`, but with six arguments.

#### Examples

```rescript
Console.debug6("Hello", "World", "JS", '!', '!', '?')
Console.debug6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.debugMany

```rescript
let debugMany: (. array<'a>) => unit
```

`debugMany(arr)`. Like `debug`, but variadic.

#### Examples

```rescript
Console.debugMany(["Hello", "World"])
Console.debugMany([1, 2, 3])
```

### let RescriptCore.Console.dir

```rescript
let dir: (. 'a) => unit
```

`dir(object)` displays an interactive view of the object in the console.

See [`console.dir`](https://developer.mozilla.org/en-US/docs/Web/API/console/dir)
on MDN.

#### Examples

```rescript
Console.dir({"language": "rescript", "version": 10.1.2})
```

### let RescriptCore.Console.dirxml

```rescript
let dirxml: (. 'a) => unit
```

`dirxml(object)` displays an interactive tree view of an XML/HTML element in the console.

See [`console.dirxml`](https://developer.mozilla.org/en-US/docs/Web/API/console/dirxml)
on MDN.

### let RescriptCore.Console.error

```rescript
let error: (. 'a) => unit
```

`error(value)` prints an error message to console.

See [`console.error`](https://developer.mozilla.org/en-US/docs/Web/API/console/error)
on MDN.

#### Examples

```rescript
Console.error("error message")
Console.error(("error", "invalid value"))
```

### let RescriptCore.Console.error2

```rescript
let error2: (. 'a, 'b) => unit
```

`error(v1, v2)`. Like `error`, but two arguments.

#### Examples

```rescript
Console.error2("Error", "here")
Console.error2(("log", "error"), "message")
```

### let RescriptCore.Console.error3

```rescript
let error3: (. 'a, 'b, 'c) => unit
```

`error3(v1, v2, v3)`. Like `error`, but three arguments.

#### Examples

```rescript
Console.error3("Hello", "World", "!!!")
Console.error3(#first, #second, #third)
```

### let RescriptCore.Console.error4

```rescript
let error4: (. 'a, 'b, 'c, 'd) => unit
```

`error4(v1, v2, v3, v4)`. Like `error`, but with four arguments.

#### Examples

```rescript
Console.error4("Hello", "World", "ReScript", '!')
Console.error4(#first, #second, #third, ("fourth"))
```

### let RescriptCore.Console.error5

```rescript
let error5: (. 'a, 'b, 'c, 'd, 'e) => unit
```

`error5(v1, v2, v3, v4, v5)`. Like `error`, but with five arguments.

#### Examples

```rescript
Console.error5('e', 'r, 'r', 'o', 'r')
Console.error5(1, #second, #third, ("fourth"), 'c')
```

### let RescriptCore.Console.error6

```rescript
let error6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit
```

`error6(v1, v2, v3, v4, v5, v6)`. Like `error`, but with six arguments.

#### Examples

```rescript
Console.error6("Hello", "World", "from", "JS", "!!!", '!')
Console.error6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.group

```rescript
let group: (. string) => unit
```

`group(label)` creates a new "group" level with the given label.

See [`console.group`](https://developer.mozilla.org/en-US/docs/Web/API/console/group)
on MDN.

#### Example

```rescript
Console.group("first group")
Console.group("second group")
Console.log("a message on the second level")
Console.groupEnd()
Console.log("a message message on the first level")
Console.groupEnd()
```

### let RescriptCore.Console.groupCollapsed

```rescript
let groupCollapsed: (. string) => unit
```

`groupCollapsed(label)`. Like `group` but collapses the group initially.

See [`console.groupCollapsed`](https://developer.mozilla.org/en-US/docs/Web/API/console/groupCollapsed)
on MDN.

### let RescriptCore.Console.groupEnd

```rescript
let groupEnd: (. unit) => unit
```

`groupEnd()` ends the current group.

See [`console.groupEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/groupEnd)
on MDN.

### let RescriptCore.Console.errorMany

```rescript
let errorMany: (. array<'a>) => unit
```

`errorMany(arr)`. Like `error`, but variadic.

#### Examples

```rescript
Console.errorMany(["Hello", "World"])
Console.errorMany([1, 2, 3])
```

### let RescriptCore.Console.info

```rescript
let info: (. 'a) => unit
```

`info(value)` print an informational message to console.

See [`console.info`](https://developer.mozilla.org/en-US/docs/Web/API/console/info)
on MDN.

#### Examples

```rescript
Console.info("Information")
Console.info(("Hello", "JS"))
```

### let RescriptCore.Console.info2

```rescript
let info2: (. 'a, 'b) => unit
```

`info2(v1, v2)`. Like `info`, but with two arguments.

#### Examples

```rescript
Console.info2("Info", "failed to download")
Console.info2(#info, {"name": "ReScript"})
```

### let RescriptCore.Console.info3

```rescript
let info3: (. 'a, 'b, 'c) => unit
```

`info3(v1, v2, v3)`. Like `info`, but with three arguments.

#### Examples

```rescript
Console.info3("Hello", "World", "ReScript")
Console.info3([1, 2, 3], #4, #5)
```

### let RescriptCore.Console.info4

```rescript
let info4: (. 'a, 'b, 'c, 'd) => unit
```

`info4(v1, v2, v3, v4)`. Like `info`, but with four arguments.

#### Examples

```rescript
Console.info4("Hello", "World", "ReScript", '!')
Console.info4([1, 2, 3], #4, #5, #lastinfo)
```

### let RescriptCore.Console.info5

```rescript
let info5: (. 'a, 'b, 'c, 'd, 'e) => unit
```

`info5(v1, v2, v3, v4, v5)`. Like `info`, but with five arguments.

#### Examples

```rescript
Console.info5("Hello", "World", "from", "JS", "!!!")
Console.info5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.info6

```rescript
let info6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit
```

`info6(v1, v2, v3, v4, v5, v6)`. Like `info`, but with six arguments.

#### Examples

```rescript
Console.info6("Hello", "World", "from", "JS", "!!!", '!')
Console.info6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.infoMany

```rescript
let infoMany: (. array<'a>) => unit
```

`infoMany(arr)`. Like `info`, but variadic.

#### Examples

```rescript
Console.infoMany(["Hello", "World"])
Console.infoMany([1, 2, 3])
```

### let RescriptCore.Console.log

```rescript
let log: (. 'a) => unit
```

`log(value)` print a message to console.

See [`console.log`](https://developer.mozilla.org/en-US/docs/Web/API/console/log)
on MDN.

#### Examples

```rescript
Console.log("Hello")
let obj = {"name": "ReScript", "version": 10}
Console.log(obj)
```

### let RescriptCore.Console.log2

```rescript
let log2: (. 'a, 'b) => unit
```

`log2(v1, v2)`. Like `log`, but with two arguments.

#### Examples

```rescript
Console.log2("Hello", "World")
Console.log2([1, 2, 3], '4')
```

### let RescriptCore.Console.log3

```rescript
let log3: (. 'a, 'b, 'c) => unit
```

`log3(v1, v2, v3)`. Like `log`, but with three arguments.

#### Examples

```rescript
Console.log3("Hello", "World", "ReScript")
Console.log3("One", 2, #3)
```

### let RescriptCore.Console.log4

```rescript
let log4: (. 'a, 'b, 'c, 'd) => unit
```

`log4(v1, v2, v3, v4)`. Like `log`, but with four arguments.

#### Examples

```rescript
Console.log4("Hello", "World", "ReScript", "!!!")
Console.log4([1, 2], (3, 4), [#5, #6], #"polyvar")
```

### let RescriptCore.Console.log5

```rescript
let log5: (. 'a, 'b, 'c, 'd, 'e) => unit
```

`log5(v1, v2, v3, v4, v5)`. Like `log`, but with five arguments.

#### Examples

```rescript
Console.log5("Hello", "World", "JS", '!', '!')
Console.log5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.log6

```rescript
let log6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit
```

`log6(v1, v2, v3, v4, v5, v6)`. Like `log`, but with six arguments.

#### Examples

```rescript
Console.log6("Hello", "World", "JS", '!', '!', '?')
Console.log6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.logMany

```rescript
let logMany: (. array<'a>) => unit
```

`logMany(arr)`. Like `log`, but variadic.

#### Examples

```rescript
Console.logMany(["Hello", "World"])
Console.logMany([1, 2, 3])
```

### let RescriptCore.Console.table

```rescript
let table: (. 'a) => unit
```

`table(object)` displays an tabular view of the object in the console.

See [`console.table`](https://developer.mozilla.org/en-US/docs/Web/API/console/table)
on MDN.

#### Examples

```rescript
Console.table({"language": "rescript", "version": 10.1.2})
```

### let RescriptCore.Console.time

```rescript
let time: (. string) => unit
```

`time(label)` creates a timer to measure how long an operation takes. `label`
must be a unique name. Call `console.timeEnd` with the same `label` to print
output time.

See [`console.time`](https://developer.mozilla.org/en-US/docs/Web/API/console/time)
on MDN.

#### Examples

```rescript
Console.time("for_time")
for x in 3 downto 1 {
  Console.log(x)
  Console.timeLog("for_time")
}
Console.timeEnd("for_time")
```

### let RescriptCore.Console.timeEnd

```rescript
let timeEnd: (. string) => unit
```

`timeEnd(label)` stops a timer created by `time`.

See [`console.timeEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/timeEnd)
on MDN.

#### Examples

```rescript
Console.time("for_time")
for x in 3 downto 1 {
  Console.log(x)
  Console.timeLog("for_time")
}
Console.timeEnd("for_time")
```

### let RescriptCore.Console.timeLog

```rescript
let timeLog: (. string) => unit
```

`timeLog(label)` prints the current elapsed time of the given timer to the console.

See [`console.timeLog`](https://developer.mozilla.org/en-US/docs/Web/API/console/timeLog)
on MDN.

#### Examples

```rescript
Console.time("for_time")
for x in 3 downto 1 {
  Console.log(x)
  Console.timeLog("for_time")
}
Console.timeEnd("for_time")
```

### let RescriptCore.Console.trace

```rescript
let trace: (. unit) => unit
```

`trace()` print a stack trace to console.

See [`console.trace`](https://developer.mozilla.org/en-US/docs/Web/API/console/trace)
on MDN.

#### Examples

```rescript
let main = () => {
  Console.trace()
}
main()
// In the console, the following trace will be displayed:
// main
// <anonymous>
```

### let RescriptCore.Console.warn

```rescript
let warn: (. 'a) => unit
```

`warn(value)` print a warning message to console.

See [`console.warn`](https://developer.mozilla.org/en-US/docs/Web/API/console/warn)
on MDN.

#### Examples

```rescript
Console.warn("Warning")
Console.warn(("Warning", "invalid number"))
```

### let RescriptCore.Console.warn2

```rescript
let warn2: (. 'a, 'b) => unit
```

`warn2(v1, v2)`. Like `warn`, but two arguments.

#### Examples

```rescript
Console.warn2("Hello", "World")
Console.warn2([1, 2, 3], 4)
```

### let RescriptCore.Console.warn3

```rescript
let warn3: (. 'a, 'b, 'c) => unit
```

`warn3(v1, v2, v3)`. Like `warn`, but three arguments.

#### Examples

```rescript
Console.warn3("Hello", "World", "ReScript")
Console.warn3([1, 2, 3], #4, #5)
```

### let RescriptCore.Console.warn4

```rescript
let warn4: (. 'a, 'b, 'c, 'd) => unit
```

`warn4(v1, v2, v3, v4)`. Like `warn`, but with four arguments.

#### Examples

```rescript
Console.warn4("Hello", "World", "ReScript", "!!!")
Console.warn4(#first, #second, #third, ("fourth"))
```

### let RescriptCore.Console.warn5

```rescript
let warn5: (. 'a, 'b, 'c, 'd, 'e) => unit
```

`warn5(v1, v2, v3, v4, v5)`. Like `warn`, but with five arguments.

#### Examples

```rescript
Console.warn5("Hello", "World", "from", "JS", "!!!")
Console.warn5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.warn6

```rescript
let warn6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit
```

`warn6(v1, v2, v3, v4, v5, v6)`. Like `warn`, but with six arguments.

#### Examples

```rescript
Console.warn6("Hello", "World", "from", "JS", "!!!", '!')
Console.warn6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.warnMany

```rescript
let warnMany: (. array<'a>) => unit
```

`warnMany(arr)`. Like `warn`, but variadic.

#### Examples

```rescript
Console.warnMany(["Hello", "World"])
Console.warnMany([1, 2, 3])
```

## module RescriptCore.DataView `alias`

### type RescriptCore.DataView.t

```rescript
type t
```

### let RescriptCore.DataView.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

### let RescriptCore.DataView.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

### let RescriptCore.DataView.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

### let RescriptCore.DataView.buffer

```rescript
let buffer: (. t) => Core__ArrayBuffer.t
```

### let RescriptCore.DataView.byteLength

```rescript
let byteLength: (. t) => int
```

### let RescriptCore.DataView.byteOffset

```rescript
let byteOffset: (. t) => int
```

### let RescriptCore.DataView.getInt8

```rescript
let getInt8: (. t) => int
```

### let RescriptCore.DataView.getUint8

```rescript
let getUint8: (. t) => int
```

### let RescriptCore.DataView.getInt16

```rescript
let getInt16: (. t) => int
```

### let RescriptCore.DataView.getUint16

```rescript
let getUint16: (. t) => int
```

### let RescriptCore.DataView.getInt32

```rescript
let getInt32: (. t) => int
```

### let RescriptCore.DataView.getUint32

```rescript
let getUint32: (. t) => int
```

### let RescriptCore.DataView.getFloat32

```rescript
let getFloat32: (. t) => float
```

### let RescriptCore.DataView.getFloat64

```rescript
let getFloat64: (. t) => float
```

### let RescriptCore.DataView.getBigInt64

```rescript
let getBigInt64: (. t) => Core__BigInt.t
```

### let RescriptCore.DataView.getBigUint64

```rescript
let getBigUint64: (. t) => Core__BigInt.t
```

### let RescriptCore.DataView.setInt8

```rescript
let setInt8: (. t, int) => unit
```

### let RescriptCore.DataView.setUint8

```rescript
let setUint8: (. t, int) => unit
```

### let RescriptCore.DataView.setInt16

```rescript
let setInt16: (. t, int) => unit
```

### let RescriptCore.DataView.setUint16

```rescript
let setUint16: (. t, int) => unit
```

### let RescriptCore.DataView.setInt32

```rescript
let setInt32: (. t, int) => unit
```

### let RescriptCore.DataView.setUint32

```rescript
let setUint32: (. t, int) => unit
```

### let RescriptCore.DataView.setFloat32

```rescript
let setFloat32: (. t, float) => unit
```

### let RescriptCore.DataView.setFloat64

```rescript
let setFloat64: (. t, float) => unit
```

### let RescriptCore.DataView.setBigInt64

```rescript
let setBigInt64: (. t, Core__BigInt.t) => unit
```

### let RescriptCore.DataView.setBigUint64

```rescript
let setBigUint64: (. t, Core__BigInt.t) => unit
```

## module RescriptCore.Date `alias`

Functions for interacting with JavaScript Dates.

### type RescriptCore.Date.t

```rescript
type t = Js.Date.t
```

A type representing a JavaScript date.

### type RescriptCore.Date.msSinceEpoch

```rescript
type msSinceEpoch = float
```

Time, in milliseconds, since / until the UNIX epoch (January 1, 1970 00:00:00 UTC).
Positive numbers represent dates after, negative numbers dates before epoch.

### type RescriptCore.Date.localeOptions

```rescript
type localeOptions = {
  dateStyle?: [#full | #long | #medium | #short],
  timeStyle?: [#full | #long | #medium | #short],
  weekday?: [#long | #narrow | #short],
  era?: [#long | #narrow | #short],
  year?: [#"2-digit" | #numeric],
  month?: [
    | #"2-digit"
    | #long
    | #narrow
    | #numeric
    | #short
  ],
  day?: [#"2-digit" | #numeric],
  hour?: [#"2-digit" | #numeric],
  minute?: [#"2-digit" | #numeric],
  second?: [#"2-digit" | #numeric],
  timeZoneName?: [#long | #short],
}
```

A type representing date time format options.

Note: There are some properties missing:
- fractionalSecondDigits
- dayPeriod
- calendar
- numberingSystem
- localeMatcher
- timeZone
- hour12
- hourCycle
- formatMatcher

See full spec at https://tc39.es/ecma402/#datetimeformat-objects

**Record Field:**

```rescript
dateStyle: option<[#full | #long | #medium | #short]>
```

 *optional*  
**Record Field:**

```rescript
timeStyle: option<[#full | #long | #medium | #short]>
```

 *optional*  
**Record Field:**

```rescript
weekday: option<[#long | #narrow | #short]>
```

 *optional*  
**Record Field:**

```rescript
era: option<[#long | #narrow | #short]>
```

 *optional*  
**Record Field:**

```rescript
year: option<[#"2-digit" | #numeric]>
```

 *optional*  
**Record Field:**

```rescript
month: option<[#"2-digit" | #long | #narrow | #numeric | #short]>
```

 *optional*  
**Record Field:**

```rescript
day: option<[#"2-digit" | #numeric]>
```

 *optional*  
**Record Field:**

```rescript
hour: option<[#"2-digit" | #numeric]>
```

 *optional*  
**Record Field:**

```rescript
minute: option<[#"2-digit" | #numeric]>
```

 *optional*  
**Record Field:**

```rescript
second: option<[#"2-digit" | #numeric]>
```

 *optional*  
**Record Field:**

```rescript
timeZoneName: option<[#long | #short]>
```

 *optional*  
### let RescriptCore.Date.make

```rescript
let make: (. unit) => t
```

`make()`

Creates a date object with the current date time as value.

#### Examples
```rescript
Date.make()
```

### let RescriptCore.Date.fromString

```rescript
let fromString: (. string) => t
```

`fromString(dateTimeString)`

Creates a date object from given date time string.
The string has to be in the ISO 8601 format YYYY-MM-DDTHH:mm:ss.sssZ (https://tc39.es/ecma262/#sec-date-time-string-format).

Invalid date time strings will create invalid dates.
You can use the result like any valid date, but many functions like `toString` will return "Invalid Date" or functions like `Date.getTime` will return NaN.

#### Examples
```rescript
Date.fromString("2023")
// 2023-01-01T00:00:00.000Z

Date.fromString("2023-02-20")
// 2023-02-20T00:00:00.000Z

Date.fromString("2023-02-20T16:40:00.00Z")
// 2023-02-20T16:40:00.000Z

Date.fromString("")
// Invalid Date

Date.fromString("")->getTime
// NaN
```

### let RescriptCore.Date.fromTime

```rescript
let fromTime: (. msSinceEpoch) => t
```

`fromTime(msSinceEpoch)`

Creates a date object from the given time in milliseconds since / until UNIX epoch (January 1, 1970 00:00:00 UTC).
Positive numbers create dates after epoch, negative numbers create dates before epoch.

#### Examples
```rescript
Date.fromTime(0.0)
// 1970-01-01T00:00:00.000Z

Date.fromTime(-86_400_000.0)
// 1969-12-31T00:00:00.000Z

Date.fromTime(86_400_000.0)
// 1970-01-02T00:00:00.000Z
```

### let RescriptCore.Date.makeWithYM

```rescript
let makeWithYM: (. ~year: int, ~month: int) => t
```

Creates a date object with the given year and month.
Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.makeWithYM(~year=2023, ~month=0)
// 2023-01-01T00:00:00.000Z

Date.makeWithYM(~year=2023, ~month=11)
// 2023-12-01T00:00:00.000Z

Date.makeWithYM(~year=2023, ~month=12)
// 2024-01-01T00:00:00.000Z

Date.makeWithYM(~year=2023, ~month=-1)
// 2022-12-01T00:00:00.000Z

// Note: The output depends on your local time zone.
// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)

```

### let RescriptCore.Date.makeWithYMD

```rescript
let makeWithYMD: (. ~year: int, ~month: int, ~date: int) => t
```

Creates a date object with the given year, month and date (day of month).
Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.makeWithYMD(~year=2023, ~month=1, ~date=20)
// 2023-02-20T00:00:00.000Z

Date.makeWithYMD(~year=2023, ~month=1, ~date=-1)
// 2022-11-29T00:00:00.000Z

Date.makeWithYMD(~year=2023, ~month=1, ~date=29)
// 2023-03-01T00:00:00.000Z
```

### let RescriptCore.Date.makeWithYMDH

```rescript
let makeWithYMDH: (. ~year: int, ~month: int, ~date: int, ~hours: int) => t
```

Creates a date object with the given year, month, date (day of month) and hours.
Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=16)
// 2023-02-20T16:00:00.000Z

Date.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=24)
// 2023-02-21T00:00:00.000Z

Date.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=-1)
// 2023-02-19T23:00:00.000Z

// Note: The output depends on your local time zone.
// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)

```

### let RescriptCore.Date.makeWithYMDHM

```rescript
let makeWithYMDHM: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
) => t
```

Creates a date object with the given year, month, date (day of month), hours and minutes.
Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40)
// 2023-02-20T16:40:00.000Z

Date.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=60)
// 2023-02-20T17:00:00.000Z

Date.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=-1)
// 2023-02-20T15:59:00.000Z

// Note: The output depends on your local time zone.
// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)

```

### let RescriptCore.Date.makeWithYMDHMS

```rescript
let makeWithYMDHMS: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
) => t
```

Creates a date object with the given year, month, date (day of month), hours, minutes and seconds.
Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0)
// 2023-02-20T16:40:00.000Z

Date.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=60)
// 2023-02-20T16:41:00.000Z

Date.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=-1)
// 2023-02-20T16:39:59.000Z

// Note: The output depends on your local time zone.
// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)

```

### let RescriptCore.Date.makeWithYMDHMSM

```rescript
let makeWithYMDHMSM: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => t
```

Creates a date object with the given year, month, date (day of month), hours, minutes, seconds and milliseconds.
Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=0)
// 2023-02-20T16:40:00.000Z

Date.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=1000)
// 2023-02-20T16:40:01.000Z

Date.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=-1)
// 2023-02-20T16:39:59.999Z

// Note: The output depends on your local time zone.
// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)

```

## module RescriptCore.Date.UTC

### let RescriptCore.Date.UTC.makeWithYM

```rescript
let makeWithYM: (. ~year: int, ~month: int) => msSinceEpoch
```

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
  Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
  Months are 0-indexed (0 = January, 11 = December).
  Values, which are out of range, will be carried over to the next bigger unit (s. example).

  ## Examples
  ```rescript
  Date.UTC.makeWithYM(~year=2023, ~month=0)
  // 1672531200000

  Date.UTC.makeWithYM(~year=2023, ~month=11)
  // 1701388800000

  Date.UTC.makeWithYM(~year=2023, ~month=12)
  // 1704067200000

  Date.UTC.makeWithYM(~year=2023, ~month=-1)
  // 1669852800000
  ```

### let RescriptCore.Date.UTC.makeWithYMD

```rescript
let makeWithYMD: (. ~year: int, ~month: int, ~date: int) => msSinceEpoch
```

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
  Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
  Months are 0-indexed (0 = January, 11 = December).
  Values, which are out of range, will be carried over to the next bigger unit (s. example).

  ## Examples
  ```rescript
  Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=20)
  // 1676851200000

  Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=-1)
  // 1675036800000

  Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=29)
  // 1677628800000
  ```

### let RescriptCore.Date.UTC.makeWithYMDH

```rescript
let makeWithYMDH: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
) => msSinceEpoch
```

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
  Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
  Months are 0-indexed (0 = January, 11 = December).
  Values, which are out of range, will be carried over to the next bigger unit (s. example).

  ## Examples
  ```rescript
  Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=16)
  // 1676908800000

  Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=24)
  // 1676937600000

  Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=-1)
  // 1676847600000
  ```

### let RescriptCore.Date.UTC.makeWithYMDHM

```rescript
let makeWithYMDHM: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
) => msSinceEpoch
```

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
  Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
  Months are 0-indexed (0 = January, 11 = December).
  Values, which are out of range, will be carried over to the next bigger unit (s. example).

  ## Examples
  ```rescript
  Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40)
  // 1676911200000

  Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=60)
  // 1676912400000

  Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=-1)
  // 1676908740000
  ```

### let RescriptCore.Date.UTC.makeWithYMDHMS

```rescript
let makeWithYMDHMS: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
) => msSinceEpoch
```

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
  Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
  Months are 0-indexed (0 = January, 11 = December).
  Values, which are out of range, will be carried over to the next bigger unit (s. example).

  ## Examples
  ```rescript
  Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0)
  // 1676911200000

  Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=60)
  // 1676911260000

  Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=-1)
  // 1676911199000
  ```

### let RescriptCore.Date.UTC.makeWithYMDHMSM

```rescript
let makeWithYMDHMSM: (.
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => msSinceEpoch
```

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
  Be aware of using a value for year \< 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
  Months are 0-indexed (0 = January, 11 = December).
  Values, which are out of range, will be carried over to the next bigger unit (s. example).

  ## Examples
  ```rescript
  ```
  Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=0)-\>Console.log
  // 1676911200000

  Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=1000)-\>Console.log
  // 1676911201000

  Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=-1)-\>Console.log
  // 1676911199999

### let RescriptCore.Date.now

```rescript
let now: (. unit) => msSinceEpoch
```

`now()`

Returns the time, in milliseconds, between UNIX epoch (January 1, 1970 00:00:00 UTC) and the current date time.

### let RescriptCore.Date.equal

```rescript
let equal: (. t, t) => bool
```

### let RescriptCore.Date.compare

```rescript
let compare: (. t, t) => Core__Ordering.t
```

### let RescriptCore.Date.getTime

```rescript
let getTime: (. t) => msSinceEpoch
```

`getTime(date)`

Returns the time, in milliseconds, between UNIX epoch (January 1, 1970 00:00:00 UTC) and the current date time.
Invalid dates will return NaN.
Dates before epoch will return negative numbers.

#### Examples
```rescript
Date.fromString("2023-02-20")->Date.getTime
// 1676851200000
```

### let RescriptCore.Date.getTimezoneOffset

```rescript
let getTimezoneOffset: (. t) => int
```

`getTimezoneOffset(date)`

Returns the time in minutes between the UTC time and the locale time.
The timezone of the given date doesn't matter.

#### Examples
```rescript
Date.fromString("2023-01-01")->Date.getTimezoneOffset
// -60 with local time zone = Europe/Berlin

Date.fromString("2023-06-01")->Date.getTimezoneOffset
// -120 with local time zone = Europe/Berlin
```

### let RescriptCore.Date.getFullYear

```rescript
let getFullYear: (. t) => int
```

`getFullYear(date)`

Returns the year of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20")->Date.getFullYear
// 2023
```

### let RescriptCore.Date.getMonth

```rescript
let getMonth: (. t) => int
```

`getMonth(date)`

Returns the month (0-indexed) of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-01-01")->Date.getMonth
// 0
```

### let RescriptCore.Date.getDate

```rescript
let getDate: (. t) => int
```

`getDate(date)`

Returns the date (day of month) of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getDate
// 20
```

### let RescriptCore.Date.getHours

```rescript
let getHours: (. t) => int
```

`getHours(date)`

Returns the hours of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getHours
// 16
```

### let RescriptCore.Date.getMinutes

```rescript
let getMinutes: (. t) => int
```

`getMinutes(date)`

Returns the minutes of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getMinutes
// 40
```

### let RescriptCore.Date.getSeconds

```rescript
let getSeconds: (. t) => int
```

`getSeconds(date)`

Returns the seconds of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getSeconds
// 0
```

### let RescriptCore.Date.getMilliseconds

```rescript
let getMilliseconds: (. t) => int
```

`getMilliseconds(date)`

Returns the milliseconds of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getMilliseconds
// 0
```

### let RescriptCore.Date.getDay

```rescript
let getDay: (. t) => int
```

`getDay(date)`

Returns the day of week of a given date (according to local time).
0 = Sunday, 1 = Monday, ... 6 = Saturday

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getDay
// 1
```

### let RescriptCore.Date.setFullYear

```rescript
let setFullYear: (. t, int) => unit
```

`setFullYear(date, year)`

Sets the year of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setFullYear(2024)
```

### let RescriptCore.Date.setFullYearM

```rescript
let setFullYearM: (. t, ~year: int, ~month: int) => unit
```

`setFullYearM(date, ~year, ~month)`

Sets the year and month of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setFullYearM(~year=2024, ~month=0)
```

### let RescriptCore.Date.setFullYearMD

```rescript
let setFullYearMD: (. t, ~year: int, ~month: int, ~date: int) => unit
```

`setFullYearMD(date, ~year, ~month, ~date)`

Sets the year, month and date (day of month) of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setFullYearMD(~year=2024, ~month=0, ~date=1)
```

### let RescriptCore.Date.setMonth

```rescript
let setMonth: (. t, int) => unit
```

`setMonth(date, month)`

Sets the month of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMonth(0)
```

### let RescriptCore.Date.setDate

```rescript
let setDate: (. t, int) => unit
```

`setDate(date, day)`

Sets the date (day of month) of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setDate(1)
```

### let RescriptCore.Date.setHours

```rescript
let setHours: (. t, int) => unit
```

`setHours(date, hours)`

Sets the hours of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHours(0)
```

### let RescriptCore.Date.setHoursM

```rescript
let setHoursM: (. t, ~hours: int, ~minutes: int) => unit
```

`setHoursM(date, ~hours, ~minutes)`

Sets the hours and minutes of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHoursM(~hours=0, ~minutes=0)
```

### let RescriptCore.Date.setHoursMS

```rescript
let setHoursMS: (. t, ~hours: int, ~minutes: int, ~seconds: int) => unit
```

`setHoursMS(date, ~hours, ~minutes, ~seconds)`

Sets the hours, minutes and seconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHoursMS(~hours=0, ~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setHoursMSMs

```rescript
let setHoursMSMs: (.
  t,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => unit
```

`setHoursMSMs(date, ~hours, ~minutes, ~seconds, ~milliseconds)`

Sets the hours, minutes, seconds and milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setMinutes

```rescript
let setMinutes: (. t, int) => unit
```

`setMinutes(date, minutes)`

Sets the minutes of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMinutes(0)
```

### let RescriptCore.Date.setMinutesS

```rescript
let setMinutesS: (. t, ~minutes: int, ~seconds: int) => unit
```

`setMinutesS(date, ~minutes, ~seconds)`

Sets the minutes and seconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMinutesS(~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setMinutesSMs

```rescript
let setMinutesSMs: (.
  t,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => unit
```

`setMinutesSMs(date, ~minutes, ~seconds, ~milliseconds)`

Sets the minutes, seconds and milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMinutesSMs(~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setSeconds

```rescript
let setSeconds: (. t, int) => unit
```

`setSeconds(date, seconds)`

Sets the seconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setSeconds(0)
```

### let RescriptCore.Date.setSecondsMs

```rescript
let setSecondsMs: (. t, ~seconds: int, ~milliseconds: int) => unit
```

`setSecondsMs(date, ~seconds, ~milliseconds)`

Sets the seconds and milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setSecondsMs(~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setMilliseconds

```rescript
let setMilliseconds: (. t, int) => unit
```

`setMilliseconds(date, milliseconds)`

Sets the milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMilliseconds(0)
```

### let RescriptCore.Date.getUTCFullYear

```rescript
let getUTCFullYear: (. t) => int
```

`getUTCFullYear(date)`

Returns the year of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCFullYear
// 2022
```

### let RescriptCore.Date.getUTCMonth

```rescript
let getUTCMonth: (. t) => int
```

`getUTCMonth(date)`

Returns the month of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCMonth
// 11
```

### let RescriptCore.Date.getUTCDate

```rescript
let getUTCDate: (. t) => int
```

`getUTCDate(date)`

Returns the date (day of month) of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCDate
// 31
```

### let RescriptCore.Date.getUTCHours

```rescript
let getUTCHours: (. t) => int
```

`getUTCHours(date)`

Returns the hours of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCHours
// 23
```

### let RescriptCore.Date.getUTCMinutes

```rescript
let getUTCMinutes: (. t) => int
```

`getUTCMinutes(date)`

Returns the minutes of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCMinutes
// 0
```

### let RescriptCore.Date.getUTCSeconds

```rescript
let getUTCSeconds: (. t) => int
```

`getUTCSeconds(date)`

Returns the seconds of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCSeconds
// 0
```

### let RescriptCore.Date.getUTCMilliseconds

```rescript
let getUTCMilliseconds: (. t) => int
```

`getUTCMilliseconds(date)`

Returns the milliseconds of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCMilliseconds
// 0
```

### let RescriptCore.Date.getUTCDay

```rescript
let getUTCDay: (. t) => int
```

`getUTCDay(date)`

Returns the day (day of week) of a given date (according to UTC time).
0 = Sunday, 1 = Monday, ... 6 = Saturday

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCDay
// 6
```

### let RescriptCore.Date.setUTCFullYear

```rescript
let setUTCFullYear: (. t, int) => unit
```

`setUTCFullYear(date, year)`

Sets the year of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCFullYear(2024)
```

### let RescriptCore.Date.setUTCFullYearM

```rescript
let setUTCFullYearM: (. t, ~year: int, ~month: int) => unit
```

`setUTCFullYearM(date, ~year, ~month)`

Sets the year and month of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCFullYearM(~year=2024, ~month=0)
```

### let RescriptCore.Date.setUTCFullYearMD

```rescript
let setUTCFullYearMD: (. t, ~year: int, ~month: int, ~date: int) => unit
```

`setUTCFullYearMD(date, ~year, ~month, ~date)`

Sets the year, month and date (day of month) of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCFullYearMD(~year=2024, ~month=0, ~date=1)
```

### let RescriptCore.Date.setUTCMonth

```rescript
let setUTCMonth: (. t, int) => unit
```

`setUTCMonth(date, month)`

Sets the month of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMonth(0)
```

### let RescriptCore.Date.setUTCDate

```rescript
let setUTCDate: (. t, int) => unit
```

`setDate(date, day)`

Sets the date (day of month) of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCDate(1)
```

### let RescriptCore.Date.setUTCHours

```rescript
let setUTCHours: (. t, int) => unit
```

`setUTCHours(date, hours)`

Sets the hours of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHours(0)
```

### let RescriptCore.Date.setUTCHoursM

```rescript
let setUTCHoursM: (. t, ~hours: int, ~minutes: int) => unit
```

`setHoursM(date, ~hours, ~minutes)`

Sets the hours and minutes of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHoursM(~hours=0, ~minutes=0)
```

### let RescriptCore.Date.setUTCHoursMS

```rescript
let setUTCHoursMS: (. t, ~hours: int, ~minutes: int, ~seconds: int) => unit
```

`setUTCHoursMS(date, ~hours, ~minutes, ~seconds)`

Sets the hours, minutes and seconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHoursMS(~hours=0, ~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setUTCHoursMSMs

```rescript
let setUTCHoursMSMs: (.
  t,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => unit
```

`setUTCHoursMSMs(date, ~hours, ~minutes, ~seconds, ~milliseconds)`

Sets the hours, minutes, seconds and milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setUTCMinutes

```rescript
let setUTCMinutes: (. t, int) => unit
```

`setUTCMinutes(date, minutes)`

Sets the minutes of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMinutes(0)
```

### let RescriptCore.Date.setUTCMinutesS

```rescript
let setUTCMinutesS: (. t, ~minutes: int, ~seconds: int) => unit
```

`setUTCMinutesS(date, ~minutes, ~seconds)`

Sets the minutes and seconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMinutesS(~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setUTCMinutesSMs

```rescript
let setUTCMinutesSMs: (.
  t,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => unit
```

`setUTCMinutesSMs(date, ~minutes, ~seconds, ~milliseconds)`

Sets the minutes, seconds and milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMinutesSMs(~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setUTCSeconds

```rescript
let setUTCSeconds: (. t, int) => unit
```

`setUTCSeconds(date, seconds)`

Sets the seconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCSeconds(0)
```

### let RescriptCore.Date.setUTCSecondsMs

```rescript
let setUTCSecondsMs: (. t, ~seconds: int, ~milliseconds: int) => unit
```

`setUTCSecondsMs(date, ~seconds, ~milliseconds)`

Sets the seconds and milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCSecondsMs(~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setUTCMilliseconds

```rescript
let setUTCMilliseconds: (. t, int) => unit
```

`setUTCMilliseconds(date, milliseconds)`

Sets the milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMilliseconds(0)
```

### let RescriptCore.Date.toDateString

```rescript
let toDateString: (. t) => string
```

`toDateString(date)`

Converts a JavaScript date to a standard date string. The date will be mapped to the current time zone.
If you want to convert it to a localized string, use `Date.toLocaleDateString` instead.

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00")->Date.toDateString->Console.log
// Sun Jan 01 2023

Date.fromString("2023-01-01T00:00:00.00+08:00")->Date.toDateString->Console.log
// Sat Dec 31 2022
```

### let RescriptCore.Date.toString

```rescript
let toString: (. t) => string
```

`toString(date)`

Converts a JavaScript date to a standard date time string. The date will be mapped to the current time zone.
If you want to convert it to a localized string, use `Date.toLocaleString` instead.

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00")->Date.toString->Console.log
// Sun Jan 01 2023 00:00:00 GMT+0100 (Central European Standard Time)

Date.fromString("2023-06-01T00:00:00.00+01:00")->Date.toString->Console.log
// Thu Jun 01 2023 01:00:00 GMT+0200 (Central European Summer Time)
```

### let RescriptCore.Date.toTimeString

```rescript
let toTimeString: (. t) => string
```

`toTimeString(date)`

Converts a JavaScript date to a standard time string. The date will be mapped to the current time zone.
If you want to convert it to a localized string, use `Date.toLocaleStimeString` instead.

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00")->Date.toTimeString->Console.log
// 00:00:00 GMT+0100 (Central European Standard Time)

Date.fromString("2023-01-01T00:00:00.00+08:00")->Date.toTimeString->Console.log
// 17:00:00 GMT+0100 (Central European Standard Time)
```

### let RescriptCore.Date.toLocaleDateString

```rescript
let toLocaleDateString: (. t) => string
```

`toLocaleDateString(date)`

Converts a JavaScript date to a localized date string. It will use the current locale.

#### Examples
```rescript
Date.make()->Date.toLocaleDateString->Console.log
// 2/19/2023
```

### let RescriptCore.Date.toLocaleDateStringWithLocale

```rescript
let toLocaleDateStringWithLocale: (. t, string) => string
```

`toLocaleDateStringWithLocale(date, locale)`

Converts a JavaScript date to a localized date string. It will use the specified locale.

#### Examples
```rescript
Date.make()->Date.toLocaleDateStringWithLocale("en-US")->Console.log
// 2/19/2023
```

### let RescriptCore.Date.toLocaleDateStringWithLocaleAndOptions

```rescript
let toLocaleDateStringWithLocaleAndOptions: (. t, string, localeOptions) => string
```

`toLocaleDateStringWithLocaleAndOptions(date, locale, options)`

Converts a JavaScript date to a localized date string. It will use the specified locale and formatting options.

#### Examples
```rescript
Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("en-US", { dateStyle: #long })->Console.log
// February 19, 2023

Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("de", { hour: #"2-digit", minute: #"2-digit" })->Console.log
// 19.2.2023, 15:40

Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("de", { year: #numeric })->Console.log
// 2023
```

### let RescriptCore.Date.toLocaleString

```rescript
let toLocaleString: (. t) => string
```

`toLocaleString(date)`

Converts a JavaScript date to a localized date-time string. It will use the current locale.

#### Examples
```rescript
Date.make()->Date.toLocaleString->Console.log
// 2/19/2023, 3:40:00 PM
```

### let RescriptCore.Date.toLocaleStringWithLocale

```rescript
let toLocaleStringWithLocale: (. t, string) => string
```

`toLocaleStringWithLocale(date, locale)`

Converts a JavaScript date to a localized date-time string. It will use the specified locale.

#### Examples
```rescript
Date.make()->Date.toLocaleStringWithLocale("en-US")->Console.log
// 2/19/2023, 3:40:00 PM
```

### let RescriptCore.Date.toLocaleStringWithLocaleAndOptions

```rescript
let toLocaleStringWithLocaleAndOptions: (. t, string, localeOptions) => string
```

`toLocaleStringWithLocaleAndOptions(date, locale, options)`

Converts a JavaScript date to a localized date-time string. It will use the specified locale and formatting options.

#### Examples
```rescript
Date.make()->Date.toLocaleStringWithLocaleAndOptions("en", { dateStyle: #short, timeStyle: #short })->Console.log
// 2/19/23, 3:40 PM

Date.make()->Date.toLocaleStringWithLocaleAndOptions("en", { era: #long, year: #numeric, month: #"2-digit", day: #"2-digit", hour: #numeric, timeZoneName: #short })->Console.log
// 02/19/2023 Anno Domini, 3 PM GMT+1
```

### let RescriptCore.Date.toLocaleTimeString

```rescript
let toLocaleTimeString: (. t) => string
```

`toLocaleTimeString(date)`

Converts a JavaScript date to a localized time string. It will use the current locale.

#### Examples
```rescript
Date.make()->Date.toLocaleTimeString->Console.log
// 3:40:00 PM
```

### let RescriptCore.Date.toLocaleTimeStringWithLocale

```rescript
let toLocaleTimeStringWithLocale: (. t, string) => string
```

`toLocaleTimeStringWithLocale(date, locale)`

Converts a JavaScript date to a localized time string. It will use the specified locale.

#### Examples
```rescript
Date.make()->Date.toLocaleTimeStringWithLocale("en-US")->Console.log
// 3:40:00 PM
```

### let RescriptCore.Date.toLocaleTimeStringWithLocaleAndOptions

```rescript
let toLocaleTimeStringWithLocaleAndOptions: (. t, string, localeOptions) => string
```

`toLocaleTimeStringWithLocaleAndOptions(date, locale, options)`

Converts a JavaScript date to a localized time string. It will use the specified locale and formatting options.

#### Examples
```rescript
Date.make()->Date.toLocaleTimeStringWithLocaleAndOptions("en-US", { timeStyle: #long })->Console.log
// 3:40:00 PM GMT+1

Date.make()->Date.toLocaleTimeStringWithLocaleAndOptions("de", { hour: #"2-digit", minute: #"2-digit" })->Console.log
// 15:40
```

### let RescriptCore.Date.toISOString

```rescript
let toISOString: (. t) => string
```

`toISOString(date)`

Converts a JavaScript date to a ISO 8601 string (YYYY-MM-DDTHH:mm:ss.sssZ). The date will be mapped to the UTC time.

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+00:00")->Date.toISOString->Console.log
// 2023-01-01T00:00:00.000Z

Date.fromString("2023-01-01T00:00:00.00+08:00")->Date.toISOString->Console.log
// 2022-12-31T16:00:00.000Z
```

### let RescriptCore.Date.toUTCString

```rescript
let toUTCString: (. t) => string
```

`toUTCString(date)`

Converts a JavaScript date to date time string. The date will be mapped to the UTC time.

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+00:00")->Date.toUTCString->Console.log
// Sun, 01 Jan 2023 00:00:00 GMT

Date.fromString("2023-01-01T00:00:00.00+08:00")->Date.toUTCString->Console.log
// Sat, 31 Dec 2022 16:00:00 GMT
```

### let RescriptCore.Date.toJSON

```rescript
let toJSON: (. t) => option<string>
```

`toJSON(date)`

Converts a JavaScript date to a string.
If the date is valid, the function will return the same result as `Date.toISOString`.
Invalid dates will return `None`.

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+00:00")->Date.toJSON
// Some("2023-01-01T00:00:00.000Z")

Date.fromString("")->Date.toJSON
// None
```

## module RescriptCore.Dict `alias`

A mutable dictionary with string keys.

Compiles to a regular JavaScript object.

### type RescriptCore.Dict.t

```rescript
type t<'a> = Js.Dict.t<'a>
```

Type representing a dictionary of value `'a`.

### let RescriptCore.Dict.getUnsafe

```rescript
let getUnsafe: (. t<'a>, string) => 'a
```

`getUnsafe(dict, key)` Returns the `value` at the provided `key`.

This is _unsafe_, meaning it will return `undefined` value if `key` does not exist in `dict`.

Use `Dict.getUnsafe` only when you are sure the key exists (i.e. when iterating `Dict.keys` result).

#### Examples
```rescript
let keys = dict->Dict.keys
keys->Array.forEach(key => {
  let value = dict->Dict.getUnsafe(key)
  Console.log(value)
})
```

### let RescriptCore.Dict.get

```rescript
let get: (. t<'a>, string) => option<'a>
```

Returns the value at the provided key, if it exists. Returns an option.

#### Examples
```rescript
let dict = Dict.fromArray([("someKey", "someValue")])

switch dict->Dict.get("someKey") {
| None => Console.log("Nope, didn't have the key.")
| Some(value) => Console.log(value)
}
```

### let RescriptCore.Dict.set

```rescript
let set: (. t<'a>, string, 'a) => unit
```

`set(dictionary, key, value)` sets the value at the provided key to the provided value.

#### Examples
```rescript
let dict = Dict.make()

dict->Dict.set("someKey", "someValue")
```

### let RescriptCore.Dict.delete

```rescript
let delete: (. t<'a>, string) => unit
```

`delete(dictionary, key)` deletes the value at `key`, if it exists.

#### Examples
```rescript
let dict = Dict.fromArray([("someKey", "someValue")])

dict->Dict.delete("someKey")
```

### let RescriptCore.Dict.make

```rescript
let make: (. unit) => t<'a>
```

`make()` creates a new, empty dictionary.

#### Examples
```rescript
let dict1: Dict.t<int> = Dict.make() // You can annotate the type of the values of your dict yourself if you want

let dict2 = Dict.make() // Or you can let ReScript infer it via usage.
dict2->Dict.set("someKey", 12)
```

### let RescriptCore.Dict.fromArray

```rescript
let fromArray: (. array<(string, 'a)>) => t<'a>
```

`fromArray(entries)` creates a new dictionary from the provided array of key/value pairs.

#### Examples
```rescript
let dict = Dict.fromArray([("key1", "value1"), ("key2", "value2")])
```

### let RescriptCore.Dict.fromIterator

```rescript
let fromIterator: (. Core__Iterator.t<(string, 'a)>) => t<'a>
```

`fromIterator(entries)` creates a new dictionary from the provided iterator of key/value pairs.

#### Examples
```rescript
// Pretend we have an iterator of the correct shape
@val external someIterator: Iterator.t<(string, int)> = "someIterator"

let dict = Dict.fromIterator(someIterator) // Dict.t<int>
```

### let RescriptCore.Dict.toArray

```rescript
let toArray: (. t<'a>) => array<(string, 'a)>
```

`toArray(dictionary)` returns an array of all the key/value pairs of the dictionary.

#### Examples
```rescript
let dict = Dict.make()
dict->Dict.set("someKey", 1)
dict->Dict.set("someKey2", 2)
let asArray = dict->Dict.toArray
Console.log(asArray) // Logs `[["someKey", 1], ["someKey2", 2]]` to the console
```

### let RescriptCore.Dict.keysToArray

```rescript
let keysToArray: (. t<'a>) => array<string>
```

`keysToArray(dictionary)` returns an array of all the keys of the dictionary.

#### Examples
```rescript
let dict = Dict.make()
dict->Dict.set("someKey", 1)
dict->Dict.set("someKey2", 2)
let keys = dict->Dict.keysToArray
Console.log(keys) // Logs `["someKey", "someKey2"]` to the console
```

### let RescriptCore.Dict.valuesToArray

```rescript
let valuesToArray: (. t<'a>) => array<'a>
```

`valuesToArray(dictionary)` returns an array of all the values of the dictionary.

#### Examples
```rescript
let dict = Dict.make()
dict->Dict.set("someKey", 1)
dict->Dict.set("someKey2", 2)
let values = dict->Dict.valuesToArray
Console.log(values) // Logs `[1, 2]` to the console
```

### let RescriptCore.Dict.assign

```rescript
let assign: (. t<'a>, t<'a>) => t<'a>
```

`assign(dictionary1, dictionary2)` [shallowly](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) merges dictionary2 into dictionary1, and returns dictionary1.

Beware this will *mutate* dictionary1. If you're looking for a way to copy a dictionary, check out `Dict.copy`.

#### Examples
```rescript
let dict1 = Dict.make()
dict1->Dict.set("firstKey", 1)
Console.log(dict1->Dict.keysToArray) // Logs `["firstKey"]`

let dict2 = Dict.make()
dict2->Dict.set("someKey", 2)
dict2->Dict.set("someKey2", 3)

let dict1 = dict1->Dict.assign(dict2)

Console.log(dict1->Dict.keysToArray) // Logs `["firstKey", "someKey", "someKey2"]`

```

### let RescriptCore.Dict.copy

```rescript
let copy: (. t<'a>) => t<'a>
```

`copy(dictionary)` [shallowly copies](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) the provided dictionary to a new dictionary.

#### Examples
```rescript
let dict = Dict.fromArray([("key1", "value1"), ("key2", "value2")])
let dict2 = dict->Dict.copy

// Both log `["key1", "key2"]` here.
Console.log2(dict->Dict.keysToArray, dict2->Dict.keysToArray)
```

## module RescriptCore.Error `alias`

Functions for working with JavaScript exceptions.

See [`Error`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error) on MDN.

### type RescriptCore.Error.t

```rescript
type t = Js.Exn.t
```

Represents a JavaScript exception.

### let RescriptCore.Error.fromException

```rescript
let fromException: (. exn) => option<t>
```

### let RescriptCore.Error.toException

```rescript
let toException: (. t) => exn
```

Turns an `Error.t` into an `exn`.

#### Examples
```rescript
let error = Error.make("Something went wrong.")

let asExn = error->Error.toException // `asExn` is now type `exn`
```

### let RescriptCore.Error.stack

```rescript
let stack: (. t) => option<string>
```

`stack(error)` retrieves the `stack` property of the error, if it exists. The stack is a list of what functions were called, and what files they are defined in, prior to the error happening.

See [`Error.prototype.stack`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Stack) on MDN.

#### Example
```rescript
Console.log(someError->Error.stack) // Logs `stack` if it exists on `someError`
```

### let RescriptCore.Error.message

```rescript
let message: (. t) => option<string>
```

`message(error)` retrieves the `message` property of the error, if it exists.

See [`Error.prototype.message`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message) on MDN.

#### Example
```rescript
let error = Error.SyntaxError.make("Some message here")
Console.log(error->Error.message) // Logs "Some message here" to the console
```

### let RescriptCore.Error.name

```rescript
let name: (. t) => option<string>
```

`name(error)` retrieves the `name` property of the error, if it exists.

See [`Error.prototype.name`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name) on MDN.

#### Example
```rescript
let error = Error.SyntaxError.make("Some message here")
Console.log(error->Error.name) // Logs "SyntaxError" to the console
```

### let RescriptCore.Error.fileName

```rescript
let fileName: (. t) => option<string>
```

`fileName(error)` retrieves the `fileName` property of the error, if it exists.

See [`Error.prototype.fileName`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/fileName) on MDN.

### let RescriptCore.Error.make

```rescript
let make: (. string) => t
```

`make(message)` creates a new error, setting its `message` to the provided value.

See [`Error`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Error) on MDN.

#### Example
```rescript
let error = Error.make("Some message here")
Console.log(error->Error.message) // Logs "Some message here" to the console
Console.log(error->Error.name) // Logs "Error" to the console, because this is a regular error
```

## module RescriptCore.Error.EvalError

### let RescriptCore.Error.EvalError.make

```rescript
let make: (. string) => t
```

Creates a new `EvalError` with the provided `message`.

  See [`EvalError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/EvalError) on MDN.

## module RescriptCore.Error.RangeError

### let RescriptCore.Error.RangeError.make

```rescript
let make: (. string) => t
```

Creates a new `RangeError` with the provided `message`.

  See [`RangeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RangeError) on MDN.

## module RescriptCore.Error.ReferenceError

### let RescriptCore.Error.ReferenceError.make

```rescript
let make: (. string) => t
```

Creates a new `ReferenceError` with the provided `message`.

  See [`ReferenceError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError) on MDN.

## module RescriptCore.Error.SyntaxError

### let RescriptCore.Error.SyntaxError.make

```rescript
let make: (. string) => t
```

Creates a new `SyntaxError` with the provided `message`.

  See [`SyntaxError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError) on MDN.

## module RescriptCore.Error.TypeError

### let RescriptCore.Error.TypeError.make

```rescript
let make: (. string) => t
```

Creates a new `TypeError` with the provided `message`.

  See [`TypeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) on MDN.

## module RescriptCore.Error.URIError

### let RescriptCore.Error.URIError.make

```rescript
let make: (. string) => t
```

Creates a new `URIError` with the provided `message`.

  See [`URIError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/URIError) on MDN.

### let RescriptCore.Error.raise

```rescript
let raise: (. t) => 'a
```

Raises (throws in JavaScript language) the provided `Error.t`, which will stop execution.

#### Examples
```rescript
let error = Error.make("Everything is upside down.")

if 5 > 10 {
  error->Error.raise
} else {
  Console.log("Phew, sanity still rules.")
}
```

### let RescriptCore.Error.panic

```rescript
let panic: (. string) => 'a
```

Raises a panic exception with the given message.

A panic exception is a native JavaScript exception that is not intended to be caught and
handled. Compared to a ReScript exception this will give a better stack trace and
debugging experience.

#### Examples
```rescript
Error.panic("Uh oh. This was unexpected!")
```

## module RescriptCore.Float `alias`

Functions for interacting with float.

## module RescriptCore.Float.Constants

### let RescriptCore.Float.Constants.nan

```rescript
let nan: float
```

The special value "Not a Number"
  See [`NaN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) on MDN.

  ## Examples

  ```rescript
  Float.Constants.nan
  ```

### let RescriptCore.Float.Constants.epsilon

```rescript
let epsilon: float
```

Represents the difference between 1 and the smallest floating point number greater than 1.
  See [`Number.EPSILON`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/EPSILON) on MDN.

  ## Examples

  ```rescript
  Float.Constants.epsilon
  ```

### let RescriptCore.Float.Constants.positiveInfinity

```rescript
let positiveInfinity: float
```

The positive Infinity value
  See [`Number.POSITIVE_INFINITY`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) on MDN.

  ## Examples

  ```rescript
  Float.Constants.positiveInfinity
  ```

### let RescriptCore.Float.Constants.negativeInfinity

```rescript
let negativeInfinity: float
```

The negative Infinity value
  See [`Number.NEGATIVE_INFINITY`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY) on MDN.

  ## Examples

  ```rescript
  Float.Constants.negativeInfinity
  ```

### let RescriptCore.Float.Constants.minValue

```rescript
let minValue: float
```

The smallest positive numeric value representable in JavaScript.
  See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) on MDN.

  ## Examples

  ```rescript
  Float.Constants.minValue
  ```

### let RescriptCore.Float.Constants.maxValue

```rescript
let maxValue: float
```

The maximum positive numeric value representable in JavaScript.
  See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) on MDN.

  ## Examples

  ```rescript
  Float.Constants.minValue
  ```

### let RescriptCore.Float.equal

```rescript
let equal: (. float, float) => bool
```

### let RescriptCore.Float.compare

```rescript
let compare: (. float, float) => Core__Ordering.t
```

### let RescriptCore.Float.isNaN

```rescript
let isNaN: (. float) => bool
```

`isNaN(v)` tests if the given `v` is `NaN`.
See [`NaN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) on MDN.

#### Examples

```rescript
Float.isNaN(3.0) // false
Float.isNaN(Float.Constants.nan) // true
```

### let RescriptCore.Float.isFinite

```rescript
let isFinite: (. float) => bool
```

`isFinite(v)` tests if the given `v` is finite.
See [`isFinite`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/isFinite) on MDN.

#### Examples

```rescript
Float.isFinite(1.0) // true
Float.isFinite(Float.Constants.nan) // false
Float.isFinite(Float.Constants.positiveInfinity) // false
```

### let RescriptCore.Float.parseFloat

```rescript
let parseFloat: (. string) => float
```

`parseFloat(v)` parse the given `v` and returns a float. Leading whitespace in
`v` is ignored. Returns `NaN` if `v` can't be parsed. Use [`fromString`] to
ensure it returns a valid float and not `NaN`.
See [`parseFloat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseFloat) on MDN.

#### Examples

```rescript
Float.parseFloat("1.0") // 1.0
Float.parseFloat("  3.14   ") // 3.14
Float.parseFloat(3.0) // 3.0
Float.parseFloat("3.14some non-digit characters") // 3.14
Float.parseFloat("error")->Float.isNaN // true
```

### let RescriptCore.Float.parseInt

```rescript
let parseInt: (. 'a) => float
```

`parseInt(v)` parse the given `v` and returns a float. Leading whitespace in
`v` is ignored. Returns `NaN` if `v` can't be parsed.
See [`parseInt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) on MDN.

#### Examples

```rescript
Float.parseInt("1.0") // 1.0
Float.parseInt("  3.14   ") // 3.0
Float.parseInt(3) // 3.0
Float.parseInt("3.14some non-digit characters") // 3.0
Float.parseInt("error")->Float.isNaN // true
```

### let RescriptCore.Float.parseIntWithRadix

```rescript
let parseIntWithRadix: (. 'a, ~radix: int) => float
```

`parseIntWithRadix(v, ~radix)` parse the given `v` and returns a float. Leading
whitespace in this argument `v`is ignored. `radix` specifies the radix base to
use for the formatted number. The value must be in the range [2, 36] (inclusive).
Returns `NaN` if `v` can't be parsed and `radix` is smaller than 2 or bigger
than 36.
See [`parseInt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) on MDN.

#### Examples

```rescript
Float.parseInt("10.0", ~radix=2) // 2.0
Float.parseInt("15 * 3", ~radix=10) // 15.0
Float.parseInt("12", ~radix=13) // 15.0
Float.parseInt("17", ~radix=40)->Float.isNaN // true
```

### let RescriptCore.Float.toExponential

```rescript
let toExponential: (. float) => string
```

`toExponential(v)` return a `string` representing the given value in exponential
notation.
See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential) on MDN.

#### Examples

```rescript
Float.toExponential(1000.0) // "1e+3"
Float.toExponential(-1000.0) // "-1e+3"
```

### let RescriptCore.Float.toExponentialWithPrecision

```rescript
let toExponentialWithPrecision: (. float, ~digits: int) => string
```

`toExponential(v, ~digits)` return a `string` representing the given value in
exponential notation. `digits` specifies how many digits should appear after
the decimal point.
See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential) on MDN.

#### Examples

```rescript
Float.toExponentialWithPrecision(77.0, ~digits=2) // "7.70e+1"
Float.toExponentialWithPrecision(5678.0, ~digits=2) // "5.68e+3"
```

#### Exceptions

- `RangeError`: If `digits` less than 0 or greater than 10.

### let RescriptCore.Float.toFixed

```rescript
let toFixed: (. float) => string
```

`toFixed(v)` return a `string` representing the given value using fixed-point
notation.
See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed) on MDN.

#### Examples

```rescript
Float.toFixed(123456.0) // "123456.00"
Float.toFixed(10.0) // "10.00"
```

### let RescriptCore.Float.toFixedWithPrecision

```rescript
let toFixedWithPrecision: (. float, ~digits: int) => string
```

`toFixedWithPrecision(v, ~digits)` return a `string` representing the given
value using fixed-point notation. `digits` specifies how many digits should
appear after the decimal point.
See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed) on MDN.

#### Examples

```rescript
Float.toFixed(300.0, ~digits=4) // "300.0000"
Float.toFixed(300.0, ~digits=1) // "300.0"
```

#### Exceptions

- `RangeError`: If `digits` is less than 0 or larger than 100.

### let RescriptCore.Float.toPrecision

```rescript
let toPrecision: (. float) => string
```

`toPrecision(v)` return a `string` representing the giver value with precision.
This function omits the argument that controls precision, so it behaves like
`toString`. See `toPrecisionWithPrecision` to control precision.
See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

#### Examples

```rescript
Float.toPrecision(100.0) // "100"
Float.toPrecision(1.0) // "1"
```

### let RescriptCore.Float.toPrecisionWithPrecision

```rescript
let toPrecisionWithPrecision: (. float, ~digits: int) => string
```

`toPrecision(v, ~digits)` return a `string` representing the giver value with
precision. `digits` specifies the number of significant digits.
See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

#### Examples

```rescript
Float.toPrecision(100.0, ~digits=2) // "1.0e+2"
Float.toPrecision(1.0) // "1.0"
```

#### Exceptions

- `RangeError`: If `digits` is not between 1 and 100 (inclusive).
Implementations are allowed to support larger and smaller values as well.
ECMA-262 only requires a precision of up to 21 significant digits.

### let RescriptCore.Float.toString

```rescript
let toString: (. float) => string
```

`toString(v)` return a `string` representing the given value.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) on MDN.

#### Examples

```rescript
Float.toString(1000.0) // "1000"
Float.toString(-1000.0) // "-1000"
```

### let RescriptCore.Float.toStringWithRadix

```rescript
let toStringWithRadix: (. float, ~radix: int) => string
```

`toStringWithRadix(v, ~radix)` return a `string` representing the given value.
`~radix` specifies the radix base to use for the formatted number.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) on MDN.

#### Examples

```rescript
Float.toString(6.0, ~radix=2) // "110"
Float.toString(3735928559.0, ~radix=16) // "deadbeef"
Float.toStringWithRadix(123456.0, ~radix=36) // "2n9c"
```

#### Exceptions

`RangeError`: if `radix` is less than 2 or greater than 36.

### let RescriptCore.Float.toLocaleString

```rescript
let toLocaleString: (. float) => string
```

`toLocaleString(v)` return a `string` with language-sensitive representing the
given value.
See [`Number.toLocaleString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString) on MDN.

#### Examples

```rescript
// If the application uses English as the default language
Int.toLocaleString(1000.0) // "1,000"

// If the application uses Portuguese Brazil as the default language
Int.toLocaleString(1000.0) // "1.000"
```

### let RescriptCore.Float.fromString

```rescript
let fromString: (. string) => option<float>
```

`fromString(str)` return an `option\<int\>` representing the given value `str`.

#### Examples

```rescript
Float.fromString("0") == Some(0.0)
Float.fromString("NaN") == None
Float.fromString("6") == Some(6.0)
```

### let RescriptCore.Float.toInt

```rescript
let toInt: (. float) => int
```

`toInt(v)` returns an int to given float `v`.

#### Examples

```rescript
Float.toInt(2.0) == 2
Float.toInt(1.0) == 1
Float.toInt(1.1) == 1
Float.toInt(1.6) == 1
```

### let RescriptCore.Float.fromInt

```rescript
let fromInt: (. int) => float
```

`fromInt(v)` returns a float to given int `v`.

#### Examples

```rescript
Float.fromInt(2) == 2.0
Float.fromInt(1) == 1.0
```

### let RescriptCore.Float.mod

```rescript
let mod: (. float, float) => float
```

`mod(n1, n2)` calculates the modulo (remainder after division) of two floats.

#### Examples

```rescript
Int.mod(7.0, 4.0) == 3
```

### let RescriptCore.Float.clamp

```rescript
let clamp: (. ~min: float=?, ~max: float=?, float) => float
```

`clamp(~min=?, ~max=?, value)` returns `value`, optionally bounded by `min` and `max`.

if `max` \< `min` returns `min`.

#### Examples

```rescript
Int.clamp(4.2) == 4.2
Int.clamp(4.2, ~min=4.3) == 4.3
Int.clamp(4.2, ~max=4.1) == 4.1
Int.clamp(4.2, ~min=4.3, ~max=4.1) == 4.3
```

## module RescriptCore.Int `alias`

Functions for interacting with JavaScript Number.
See: [`Number`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number).

## module RescriptCore.Int.Constants

### let RescriptCore.Int.Constants.minValue

```rescript
let minValue: int
```

The smallest positive number represented in JavaScript.
  See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE)
  on MDN.

  ## Examples

  ```rescript
  Console.log(Int.Constants.minValue)
  ```

### let RescriptCore.Int.Constants.maxValue

```rescript
let maxValue: int
```

The largest positive number represented in JavaScript.
  See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE)
  on MDN.

  ## Examples

  ```rescript
  Console.log(Int.Constants.maxValue)
  ```

### let RescriptCore.Int.equal

```rescript
let equal: (. int, int) => bool
```

### let RescriptCore.Int.compare

```rescript
let compare: (. int, int) => Core__Ordering.t
```

### let RescriptCore.Int.toExponential

```rescript
let toExponential: (. int) => string
```

`toExponential(n)` return a `string` representing the given value in exponential
notation.
See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)
on MDN.

#### Examples

```rescript
Int.toExponential(1000) // "1e+3"
Int.toExponential(-1000) // "-1e+3"
```

### let RescriptCore.Int.toExponentialWithPrecision

```rescript
let toExponentialWithPrecision: (. int, ~digits: int) => string
```

`toExponential(n, ~digits)` return a `string` representing the given value in
exponential notation. `digits` specifies how many digits should appear after
the decimal point. See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)
on MDN.

#### Examples

```rescript
Int.toExponentialWithPrecision(77, ~digits=2) // "7.70e+1"
Int.toExponentialWithPrecision(5678, ~digits=2) // "5.68e+3"
```

#### Exceptions

- `RangeError`: If `digits` less than 0 or greater than 10.

### let RescriptCore.Int.toFixed

```rescript
let toFixed: (. int) => string
```

`toFixed(n)` return a `string` representing the given value using fixed-point
notation. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)
on MDN.


#### Examples

```rescript
Int.toFixed(123456) // "123456.00"
Int.toFixed(10) // "10.00"
```

### let RescriptCore.Int.toFixedWithPrecision

```rescript
let toFixedWithPrecision: (. int, ~digits: int) => string
```

`toFixedWithPrecision(n, ~digits)` return a `string` representing the given
value using fixed-point notation. `digits` specifies how many digits should
appear after the decimal point. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)
on MDN.

#### Examples

```rescript
Int.toFixed(300, ~digits=4) // "300.0000"
Int.toFixed(300, ~digits=1) // "300.0"
```

#### Exceptions

- `RangeError`: If `digits` is less than 0 or larger than 100.

### let RescriptCore.Int.toPrecision

```rescript
let toPrecision: (. int) => string
```

`toPrecision(n)` return a `string` representing the giver value with precision.
This function omits the argument that controls precision, so it behaves like
`toString`. See `toPrecisionWithPrecision` to control precision. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

#### Examples

```rescript
Int.toPrecision(100) // "100"
Int.toPrecision(1) // "1"
```

### let RescriptCore.Int.toPrecisionWithPrecision

```rescript
let toPrecisionWithPrecision: (. int, ~digits: int) => string
```

`toPrecision(n, ~digits)` return a `string` representing the giver value with
precision. `digits` specifies the number of significant digits. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

#### Examples

```rescript
Int.toPrecision(100, ~digits=2) // "1.0e+2"
Int.toPrecision(1) // "1.0"
```

#### Exceptions

- `RangeError`: If `digits` is not between 1 and 100 (inclusive).
Implementations are allowed to support larger and smaller values as well.
ECMA-262 only requires a precision of up to 21 significant digits.

### let RescriptCore.Int.toString

```rescript
let toString: (. int) => string
```

`toString(n)` return a `string` representing the given value.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)
on MDN.

#### Examples

```rescript
Int.toString(1000) // "1000"
Int.toString(-1000) // "-1000"
```

### let RescriptCore.Int.toStringWithRadix

```rescript
let toStringWithRadix: (. int, ~radix: int) => string
```

`toStringWithRadix(n, ~radix)` return a `string` representing the given value.
`~radix` specifies the radix base to use for the formatted number.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)
on MDN.

#### Examples

```rescript
Int.toString(6, ~radix=2) // "110"
Int.toString(3735928559, ~radix=16) // "deadbeef"
Int.toStringWithRadix(123456, ~radix=36) // "2n9c"
```

#### Exceptions

`RangeError`: if `radix` is less than 2 or greater than 36.

### let RescriptCore.Int.toLocaleString

```rescript
let toLocaleString: (. int) => string
```

`toLocaleString(n)` return a `string` with language-sensitive representing the
given value. See [`Number.toLocaleString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString) on MDN.

#### Examples

```rescript
// If the application uses English as the default language
Int.toLocaleString(1000) // "1,000"

// If the application uses Portuguese Brazil as the default language
Int.toLocaleString(1000) // "1.000"
```

### let RescriptCore.Int.toFloat

```rescript
let toFloat: (. int) => float
```

`toFloat(n)` return a `float` representing the given value.

#### Examples

```rescript
Int.toFloat(100) == 100.0
Int.toFloat(2) == 2.0
```

### let RescriptCore.Int.fromFloat

```rescript
let fromFloat: (. float) => int
```

`fromFloat(n)` return an `int` representing the given value. The conversion is
done by truncating the decimal part.

#### Examples

```rescript
Int.fromFloat(2.0) == 2
Int.fromFloat(1.999) == 1
Int.fromFloat(1.5) == 1
Int.fromFloat(0.9999) == 0
```

### let RescriptCore.Int.fromString

```rescript
let fromString: (. ~radix: int=?, string) => option<int>
```

`fromString(~radix?, str)` return an `option\<int\>` representing the given value
`str`. `~radix` specifies the radix base to use for the formatted number.

#### Examples

```rescript
Int.fromString("0") == Some(0)
Int.fromString("NaN") == None
Int.fromString(~radix=2, "6") == None
```

### let RescriptCore.Int.mod

```rescript
let mod: (. int, int) => int
```

`mod(n1, n2)` calculates the modulo (remainder after division) of two integers.

#### Examples

```rescript
Int.mod(7, 4) == 3
```

### let RescriptCore.Int.range

```rescript
let range: (. int, int) => array<int>
```

`range(start, end)` returns an int array of the sequence of integers in the
range `[start, end)`. That is, including `start` but excluding `end`.

If `start \< end` the sequence will be increasing in steps of 1.

If `start \> end` the sequence will be decreasing in steps of -1.

This is equivalent to `rangeWithOptions` with `inclusive` set to `false` and
`step` set to `1` if `start \< end` and `-1` otherwise.

#### Examples

```rescript
Int.range(3, 6) == [3, 4, 5]
Int.range(-3, -1) == [-3, -2]
Int.range(3, 1) == [3, 2]
```

### type RescriptCore.Int.rangeOptions

```rescript
type rangeOptions = {step?: int, inclusive?: bool}
```

The options for `rangeWithOptions`.

**Record Field:**

```rescript
step: option<int>
```

 *optional*  
**Record Field:**

```rescript
inclusive: option<bool>
```

 *optional*  
### let RescriptCore.Int.rangeWithOptions

```rescript
let rangeWithOptions: (. int, int, rangeOptions) => array<int>
```

`rangeWithOptions(start, end, options)` is like `range`, but with `step` and
`inclusive` options configurable.

If `step` is set, the sequence will increase or decrease by that amount for each
step. If `start \< end` and `step` is negative, or vice versa, an empty array is
returned since the sequence would otherwise never reach or exceed the end value
and hence be infinite. If `step` is `0` and `start !=` end, a `RangeError` is
raised as the sequence would never reach or exceed the end value and hence be
infinite.

If `inclusive` is set to `true`, the sequence will include `end` if `step` is
set such that the sequence includes it.

#### Examples

```rescript
Int.rangeWithOptions(3, 7, {step: 2}) == [3, 5]
Int.rangeWithOptions(3, 7, {step: 2, inclusive: true}) == [3, 5, 7]
Int.rangeWithOptions(3, 6, {step: -2}) // RangeError
```

#### Exceptions

- Raises `RangeError` if `step == 0 && start != end`.

### let RescriptCore.Int.clamp

```rescript
let clamp: (. ~min: int=?, ~max: int=?, int) => int
```

`clamp(~min=?, ~max=?, value)` returns `value`, optionally bounded by `min` and `max`.

if `max` \< `min` returns `min`.

#### Examples

```rescript
Int.clamp(42) == 42
Int.clamp(42, ~min=50) == 50
Int.clamp(42, ~max=40) == 40
Int.clamp(42, ~min=50, ~max=40) == 50
```

## module RescriptCore.BigInt `alias`

### type RescriptCore.BigInt.t

```rescript
type t = Js.Types.bigint_val
```

### let RescriptCore.BigInt.asIntN

```rescript
let asIntN: (. ~width: int, t) => t
```

### let RescriptCore.BigInt.asUintN

```rescript
let asUintN: (. ~width: int, t) => t
```

### let RescriptCore.BigInt.fromString

```rescript
let fromString: (. string) => t
```

### let RescriptCore.BigInt.fromInt

```rescript
let fromInt: (. int) => t
```

### let RescriptCore.BigInt.fromFloat

```rescript
let fromFloat: (. float) => t
```

### let RescriptCore.BigInt.toString

```rescript
let toString: (. t) => string
```

### let RescriptCore.BigInt.toStringWithRadix

```rescript
let toStringWithRadix: (. t, ~radix: int) => string
```

### let RescriptCore.BigInt.toLocaleString

```rescript
let toLocaleString: (. t) => string
```

### let RescriptCore.BigInt.toFloat

```rescript
let toFloat: (. t) => float
```

### let RescriptCore.BigInt.toInt

```rescript
let toInt: (. t) => int
```

### let RescriptCore.BigInt.+

```rescript
let +: (. t, t) => t
```

### let RescriptCore.BigInt.-

```rescript
let -: (. t, t) => t
```

### let RescriptCore.BigInt.*

```rescript
let *: (. t, t) => t
```

### let RescriptCore.BigInt./

```rescript
let /: (. t, t) => t
```

### let RescriptCore.BigInt.add

```rescript
let add: (. t, t) => t
```

### let RescriptCore.BigInt.sub

```rescript
let sub: (. t, t) => t
```

### let RescriptCore.BigInt.mul

```rescript
let mul: (. t, t) => t
```

### let RescriptCore.BigInt.div

```rescript
let div: (. t, t) => t
```

### let RescriptCore.BigInt.mod

```rescript
let mod: (. t, t) => t
```

### let RescriptCore.BigInt.land

```rescript
let land: (. t, t) => t
```

### let RescriptCore.BigInt.lor

```rescript
let lor: (. t, t) => t
```

### let RescriptCore.BigInt.lxor

```rescript
let lxor: (. t, t) => t
```

### let RescriptCore.BigInt.lsl

```rescript
let lsl: (. t, t) => t
```

### let RescriptCore.BigInt.asr

```rescript
let asr: (. t, t) => t
```

### let RescriptCore.BigInt.exp

```rescript
let exp: (. t, t) => 'a
```

## module RescriptCore.Math `alias`

Functions for interacting with JavaScript Math.
See: [`Math`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).

## module RescriptCore.Math.Constants

### let RescriptCore.Math.Constants.e

```rescript
let e: float
```

`Math.Constants.e` returns Euler's number, ≈ 2.718281828459045.
  See [`Math.E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E) on MDN.

  ## Examples

  ```rescript
  Math.Constants.e
  ```

### let RescriptCore.Math.Constants.ln2

```rescript
let ln2: float
```

`Math.Constants.ln2` returns Natural logarithm of 2, ≈ 0.6931471805599453.
  See [`Math.LN2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN2) on MDN.

  ## Examples

  ```rescript
  Math.Constants.LN2
  ```

### let RescriptCore.Math.Constants.ln10

```rescript
let ln10: float
```

`Math.Constants.ln10` returns Natural logarithm of 10, ≈ 2.302585092994046.
  See [`Math.LN10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN10) on MDN.

  ## Examples

  ```rescript
  Math.Constants.ln10
  ```

### let RescriptCore.Math.Constants.log2e

```rescript
let log2e: float
```

`Math.Constants.log2e` returns Base 2 logarithm of E, ≈ 1.4426950408889634.
  See [`Math.LOG2E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG2E) on MDN.

  ## Examples

  ```rescript
  Math.Constants.log2e
  ```

### let RescriptCore.Math.Constants.log10e

```rescript
let log10e: float
```

`Math.Constants.log10e` returns Base 10 logarithm of E, ≈ 0.4342944819032518.
  See [`Math.LOG10E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG10E) on MDN.

  ## Examples

  ```rescript
  Math.Constants.log10e
  ```

### let RescriptCore.Math.Constants.pi

```rescript
let pi: float
```

`Math.Constants.pi` returns Pi - ratio of the circumference to the diameter
  of a circle, ≈ 3.141592653589793.
  See [`Math.PI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/PI) on MDN.

  ## Examples

  ```rescript
  Math.Constants.pi
  ```

### let RescriptCore.Math.Constants.sqrt1_2

```rescript
let sqrt1_2: float
```

`Math.Constants.sqrt1_2` returns Square root of 1/2, ≈ 0.7071067811865476.
  See [`Math.SQRT1_2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/SQRT1_2) on MDN.

  ## Examples

  ```rescript
  Math.Constants.sqrt1_2
  ```

### let RescriptCore.Math.Constants.sqrt2

```rescript
let sqrt2: float
```

`Math.Constants.e` returns Absolute value for integer argument.
  See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

  ## Examples

  ```rescript
  Math.Constants.sqrt2
  ```

## module RescriptCore.Math.Int

### let RescriptCore.Math.Int.abs

```rescript
let abs: (. int) => int
```

`abs(v)` returns absolute value of `v`.
  See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

  ## Examples

  ```rescript
  Math.Int.abs(-2) // 2
  Math.Int.abs(3) // 3
  ```

### let RescriptCore.Math.Int.clz32

```rescript
let clz32: (. int) => int
```

`clz32(v)` returns the number of leading zero bits of the argument's 32 bit
  int representation.
  See [`Math.clz32`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32) on MDN.

  ## Examples

  ```rescript
  // 00000000000000000000000000000001
  Math.Int.clz32(1) // 31
  // 00000000000000000000000000000100
  Math.Int.clz32(4) // 29
  ```

### let RescriptCore.Math.Int.imul

```rescript
let imul: (. int, int) => int
```

`imul(a, b)` returns 32-bit integer multiplication. Use this only when you
  need to optimize performance of multiplication of numbers stored as 32-bit
  integers.
  See [`Math.imul`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul) on MDN.

  ## Examples

  ```rescript
  Math.Int.imul(3, 4) // 12
  Math.Int.imul(-5, 12) // 60
  ```

### let RescriptCore.Math.Int.min

```rescript
let min: (. int, int) => int
```

`min(a, b)` returns the minimum of its two integer arguments.
  See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

  ## Examples

  ```rescript
  Math.Int.min(1, 2) // 1
  Math.Int.min(-1, -2) // -2
  ```

### let RescriptCore.Math.Int.minMany

```rescript
let minMany: (. array<int>) => int
```

`minMany(arr)` returns the minimum of the integers in the given array `arr`.
  Returns `Infinity` if `arr` is empty.
  See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

  ## Examples

  ```rescript
  Math.Int.minMany([1, 2]) // 1
  Math.Int.minMany([-1, -2]) // -2
  Math.Int.minMany([])-\>Float.isFinite // false
  ```

### let RescriptCore.Math.Int.max

```rescript
let max: (. int, int) => int
```

`max(a, b)` returns the maximum of its two integer arguments.
  See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

  ## Examples

  ```rescript
  Math.Int.max(1, 2) // 2
  Math.Int.max(-1, -2) // -1
  ```

### let RescriptCore.Math.Int.maxMany

```rescript
let maxMany: (. array<int>) => int
```

`maxMany(arr)` returns the maximum of the integers in the given array `arr`.
  Returns `Infinity` if `arr` is empty.
  See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

  ## Examples

  ```rescript
  Math.Int.maxMany([1, 2]) // 2
  Math.Int.maxMany([-1, -2]) // -1
  Math.Int.maxMany([])-\>Float.isFinite // false
  ```

### let RescriptCore.Math.Int.pow

```rescript
let pow: (. int, ~exp: int) => int
```

`pow(a, ~exp)` raises the given base `a` to the given exponent `exp`.
  See [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.

  ## Examples

  ```rescript
  Math.Int.pow(2, ~exp=4) // 16
  Math.Int.pow(3, ~exp=4) // 81
  ```

### let RescriptCore.Math.Int.sign

```rescript
let sign: (. int) => int
```

`sign(v)` returns the sign of its integer argument: `-1` if negative, `0` if
  zero, `1` if positive.
  See [`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign) on MDN.

  ## Examples

  ```rescript
  Math.Int.sign(3) // 1
  Math.Int.sign(-3) // 1
  Math.Int.sign(0) // 0
  ```

### let RescriptCore.Math.Int.floor

```rescript
let floor: (. float) => int
```

floor(v) returns the largest `int` less than or equal to the argument; 
  the result is pinned to the range of the `int` data type: -2147483648 to 2147483647. 
  See [`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)
  on MDN.

  ## Examples

  ```rescript
  Math.Int.floor(3.7) == 3
  Math.Int.floor(3.0) == 3
  Math.Int.floor(-3.1) == -4
  Math.Int.floor(-1.0e15) == -2147483648
  Math.Int.floor(1.0e15) == 2147483647
  ```

### let RescriptCore.Math.Int.random

```rescript
let random: (. int, int) => int
```

`random(minVal, maxVal)` returns a random integer number in the half-closed interval [minVal, maxVal).
   See [`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)
  on MDN.

  ## Examples

  ```rescript
  Math.Int.random(2, 5) == 4
  Math.Int.random(505, 2000) == 1276
  Math.Int.random(-7, -2) == -4
  ```

### let RescriptCore.Math.abs

```rescript
let abs: (. float) => float
```

`abs(v)` returns absolute value of `v`.
See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

#### Examples

```rescript
Math.abs(-2.0) // 2.0
Math.abs(3.0) // 3.0
```

### let RescriptCore.Math.acos

```rescript
let acos: (. float) => float
```

`acos(v)` returns arccosine (in radians) of argument `v`, returns `NaN` if the
argument is outside the range [-1.0, 1.0].
See [`Math.acos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos) on MDN.

#### Examples

```rescript
Math.acos(-1) // 3.141592653589793
Math.acos(-3)->Float.isNaN // true
```

### let RescriptCore.Math.acosh

```rescript
let acosh: (. float) => float
```

`acosh(v)` returns the inverse hyperbolic arccosine (in radians) of argument `v`,
returns `NaN` if the argument is less than `1.0`.
See [`Math.acosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh) on MDN.

#### Examples

```rescript
Math.acosh(1) // 0.0
Math.acosh(0.5)->Float.isNaN // true
```

### let RescriptCore.Math.asin

```rescript
let asin: (. float) => float
```

`asin(v)` returns the inverse sine (in radians) of argument `v`, returns `NaN`
if the argument `v` is outside the range [-1.0, 1.0].
See [`Math.asin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asin) on MDN.

#### Examples

```rescript
Math.asin(-1.0) // -1.5707963267948966
Math.asin(-2.0)->Float.isNaN // true
```

### let RescriptCore.Math.asinh

```rescript
let asinh: (. float) => float
```

`asinh(v)` returns the inverse hyperbolic sine of argument `v`.
See [`Math.asinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh) on MDN.

#### Examples

```rescript
Math.asinh(-1) // -0.881373587019543
Math.asinh(-0) // -0.0
```

### let RescriptCore.Math.atan

```rescript
let atan: (. float) => float
```

`atan(v)` returns the inverse tangent (in radians) of argument `v`.
See [`Math.atan`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan) on MDN.

#### Examples

```rescript
Math.atan(-0.0) // -0.0
Math.atan(0.0) // 0.0
Math.atan(1) // 0.7853981633974483
```

### let RescriptCore.Math.atanh

```rescript
let atanh: (. float) => float
```

`atanh(v)` returns the invert hyperbolic tangent of argument `v`. Returns `NaN`
if the argument `v` is is outside the range [-1.0, 1.0] and `Infinity` if `v`
is `-1.0` or `1.0`.
See [`Math.atanh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh) on MDN.

#### Examples

```rescript
Math.atanh(-2.0)->Float.isNaN // true
Math.atanh(-1.0)->Float.isFinite // false
Math.atanh(-0.0) // -0.0
Math.atanh(0.0) // 0.0
Math.atanh(0.5) // 0.5493061443340548
```

### let RescriptCore.Math.atan2

```rescript
let atan2: (. ~y: float, ~x: float) => float
```

`atan2(~y, ~x)` returns the angle (in radians) of the quotient `y /. x`. It is
also the angle between the *x*-axis and point (*x*, *y*).
See [`Math.atan2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan2) on MDN.

#### Examples

```rescript
Math.atan2(~y=0.0, ~x=10.0) == 0.0
Math.atan2(~x=5.0, ~y=5.0) == Math.Constants.pi /. 4.0
Math.atan2(~x=90.0, ~y=15.0) // 1.4056476493802699
Math.atan2(~x=15.0, ~y=90.0) // 0.16514867741462683
```

### let RescriptCore.Math.cbrt

```rescript
let cbrt: (. float) => float
```

`cbrt(v)` returns the cube root of argument `v`.
See [`Math.cbrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt) on MDN.

#### Examples

```rescript
Math.cbrt(-1.0) // -1.0
Math.cbrt(-0.0) // -0.0
Math.cbrt(0.0) // 0.0
```

### let RescriptCore.Math.ceil

```rescript
let ceil: (. float) => float
```

`ceil(v)` returns the smallest integral value greater than or equal to the
argument `v`. The result is a `float` and is not restricted to the `int` data
type range.
See [`Math.ceil`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil) on MDN.

#### Examples

```rescript
Math.ceil(3.1) == 4.0
Math.ceil(3.0) == 3.0
Math.ceil(-3.1) == -3.0
Math.ceil(2_150_000_000.3) == 2_150_000_001.0
```

### let RescriptCore.Math.cos

```rescript
let cos: (. float) => float
```

`cos(v)` returns the cosine of argument `v`, which must be specified in radians.
See [`Math.cos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos) on MDN.

#### Examples

```rescript
Math.cos(-0.0) // 1.0
Math.cos(0.0) // 1.0
Math.cos(1.0) // 0.5403023058681398
```

### let RescriptCore.Math.cosh

```rescript
let cosh: (. float) => float
```

`cosh(v)` returns the hyperbolic cosine of argument `v`, which must be specified
in radians.
See [`Math.cosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cosh) on MDN.

#### Examples

```rescript
Math.cosh(-1.0) // 1.5430806348152437
Math.cosh(-0.0) // 1.0
Math.cosh(0.0) // 1.0
```

### let RescriptCore.Math.exp

```rescript
let exp: (. float) => float
```

`exp(v)` returns natural exponentional, returns *e* (the base of natural logarithms)
to the power of the given argument `v`.
See [`Math.exp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp) on MDN.

#### Examples

```rescript
Math.exp(-1.0) // 0.36787944117144233
Math.exp(0.0) // 1.0
```

### let RescriptCore.Math.expm1

```rescript
let expm1: (. float) => float
```

`expm1(v)` returns *e* (the base of natural logarithms) to the power of the given
argument `v` minus 1.
See [`Math.expm1`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1) on MDN.

#### Examples

```rescript
Math.expm1(-1.0) // -0.6321205588285577
Math.expm1(-0.0) // -0
```

### let RescriptCore.Math.floor

```rescript
let floor: (. float) => float
```

`floor(v)` returns the largest integral value less than or equal to the argument
`v`. The result is a `float` and is not restricted to the `int` data type range.
See [`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor) on MDN.

#### Examples

```rescript
Math.floor(-45.95) // -46.0
Math.floor(-45.05) // -46.0
Math.floor(-0.0) // -0.0
```

### let RescriptCore.Math.fround

```rescript
let fround: (. float) => float
```

`fround(v)` returns the nearest single precision float.
See [`Math.fround`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround) on MDN.

#### Examples

```rescript
Math.fround(5.5) == 5.5
Math.fround(5.05) == 5.050000190734863
```

### let RescriptCore.Math.hypot

```rescript
let hypot: (. float, float) => float
```

`hypot(a, b)` returns the square root of the sum of squares of its two arguments
(the Pythagorean formula).
See [`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot) on MDN.

#### Examples

```rescript
Math.hypot(3.0, 4.0) // 5.0
Math.hypot(3.0, 5.0) // 5.8309518948453
```

### let RescriptCore.Math.hypotMany

```rescript
let hypotMany: (. array<float>) => float
```

`hypotMany(arr)` returns the square root of the sum of squares of the numbers in
the array argument (generalized Pythagorean equation). Using an array allows you
to have more than two items. If `arr` is an empty array then returns `0.0`.
See [`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot) on MDN.

#### Examples

```rescript
Math.hypot([3.0, 4.0, 5.0]) // 7.0710678118654755
Math.hypot([]) // 0.0
```

### let RescriptCore.Math.log

```rescript
let log: (. float) => float
```

`log(v)` returns the natural logarithm of argument `v`, this is the number *x*
such that `e^x` equals the argument. Returns `NaN` for negative arguments and
`Infinity` for `0.0` or `-0.0`.
See [`Math.log`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log) on MDN.

#### Examples

```rescript
Math.log(-1.0)->Float.isNaN // true
Math.log(-0.0)->Float.isFinite // false
Math.log(0.0)->Float.isFinite // false
Math.log(1.0) // 0
```

### let RescriptCore.Math.log1p

```rescript
let log1p: (. float) => float
```

`log1p(v)` returns the natural logarithm of one plus the argument `v`.
Returns `NaN` for arguments less than `-1` and `Infinity` if `v` is `-1.0`.
See [`Math.log1p`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p) on MDN.

#### Examples

```rescript
Math.log1p(-2.0)->Float.isNaN // true
Math.log1p(-1.0)->Float.isFinite // false
Math.log1p(-0.0) // -0
```

### let RescriptCore.Math.log10

```rescript
let log10: (. float) => float
```

`log10(v)` returns the base 10 logarithm of argument `v`. Returns `NaN` for
negative `v`. If `v` is `-0.0` or `0.0` returns `Infinity`.
See [`Math.log10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log10) on MDN.

#### Examples

```rescript
Math.log10(-2.0)->Float.isNaN // true
Math.log10(-0.0)->Float.isFinite // false
Math.log10(0.0)->Float.isFinite // false
Math.log10(1.0) // 0
```

### let RescriptCore.Math.log2

```rescript
let log2: (. float) => float
```

`log2(v)` returns the base 2 logarithm of argument `v`. Returns `NaN` for
negative `v` and `Infinity` if `v` is `-0.0` or `0.0`.
See [`Math.log2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log2) on MDN.

#### Examples

```rescript
Math.log2(-2.0)->Float.isNaN // true
Math.log2(-0.0)->Float.isFinite // false
Math.log2(0.0)->Float.isFinite // false
Math.log2(1.0) // 0.0
```

### let RescriptCore.Math.min

```rescript
let min: (. float, float) => float
```

`min(a, b)` returns the minimum of its two float arguments.
See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

#### Examples

```rescript
Math.min(1.0, 2.0) // 1.0
Math.min(-1.0, -2.0) // -2.0
```

### let RescriptCore.Math.minMany

```rescript
let minMany: (. array<float>) => float
```

`minMany(arr)` returns the minimum of the float in the given array `arr`.
Returns `Infinity` if `arr` is empty.
See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

#### Examples

```rescript
Math.minMany([1.0, 2.0]) // 1.0
Math.minMany([-1.0, -2.0]) // -2.0
Math.minMany([])->Float.isFinite // false
```

### let RescriptCore.Math.max

```rescript
let max: (. float, float) => float
```

`max(a, b)` returns the maximum of its two float arguments.
See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

#### Examples

```rescript
Math.max(1.0, 2.0) // 2.0
Math.max(-1.0, -2.0) // -1.0
```

### let RescriptCore.Math.maxMany

```rescript
let maxMany: (. array<float>) => float
```

`maxMany(arr)` returns the maximum of the float in the given array `arr`.
Returns `Infinity` if `arr` is empty.
See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

#### Examples

```rescript
Math.maxMany([1.0, 2.0]) // 2.0
Math.maxMany([-1.0, -2.0]) // -1.0
Math.maxMany([])->Float.isFinite // false
```

### let RescriptCore.Math.pow

```rescript
let pow: (. float, ~exp: float) => float
```

`pow(a, ~exp)` raises the given base `a` to the given exponent `exp`.
See [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.

#### Examples

```rescript
Math.pow(2.0, ~exp=4.0) // 16.0
Math.pow(3.0, ~exp=4.0) // 81.0
```

### let RescriptCore.Math.random

```rescript
let random: (. unit) => float
```

`random()` returns a random number in the half-closed interval [0,1].
See [`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) on MDN.

#### Examples

```rescript
Math.random()
```

### let RescriptCore.Math.round

```rescript
let round: (. float) => float
```

`round(v)` returns then value of `v` rounded to nearest integral value
(expressed as a float). If the fractional portion of the argument `v` is greater
than `0.5`, the argument `v` is rounded to the float with the next higher
absolute value.
See [`Math.round`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round) on MDN.

#### Examples

```rescript
Math.round(-20.5) // -20.0
Math.round(-0.1) // -0.0
Math.round(0.0) // 0.0
Math.round(-0.0) // -0.0
```

### let RescriptCore.Math.sign

```rescript
let sign: (. float) => float
```

`sign(v)` returns the sign of its foat argument: `-1` if negative, `0` if
zero, `1` if positive.
See [`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign) on MDN.

#### Examples

```rescript
Math.sign(3.0) // 1.0
Math.sign(-3.0) // 1.0
Math.sign(0.0) // 0.0
```

### let RescriptCore.Math.sin

```rescript
let sin: (. float) => float
```

`sin(v)` returns the sine of argument `v`, which must be specified in radians.
See [`Math.sin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin) on MDN.

#### Examples

```rescript
Math.sin(-0.0) // -0.0
Math.sin(0.0) // 0.0
Math.sin(1.0) // 0.8414709848078965
```

### let RescriptCore.Math.sinh

```rescript
let sinh: (. float) => float
```

`sinh(v)` returns then hyperbolic sine of argument `v`, which must be specified
in radians.
See [`Math.sinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh) on MDN.

#### Examples

```rescript
Math.sinh(-0.0) // -0.0
Math.sinh(0.0) // 0.0
Math.sinh(1.0) // 1.1752011936438014
```

### let RescriptCore.Math.sqrt

```rescript
let sqrt: (. float) => float
```

`sqrt(v)` returns the square root of `v`. If `v` is negative returns `NaN`.
See [`Math.sqrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt) on MDN.

#### Examples

```rescript
Math.sqrt(-1.0)->Float.isNaN // true
Math.sqrt(-0.0) // -0.0
Math.sqrt(0.0) // 0.0
Math.sqrt(1.0) // 1.0
Math.sqrt(9.0) // 3.0
```

### let RescriptCore.Math.tan

```rescript
let tan: (. float) => float
```

`tan(v)` returns the tangent of argument `v`, which must be specified in
radians. Returns `NaN` if `v` is positive `Infinity` or negative `Infinity`.
See [`Math.tan`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tan) on MDN.

#### Examples

```rescript
Math.tan(-0.0) // -0.0
Math.tan(0.0) // 0.0
Math.tan(1.0) // 1.5574077246549023
```

### let RescriptCore.Math.tanh

```rescript
let tanh: (. float) => float
```

`tanh(v)` returns the hyperbolic tangent of argument `v`, which must be
specified in radians.
See [`Math.tanh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh) on MDN.

#### Examples

```rescript
Math.tanh(-0.0) // -0.0
Math.tanh(0.0) // 0.0
Math.tanh(1.0) // 0.7615941559557649
```

### let RescriptCore.Math.trunc

```rescript
let trunc: (. float) => float
```

`trunc(v)` truncates the argument `v`, i.e., removes fractional digits.
See [`Math.trunc`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc) on MDN.

#### Examples

```rescript
Math.trunc(0.123) // 0.0
Math.trunc(1.999) // 1.0
Math.trunc(13.37) // 13.0
Math.trunc(42.84) // 42.0
```

## module RescriptCore.Null `alias`

Functions for handling values that could be `null`.

If you also need to cover `undefined`, check out `Nullable` instead.

### type RescriptCore.Null.t

```rescript
type t<'a> = Js.Null.t<'a>
```

A type representing a value that can be either `'a` or `null`.

**Variant Constructor:**

```rescript
Value('a)
```

**Variant Constructor:**

```rescript
Null
```

### let RescriptCore.Null.asNullable

```rescript
let asNullable: (. t<'a>) => Core__Nullable.t<'a>
```

Converts a `Null.t` into a `Nullable.t`.

#### Examples
```rescript
let nullValue = Null.make("Hello")
let asNullable = nullValue->Null.asNullable // Nullable.t<string>
```

### let RescriptCore.Null.null

```rescript
let null: t<'a>
```

The value `null`.

See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.

#### Examples
```rescript
Console.log(null) // Logs `null` to the console.
```

### let RescriptCore.Null.make

```rescript
let make: (. 'a) => t<'a>
```

Creates a new `Null.t` from the provided value.
This means the compiler will enforce null checks for the new value.

#### Examples
```rescript
let myStr = "Hello"
let asNullValue = myStr->Null.make // The compiler now thinks this can be `string` or `null`.
```

### let RescriptCore.Null.equal

```rescript
let equal: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool
```

### let RescriptCore.Null.compare

```rescript
let compare: (.
  t<'a>,
  t<'b>,
  (. 'a, 'b) => Core__Ordering.t,
) => Core__Ordering.t
```

### let RescriptCore.Null.toOption

```rescript
let toOption: (. t<'a>) => option<'a>
```

Converts a nullable value into an option, so it can be pattern matched on.
Will convert `null` to `None`, and a present value to `Some(value)`.

#### Examples
```rescript
let nullStr = Null.make("Hello")

switch nullStr->Null.toOption {
| Some(str) => Console.log2("Got string:", str)
| None => Console.log("Didn't have a value.")
}
```

### let RescriptCore.Null.fromOption

```rescript
let fromOption: (. option<'a>) => t<'a>
```

Turns an `option` into a `Null.t`. `None` will be converted to `null`.

#### Examples
```rescript
let optString: option<string> = None
let asNull = optString->Null.fromOption // Null.t<string>
Console.log(asNull == null) // Logs `true` to the console.
```

### let RescriptCore.Null.getOr

```rescript
let getOr: (. t<'a>, 'a) => 'a
```

`getOr(value, default)` returns `value` if not `null`, otherwise return
`default`.

#### Examples

```rescript
Null.getOr(null, "Banana") // Banana
Null.getOr(Nulalble.make("Apple"), "Banana") // Apple

let greet = (firstName: option<string>) =>
  "Greetings " ++ firstName->Null.getOr("Anonymous")

Null.make("Jane")->greet // "Greetings Jane"
null->greet // "Greetings Anonymous"
```

### let RescriptCore.Null.getWithDefault

*DEPRECATED:* Use getOr instead  
```rescript
let getWithDefault: (. t<'a>, 'a) => 'a
```

### let RescriptCore.Null.getExn

```rescript
let getExn: (. t<'a>) => 'a
```

`getExn(value)` raises an exception if `null`, otherwise returns the value.

```rescript
Null.getExn(Null.make(3)) // 3
Null.getExn(null) /* Raises an Error */
```

#### Exceptions

- Raises `Invalid_argument` if `value` is `null`,

### let RescriptCore.Null.getUnsafe

```rescript
let getUnsafe: (. t<'a>) => 'a
```

`getUnsafe(value)` returns `value`.

#### Examples

```rescript
Null.getUnsafe(Null.make(3)) == 3
Null.getUnsafe(null) // Raises an error
```

#### Important

- This is an unsafe operation, it assumes `value` is not `null`.

### let RescriptCore.Null.forEach

```rescript
let forEach: (. t<'a>, (. 'a) => unit) => unit
```

`forEach(value, f)` call `f` on `value`. if `value` is not `null`, then if calls
`f`, otherwise returns `unit`.

#### Examples

```rescript
Null.forEach(Null.make("thing"), x => Console.log(x)) // logs "thing"
Null.forEach(null, x => Console.log(x)) // returns ()
```

### let RescriptCore.Null.map

```rescript
let map: (. t<'a>, (. 'a) => 'b) => t<'b>
```

`map(value, f)` returns `f(value)` if `value` is not `null`, otherwise returns
`value` unchanged.

#### Examples

```rescript
Null.map(Null.make(3), x => x * x) // Null.make(9)
Null.map(null, x => x * x) // null
```

### let RescriptCore.Null.mapOr

```rescript
let mapOr: (. t<'a>, 'b, (. 'a) => 'b) => 'b
```

`mapOr(value, default, f)` returns `f(value)` if `value` is not `null`,
otherwise returns `default`.

#### Examples

```rescript
let someValue = Null.make(3)
someValue->Null.mapOr(0, x => x + 5) // 8

let noneValue = null
noneValue->Null.mapOr(0, x => x + 5) // 0
```

### let RescriptCore.Null.mapWithDefault

*DEPRECATED:* Use mapOr instead  
```rescript
let mapWithDefault: (. t<'a>, 'b, (. 'a) => 'b) => 'b
```

### let RescriptCore.Null.flatMap

```rescript
let flatMap: (. t<'a>, (. 'a) => t<'b>) => t<'b>
```

`flatMap(value, f)` returns `f(value)` if `value` is not `null`, otherwise
returns `value` unchanged.

#### Examples

```rescript
let addIfAboveOne = value =>
  if (value > 1) {
    Null.make(value + 1)
  } else {
    null
  }

Null.flatMap(Null.make(2), addIfAboveOne) // Null.make(3)
Null.flatMap(Null.make(-4), addIfAboveOne) // null
Null.flatMap(null, addIfAboveOne) // null
```

## module RescriptCore.Nullable `alias`

Functions for handling nullable values.

Primarily useful when interoping with JavaScript when you don't know whether you'll get a value, `null` or `undefined`.

### type RescriptCore.Nullable.t

```rescript
type t<'a> = Js.Nullable.t<'a>
```

Type representing a nullable value.
A nullable value can be the value `'a`, `null` or `undefined`.

**Variant Constructor:**

```rescript
Value('a)
```

**Variant Constructor:**

```rescript
Null
```

**Variant Constructor:**

```rescript
Undefined
```

### let RescriptCore.Nullable.null

```rescript
let null: t<'a>
```

The value `null`.

See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.

#### Examples
```rescript
Console.log(Nullable.null) // Logs `null` to the console.
```

### let RescriptCore.Nullable.undefined

```rescript
let undefined: t<'a>
```

The value `undefined`.

See [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/undefined) on MDN.

#### Examples
```rescript
Console.log(undefined) // Logs `undefined` to the console.
```

### let RescriptCore.Nullable.make

```rescript
let make: (. 'a) => t<'a>
```

Creates a new nullable value from the provided value.
This means the compiler will enforce null checks for the new value.

#### Examples
```rescript
let myStr = "Hello"
let asNullable = myStr->Nullable.make

// Can't do the below because we're now forced to check for nullability
// myStr == asNullable

// Need to do this
switch asNullable->Nullable.toOption {
| Some(value) if value == myStr => Console.log("Yay, values matched!")
| _ => Console.log("Values did not match.")
}
```

### let RescriptCore.Nullable.equal

```rescript
let equal: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool
```

### let RescriptCore.Nullable.compare

```rescript
let compare: (.
  t<'a>,
  t<'b>,
  (. 'a, 'b) => Core__Ordering.t,
) => Core__Ordering.t
```

### let RescriptCore.Nullable.toOption

```rescript
let toOption: (. t<'a>) => option<'a>
```

Converts a nullable value into an option, so it can be pattern matched on.
Will convert both `null` and `undefined` to `None`, and a present value to `Some(value)`.

#### Examples
```rescript
let nullableString = Nullable.make("Hello")

switch nullableString->Nullable.toOption {
| Some(str) => Console.log2("Got string:", str)
| None => Console.log("Didn't have a value.")
}
```

### let RescriptCore.Nullable.fromOption

```rescript
let fromOption: (. option<'a>) => t<'a>
```

Turns an `option` into a `Nullable.t`.

#### Examples
```rescript
let optString = Some("Hello")
let asNullable = optString->Nullable.fromOption // Nullable.t<string>
```

### let RescriptCore.Nullable.getOr

```rescript
let getOr: (. t<'a>, 'a) => 'a
```

`getOr(value, default)` returns `value` if not `null` or `undefined`,
otherwise return `default`.

#### Examples

```rescript
Nullable.getOr(Nullable.null, "Banana") // Banana
Nullable.getOr(Nulalble.make("Apple"), "Banana") // Apple

let greet = (firstName: option<string>) =>
  "Greetings " ++ firstName->Nullable.getOr("Anonymous")

Nullable.make("Jane")->greet // "Greetings Jane"
Nullable.null->greet // "Greetings Anonymous"
```

### let RescriptCore.Nullable.getWithDefault

*DEPRECATED:* Use getOr instead  
```rescript
let getWithDefault: (. t<'a>, 'a) => 'a
```

### let RescriptCore.Nullable.getExn

```rescript
let getExn: (. t<'a>) => 'a
```

`getExn(value)` raises an exception if `null` or `undefined`, otherwise returns the value.

```rescript
Nullable.getExn(Nullable.make(3)) // 3
Nullable.getExn(Nullable.null) /* Raises an Error */
```

#### Exceptions

- Raises `Invalid_argument` if `value` is `null` or `undefined`

### let RescriptCore.Nullable.getUnsafe

```rescript
let getUnsafe: (. t<'a>) => 'a
```

`getUnsafe(value)` returns `value`.

#### Examples

```rescript
Nullable.getUnsafe(Nullable.make(3)) == 3
Nullable.getUnsafe(Nullable.null) // Raises an error
```

#### Important

- This is an unsafe operation, it assumes `value` is not `null` or `undefined`.

### let RescriptCore.Nullable.forEach

```rescript
let forEach: (. t<'a>, (. 'a) => unit) => unit
```

`forEach(value, f)` call `f` on `value`. if `value` is not `null` or `undefined`, 
then if calls `f`, otherwise returns `unit`.

#### Examples

```rescript
Nullable.forEach(Nullable.make("thing"), x => Console.log(x)) // logs "thing"
Nullable.forEach(Nullable.null, x => Console.log(x)) // returns ()
Nullable.forEach(undefined, x => Console.log(x)) // returns ()
```

### let RescriptCore.Nullable.map

```rescript
let map: (. t<'a>, (. 'a) => 'b) => t<'b>
```

`map(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,
otherwise returns `value` unchanged.

#### Examples

```rescript
Nullable.map(Nullable.make(3), x => x * x) // Nullable.make(9)
Nullable.map(undefined, x => x * x) // undefined
```

### let RescriptCore.Nullable.mapOr

```rescript
let mapOr: (. t<'a>, 'b, (. 'a) => 'b) => 'b
```

`mapOr(value, default, f)` returns `f(value)` if `value` is not `null`
or `undefined`, otherwise returns `default`.

#### Examples

```rescript
let someValue = Nullable.make(3)
someValue->Nullable.mapOr(0, x => x + 5) // 8

let noneValue = Nullable.null
noneValue->Nullable.mapOr(0, x => x + 5) // 0
```

### let RescriptCore.Nullable.mapWithDefault

*DEPRECATED:* Use mapOr instead  
```rescript
let mapWithDefault: (. t<'a>, 'b, (. 'a) => 'b) => 'b
```

### let RescriptCore.Nullable.flatMap

```rescript
let flatMap: (. t<'a>, (. 'a) => t<'b>) => t<'b>
```

`flatMap(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,
otherwise returns `value` unchanged.

#### Examples

```rescript
let addIfAboveOne = value =>
  if (value > 1) {
    Nullable.make(value + 1)
  } else {
    Nullable.null
  }

Nullable.flatMap(Nullable.make(2), addIfAboveOne) // Nullable.make(3)
Nullable.flatMap(Nullable.make(-4), addIfAboveOne) // undefined
Nullable.flatMap(Nullable.null, addIfAboveOne) // undefined
```

## module RescriptCore.Object `alias`

### let RescriptCore.Object.empty

```rescript
let empty: (. unit) => {..}
```

`empty` create a new object that inherits the properties and methods from the standard built-in Object, such as `toString`. See [Object on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object)

#### Examples

```rescript
let x = Object.empty()
x->Object.keysToArray->Array.length // 0
x->Object.get("toString")->Option.isSome // true
```

### let RescriptCore.Object.is

```rescript
let is: (. 'a, 'a) => bool
```

`is` determines if two objects are identical in all contexts. Objects, arrays, records, and other non-primitives are only identical if they reference the **exact** same object in memory. Primitives like ints, floats, and strings are identical if they have the same value. `+0` and `-0` are distinct. NaN is equal to itself. See [Object.is on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is)

In most scenarios use `==` or `===` or the custom `equals` function (if provided) for the type.

#### Examples

```rescript
Object.is(25, 13) // false
Object.is("abc", "abc") // true
Object.is(undefined, undefined) // true
Object.is(undefined, null) // false
Object.is(-0.0, 0.0) // false
Object.is(list{1, 2}, list{1, 2}) // false

Object.is([1, 2, 3], [1, 2, 3]) // false
[1, 2, 3] == [1, 2, 3] // true
[1, 2, 3] === [1, 2, 3] // false

let fruit = {"name": "Apple" }
Object.is(fruit, fruit) // true
Object.is(fruit, {"name": "Apple" }) // false
fruit == {"name": "Apple" } // true
fruit === {"name": "Apple" } // false
```

### let RescriptCore.Object.create

```rescript
let create: (. {..}) => {..}
```

`create` creates a new object, using an existing object as the prototype of the new object. See [Object.create on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)

**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object) and [records](https://rescript-lang.org/docs/manual/latest/record). This is often safer and more convenient than using `create` and other functions in this module.

#### Examples

```rescript
let x = {"fruit": "banana"}
let y = Object.create(x)
y->Object.get("fruit") // Some("banana")
```

### let RescriptCore.Object.createWithProperties

```rescript
let createWithProperties: (. {..}, {..}) => {..}
```

### let RescriptCore.Object.createWithNull

```rescript
let createWithNull: (. unit) => {..}
```

### let RescriptCore.Object.createWithNullAndProperties

```rescript
let createWithNullAndProperties: (. {..}) => {..}
```

### let RescriptCore.Object.assign

```rescript
let assign: (. {..}, {..}) => {..}
```

`assign(target, source)` copies enumerable own properties from the source to the target, overwriting properties with the same name. It returns the modified target object. A deep clone is not created; properties are copied by reference.

**Warning:** ReScript provides compile-time support for type-safe access to JavaScript objects. This eliminates common errors such as accessing properties that do not exist, or using a property of type x as if it were a y. Using `assign` can bypass these safety checks and lead to run-time errors (if you are not careful). ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object) and [records](https://rescript-lang.org/docs/manual/latest/record). This is often safer and more convenient than using `assign` and other functions in this module.

See [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign).

#### Examples

```rescript
Object.assign({"a": 1}, {"a": 2}) // {"a": 2}
Object.assign({"a": 1, "b": 2}, {"a": 0}) // {"a": 0, "b": 2}
Object.assign({"a": 1}, {"a": null}) // {"a": null}
```

### let RescriptCore.Object.assignMany

```rescript
let assignMany: (. {..}, array<{..}>) => {..}
```

`assignMany(target, sources)` copies enumerable own properties from each source to the target, overwriting properties with the same name. Later sources' properties overwrite earlier ones. It returns the modified target object. A deep clone is not created; properties are copied by reference.

**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object), including spreading one object into another. This is often more convenient than using `assign` or `assignMany`.  

See [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign).

### let RescriptCore.Object.copy

```rescript
let copy: (. ({..} as 'a)) => 'a
```

### let RescriptCore.Object.get

```rescript
let get: (. {..}, string) => option<'a>
```

`get` gets the value of a property by name. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.

#### Examples

```rescript
{"a": 1}->Object.get("a") // Some(1)
{"a": 1}->Object.get("b") // None
{"a": undefined}->Object.get("a") // None
{"a": null}->Object.get("a") // Some(null)
{"a": 1}->Object.get("toString")->Option.isSome // true
```

### let RescriptCore.Object.getSymbol

```rescript
let getSymbol: (. {..}, Core__Symbol.t) => option<'a>
```

`getSymbol` gets the value of a property by symbol. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.

#### Examples

```rescript
let fruit = Symbol.make("fruit")
let x = Object.empty()
x->Object.setSymbol(fruit, "banana")
x->Object.getSymbol(fruit) // Some("banana")
```

### let RescriptCore.Object.getSymbolUnsafe

```rescript
let getSymbolUnsafe: (. {..}, Core__Symbol.t) => 'a
```

### let RescriptCore.Object.set

```rescript
let set: (. {..}, string, 'a) => unit
```

`set(name, value)` assigns a value to the named object property, overwriting the previous value if any. See [Working with Objects on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects#objects_and_properties)

#### Examples

```rescript
{"a": 1}->Object.set("a", 2) // {"a": 2}
{"a": 1}->Object.set("a", None) // {"a": None}
{"a": 1}->Object.set("b", 2) // {"a": 1, "b": 2}
```

### let RescriptCore.Object.setSymbol

```rescript
let setSymbol: (. {..}, Core__Symbol.t, 'a) => unit
```

### let RescriptCore.Object.keysToArray

```rescript
let keysToArray: (. {..}) => array<string>
```

`keysToArray` returns an array of an object's own enumerable string-keyed property names. See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.keys) 
or [Object.keys on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys).

#### Examples

```rescript
{"a": 1, "b": 2}->Object.keysToArray // ["a", "b"]
{"a": None}->Object.keysToArray // ["a"]
Object.empty()->Object.keysToArray // []
```

### let RescriptCore.Object.hasOwnProperty

```rescript
let hasOwnProperty: (. {..}, string) => bool
```

`hasOwnProperty` determines whether the object has the specified property as its **own** property, as opposed to inheriting it. See [hasOwnProperty on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty)

#### Examples

```rescript
let point = {"x": 1, "y": 2}
{"a": 1}->hasOwnProperty("a") // true
{"a": 1}->hasOwnProperty("b") // false
{"a": 1}->hasOwnProperty("toString") // false
```

### let RescriptCore.Object.seal

```rescript
let seal: (. ({..} as 'a)) => 'a
```

`seal` seals an object. Sealing an object prevents extensions and makes existing properties non-configurable. A sealed object has a fixed set of properties. Unlike `freeze`, values of existing properties can still be changed as long as they are writable. 

**Note:** `seal` returns the same object that was passed in; it does not create a copy. Any attempt to delete or add properties to a sealed object will fail, either silently or by throwing an error. 

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.seal) and [Object.seal on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/seal)

#### Examples

```rescript
let point = {"x": 1, "y": 2}
point->Object.set("x", -7) // succeeds
point->Object.seal->ignore
point->Object.set("z", 9) // fails
point->Object.set("x", 13) // succeeds
```

### let RescriptCore.Object.preventExtensions

```rescript
let preventExtensions: (. ({..} as 'a)) => 'a
```

`preventExtensions` prevents new properties from being added to the object. It modifies the object (rather than creating a copy) and returns it.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.preventextensions) and [Object.preventExtensions on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions)

#### Examples

```rescript
let obj = {"a": 1}
obj->Object.set("b", 2) // succeeds
obj->Object.preventExtensions->ignore
obj->Object.set("c", 3) // fails
```

### let RescriptCore.Object.freeze

```rescript
let freeze: (. ({..} as 'a)) => 'a
```

`freeze` freezes an object. Freezing an object makes existing properties non-writable and prevents extensions. Once an object is frozen, new properties cannot be be added, existing properties cannot be removed, and their values cannot be changed.

**Note:** `freeze` returns the same object that was passed in; it does not create a frozen copy. Any attempt to change a frozen object will fail, either silently or by throwing an exception.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).

#### Examples

 ```rescript
let obj = {"a": 1}
obj-\>Object.set("a", 2) // succeeds
obj-\>Object.freeze-\>ignore
obj-\>Object.set("a", 3) // fails
```

### let RescriptCore.Object.isSealed

```rescript
let isSealed: (. 'a) => bool
```

`isSealed` determines if an object is sealed. A sealed object has a fixed set of properties.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.issealed) and [Object.isSealed on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isSealed)

#### Examples

```rescript
let point = {"x": 1, "y": 3}->Object.seal
let pointIsSealed = point->Object.isSealed // true
let fruit = {"name": "Apple" }
let fruitIsSealed = fruit->Object.isSealed // false
 ```

### let RescriptCore.Object.isFrozen

```rescript
let isFrozen: (. 'a) => bool
```

`isFrozen` determines if an object is frozen. An object is frozen if an only if it is not extensible, all its properties are non-configurable, and all its data properties are non-writable.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).

#### Examples

```rescript
let point = {"x": 1, "y": 3}->Object.freeze
let pointIsFrozen = point->Object.isFrozen // true
let fruit = {"name": "Apple" }
let fruitIsFrozen = fruit->Object.isFrozen // false
 ```

### let RescriptCore.Object.isExtensible

```rescript
let isExtensible: (. 'a) => bool
```

`isExtensible` determines if an object is extensible (whether it can have new properties added to it).

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isextensible) and [Object.isExtensible on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible)

#### Examples

```rescript
let obj = {"a": 1}
obj->Object.isExtensible // true
obj->Object.preventExtensions->ignore
obj->Object.isExtensible // false
```

## module RescriptCore.Ordering `alias`

### type RescriptCore.Ordering.t

```rescript
type t = float
```

### let RescriptCore.Ordering.less

```rescript
let less: float
```

### let RescriptCore.Ordering.equal

```rescript
let equal: float
```

### let RescriptCore.Ordering.greater

```rescript
let greater: float
```

### let RescriptCore.Ordering.isLess

```rescript
let isLess: (. float) => bool
```

### let RescriptCore.Ordering.isEqual

```rescript
let isEqual: (. float) => bool
```

### let RescriptCore.Ordering.isGreater

```rescript
let isGreater: (. float) => bool
```

### let RescriptCore.Ordering.invert

```rescript
let invert: (. float) => float
```

### let RescriptCore.Ordering.fromInt

```rescript
let fromInt: (. int) => float
```

## module RescriptCore.Promise `alias`

Functions for interacting with JavaScript Promise.
See: [`Promise`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).

### type RescriptCore.Promise.t

```rescript
type t<'a> = promise<'a>
```

### let RescriptCore.Promise.resolve

```rescript
let resolve: (. 'a) => t<'a>
```

`resolve(value)` creates a resolved Promise with a given `value`.
See [`Promise.resolve`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve) on MDN.

#### Examples

```rescript
let p = Promise.resolve(5) // promise<int>
```

### let RescriptCore.Promise.reject

```rescript
let reject: (. exn) => t<'a>
```

`reject(exn)` reject a Promise.
See [`Promise.reject`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/reject) on MDN.

#### Examples

```rescript
exception TestError(string)

let p = Promise.reject(TestError("some rejected value"))
```

### let RescriptCore.Promise.make

```rescript
let make: (. (. (. 'a) => unit, (. 'e) => unit) => unit) => t<'a>
```

`make(callback)` creates a new Promise based on a `callback` that receives two
uncurried functions `resolve` and `reject` for defining the Promise's result.

#### Examples

```rescript
open Promise

let n = 4
Promise.make((resolve, reject) => {
  if(n < 5) {
    resolve(. "success")
  }
  else {
    reject(. "failed")
  }
})
->then(str => {
  Console.log(str)->resolve
})
->catch(e => {
  Console.log("Error occurred")
  resolve()
})
->ignore
```

### let RescriptCore.Promise.catch

```rescript
let catch: (. t<'a>, (. exn) => t<'a>) => t<'a>
```

`catch(promise, errorCallback)` registers an exception handler in a promise chain.
The `errorCallback` receives an `exn` value that can later be refined into a JS
error or ReScript error. The `errorCallback` needs to return a promise with the
same type as the consumed promise. See [`Promise.catch`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch) on MDN.

#### Examples

```rescript
open Promise

exception SomeError(string)

reject(SomeError("this is an error"))
->then(_ => {
  Ok("This result will never be returned")->resolve
})
->catch(e => {
  let msg = switch(e) {
    | SomeError(msg) => "ReScript error occurred: " ++ msg
    | Exn.Error(obj) =>
      switch Exn.message(obj) {
        | Some(msg) => "JS exception occurred: " ++ msg
        | None => "Some other JS value has been thrown"
      }
    | _ => "Unexpected error occurred"
  }

  Error(msg)->resolve
})
->then(result => {
  switch result {
  | Ok(r) => Console.log2("Operation successful: ", r)
  | Error(msg) => Console.log2("Operation failed: ", msg)
  }->resolve
})
->ignore // Ignore needed for side-effects
```

In case you want to return another promise in your `callback`, consider using
`then` instead.

### let RescriptCore.Promise.then

```rescript
let then: (. t<'a>, (. 'a) => t<'b>) => t<'b>
```

`then(promise, callback)` returns a new promise based on the result of `promise`'s 
value. The `callback` needs to explicitly return a new promise via `resolve`.
It is **not allowed** to resolve a nested promise (like `resolve(resolve(1))`).
See [`Promise.then`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then) on MDN.
#### Examples

```rescript
Promise.resolve(5)
->then(num => {
  resolve(num + 5)
})
->then(num => {
  Console.log2("Your lucky number is: ", num)
  resolve()
})
->ignore
```

### let RescriptCore.Promise.thenResolve

```rescript
let thenResolve: (. t<'a>, (. 'a) => 'b) => t<'b>
```

`thenResolve(promise, callback)` converts an encapsulated value of a promise
into another promise wrapped value. It is **not allowed** to return a promise
within the provided callback (e.g. `thenResolve(value =\> resolve(value))`).

#### Examples

```rescript
resolve("Anna")
->thenResolve(str => {
  "Hello " ++ str
})
->thenResolve(str => {
  Console.log(str)
})
->ignore // Ignore needed for side-effects
```

In case you want to return another promise in your `callback`, consider using
`then` instead.

### let RescriptCore.Promise.finally

```rescript
let finally: (. t<'a>, (. unit) => unit) => t<'a>
```

`finally(promise, callback)` is used to execute a function that is called no
matter if a promise was resolved or rejected. It will return the same `promise`
it originally received. See [`Promise.finally`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally) on MDN.

#### Examples

```rescript
exception SomeError(string)
let isDone = ref(false)

resolve(5)
->then(_ => {
  reject(TestError("test"))
})
->then(v => {
  Console.log2("final result", v)
  resolve()
})
->catch(_ => {
  Console.log("Error handled")
  resolve()
})
->finally(() => {
  Console.log("finally")
  isDone := true
})
->then(() => {
  Console.log2("isDone:", isDone.contents)
  resolve()
})
->ignore
```

### let RescriptCore.Promise.race

```rescript
let race: (. array<t<'a>>) => t<'a>
```

`race(arr)` combining `array` of promises. See [`Promise.race`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/race) on MDN.

#### Examples

```rescript
open Promise
let racer = (ms, name) => {
  Promise.make((resolve, _) => {
    Global.setTimeout(() => {
      resolve(. name)
    }, ms)->ignore
  })
}

let promises = [racer(1000, "Turtle"), racer(500, "Hare"), racer(100, "Eagle")]

race(promises)->then(winner => {
  Console.log("The winner is " ++ winner)
  resolve()
})
```

### let RescriptCore.Promise.all

```rescript
let all: (. array<t<'a>>) => t<array<'a>>
```

`all(promises)` runs all promises in parallel and returns a new promise resolving
all gathered results in a unified array. See [`Promise.all`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) on MDN.

```rescript
open Promise
let promises = [resolve(1), resolve(2), resolve(3)]

all(promises)
->then((results) => {
  results->Array.forEach(num => {
    Console.log2("Number: ", num)
  })

  resolve()
})
->ignore
```

### let RescriptCore.Promise.all2

```rescript
let all2: (. (t<'a>, t<'b>)) => t<('a, 'b)>
```

`all2((p1, p2))`. Like `all()`, but with a fixed size tuple of 2

### let RescriptCore.Promise.all3

```rescript
let all3: (. (t<'a>, t<'b>, t<'c>)) => t<('a, 'b, 'c)>
```

`all3((p1, p2, p3))`. Like `all()`, but with a fixed size tuple of 3

### let RescriptCore.Promise.all4

```rescript
let all4: (. (t<'a>, t<'b>, t<'c>, t<'d>)) => t<('a, 'b, 'c, 'd)>
```

`all4((p1, p2, p3, p4))`. Like `all()`, but with a fixed size tuple of 4

### let RescriptCore.Promise.all5

```rescript
let all5: (.
  (t<'a>, t<'b>, t<'c>, t<'d>, t<'e>),
) => t<('a, 'b, 'c, 'd, 'e)>
```

`all5((p1, p2, p3, p4, p5))`. Like `all()`, but with a fixed size tuple of 5

### let RescriptCore.Promise.all6

```rescript
let all6: (.
  (t<'a>, t<'b>, t<'c>, t<'d>, t<'e>, t<'f>),
) => t<('a, 'b, 'c, 'd, 'e, 'f)>
```

`all6((p1, p2, p4, p5, p6))`. Like `all()`, but with a fixed size tuple of 6
")

### let RescriptCore.Promise.done

```rescript
let done: (. promise<'a>) => unit
```

`done(p)` is a safe way to ignore a promise. If a value is anything else than a
promise, it will raise a type error.

## module RescriptCore.RegExp `alias`

Functions for handling RegExp's in ReScript.

See [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp) on MDN.

### type RescriptCore.RegExp.t

```rescript
type t = Js.Re.t
```

Type representing an instantiated `RegExp`.

## module RescriptCore.RegExp.Result

### type RescriptCore.RegExp.Result.t

```rescript
type t = array<string>
```

Type representing the result of a `RegExp` execution.

### let RescriptCore.RegExp.Result.fullMatch

```rescript
let fullMatch: (. t) => string
```

`fullMatch(regExpResult)` returns the full string that matched in this result.

  ## Examples
  ```rescript
  // Match the first two words separated by a space
  let regexp = RegExp.fromString("(\\w+) (\\w+)")

  switch regexp-\>RegExp.exec("ReScript is pretty cool, right?") {
  | None =\> Console.log("Nope, no match...")
  | Some(result) =\> Console.log(result-\>RegExp.Result.fullMatch) // Prints the full string that matched, "ReScript is"
  }
  ```

### let RescriptCore.RegExp.Result.matches

```rescript
let matches: (. t) => array<string>
```

`matches(regExpResult)` returns all matches for `regExpResult`.

  ## Examples
  ```rescript
  // Match the first two words separated by a space
  let regexp = RegExp.fromString("(\\w+) (\\w+)")

  // This below will log "ReScript" and "is" to the console.
  switch regexp-\>RegExp.exec("ReScript is pretty cool, right?") {
  | None =\> Console.log("Nope, no match...")
  | Some(result) =\> switch result-\>RegExp.Result.matches {
    | [firstWord, secondWord] =\> Console.log2(firstWord, secondWord)
    | _ =\> Console.log("Didn't find exactly two words...")
    }
  }
  ```

### let RescriptCore.RegExp.Result.index

```rescript
let index: (. t) => int
```

### let RescriptCore.RegExp.Result.input

```rescript
let input: (. t) => string
```

`input(regExpResult)` returns the full input string that was passed to what produced the `RegExp.Result.t`.

  ## Examples
  ```rescript
  // Match the first two words separated by a space
  let regexp = RegExp.fromString("(\\w+) (\\w+)")

  // This below will log the full input string "ReScript is pretty cool, right?" to the console.
  switch regexp-\>RegExp.exec("ReScript is pretty cool, right?") {
  | None =\> Console.log("Nope, no match...")
  | Some(result) =\> Console.log(result-\>RegExp.Result.input)
  }
  ```

### let RescriptCore.RegExp.fromString

```rescript
let fromString: (. string) => t
```

`fromString(string)` creates a `RegExp.t` from the provided string. This can then be used to match on strings using `RegExp.exec`.

See [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints "ReScript"
}
```

### let RescriptCore.RegExp.fromStringWithFlags

```rescript
let fromStringWithFlags: (. string, ~flags: string) => t
```

`fromStringWithFlags(string)` creates a `RegExp.t` from the provided string, using the provided `flags`. This can then be used to match on strings using `RegExp.exec`.

See [`RegExp parameters`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp#parameters) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromStringWithFlags("\\w+", ~flags="g")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints "ReScript"
}
```

### let RescriptCore.RegExp.test

```rescript
let test: (. t, string) => bool
```

`test(regexp, string)` tests whether the provided `regexp` matches on the provided string.

See [`RegExp.test`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")

if regexp->RegExp.test("ReScript is cool!") {
  Console.log("Yay, there's a word in there.")
}
```

### let RescriptCore.RegExp.exec

```rescript
let exec: (. t, string) => option<Result.t>
```

`exec(regexp, string)` executes the provided regexp on the provided string, optionally returning a `RegExp.Result.t` if the regexp matches on the string.

See [`RegExp.exec`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints "ReScript"
}
```

### let RescriptCore.RegExp.lastIndex

```rescript
let lastIndex: (. t) => int
```

`lastIndex(regexp)` returns the index the next match will start from.

See [`RegExp.lastIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")
let someStr = "Many words here."

Console.log(regexp->RegExp.lastIndex) // Logs `0` to the console

regexp->RegExp.exec(someStr)->ignore

Console.log(regexp->RegExp.lastIndex) // Logs `4` to the console
```

### let RescriptCore.RegExp.ignoreCase

```rescript
let ignoreCase: (. t) => bool
```

`ignoreCase(regexp)` returns whether the ignore case (`i`) flag is set on this `RegExp`.

See [`RegExp.ignoreCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.ignoreCase) // Logs `false`, since `i` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="i")
Console.log(regexp2->RegExp.ignoreCase) // Logs `true`, since `i` is set
```

### let RescriptCore.RegExp.global

```rescript
let global: (. t) => bool
```

`global(regexp)` returns whether the global (`g`) flag is set on this `RegExp`.

See [`RegExp.global`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.global) // Logs `true`, since `g` is set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="i")
Console.log(regexp2->RegExp.global) // Logs `false`, since `g` is not set
```

### let RescriptCore.RegExp.multiline

```rescript
let multiline: (. t) => bool
```

`multiline(regexp)` returns whether the multiline (`m`) flag is set on this `RegExp`.

See [`RegExp.multiline`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.multiline) // Logs `false`, since `m` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="mi")
Console.log(regexp2->RegExp.multiline) // Logs `true`, since `m` is set
```

### let RescriptCore.RegExp.source

```rescript
let source: (. t) => string
```

`source(regexp)` returns the source text for this `RegExp`, without the two forward slashes (if present), and without any set flags.

See [`RegExp.source`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) on MDN.

#### Examples
```rescript
let regexp = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp->RegExp.source) // Logs `\w+`, the source text of the `RegExp`
```

### let RescriptCore.RegExp.sticky

```rescript
let sticky: (. t) => bool
```

`sticky(regexp)` returns whether the sticky (`y`) flag is set on this `RegExp`.

See [`RegExp.sticky`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.unicode) // Logs `false`, since `y` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="my")
Console.log(regexp2->RegExp.unicode) // Logs `true`, since `y` is set
```

### let RescriptCore.RegExp.unicode

```rescript
let unicode: (. t) => bool
```

`unicode(regexp)` returns whether the unicode (`y`) flag is set on this `RegExp`.

See [`RegExp.unicode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.unicode) // Logs `false`, since `u` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="mu")
Console.log(regexp2->RegExp.unicode) // Logs `true`, since `u` is set
```

## module RescriptCore.String `alias`

Functions for interacting with JavaScript strings.
See: [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String).

### let RescriptCore.String.make

```rescript
let make: (. 'a) => string
```

`make(value)` converts the given value to a `string`.

#### Examples

```rescript
String.make(3.5) == "3.5"
String.make([1, 2, 3]) == "1,2,3"
```

### let RescriptCore.String.fromCharCode

```rescript
let fromCharCode: (. int) => string
```

`fromCharCode(n)` creates a `string` containing the character corresponding to
that number, `n` ranges from 0 to 65535. If out of range, the lower 16 bits of
the value are used. Thus, `fromCharCode(0x1F63A)` gives the same result as
`fromCharCode(0xF63A)`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode) on MDN.

#### Examples

```rescript
String.fromCharCode(65) == "A"
String.fromCharCode(0x3c8) == `ψ`
String.fromCharCode(0xd55c) == `한`
String.fromCharCode(-64568) == `ψ`
```

### let RescriptCore.String.fromCharCodeMany

```rescript
let fromCharCodeMany: (. array<int>) => string
```

`fromCharCodeMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given numbers, using the same rules as `fromCharCode`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode) on MDN.

#### Examples

```rescript
String.fromCharCodeMany([189, 43, 190, 61]) == "½+¾="
String.fromCharCode([65, 66, 67]) == "ABC"
```

### let RescriptCore.String.fromCodePoint

```rescript
let fromCodePoint: (. int) => string
```

`fromCodePoint(n)` creates a `string` containing the character corresponding to
that numeric code point.
See [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint) on MDN.

#### Examples

```rescript
String.fromCodePoint(65) == "A"
String.fromCodePoint(0x3c8) == `ψ`
String.fromCodePoint(0xd55c) == `한`
String.fromCodePoint(0x1f63a) == `😺`
```

#### Exceptions

- `RangeError`: If the number is not a valid code point, like `fromCharCode(-5)`.

### let RescriptCore.String.fromCodePointMany

```rescript
let fromCodePointMany: (. array<int>) => string
```

`fromCodePointMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given code point numbers, using the same rules as
`fromCodePoint`.
See [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint) on MDN.

#### Examples

```rescript
String.fromCodePointMany([0xd55c, 0xae00, 0x1f63a]) == `한글😺`
```

#### Exceptions

- `RangeError`: If one of the number is not a valid code point, like
`fromCharCode([1, -5])`.

### let RescriptCore.String.equal

```rescript
let equal: (. string, string) => bool
```

### let RescriptCore.String.compare

```rescript
let compare: (. string, string) => Core__Ordering.t
```

### let RescriptCore.String.length

```rescript
let length: (. string) => int
```

`length(str)` returns the length of the given `string`.
See [`String.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) on MDN.

#### Examples

```rescript
String.length("abcd") == 4
```

### let RescriptCore.String.get

```rescript
let get: (. string, int) => option<string>
```

`get(str, index)` returns an `option\<string\>` at the given `index` number. If
`index` is out of range, this function returns `None`.

#### Examples

```rescript
String.get("ReScript", 0) == Some("R")
String.get("Hello", 4) == Some("o")
String.get(`JS`, 4) == None
```

### let RescriptCore.String.charAt

```rescript
let charAt: (. string, int) => string
```

`charAt(str, index)` gets the character at `index` within string `str`. If
`index` is negative or greater than the length of `str`, it returns the empty
string. If the string contains characters outside the range \u0000-\uffff, it
will return the first 16-bit value at that position in the string.
See [`String.charAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charAt) on MDN.

#### Examples

```rescript
String.charAt("ReScript", 0) == "R"
String.charAt("Hello", 12) == ""
String.charAt(`JS`, 5) == ""
```

### let RescriptCore.String.charCodeAt

```rescript
let charCodeAt: (. string, int) => float
```

`charCodeAt(str, index)` returns the character code at position `index` in
string `str` the result is in the range 0-65535, unlike `codePointAt`, so it
will not work correctly for characters with code points greater than or equal
to 0x10000. The return type is `float` because this function returns NaN if
`index` is less than zero or greater than the length of the string.
See [`String.charCodeAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charCodeAt) on MDN.

#### Examples

```rescript
String.charCodeAt(`😺`, 0) == 0xd83d->Int.toFloat
String.codePointAt(`😺`, 0) == Some(0x1f63a)
```

### let RescriptCore.String.codePointAt

```rescript
let codePointAt: (. string, int) => option<int>
```

`codePointAt(str, index)` returns the code point at position `index` within
string `str` as a `Some(value)`. The return value handles code points greater
than or equal to 0x10000. If there is no code point at the given position, the
function returns `None`.
See [`String.codePointAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt) on MDN.

#### Examples

```rescript
String.codePointAt(`¿😺?`, 1) == Some(0x1f63a)
String.codePointAt("abc", 5) == None
```

### let RescriptCore.String.concat

```rescript
let concat: (. string, string) => string
```

`concat(original, append)` returns a new `string` with `append` added after
`original`.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat) on MDN.

#### Examples

```rescript
String.concat("cow", "bell") == "cowbell"
String.concat("Re", "Script") == "ReScript"
```

### let RescriptCore.String.concatMany

```rescript
let concatMany: (. string, array<string>) => string
```

`concatMany(original, arr)` returns a new `string` consisting of each item of an
array of strings added to the `original` string.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat) on MDN.

#### Examples

```rescript
String.concatMany("1st", ["2nd", "3rd", "4th"]) == "1st2nd3rd4th"
```

### let RescriptCore.String.endsWith

```rescript
let endsWith: (. string, string) => bool
```

`endsWith(str, substr)` returns `true` if the `str` ends with `substr`, `false`
otherwise.
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith) on MDN.

#### Examples

```rescript
String.endsWith("BuckleScript", "Script") == true
String.endsWith("BuckleShoes", "Script") == false
```

### let RescriptCore.String.endsWithFrom

```rescript
let endsWithFrom: (. string, string, int) => bool
```

`endsWithFrom(str, ending, len)` returns `true` if the first len characters of
`str` end with `ending`, `false` otherwise. If `len` is greater than or equal
to the length of `str`, then it works like `endsWith`.
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith) on MDN.

#### Examples

```rescript
String.endsWithFrom("abcd", "cd", 4) == true
String.endsWithFrom("abcde", "cd", 3) == false
String.endsWithFrom("abcde", "cde", 99) == true
String.endsWithFrom("example.dat", "ple", 7) == true
```

### let RescriptCore.String.includes

```rescript
let includes: (. string, string) => bool
```

`includes(str, searchValue)` returns `true` if `searchValue` is found anywhere
within `str`, `false` otherwise.
See [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes) on MDN.

#### Examples

```rescript
String.includes("programmer", "gram") == true
String.includes("programmer", "er") == true
String.includes("programmer", "pro") == true
String.includes("programmer.dat", "xyz") == false
```

### let RescriptCore.String.includesFrom

```rescript
let includesFrom: (. string, string, int) => bool
```

`includesFrom(str, searchValue, start)` returns `true` if `searchValue` is found
anywhere within `str` starting at character number `start` (where 0 is the
first character), `false` otherwise.
See [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes) on MDN.

#### Examples

```rescript
String.includesFrom("programmer", "gram", 1) == true
String.includesFrom("programmer", "gram", 4) == false
String.includesFrom(`대한민국`, `한`, 1) == true
```

### let RescriptCore.String.indexOf

```rescript
let indexOf: (. string, string) => int
```

`indexOf(str, searchValue)` returns the position at which `searchValue` was
first found within `str`, or `-1` if `searchValue` is not in `str`.
See [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf) on MDN.

#### Examples

```rescript
String.indexOf("bookseller", "ok") == 2
String.indexOf("bookseller", "sell") == 4
String.indexOf("beekeeper", "ee") == 1
String.indexOf("bookseller", "xyz") == -1
```

### let RescriptCore.String.indexOfOpt

```rescript
let indexOfOpt: (. string, string) => option<int>
```

`indexOfOpt(str, searchValue)`. Like `indexOf`, but return an `option\<int\>`.

#### Examples

```rescript
String.indexOf("bookseller", "ok") == Some(2)
String.indexOf("bookseller", "xyz") == None
```

### let RescriptCore.String.indexOfFrom

```rescript
let indexOfFrom: (. string, string, int) => int
```

`indexOfFrom(str, searchValue, start)` returns the position at which
`searchValue` was found within `str` starting at character position `start`, or
`-1` if `searchValue` is not found in that portion of `str`. The return value is
relative to the beginning of the string, no matter where the search started
from.
See [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf) on MDN.

#### Examples

```rescript
String.indexOfFrom("bookseller", "ok", 1) == 2
String.indexOfFrom("bookseller", "sell", 2) == 4
String.indexOfFrom("bookseller", "sell", 5) == -1
```

### let RescriptCore.String.lastIndexOf

```rescript
let lastIndexOf: (. string, string) => int
```

`lastIndexOf(str, searchValue)` returns the position of the last occurrence of
`searchValue` within `str`, searching backwards from the end of the string.
Returns `-1` if `searchValue` is not in `str`. The return value is always
relative to the beginning of the string.
See [`String.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf) on MDN.

#### Examples

```rescript
String.lastIndexOf("bookseller", "ok") == 2
String.lastIndexOf("beekeeper", "ee") == 4
String.lastIndexOf("abcdefg", "xyz") == -1
```

### let RescriptCore.String.lastIndexOfOpt

```rescript
let lastIndexOfOpt: (. string, string) => option<int>
```

`lastIndexOfOpt(str, searchValue)`. Like `lastIndexOfOpt`, but return an
`option\<int\>`.

#### Examples

```rescript
String.lastIndexOf("bookseller", "ok") == Some(2)
String.lastIndexOf("beekeeper", "ee") == Some(4)
String.lastIndexOf("abcdefg", "xyz") == None
```

### let RescriptCore.String.lastIndexOfFrom

```rescript
let lastIndexOfFrom: (. string, string, int) => int
```

`lastIndexOfFrom(str, searchValue, start)` returns the position of the last
occurrence of `searchValue` within `str`, searching backwards from the given
start position. Returns `-1` if `searchValue` is not in `str`. The return value
is always relative to the beginning of the string.
See [`String.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf) on MDN.

#### Examples

```rescript
String.lastIndexOfFrom("bookseller", "ok", 6) == 2
String.lastIndexOfFrom("beekeeper", "ee", 8) == 4
String.lastIndexOfFrom("beekeeper", "ee", 3) == 1
String.lastIndexOfFrom("abcdefg", "xyz", 4) == -1
```

### let RescriptCore.String.match

```rescript
let match: (. string, Core__RegExp.t) => option<Core__RegExp.Result.t>
```

`match(str, regexp)` matches a `string` against the given `regexp`. If there is
no match, it returns `None`. For regular expressions without the g modifier, if
there is a match, the return value is `Some(array)` where the array contains:
- The entire matched string
- Any capture groups if the regexp had parentheses
For regular expressions with the g modifier, a matched expression returns
`Some(array)` with all the matched substrings and no capture groups.
See [`String.match`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) on MDN.

#### Examples

```rescript
String.match("The better bats", %re("/b[aeiou]t/")) == Some(["bet"])
String.match("The better bats", %re("/b[aeiou]t/g")) == Some(["bet", "bat"])
String.match("Today is 2018-04-05.", %re("/(\d+)-(\d+)-(\d+)/")) ==
  Some(["2018-04-05", "2018", "04", "05"])
String.match("The large container.", %re("/b[aeiou]g/")) == None
```

### let RescriptCore.String.normalize

```rescript
let normalize: (. string) => string
```

`normalize(str)` returns the normalized Unicode string using Normalization Form
Canonical (NFC) Composition. Consider the character ã, which can be represented
as the single codepoint \u00e3 or the combination of a lower case letter A
\u0061 and a combining tilde \u0303. Normalization ensures that both can be
stored in an equivalent binary representation.
See [`String.normalize`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize) on MDN.
See also [Unicode technical report #15](https://unicode.org/reports/tr15/) for details.

#### Examples

```rescript
let string1 = "\uFB00"
let string2 = "\u0066\u0066"
Console.log(string1 === string2) // false

let normalizeString1 = String.normalize(string1, "NFKD")
let normalizeString2 = String.normalize(string2, "NFKD")
assert(normalizeString1 === normalizeString2)
```

### type RescriptCore.String.normalizeForm

```rescript
type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]
```

`normalizeByForm(str, form)` returns the normalized Unicode string using the
specified form of normalization, which may be one of:
- "NFC" — Normalization Form Canonical Composition.
- "NFD" — Normalization Form Canonical Decomposition.
- "NFKC" — Normalization Form Compatibility Composition.
- "NFKD" — Normalization Form Compatibility Decomposition.
See [`String.normalize`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize) on MDN.
See also [Unicode technical report #15](https://unicode.org/reports/tr15/) for
details.

#### Examples

```rescript
let string1 = "\uFB00"
let string2 = "\u0066\u0066"
Console.log(string1 == string2) // false

let normalizeString1 = String.normalizeByForm(string1, #NFKD)
let normalizeString2 = String.normalizeByForm(string2, #NFKD)
Console.log(normalizeString1 == normalizeString2) // true
```

### let RescriptCore.String.normalizeByForm

```rescript
let normalizeByForm: (. string, normalizeForm) => string
```

### let RescriptCore.String.repeat

```rescript
let repeat: (. string, int) => string
```

`repeat(str, n)` returns a `string` that consists of `n` repetitions of `str`.
See [`String.repeat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat) on MDN.

#### Examples

```rescript
String.repeat("ha", 3) == "hahaha"
String.repeat("empty", 0) == ""
```

#### Exceptions

- `RangeError`: if `n` is negative.

### let RescriptCore.String.replace

```rescript
let replace: (. string, string, string) => string
```

`replace(str, substr, newSubstr)` returns a new `string` which is
identical to `str` except with the first matching instance of `substr` replaced
by `newSubstr`. `substr` is treated as a verbatim string to match, not a
regular expression.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

#### Examples

```rescript
String.replace("old string", "old", "new") == "new string"
String.replace("the cat and the dog", "the", "this") == "this cat and the dog"
```

### let RescriptCore.String.replaceRegExp

```rescript
let replaceRegExp: (. string, Core__RegExp.t, string) => string
```

`replaceRegExp(str, regex, replacement)` returns a new `string` where
occurrences matching regex have been replaced by `replacement`.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

#### Examples

```rescript
String.replaceRegExp("vowels be gone", %re("/[aeiou]/g"), "x") == "vxwxls bx gxnx"
String.replaceRegExp("Juan Fulano", %re("/(\w+) (\w+)/"), "$2, $1") == "Fulano, Juan"
```

### let RescriptCore.String.replaceAll

```rescript
let replaceAll: (. string, string, string) => string
```

`replaceAll(str, substr, newSubstr)` returns a new `string` which is
identical to `str` except with all matching instances of `substr` replaced
by `newSubstr`. `substr` is treated as a verbatim string to match, not a
regular expression.
See [`String.replaceAll`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) on MDN.

#### Examples

```rescript
String.replaceAll("old old string", "old", "new") == "new new string"
String.replaceAll("the cat and the dog", "the", "this") == "this cat and this dog"
```

### let RescriptCore.String.replaceAllRegExp

```rescript
let replaceAllRegExp: (. string, Core__RegExp.t, string) => string
```

`replaceAllRegExp(str, regex, replacement)` returns a new `string` where
all occurrences matching regex have been replaced by `replacement`.
The pattern must include the global (`g`) flag or a runtime TypeError will be thrown.
See [`String.replaceAll`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) on MDN.

#### Examples

```rescript
String.replaceAllRegExp("vowels be gone", %re("/[aeiou]/g"), "x") == "vxwxls bx gxnx"
String.replaceAllRegExp("aabbcc", %re("/b/g"), ".") == "aa..cc"
```

### let RescriptCore.String.unsafeReplaceRegExpBy0

```rescript
let unsafeReplaceRegExpBy0: (.
  string,
  Core__RegExp.t,
  (.
    ~match: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string
```

`unsafeReplaceRegExpBy0(str, regex, f)` returns a new `string` with some or all
matches of a pattern with no capturing parentheses replaced by the value
returned from the given function. The function receives as its parameters the
matched string, the offset at which the match begins, and the whole string being
matched.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

#### Examples

```rescript
let str = "beautiful vowels"
let re = %re("/[aeiou]/g")
let matchFn = (matchPart, _offset, _wholeString) => String.toUpperCase(matchPart)
String.unsafeReplaceRegExpBy0(str, re, matchFn) == "bEAUtIfUl vOwEls"
```

### let RescriptCore.String.unsafeReplaceRegExpBy1

```rescript
let unsafeReplaceRegExpBy1: (.
  string,
  Core__RegExp.t,
  (.
    ~match: string,
    ~group1: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string
```

`unsafeReplaceRegExpBy1(str, regexp, f)`. Like `unsafeReplaceRegExpBy0`, but `f`
has `group1` parameter.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

#### Examples

```rescript
let str = "Jony is 40"
let re = %re("/(Jony is )\d+/g")
let matchFn = (_match, part1, _offset, _wholeString) => {
  part1 ++ "41"
}
String.unsafeReplaceRegExpBy1(str, re, matchFn) == "Jony is 41"
```

### let RescriptCore.String.unsafeReplaceRegExpBy2

```rescript
let unsafeReplaceRegExpBy2: (.
  string,
  Core__RegExp.t,
  (.
    ~match: string,
    ~group1: string,
    ~group2: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string
```

`unsafeReplaceRegExpBy2(str, regexp, f)`. Like `unsafeReplaceRegExpBy1`, but `f`
has two group parameters.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

#### Examples

```rescript
let str = "7 times 6"
let re = %re("/(\d+) times (\d+)/")
let matchFn = (_match, p1, p2, _offset, _wholeString) => {
  switch (Int.fromString(p1), Int.fromString(p2)) {
  | (Some(x), Some(y)) => Int.toString(x * y)
  | _ => "???"
  }
}
String.unsafeReplaceRegExpBy2(str, re, matchFn) == "42"
```

### let RescriptCore.String.unsafeReplaceRegExpBy3

```rescript
let unsafeReplaceRegExpBy3: (.
  string,
  Core__RegExp.t,
  (.
    ~match: string,
    ~group1: string,
    ~group2: string,
    ~group3: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string
```

`unsafeReplaceRegExpBy3(str, regexp, f)`. Like `unsafeReplaceRegExpBy1`, but `f`
has three group parameters.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

### let RescriptCore.String.search

```rescript
let search: (. string, Core__RegExp.t) => int
```

`search(str, regexp)` returns the starting position of the first match of
`regexp` in the given `str`, or -1 if there is no match.
See [`String.search`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search) on MDN.

#### Examples

```rescript
String.search("testing 1 2 3", %re("/\d+/")) == 8
String.search("no numbers", %re("/\d+/")) == -1
```

### let RescriptCore.String.searchOpt

```rescript
let searchOpt: (. string, Core__RegExp.t) => option<int>
```

`searchOpt(str, regexp)`. Like `search`, but return an `option\<int\>`.

#### Examples

```rescript
String.search("testing 1 2 3", %re("/\d+/")) == Some(8)
String.search("no numbers", %re("/\d+/")) == None
```

### let RescriptCore.String.slice

```rescript
let slice: (. string, ~start: int, ~end: int) => string
```

`slice(str, ~start, ~end)` returns the substring of `str` starting at
character `start` up to but not including `end`.
- If either `start` or `end` is negative, then it is evaluated as
`length(str - start)` or `length(str - end)`.
- If `end` is greater than the length of `str`, then it is treated as
`length(str)`.
- If `start` is greater than `end`, slice returns the empty string.
See [`String.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice) on MDN.

#### Examples

```rescript
String.slice("abcdefg", ~start=2, ~end=5) == "cde"
String.slice("abcdefg", ~start=2, ~end=9) == "cdefg"
String.slice("abcdefg", ~start=-4, ~end=-2) == "de"
String.slice("abcdefg", ~start=5, ~end=1) == ""
```

### let RescriptCore.String.sliceToEnd

```rescript
let sliceToEnd: (. string, ~start: int) => string
```

`sliceToEnd(str, ~start)` returns the substring of `str` starting at character
`start` to the end of the string.
- If `start` is negative, then it is evaluated as `length(str - start)`.
- If `start` is greater than the length of `str`, then sliceToEnd returns the empty string.
See [`String.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice) on MDN.

#### Examples

```rescript
String.sliceToEnd("abcdefg", ~start=4) == "efg"
String.sliceToEnd("abcdefg", ~start=-2) == "fg"
String.sliceToEnd("abcdefg", ~start=7) == ""
```

### let RescriptCore.String.split

```rescript
let split: (. string, string) => array<string>
```

`split(str, delimiter)` splits the given `str` at every occurrence of
`delimiter` and returns an array of the resulting substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.

#### Examples

```rescript
String.split("2018-01-02", "-") == ["2018", "01", "02"]
String.split("a,b,,c", ",") == ["a", "b", "", "c"]
String.split("good::bad as great::awful", "::") == ["good", "bad as great", "awful"]
String.split("has-no-delimiter", ";") == ["has-no-delimiter"]
```

### let RescriptCore.String.splitAtMost

```rescript
let splitAtMost: (. string, string, ~limit: int) => array<string>
```

`splitAtMost(str, delimiter, ~limit)` splits the given `str` at every
occurrence of `delimiter` and returns an array of the first `limit` resulting
substrings. If `limit` is negative or greater than the number of substrings,
the array will contain all the substrings.

#### Examples

```rescript
String.splitAtMost("ant/bee/cat/dog/elk", "/", ~limit=3) = ["ant", "bee", "cat"]
String.splitAtMost("ant/bee/cat/dog/elk", "/", ~limit=0) = []
String.splitAtMost("ant/bee/cat/dog/elk", "/", ~limit=9) = ["ant", "bee", "cat", "dog", "elk"]
```

### let RescriptCore.String.splitByRegExp

```rescript
let splitByRegExp: (. string, Core__RegExp.t) => array<option<string>>
```

`splitByRegExp(str, regexp)` splits the given `str` at every occurrence of
`regexp` and returns an array of the resulting substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.

#### Examples

```rescript
String.splitByRegExp("Jan,Feb,Mar", %re("/,/")) == [Some("Jan"), Some("Feb"), Some("Mar")]
```

### let RescriptCore.String.splitByRegExpAtMost

```rescript
let splitByRegExpAtMost: (.
  string,
  Core__RegExp.t,
  ~limit: int,
) => array<option<string>>
```

`splitByRegExpAtMost(str, regexp, ~limit)` splits the given `str` at every
occurrence of `regexp` and returns an array of the first `limit` resulting
substrings. If `limit` is negative or greater than the number of substrings, the
array will contain all the substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.

#### Examples

```rescript
String.splitByRegExpAtMost("Hello World. How are you doing?", %re("/ /"), ~limit=3) == [
  Some("Hello"),
  Some("World."),
  Some("How"),
]
```

### let RescriptCore.String.startsWith

```rescript
let startsWith: (. string, string) => bool
```

`startsWith(str, substr)` returns `true` if the `str` starts with `substr`,
`false` otherwise.
See [`String.startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith) on MDN.

#### Examples

```rescript
String.startsWith("BuckleScript", "Buckle") == true
String.startsWith("BuckleScript", "") == true
String.startsWith("JavaScript", "Buckle") == false
```

### let RescriptCore.String.startsWithFrom

```rescript
let startsWithFrom: (. string, string, int) => bool
```

`startsWithFrom(str, substr, n)` returns `true` if the `str` starts
with `substr` starting at position `n`, `false` otherwise. If `n` is negative,
the search starts at the beginning of `str`.
See [`String.startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith) on MDN.

#### Examples

```rescript
String.startsWithFrom("BuckleScript", "kle", 3) == true
String.startsWithFrom("BuckleScript", "", 3) == true
String.startsWithFrom("JavaScript", "Buckle", 2) == false
```

### let RescriptCore.String.substring

```rescript
let substring: (. string, ~start: int, ~end: int) => string
```

`substring(str, ~start, ~end)` returns characters `start` up to but not
including end from `str`.
- If `start` is less than zero, it is treated as zero.
- If `end` is zero or negative, the empty string is returned.
- If `start` is greater than `end`, the `start` and `end` points are swapped.
See [`String.substring`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring) on MDN.

#### Examples

```rescript
String.substring("playground", ~start=3, ~end=6) == "ygr"
String.substring("playground", ~start=6, ~end=3) == "ygr"
String.substring("playground", ~start=4, ~end=12) == "ground"
```

### let RescriptCore.String.substringToEnd

```rescript
let substringToEnd: (. string, ~start: int) => string
```

`substringToEnd(str, ~start)` returns the substring of `str` from position
`start` to the end.
- If `start` is less than or equal to zero, the entire string is returned.
- If `start` is greater than or equal to the length of `str`, the empty string
is returned.
See [`String.substring`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring) on MDN.

#### Examples

```rescript
String.substringToEnd("playground", ~start=4) == "ground"
String.substringToEnd("playground", ~start=-3) == "playground"
String.substringToEnd("playground", ~start=12) == ""
```

### let RescriptCore.String.toLowerCase

```rescript
let toLowerCase: (. string) => string
```

`toLowerCase(str)` converts `str` to lower case using the locale-insensitive
case mappings in the Unicode Character Database. Notice that the conversion can
give different results depending upon context, for example with the Greek
letter sigma, which has two different lower case forms, one when it is the last
character in a string and another when it is not.
See [`String.toLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) on MDN.

#### Examples

```rescript
String.toLowerCase("ABC") == "abc"
String.toLowerCase(`ΣΠ`) == `σπ`
String.toLowerCase(`ΠΣ`) == `πς`
```

### let RescriptCore.String.toLocaleLowerCase

```rescript
let toLocaleLowerCase: (. string) => string
```

`toLocaleLowerCase(str)` converts `str` to lower case using the current locale.
See [`String.toLocaleLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleLowerCase) on MDN.

### let RescriptCore.String.toUpperCase

```rescript
let toUpperCase: (. string) => string
```

`toUpperCase(str)` converts `str` to upper case using the locale-insensitive
case mappings in the Unicode Character Database. Notice that the conversion can
expand the number of letters in the result, for example the German ß
capitalizes to two Ses in a row.
See [`String.toUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) on MDN.

#### Examples

```rescript
String.toUpperCase("abc") == "ABC"
String.toUpperCase(`Straße`) == `STRASSE`
String.toUpperCase(`πς`) == `ΠΣ`
```

### let RescriptCore.String.toLocaleUpperCase

```rescript
let toLocaleUpperCase: (. string) => string
```

`toLocaleUpperCase(str)` converts `str` to upper case using the current locale.
See [`String.toLocaleUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleUpperCase) on MDN.

### let RescriptCore.String.trim

```rescript
let trim: (. string) => string
```

`trim(str)` returns a string that is `str` with whitespace stripped from both
ends. Internal whitespace is not removed.
See [`String.trim`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim) on MDN.

#### Examples

```rescript
String.trim("   abc def   ") == "abc def"
String.trim("
\r\t abc def 

\t\r ") == "abc def"
```

### let RescriptCore.String.trimStart

```rescript
let trimStart: (. string) => string
```

`trimStart(str)` returns a string that is `str` with whitespace stripped from
the beginning of a string. Internal whitespace is not removed.
See [`String.trimStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart) on MDN.

#### Examples

```rescript
String.trimStart("   Hello world!   ") == "Hello world!   "
String.trimStart("   Hello   world!   ") == "Hello   world!   "
```

### let RescriptCore.String.trimEnd

```rescript
let trimEnd: (. string) => string
```

`trinEnd(str)` returns a string that is `str` with whitespace stripped from the
end of a string. Internal whitespace is not removed.
See [`String.trimEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd) on MDN.

#### Examples

```rescript
String.trimEnd("   Hello world!   ") == "   Hello world!"
String.trimEnd("   Hello   world!   ") == "   Hello   world!"
```

### let RescriptCore.String.padStart

```rescript
let padStart: (. string, int, string) => string
```

`padStart(str, n, padStr)` returns a string that has been padded with `padStr`
(multiple times, if needed) until the resulting string reaches the given `n`
length. The padding is applied from the start of the current string.
See [`String.padStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart) on MDN.

#### Examples

```rescript
String.padStart("abc", 5, " ") == "  abc"
String.padStart("abc", 6, "123465") == "123abc"
```

### let RescriptCore.String.padEnd

```rescript
let padEnd: (. string, int, string) => string
```

`padEnd(str, n, padStr)` returns a string that has been padded with `padStr`
(multiple times, if needed) until the resulting string reaches the given `n`
length. The padding is applied from the end of the current string.
See [`String.padEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd) on MDN.

#### Examples

```rescript
String.padEnd("Hello", 10, ".") == "Hello....."
String.padEnd("abc", 1, "") == "abc"
```

### let RescriptCore.String.getSymbol

```rescript
let getSymbol: (. string, Core__Symbol.t) => option<'a>
```

### let RescriptCore.String.getSymbolUnsafe

```rescript
let getSymbolUnsafe: (. string, Core__Symbol.t) => 'a
```

### let RescriptCore.String.setSymbol

```rescript
let setSymbol: (. string, Core__Symbol.t, 'a) => unit
```

### let RescriptCore.String.localeCompare

```rescript
let localeCompare: (. string, string) => float
```

`localeCompare(referenceStr, compareStr)` returns a float than indicatings
whether a reference string comes before or after, or is the same as the given
string in sort order. If `referenceStr` occurs before `compareStr` positive if
the `referenceStr` occurs after `compareStr`, `0` if they are equivalent.
Do not rely on exact return values of `-1` or `1`
See [`String.localeCompare`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare) on MDN.

#### Examples

```rescript
String.localeCompare("a", "c") < 0.0 == true
String.localeCompare("a", "a") == 0.0
```

## module RescriptCore.Symbol `alias`

### type RescriptCore.Symbol.t

```rescript
type t = Js.Types.symbol
```

### let RescriptCore.Symbol.make

```rescript
let make: (. string) => t
```

### let RescriptCore.Symbol.getFor

```rescript
let getFor: (. string) => t
```

### let RescriptCore.Symbol.keyFor

```rescript
let keyFor: (. t) => option<string>
```

### let RescriptCore.Symbol.asyncIterator

```rescript
let asyncIterator: t
```

### let RescriptCore.Symbol.hasInstance

```rescript
let hasInstance: t
```

### let RescriptCore.Symbol.isConcatSpreadable

```rescript
let isConcatSpreadable: t
```

### let RescriptCore.Symbol.iterator

```rescript
let iterator: t
```

### let RescriptCore.Symbol.match

```rescript
let match: t
```

### let RescriptCore.Symbol.matchAll

```rescript
let matchAll: t
```

### let RescriptCore.Symbol.replace

```rescript
let replace: t
```

### let RescriptCore.Symbol.search

```rescript
let search: t
```

### let RescriptCore.Symbol.species

```rescript
let species: t
```

### let RescriptCore.Symbol.split

```rescript
let split: t
```

### let RescriptCore.Symbol.toPrimitive

```rescript
let toPrimitive: t
```

### let RescriptCore.Symbol.toStringTag

```rescript
let toStringTag: t
```

### let RescriptCore.Symbol.unscopables

```rescript
let unscopables: t
```

## module RescriptCore.Type `alias`

Utilities for classifying the type of JavaScript values at runtime.

### type RescriptCore.Type.t

```rescript
type t = [
  | #bigint
  | #boolean
  | #function
  | #number
  | #object
  | #string
  | #symbol
  | #undefined
]
```

The possible types of JavaScript values.

### let RescriptCore.Type.typeof

```rescript
let typeof: (. 'a) => t
```

`typeof(someValue)`

Returns the underlying JavaScript type of any runtime value.

See [`typeof`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof) on MDN.

#### Examples
```rescript
Console.log(Type.typeof("Hello")) // Logs "string" to the console.

let someVariable = true

switch someVariable->Type.typeof {
| #boolean => Console.log("This is a bool, yay!")
| _ => Console.log("Oh, not a bool sadly...")
}
```

## module RescriptCore.Type.Classify

### type RescriptCore.Type.Classify.function

```rescript
type function
```

An abstract type representing a JavaScript function.

  See [`function`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) on MDN.

### type RescriptCore.Type.Classify.object

```rescript
type object
```

An abstract type representing a JavaScript object.

  See [`object`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) on MDN.

### type RescriptCore.Type.Classify.t

```rescript
type t =
  | Bool(bool)
  | Null
  | Undefined
  | String(string)
  | Number(float)
  | Object(object)
  | Function(function)
  | Symbol(Core__Symbol.t)
  | BigInt(Core__BigInt.t)
```

The type representing a classified JavaScript value.

**Variant Constructor:**

```rescript
Bool(bool)
```

**Variant Constructor:**

```rescript
Null
```

**Variant Constructor:**

```rescript
Undefined
```

**Variant Constructor:**

```rescript
String(string)
```

**Variant Constructor:**

```rescript
Number(float)
```

**Variant Constructor:**

```rescript
Object(object)
```

**Variant Constructor:**

```rescript
Function(function)
```

**Variant Constructor:**

```rescript
Symbol(Core__Symbol.t)
```

**Variant Constructor:**

```rescript
BigInt(Core__BigInt.t)
```

### let RescriptCore.Type.Classify.classify

```rescript
let classify: (. 'a) => t
```

`classify(anyValue)`
Classifies a JavaScript value.

#### Examples
```rescript
switch %raw(`null`)->Type.Classify.classify {
| Null => Console.log("Yup, that's null.")
| _ => Console.log("This doesn't actually appear to be null...")
}
```

## module RescriptCore.JSON `alias`

Functions for interacting with JSON.

### type RescriptCore.JSON.t

```rescript
type t = Js.Json.t
```

A type representing a JSON object.

**Variant Constructor:**

```rescript
Boolean(bool)
```

**Variant Constructor:**

```rescript
Null
```

**Variant Constructor:**

```rescript
String(string)
```

**Variant Constructor:**

```rescript
Number(float)
```

**Variant Constructor:**

```rescript
Object(Js.Dict.t<t>)
```

**Variant Constructor:**

```rescript
Array(array<t>)
```

### let RescriptCore.JSON.parseExn

```rescript
let parseExn: (. string) => t
```

`parseExn(string)` 

Parses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.
It returns a JSON type.

#### Examples
```rescript
try {
  let _ = JSON.parseExn(`{"foo":"bar","hello":"world"}`)
  // { foo: 'bar', hello: 'world' }

  let _ = JSON.parseExn("")
  // error
} catch {
| Exn.Error(obj) => Console.log("error")
}
```

#### Exceptions 

- Raises a SyntaxError (Exn.t) if the string isn't valid JSON.

### let RescriptCore.JSON.parseExnWithReviver

```rescript
let parseExnWithReviver: (. string, (. string, t) => t) => t
```

`parseExnWithReviver(string, reviver)` 

Parses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.
The reviver describes how the value should be transformed. It is a function which receives a key and a value.
It returns a JSON type.

#### Examples
```rescript
let reviver = (key, value) => {
  let valueType = JSON.Classify.classify(value)

  switch valueType {
  | String(string) => string->String.toUpperCase->JSON.Encode.string
  | Number(number) => (number *. 2.0)->JSON.Encode.float
  | _ => value
  }
}

let jsonString = `{"hello":"world","someNumber":21}`

try {
  JSON.parseExnWithReviver(jsonString, reviver)->Console.log
  // { hello: 'WORLD', someNumber: 42 }

  JSON.parseExnWithReviver("", reviver)->Console.log
  // error
} catch {
| Exn.Error(_) => Console.log("error")
}
```

#### Exceptions 

- Raises a SyntaxError if the string isn't valid JSON.

### let RescriptCore.JSON.stringify

```rescript
let stringify: (. t) => string
```

`stringify(json)` 

Converts a JSON object to a JSON string.
If you want to stringify any type, use `JSON.stringifyAny` instead.

#### Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

JSON.stringify(json)
// {"foo":"bar","hello":"world","someNumber":42}
```

### let RescriptCore.JSON.stringifyWithIndent

```rescript
let stringifyWithIndent: (. t, int) => string
```

`stringifyWithIndent(json, indentation)` 

Converts a JSON object to a JSON string. The output will be indented.
If you want to stringify any type, use `JSON.stringifyAnyWithIndent` instead.

#### Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

JSON.stringifyWithIndent(json, 2)
// {
//   "foo": "bar",
//   "hello": "world",
//   "someNumber": 42
// }
```

### let RescriptCore.JSON.stringifyWithReplacer

```rescript
let stringifyWithReplacer: (. t, (. string, t) => t) => string
```

`stringifyWithReplacer(json, replacer)` 

Converts a JSON object to a JSON string.
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
If you want to stringify any type, use `JSON.stringifyAnyWithReplacer` instead.

#### Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

let replacer = (key, value) => {
  let decodedValue = value->JSON.Decode.string

  switch decodedValue {
  | Some(string) => string->String.toUpperCase->JSON.Encode.string
  | None => value
  }
}

JSON.stringifyWithReplacer(json, replacer)
// {"foo":"BAR","hello":"WORLD","someNumber":42}
```

### let RescriptCore.JSON.stringifyWithReplacerAndIndent

```rescript
let stringifyWithReplacerAndIndent: (. t, (. string, t) => t, int) => string
```

`stringifyWithReplacerAndIndent(json, replacer, indentation)` 

Converts a JSON object to a JSON string. The output will be indented.
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
If you want to stringify any type, use `JSON.stringifyAnyWithReplacerAndIndent` instead.

#### Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

let replacer = (key, value) => {
  let decodedValue = value->JSON.Decode.string

  switch decodedValue {
  | Some(string) => string->String.toUpperCase->JSON.Encode.string
  | None => value
  }
}

JSON.stringifyWithReplacerAndIndent(json, replacer, 2)
// {
  "foo": "BAR",
  "hello": "WORLD",
  "someNumber": 42
}
```

### let RescriptCore.JSON.stringifyWithFilter

```rescript
let stringifyWithFilter: (. t, array<string>) => string
```

`stringifyWithFilter(json, filter)` 

Converts a JSON object to a JSON string.
The filter is an array of keys, which should be included in the output.
If you want to stringify any type, use `JSON.stringifyAnyWithFilter` instead.

#### Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

JSON.stringifyWithFilter(json, ["foo", "someNumber"])
// {"foo":"bar","someNumber":42}
```

### let RescriptCore.JSON.stringifyWithFilterAndIndent

```rescript
let stringifyWithFilterAndIndent: (. t, array<string>, int) => string
```

`stringifyWithFilterAndIndent(json, filter, indentation)` 

Converts a JSON object to a JSON string. The output will be indented.
The filter is an array of keys, which should be included in the output.
If you want to stringify any type, use `JSON.stringifyAnyWithFilterAndIndent` instead.

#### Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

JSON.stringifyWithFilterAndIndent(json, ["foo", "someNumber"], 2)
// {
//   "foo": "bar",
//   "someNumber": 42
// }
```

### let RescriptCore.JSON.stringifyAny

```rescript
let stringifyAny: (. 'a) => option<string>
```

`stringifyAny(any)` 

Converts any type to a JSON string.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringify` instead.

#### Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

JSON.stringifyAny(dict)
// {"foo":"bar","hello":"world","someNumber":42}

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

#### Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.

### let RescriptCore.JSON.stringifyAnyWithIndent

```rescript
let stringifyAnyWithIndent: (. 'a, int) => option<string>
```

`stringifyAnyWithIndent(any, indentation)` 

Converts any type to a JSON string. The output will be indented.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringifyWithIndent` instead.

#### Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

JSON.stringifyAnyWithIndent(dict, 2)
// {
//   "foo": "bar",
//   "hello": "world",
//   "someNumber": 42
// }

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

#### Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.

### let RescriptCore.JSON.stringifyAnyWithReplacer

```rescript
let stringifyAnyWithReplacer: (. 'a, (. string, t) => t) => option<string>
```

`stringifyAnyWithReplacer(json, replacer)` 

Converts any type to a JSON string.
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringifyWithReplacer` instead.

#### Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

let replacer = (key, value) => {
  let decodedValue = value->JSON.Decode.string

  switch decodedValue {
  | Some(string) => string->String.toUpperCase->JSON.Encode.string
  | None => value
  }
}

JSON.stringifyAnyWithReplacer(dict, replacer)
// {"foo":"BAR","hello":"WORLD","someNumber":42}

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

#### Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.

### let RescriptCore.JSON.stringifyAnyWithReplacerAndIndent

```rescript
let stringifyAnyWithReplacerAndIndent: (. 'a, (. string, t) => t, int) => option<string>
```

`stringifyAnyWithReplacerAndIndent(json, replacer, indentation)` 

Converts any type to a JSON string. The output will be indented.
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringifyWithReplacerAndIndent` instead.

#### Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

let replacer = (key, value) => {
  let decodedValue = value->JSON.Decode.string

  switch decodedValue {
  | Some(string) => string->String.toUpperCase->JSON.Encode.string
  | None => value
  }
}

JSON.stringifyAnyWithReplacerAndIndent(dict, replacer, 2)
// {
//   "foo": "BAR",
//   "hello": "WORLD",
//   "someNumber": 42
// }

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

#### Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.

### let RescriptCore.JSON.stringifyAnyWithFilter

```rescript
let stringifyAnyWithFilter: (. 'a, array<string>) => string
```

`stringifyAnyWithFilter(json, filter)` 

Converts any type to a JSON string.
The filter is an array of keys, which should be included in the output.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringifyWithFilter` instead.

#### Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

JSON.stringifyAnyWithFilter(dict, ["foo", "someNumber"])
// {"foo": "bar","someNumber": 42}

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

#### Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.

### let RescriptCore.JSON.stringifyAnyWithFilterAndIndent

```rescript
let stringifyAnyWithFilterAndIndent: (. 'a, array<string>, int) => string
```

`stringifyAnyWithFilterAndIndent(json, filter, indentation)` 

Converts any type to a JSON string. The output will be indented.
The filter is an array of keys, which should be included in the output.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringifyWithFilterAndIndent` instead.

#### Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

JSON.stringifyAnyWithFilterAndIndent(dict, ["foo", "someNumber"], 2)
// {
//   "foo": "bar",
//   "someNumber": 42
// }

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

#### Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.

## module RescriptCore.JSON.Classify

### type RescriptCore.JSON.Classify.t

```rescript
type t =
  | Bool(bool)
  | Null
  | String(string)
  | Number(float)
  | Object(Core__Dict.t<t>)
  | Array(array<t>)
```

A type representing a JavaScript type.

**Variant Constructor:**

```rescript
Bool(bool)
```

**Variant Constructor:**

```rescript
Null
```

**Variant Constructor:**

```rescript
String(string)
```

**Variant Constructor:**

```rescript
Number(float)
```

**Variant Constructor:**

```rescript
Object(Core__Dict.t<t>)
```

**Variant Constructor:**

```rescript
Array(array<t>)
```

### let RescriptCore.JSON.Classify.classify

```rescript
let classify: (. 'a) => t
```

Returns the JSON type of any value.

  ## Examples
  ```rescript
  JSON.Classify.classify("hello world")
  // String("hello world")

  JSON.Classify.classify(42)
  // Number(42)
  ```

## module RescriptCore.JSON.Encode

### let RescriptCore.JSON.Encode.bool

```rescript
let bool: (. bool) => t
```

Returns a boolean as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.bool(true)
  ```

### let RescriptCore.JSON.Encode.null

```rescript
let null: t
```

Returns null as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.null
  ```

### let RescriptCore.JSON.Encode.string

```rescript
let string: (. string) => t
```

Returns a string as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.string("hello world")
  ```

### let RescriptCore.JSON.Encode.int

```rescript
let int: (. int) => t
```

Returns an int as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.int(42)
  ```

### let RescriptCore.JSON.Encode.float

```rescript
let float: (. float) => t
```

Returns a float as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.float(42.0)
  ```

### let RescriptCore.JSON.Encode.object

```rescript
let object: (. Core__Dict.t<t>) => t
```

Returns a dict as a JSON object.

  ## Examples
  ```rescript
  let dict = Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
  ])

  JSON.Encode.object(dict)
  ```

### let RescriptCore.JSON.Encode.array

```rescript
let array: (. array<t>) => t
```

Returns an array as a JSON object.

  ## Examples
  ```rescript
  let array = [JSON.Encode.string("hello world"), JSON.Encode.int(42)]

  JSON.Encode.array(array)
  ```

## module RescriptCore.JSON.Decode

### let RescriptCore.JSON.Decode.bool

```rescript
let bool: (. t) => option<bool>
```

Decodes a single JSON value. If the value is a bool, it will return `Some(bool)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`true`)-\>JSON.Decode.bool
  // Some(true)

  JSON.parseExn(`"hello world"`)-\>JSON.Decode.bool
  // None
  ```

### let RescriptCore.JSON.Decode.null

```rescript
let null: (. t) => option<Core__Null.t<'a>>
```

Decodes a single JSON value. If the value is null, it will return `Some(Null.t)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`null`)-\>JSON.Decode.null
  // Some(null)

  JSON.parseExn(`"hello world"`)-\>JSON.Decode.null
  // None
  ```

### let RescriptCore.JSON.Decode.string

```rescript
let string: (. t) => option<string>
```

Decodes a single JSON value. If the value is a string, it will return `Some(string)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`"hello world"`)-\>JSON.Decode.string
  // Some("hello world")

  JSON.parseExn(`42`)-\>JSON.Decode.string
  // None 
  ```

### let RescriptCore.JSON.Decode.float

```rescript
let float: (. t) => option<float>
```

Decodes a single JSON value. If the value is a float, it will return `Some(float)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`42.0`)-\>JSON.Decode.float
  // Some(42.0)

  JSON.parseExn(`"hello world"`)-\>JSON.Decode.float
  // None
  ```

### let RescriptCore.JSON.Decode.object

```rescript
let object: (. t) => option<Core__Dict.t<t>>
```

Decodes a single JSON value. If the value is an object, it will return `Some(Dict.t)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`{"foo":"bar"}`)-\>JSON.Decode.object
  // Some({ foo: 'bar' })

  JSON.parseExn(`"hello world"`)-\>JSON.Decode.object
  // None
  ```

### let RescriptCore.JSON.Decode.array

```rescript
let array: (. t) => option<array<t>>
```

Decodes a single JSON value. If the value is an array, it will return `Some(array)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`["foo", "bar"]`)-\>JSON.Decode.array
  // Some([ 'foo', 'bar' ])

  JSON.parseExn(`"hello world"`)-\>JSON.Decode.array
  // None
  ```

## module RescriptCore.Iterator `alias`

Bindings to JavaScript iterators.

See [`iterator protocols`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.

### type RescriptCore.Iterator.t

```rescript
type t<'a>
```

The type representing an iterator.

### type RescriptCore.Iterator.value

```rescript
type value<'a> = {done: bool, value: option<'a>}
```

The current value of an iterator.

**Record Field:**

```rescript
done: bool
```

Whether there are more values to iterate on before the iterator is done.

**Record Field:**

```rescript
value: option<'a>
```

The value of this iteration, if any.

### let RescriptCore.Iterator.next

```rescript
let next: (. t<'a>) => value<'a>
```

Returns the next value of the iterator, if any.

See [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.

#### Examples
```rescript
// Pulls out the next value of the iterator
let {done, value} = someIterator->Iterator.next
```

### let RescriptCore.Iterator.toArray

```rescript
let toArray: (. t<'a>) => array<'a>
```

Turns an iterator into an array of the remaining values.
Remember that each invocation of `next` of an iterator consumes a value. `Iterator.toArray` will consume all remaining values of the iterator and return them in an array to you.

See [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("someKey2", "someValue2")

// `Map.keys` returns all keys of the map as an iterator.
let mapKeysAsArray = map->Map.keys->Iterator.toArray

Console.log(mapKeysAsArray) // Logs ["someKey", "someKey2"] to the console.
```

### let RescriptCore.Iterator.toArrayWithMapper

```rescript
let toArrayWithMapper: (. t<'a>, (. 'a) => 'b) => array<'b>
```

`toArray(iterator)` turns `iterator` into an array of its remaining values, applying the provided mapper function on each item.
Remember that each invocation of `next` of an iterator consumes a value. `Iterator.toArrayWithMapper` will consume all remaining values of the iterator and return them in an array to you.

See [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("someKey2", "someValue2")

// `Map.keys` returns all keys of the map as an iterator.
let mapKeysAsArray = map
  ->Map.keys
  ->Iterator.toArrayWithMapper(key => key->String.length)

Console.log(mapKeysAsArray) // Logs [7, 8] to the console.
```

## module RescriptCore.AsyncIterator `alias`

Bindings to async iterators, a way to do async iteration in JavaScript.

See [async iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) on MDN.

### type RescriptCore.AsyncIterator.t

```rescript
type t<'a>
```

The type representing an async iterator.

### type RescriptCore.AsyncIterator.value

```rescript
type value<'a> = {done: bool, value: option<'a>}
```

**Record Field:**

```rescript
done: bool
```

Whether there are more values to iterate on before the iterator is done.

**Record Field:**

```rescript
value: option<'a>
```

The value of this iteration, if any.

### let RescriptCore.AsyncIterator.next

```rescript
let next: (. t<'a>) => promise<value<'a>>
```

`next(asyncIterator)`

Returns the next value of the iterator, if any.

See [async iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) on MDN.

#### Examples
- A simple example, getting the next value:
```rescript
let {done, value} = await someAsyncIterator->AsyncIterator.next
```

- Complete example, including looping over all values:
```rescript
// Let's pretend we get an async iterator returning ints from somewhere.
@val external asyncIterator: AsyncIterator.t<int> = "someAsyncIterator"


let processMyAsyncIterator = async () => {
  // ReScript doesn't have `for ... of` loops, but it's easy to mimic using a while loop.
  let break = ref(false)

  while !break.contents {
    // Await the next iterator value
    let {value, done} = await asyncIterator->AsyncIterator.next

    // Exit the while loop if the iterator says it's done
    break := done

    // This will log the (int) value of the current async iteration, if a value was returned.
    Console.log(value)
  }
}
```

## module RescriptCore.Map `alias`

Bindings to the mutable JavaScript `Map`.

See [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) on MDN.

### type RescriptCore.Map.t

```rescript
type t<'k, 'v> = Js.Map.t<'k, 'v>
```

Type representing an instance of `Map`.

### let RescriptCore.Map.make

```rescript
let make: (. unit) => t<'k, 'v>
```

Creates a new, mutable JavaScript `Map`. A `Map` can have any values as both keys and values.

See [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) on MDN.



#### Examples
```rescript
`make()`
// You can annotate the type of your map if you want to
let myMap: Map.t<string, int> = Map.make()

// Or you can let ReScript infer what's in your map
let map = Map.make()
map->Map.set("lang", "ReScript") // Inferred as Map.t<string, string>
```

#### Alternatives
A JavaScript `Map` is mutable. If you're looking for an immutable alternative, check out`Belt.Map`.

### let RescriptCore.Map.fromArray

```rescript
let fromArray: (. array<('k, 'v)>) => t<'k, 'v>
```

Turns an array of key/value pairs into a Map.

#### Examples
```rescript
type languages = ReScript | JavaScript | TypeScript
let languageRank = [(ReScript, 1), (JavaScript, 2), (TypeScript, 3)]

let map = Map.fromArray(languageRank) // Map.t<languages, int>

switch map->Map.get(ReScript) {
| Some(1) => Console.log("Yay, ReScript is #1!")
| _ => Console.log("Uh-oh, something is _terribly_ wrong with this program... abort.")
}
```

### let RescriptCore.Map.fromIterator

```rescript
let fromIterator: (. Core__Iterator.t<('k, 'v)>) => t<'k, 'v>
```

Turns an iterator in the shape of `('key, 'value)` into a `Map`.

#### Examples
```rescript
// Let's pretend we have an interator in the correct shape
@val external someIterator: Iterator.t<(string, int)> = "someIterator"

let map = Map.fromIterator(someIterator) // Map.t<string, int>
```

### let RescriptCore.Map.size

```rescript
let size: (. t<'k, 'v>) => int
```

Returns the size, the number of key/value pairs, of the map.

#### Examples
```rescript
let map = Map.make()

map->Map.set("someKey", "someValue")

let size = map->Map.size // 1
```

### let RescriptCore.Map.clear

```rescript
let clear: (. t<'k, 'v>) => unit
```

Clears all entries in the map.

#### Examples
```rescript
let map = Map.make()

map->Map.set("someKey", "someValue")
let size = map->Map.size // 1

map->Map.clear
let size = map->Map.size // 0
```

### let RescriptCore.Map.forEach

```rescript
let forEach: (. t<'k, 'v>, (. 'v) => unit) => unit
```

Iterates through all values of the map.

\> Please note that this is *without the keys*, just the values. If you need the key as well, use `Map.forEachWithKey`.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("someKey2", "someValue2")

map->Map.forEach(value => {
  Console.log(value)
})
```

### let RescriptCore.Map.forEachWithKey

```rescript
let forEachWithKey: (. t<'k, 'v>, (. 'v, 'k) => unit) => unit
```

Iterates through all values of the map, including the key for each value.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("someKey2", "someValue2")

map->Map.forEachWithKey((value, key) => {
  Console.log2(value, key)
})
```

### let RescriptCore.Map.get

```rescript
let get: (. t<'k, 'v>, 'k) => option<'v>
```

Returns the value for a key, if a value exists at that key.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")

switch map->Map.get("someKey") {
| None => Console.log("Nope, didn't have it.")
| Some(value) => Console.log2("Yay, had the value, and it's:", value)
}
```

### let RescriptCore.Map.has

```rescript
let has: (. t<'k, 'v>, 'k) => bool
```

Checks whether the map has a specific key.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")

switch map->Map.has("someKey") {
| false => Console.log("Nope, didn't have it.")
| true => Console.log("Yay, we have the value!")
}
```

### let RescriptCore.Map.set

```rescript
let set: (. t<'k, 'v>, 'k, 'v) => unit
```

Sets the provided `value` to the provided `key`.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
```

### let RescriptCore.Map.delete

```rescript
let delete: (. t<'k, 'v>, 'k) => bool
```

Deletes the provided `key` and its value from the map. Returns a `bool` for whether the key existed, and was deleted.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
let didDeleteKey = map->Map.delete("someKey")
Console.log(didDeleteKey) // Logs `true` to the console, becuase the map had the key, so it was successfully deleted

let didDeleteKey = map->Map.delete("someNonExistantKey")
Console.log(didDeleteKey) // Logs `false` to the console, becuase the key did not exist
```

### let RescriptCore.Map.keys

```rescript
let keys: (. t<'k, 'v>) => Core__Iterator.t<'k>
```

Returns an iterator that holds all keys of the map.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("anotherKey", "anotherValue")

let keys = map->Map.keys

// Logs the first key
Console.log(Iterator.next(keys).value)

// You can also turn the iterator into an array.
// Remember that an iterator consumes values. We'll need a fresh keys iterator to get an array of all keys, since we consumed a value via `next` above already.
Console.log(map->Map.keys->Iterator.toArray)
```

### let RescriptCore.Map.values

```rescript
let values: (. t<'k, 'v>) => Core__Iterator.t<'v>
```

Returns an iterator that holds all values of the map.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("anotherKey", "anotherValue")

let values = map->Map.values

// Logs the first value
Console.log(Iterator.next(values).value)

// You can also turn the iterator into an array.
// Remember that an iterator consumes values. We'll need a fresh values iterator to get an array of all values, since we consumed a value via `next` above already.
Console.log(map->Map.values->Iterator.toArray)
```

### let RescriptCore.Map.entries

```rescript
let entries: (. t<'k, 'v>) => Core__Iterator.t<('k, 'v)>
```

Returns an iterator that holds all entries of the map.
An entry is represented as a tuple of `('key, 'value)`,

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
map->Map.set("anotherKey", "anotherValue")

let entries = map->Map.entries

// Logs the first value
Console.log(Iterator.next(entries).value)

// You can also turn the iterator into an array.
// Remember that an iterator consumes entries. We'll need a fresh entries iterator to get an array of all entries, since we consumed a value via `next` above already.
Console.log(map->Map.entries->Iterator.toArray)
```

## module RescriptCore.WeakMap `alias`

### type RescriptCore.WeakMap.t

```rescript
type t<'k, 'v> = Js.WeakMap.t<'k, 'v>
```

### let RescriptCore.WeakMap.make

```rescript
let make: (. unit) => t<'k, 'v>
```

### let RescriptCore.WeakMap.get

```rescript
let get: (. t<'k, 'v>, 'k) => option<'v>
```

### let RescriptCore.WeakMap.has

```rescript
let has: (. t<'k, 'v>, 'k) => bool
```

### let RescriptCore.WeakMap.set

```rescript
let set: (. t<'k, 'v>, 'k, 'v) => t<'k, 'v>
```

### let RescriptCore.WeakMap.delete

```rescript
let delete: (. t<'k, 'v>, 'k) => bool
```

## module RescriptCore.Set `alias`

Bindings to the mutable JavaScript `Set`.

See [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) on MDN.

### type RescriptCore.Set.t

```rescript
type t<'a> = Js.Set.t<'a>
```

Type representing an instance of `Set`.

### let RescriptCore.Set.make

```rescript
let make: (. unit) => t<'a>
```

Creates a new, mutable JavaScript `Set`. A `Set` is a collection of unique values.

See [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) on MDN.



#### Examples
```rescript
// You can annotate the type of your set if you want to
let mySet: Set.t<string> = Set.make()

// Or you can let ReScript infer what's in your Set
let set = Set.make()
set->Set.add("Fine name") // Inferred as Set.t<string>
```

#### Alternatives
A JavaScript `Set` is mutable. If you're looking for an immutable alternative, check out `Belt.Set`.

### let RescriptCore.Set.fromArray

```rescript
let fromArray: (. array<'a>) => t<'a>
```

Turns an array of values into a Set. Meaning only unique values are preserved.

#### Examples
```rescript
type languages = ReScript | JavaScript | TypeScript
let languageRank = [ReScript, JavaScript, TypeScript]

let set = Set.fromArray(languageRank) // Set.t<languages>

switch set->Set.has(ReScript) {
| true => Console.log("Yay, ReScript is in there!")
| false => Console.log("Uh-oh, something is _terribly_ wrong with this program... abort.")
}
```

### let RescriptCore.Set.fromIterator

```rescript
let fromIterator: (. Core__Iterator.t<'a>) => t<'a>
```

Turns an iterator into a `Set`.

#### Examples
```rescript
// Let's pretend we have an interator
@val external someIterator: Iterator.t<int> = "someIterator"

let set = Set.fromIterator(someIterator) // Set.t<int>
```

### let RescriptCore.Set.size

```rescript
let size: (. t<'a>) => int
```

Returns the size, the number of unique values, of the set.

#### Examples
```rescript
let set = Set.make()

set->Set.add("someValue")
set->Set.add("someValue")
set->Set.add("someValue2")

let size = set->Set.size // 2
```

### let RescriptCore.Set.clear

```rescript
let clear: (. t<'a>) => unit
```

Clears all entries in the set.

#### Examples
```rescript
let set = Set.make()

set->Set.add("someKey")
let size = set->Set.size // 1

set->Set.clear
let size = set->Set.size // 0
```

### let RescriptCore.Set.add

```rescript
let add: (. t<'a>, 'a) => unit
```

Adds a new value to the set.

#### Examples
```rescript
let set = Set.make()
set->Set.add("someValue")
```

### let RescriptCore.Set.delete

```rescript
let delete: (. t<'a>, 'a) => bool
```

Deletes the provided `value` from the set. Returns a `bool` for whether the value existed, and was deleted.

#### Examples
```rescript
let set = Set.make()
set->Set.add("someValue")
let didDeleteValue = set->Set.delete("someValue")
Console.log(didDeleteValue) // Logs `true` to the console, becuase the set had the value, so it was successfully deleted

let didDeleteValue = set->Set.delete("someNonExistantKey")
Console.log(didDeleteValue) // Logs `false` to the console, becuase the value did not exist in the set
```

### let RescriptCore.Set.has

```rescript
let has: (. t<'a>, 'a) => bool
```

Checks whether the set has a specific value.

#### Examples
```rescript
let set = Set.make()
set->Set.add("someValue")

switch set->Set.has("someValue") {
| false => Console.log("Nope, didn't have it.")
| true => Console.log("Yay, we have the value!")
}
```

### let RescriptCore.Set.forEach

```rescript
let forEach: (. t<'a>, (. 'a) => unit) => unit
```

Iterates through all values of the set.

#### Examples
```rescript
let set = Set.make()
set->Set.add("someValue")
set->Set.add("someValue2")

set->Set.forEach(value => {
  Console.log(value)
})
```

### let RescriptCore.Set.values

```rescript
let values: (. t<'a>) => Core__Iterator.t<'a>
```

Returns an iterator that holds all values of the set.

#### Examples
```rescript
let set = Set.make()
set->Set.add("someValue")
set->Set.add("anotherValue")

let values = set->Set.values

// Logs the first value
Console.log(Iterator.next(values).value)

// You can also turn the iterator into an array.
// Remember that an iterator consumes values. We'll need a fresh values iterator to get an array of all values, since we consumed a value via `next` above already.
Console.log(set->Set.values->Iterator.toArray)
```

## module RescriptCore.WeakSet `alias`

### type RescriptCore.WeakSet.t

```rescript
type t<'a> = Js.WeakSet.t<'a>
```

### let RescriptCore.WeakSet.make

```rescript
let make: (. unit) => t<'a>
```

### let RescriptCore.WeakSet.add

```rescript
let add: (. t<'a>, 'a) => t<'a>
```

### let RescriptCore.WeakSet.delete

```rescript
let delete: (. t<'a>, 'a) => bool
```

### let RescriptCore.WeakSet.has

```rescript
let has: (. t<'a>, 'a) => bool
```

## module RescriptCore.ArrayBuffer `alias`

### type RescriptCore.ArrayBuffer.t

```rescript
type t = Js.TypedArray2.ArrayBuffer.t
```

### let RescriptCore.ArrayBuffer.make

```rescript
let make: (. int) => t
```

### let RescriptCore.ArrayBuffer.byteLength

```rescript
let byteLength: (. t) => int
```

### let RescriptCore.ArrayBuffer.slice

```rescript
let slice: (. t, ~start: int, ~end: int) => t
```

### let RescriptCore.ArrayBuffer.sliceToEnd

```rescript
let sliceToEnd: (. t, ~start: int) => t
```

## module RescriptCore.TypedArray `alias`

### type RescriptCore.TypedArray.t

```rescript
type t<'a>
```

### let RescriptCore.TypedArray.get

```rescript
let get: (. t<'a>, int) => option<'a>
```

### let RescriptCore.TypedArray.set

```rescript
let set: (. t<'a>, int, 'a) => unit
```

### let RescriptCore.TypedArray.buffer

```rescript
let buffer: (. t<'a>) => Core__ArrayBuffer.t
```

### let RescriptCore.TypedArray.byteLength

```rescript
let byteLength: (. t<'a>) => int
```

### let RescriptCore.TypedArray.byteOffset

```rescript
let byteOffset: (. t<'a>) => int
```

### let RescriptCore.TypedArray.setArray

```rescript
let setArray: (. t<'a>, array<'a>) => unit
```

### let RescriptCore.TypedArray.setArrayFrom

```rescript
let setArrayFrom: (. t<'a>, array<'a>, int) => unit
```

### let RescriptCore.TypedArray.length

```rescript
let length: (. t<'a>) => int
```

### let RescriptCore.TypedArray.copyAllWithin

```rescript
let copyAllWithin: (. t<'a>, ~target: int) => array<'a>
```

### let RescriptCore.TypedArray.copyWithinToEnd

```rescript
let copyWithinToEnd: (. t<'a>, ~target: int, ~start: int) => array<'a>
```

### let RescriptCore.TypedArray.copyWithin

```rescript
let copyWithin: (. t<'a>, ~target: int, ~start: int, ~end: int) => array<'a>
```

### let RescriptCore.TypedArray.fillAll

```rescript
let fillAll: (. t<'a>, 'a) => t<'a>
```

### let RescriptCore.TypedArray.fillToEnd

```rescript
let fillToEnd: (. t<'a>, 'a, ~start: int) => t<'a>
```

### let RescriptCore.TypedArray.fill

```rescript
let fill: (. t<'a>, 'a, ~start: int, ~end: int) => t<'a>
```

### let RescriptCore.TypedArray.reverse

```rescript
let reverse: (. t<'a>) => unit
```

### let RescriptCore.TypedArray.toReversed

```rescript
let toReversed: (. t<'a>) => t<'a>
```

### let RescriptCore.TypedArray.sort

```rescript
let sort: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => unit
```

### let RescriptCore.TypedArray.toSorted

```rescript
let toSorted: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => t<'a>
```

### let RescriptCore.TypedArray.with

```rescript
let with: (. t<'a>, int, 'a) => t<'a>
```

### let RescriptCore.TypedArray.includes

```rescript
let includes: (. t<'a>, 'a) => bool
```

### let RescriptCore.TypedArray.indexOf

```rescript
let indexOf: (. t<'a>, 'a) => int
```

### let RescriptCore.TypedArray.indexOfFrom

```rescript
let indexOfFrom: (. t<'a>, 'a, int) => int
```

### let RescriptCore.TypedArray.joinWith

```rescript
let joinWith: (. t<'a>, string) => string
```

### let RescriptCore.TypedArray.lastIndexOf

```rescript
let lastIndexOf: (. t<'a>, 'a) => int
```

### let RescriptCore.TypedArray.lastIndexOfFrom

```rescript
let lastIndexOfFrom: (. t<'a>, 'a, int) => int
```

### let RescriptCore.TypedArray.slice

```rescript
let slice: (. t<'a>, ~start: int, ~end: int) => t<'a>
```

### let RescriptCore.TypedArray.sliceToEnd

```rescript
let sliceToEnd: (. t<'a>, ~start: int) => t<'a>
```

### let RescriptCore.TypedArray.copy

```rescript
let copy: (. t<'a>) => t<'a>
```

### let RescriptCore.TypedArray.subarray

```rescript
let subarray: (. t<'a>, ~start: int, ~end: int) => t<'a>
```

### let RescriptCore.TypedArray.subarrayToEnd

```rescript
let subarrayToEnd: (. t<'a>, ~start: int) => t<'a>
```

### let RescriptCore.TypedArray.toString

```rescript
let toString: (. t<'a>) => string
```

### let RescriptCore.TypedArray.toLocaleString

```rescript
let toLocaleString: (. t<'a>) => string
```

### let RescriptCore.TypedArray.every

```rescript
let every: (. t<'a>, (. 'a) => bool) => bool
```

### let RescriptCore.TypedArray.everyWithIndex

```rescript
let everyWithIndex: (. t<'a>, (. 'a, int) => bool) => bool
```

### let RescriptCore.TypedArray.filter

```rescript
let filter: (. t<'a>, (. 'a) => bool) => t<'a>
```

### let RescriptCore.TypedArray.filterWithIndex

```rescript
let filterWithIndex: (. t<'a>, (. 'a, int) => bool) => t<'a>
```

### let RescriptCore.TypedArray.find

```rescript
let find: (. t<'a>, (. 'a) => bool) => option<'a>
```

### let RescriptCore.TypedArray.findWithIndex

```rescript
let findWithIndex: (. t<'a>, (. 'a, int) => bool) => option<'a>
```

### let RescriptCore.TypedArray.findIndex

```rescript
let findIndex: (. t<'a>, (. 'a) => bool) => int
```

### let RescriptCore.TypedArray.findIndexWithIndex

```rescript
let findIndexWithIndex: (. t<'a>, (. 'a, int) => bool) => int
```

### let RescriptCore.TypedArray.forEach

```rescript
let forEach: (. t<'a>, (. 'a) => unit) => unit
```

### let RescriptCore.TypedArray.forEachWithIndex

```rescript
let forEachWithIndex: (. t<'a>, (. 'a, int) => unit) => unit
```

### let RescriptCore.TypedArray.map

```rescript
let map: (. t<'a>, (. 'a) => 'b) => t<'b>
```

### let RescriptCore.TypedArray.mapWithIndex

```rescript
let mapWithIndex: (. t<'a>, (. 'a, int) => 'b) => t<'b>
```

### let RescriptCore.TypedArray.reduce

```rescript
let reduce: (. t<'a>, (. 'b, 'a) => 'b, 'b) => 'b
```

### let RescriptCore.TypedArray.reduceWithIndex

```rescript
let reduceWithIndex: (. t<'a>, (. 'b, 'a, int) => 'b, 'b) => 'b
```

### let RescriptCore.TypedArray.reduceRight

```rescript
let reduceRight: (. t<'a>, (. 'b, 'a) => 'b, 'b) => 'b
```

### let RescriptCore.TypedArray.reduceRightWithIndex

```rescript
let reduceRightWithIndex: (. t<'a>, (. 'b, 'a, int) => 'b, 'b) => 'b
```

### let RescriptCore.TypedArray.some

```rescript
let some: (. t<'a>, (. 'a) => bool) => bool
```

### let RescriptCore.TypedArray.someWithIndex

```rescript
let someWithIndex: (. t<'a>, (. 'a, int) => bool) => bool
```

## module RescriptCore.Float32Array `alias`

### type RescriptCore.Float32Array.t

```rescript
type t = Core__TypedArray.t<float>
```

The `Float32Array` typed array represents an array of 32-bit floating point numbers in platform byte order. See [Float32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array)

## module RescriptCore.Float32Array.Constants

### let RescriptCore.Float32Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Float32Array.fromArray

```rescript
let fromArray: (. array<float>) => t
```

`fromArray` creates a `Float32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

### let RescriptCore.Float32Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Float32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Float32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Float32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Float32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Float32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Float32Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => float) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Float32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Float64Array `alias`

### type RescriptCore.Float64Array.t

```rescript
type t = Core__TypedArray.t<float>
```

The `Float64Array` typed array represents an array of 64-bit floating point numbers in platform byte order. See [Float64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array)

## module RescriptCore.Float64Array.Constants

### let RescriptCore.Float64Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Float64Array.fromArray

```rescript
let fromArray: (. array<float>) => t
```

`fromArray` creates a `Float64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

### let RescriptCore.Float64Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Float64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Float64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Float64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Float64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Float64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Float64Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => float) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Float64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Int8Array `alias`

### type RescriptCore.Int8Array.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Int8Array` typed array represents an array of twos-complement 8-bit signed integers. See [Int8Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array)

## module RescriptCore.Int8Array.Constants

### let RescriptCore.Int8Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Int8Array.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Int8Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

### let RescriptCore.Int8Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Int8Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Int8Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Int8Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Int8Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Int8Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Int8Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Int8Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Int16Array `alias`

### type RescriptCore.Int16Array.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Int16Array` typed array represents an array of twos-complement 16-bit signed integers in platform byte order. See [Int16Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array)

## module RescriptCore.Int16Array.Constants

### let RescriptCore.Int16Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Int16Array.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Int16Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

### let RescriptCore.Int16Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Int16Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Int16Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Int16Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Int16Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Int16Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Int16Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Int16Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Int32Array `alias`

### type RescriptCore.Int32Array.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Int32Array` typed array represents an array of twos-complemenet 32-bit signed integers in platform byte order. See [Int32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array)

## module RescriptCore.Int32Array.Constants

### let RescriptCore.Int32Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Int32Array.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Int32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

### let RescriptCore.Int32Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Int32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Int32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Int32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Int32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Int32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Int32Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Int32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint8Array `alias`

### type RescriptCore.Uint8Array.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Uint8Array` typed array represents an array of 8-bit unsigned integers. See [Uint8Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)

## module RescriptCore.Uint8Array.Constants

### let RescriptCore.Uint8Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint8Array.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Uint8Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

### let RescriptCore.Uint8Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Uint8Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Uint8Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Uint8Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Uint8Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Uint8Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint8Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Uint8Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint16Array `alias`

### type RescriptCore.Uint16Array.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Uint16Array` typed array represents an array of 16-bit unsigned integers in platform byte order. See [Uint16Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array)

## module RescriptCore.Uint16Array.Constants

### let RescriptCore.Uint16Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint16Array.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Uint16Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

### let RescriptCore.Uint16Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Uint16Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Uint16Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Uint16Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Uint16Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Uint16Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint16Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Uint16Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint32Array `alias`

### type RescriptCore.Uint32Array.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Uint32Array` typed array represents an array of 32-bit unsigned integers in platform byte order. See [Uint32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array)

## module RescriptCore.Uint32Array.Constants

### let RescriptCore.Uint32Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint32Array.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Uint32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

### let RescriptCore.Uint32Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Uint32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Uint32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Uint32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Uint32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Uint32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint32Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Uint32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint8ClampedArray `alias`

### type RescriptCore.Uint8ClampedArray.t

```rescript
type t = Core__TypedArray.t<int>
```

The `Uint8ClampedArray` typed array represents an array of 8-bit unsigned integers clamped to 0-255. See [Uint8ClampedArray on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray)

## module RescriptCore.Uint8ClampedArray.Constants

### let RescriptCore.Uint8ClampedArray.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint8ClampedArray.fromArray

```rescript
let fromArray: (. array<int>) => t
```

`fromArray` creates a `Uint8ClampedArray` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

### let RescriptCore.Uint8ClampedArray.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `Uint8ClampedArray` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `Uint8ClampedArray` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint8ClampedArray.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t
```

`fromArrayLikeOrIterableWithMap` creates a `Uint8ClampedArray` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.BigInt64Array `alias`

### type RescriptCore.BigInt64Array.t

```rescript
type t = Core__TypedArray.t<Core__BigInt.t>
```

The `BigInt64Array` typed array represents an array of 64-bit signed integers in platform byte order. See [BigInt64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array)

## module RescriptCore.BigInt64Array.Constants

### let RescriptCore.BigInt64Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.BigInt64Array.fromArray

```rescript
let fromArray: (. array<Core__BigInt.t>) => t
```

`fromArray` creates a `BigInt64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

### let RescriptCore.BigInt64Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `BigInt64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `BigInt64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `BigInt64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `BigInt64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `BigInt64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.BigInt64Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => Core__BigInt.t) => t
```

`fromArrayLikeOrIterableWithMap` creates a `BigInt64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.BigUint64Array `alias`

### type RescriptCore.BigUint64Array.t

```rescript
type t = Core__TypedArray.t<Core__BigInt.t>
```

The `BigUint64Array` typed array represents an array of 64-bit unsigned integers in platform byte order. See [BigUint64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array)

## module RescriptCore.BigUint64Array.Constants

### let RescriptCore.BigUint64Array.Constants.bytesPerElement

```rescript
let bytesPerElement: int
```

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.BigUint64Array.fromArray

```rescript
let fromArray: (. array<Core__BigInt.t>) => t
```

`fromArray` creates a `BigUint64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

### let RescriptCore.BigUint64Array.fromBuffer

```rescript
let fromBuffer: (. Core__ArrayBuffer.t) => t
```

`fromBuffer` creates a `BigUint64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromBufferToEnd

```rescript
let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t
```

`fromBufferToEnd` creates a `BigUint64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromBufferWithRange

```rescript
let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t
```

`fromBufferWithRange` creates a `BigUint64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromLength

```rescript
let fromLength: (. int) => t
```

`fromLength` creates a zero-initialized `BigUint64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromArrayLikeOrIterable

```rescript
let fromArrayLikeOrIterable: (. 'a) => t
```

`fromArrayLikeOrIterable` creates a `BigUint64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.BigUint64Array.fromArrayLikeOrIterableWithMap

```rescript
let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => Core__BigInt.t) => t
```

`fromArrayLikeOrIterableWithMap` creates a `BigUint64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Intl `alias`

## module RescriptCore.Intl.Collator `alias`

### type RescriptCore.Intl.Collator.t

```rescript
type t
```

### let RescriptCore.Intl.Collator.make

```rescript
let make: (. unit) => t
```

### let RescriptCore.Intl.Collator.makeWithLocale

```rescript
let makeWithLocale: (. string) => t
```

### let RescriptCore.Intl.Collator.makeWithLocales

```rescript
let makeWithLocales: (. array<string>) => t
```

### let RescriptCore.Intl.Collator.makeWithLocaleAndOptions

```rescript
let makeWithLocaleAndOptions: (. string, {..}) => t
```

### let RescriptCore.Intl.Collator.makeWithLocalesAndOptions

```rescript
let makeWithLocalesAndOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.Collator.makeWithOptions

```rescript
let makeWithOptions: (. {..}) => t
```

### let RescriptCore.Intl.Collator.supportedLocalesOf

```rescript
let supportedLocalesOf: (. array<string>) => t
```

### let RescriptCore.Intl.Collator.supportedLocalesOfWithOptions

```rescript
let supportedLocalesOfWithOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.Collator.resolvedOptions

```rescript
let resolvedOptions: (. t) => {..}
```

### let RescriptCore.Intl.Collator.compare

```rescript
let compare: (. t, string, string) => int
```

## module RescriptCore.Intl.DateTimeFormat `alias`

### type RescriptCore.Intl.DateTimeFormat.t

```rescript
type t
```

### let RescriptCore.Intl.DateTimeFormat.make

```rescript
let make: (. unit) => t
```

### let RescriptCore.Intl.DateTimeFormat.makeWithLocale

```rescript
let makeWithLocale: (. string) => t
```

### let RescriptCore.Intl.DateTimeFormat.makeWithLocales

```rescript
let makeWithLocales: (. array<string>) => t
```

### let RescriptCore.Intl.DateTimeFormat.makeWithLocaleAndOptions

```rescript
let makeWithLocaleAndOptions: (. string, {..}) => t
```

### let RescriptCore.Intl.DateTimeFormat.makeWithLocalesAndOptions

```rescript
let makeWithLocalesAndOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.DateTimeFormat.makeWithOptions

```rescript
let makeWithOptions: (. {..}) => t
```

### let RescriptCore.Intl.DateTimeFormat.supportedLocalesOf

```rescript
let supportedLocalesOf: (. array<string>) => t
```

### let RescriptCore.Intl.DateTimeFormat.supportedLocalesOfWithOptions

```rescript
let supportedLocalesOfWithOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.DateTimeFormat.resolvedOptions

```rescript
let resolvedOptions: (. t) => {..}
```

### let RescriptCore.Intl.DateTimeFormat.format

```rescript
let format: (. t, Core__Date.t) => string
```

### let RescriptCore.Intl.DateTimeFormat.formatToParts

```rescript
let formatToParts: (.
  t,
  Core__Date.t,
) => array<{"type": string, "value": string}>
```

### let RescriptCore.Intl.DateTimeFormat.formatRange

```rescript
let formatRange: (.
  t,
  ~startDate: Core__Date.t,
  ~endDate: Core__Date.t,
) => string
```

### let RescriptCore.Intl.DateTimeFormat.formatRangeToParts

```rescript
let formatRangeToParts: (.
  t,
  ~startDate: Core__Date.t,
  ~endDate: Core__Date.t,
) => array<
  {"source": string, "type": string, "value": string},
>
```

## module RescriptCore.Intl.Locale `alias`

### type RescriptCore.Intl.Locale.t

```rescript
type t
```

### let RescriptCore.Intl.Locale.make

```rescript
let make: (. string) => t
```

### let RescriptCore.Intl.Locale.makeWithOptions

```rescript
let makeWithOptions: (. string, {..}) => t
```

### let RescriptCore.Intl.Locale.baseName

```rescript
let baseName: (. t) => string
```

### let RescriptCore.Intl.Locale.calendar

```rescript
let calendar: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.caseFirst

```rescript
let caseFirst: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.collation

```rescript
let collation: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.hourCycle

```rescript
let hourCycle: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.language

```rescript
let language: (. t) => string
```

### let RescriptCore.Intl.Locale.numberingSystem

```rescript
let numberingSystem: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.numeric

```rescript
let numeric: (. t) => bool
```

### let RescriptCore.Intl.Locale.region

```rescript
let region: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.script

```rescript
let script: (. t) => option<string>
```

### let RescriptCore.Intl.Locale.maximize

```rescript
let maximize: (. t) => t
```

### let RescriptCore.Intl.Locale.minimize

```rescript
let minimize: (. t) => t
```

## module RescriptCore.Intl.NumberFormat `alias`

### type RescriptCore.Intl.NumberFormat.t

```rescript
type t
```

### let RescriptCore.Intl.NumberFormat.make

```rescript
let make: (. unit) => t
```

### let RescriptCore.Intl.NumberFormat.makeWithLocale

```rescript
let makeWithLocale: (. string) => t
```

### let RescriptCore.Intl.NumberFormat.makeWithLocales

```rescript
let makeWithLocales: (. array<string>) => t
```

### let RescriptCore.Intl.NumberFormat.makeWithLocaleAndOptions

```rescript
let makeWithLocaleAndOptions: (. string, {..}) => t
```

### let RescriptCore.Intl.NumberFormat.makeWithLocalesAndOptions

```rescript
let makeWithLocalesAndOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.NumberFormat.makeWithOptions

```rescript
let makeWithOptions: (. {..}) => t
```

### let RescriptCore.Intl.NumberFormat.supportedLocalesOf

```rescript
let supportedLocalesOf: (. array<string>) => t
```

### let RescriptCore.Intl.NumberFormat.supportedLocalesOfWithOptions

```rescript
let supportedLocalesOfWithOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.NumberFormat.resolvedOptions

```rescript
let resolvedOptions: (. t) => {..}
```

### let RescriptCore.Intl.NumberFormat.format

```rescript
let format: (. t, float) => string
```

### let RescriptCore.Intl.NumberFormat.formatToParts

```rescript
let formatToParts: (. t, float) => array<{"type": string, "value": string}>
```

### let RescriptCore.Intl.NumberFormat.formatInt

```rescript
let formatInt: (. t, int) => string
```

### let RescriptCore.Intl.NumberFormat.formatIntToParts

```rescript
let formatIntToParts: (. t, int) => array<{"type": string, "value": string}>
```

### let RescriptCore.Intl.NumberFormat.formatBigInt

```rescript
let formatBigInt: (. t, Core__BigInt.t) => string
```

### let RescriptCore.Intl.NumberFormat.formatBigIntToParts

```rescript
let formatBigIntToParts: (.
  t,
  Core__BigInt.t,
) => array<{"type": string, "value": string}>
```

## module RescriptCore.Intl.PluralRules `alias`

### type RescriptCore.Intl.PluralRules.t

```rescript
type t
```

### let RescriptCore.Intl.PluralRules.make

```rescript
let make: (. unit) => t
```

### let RescriptCore.Intl.PluralRules.makeWithLocale

```rescript
let makeWithLocale: (. string) => t
```

### let RescriptCore.Intl.PluralRules.makeWithLocales

```rescript
let makeWithLocales: (. array<string>) => t
```

### let RescriptCore.Intl.PluralRules.makeWithLocaleAndOptions

```rescript
let makeWithLocaleAndOptions: (. string, {..}) => t
```

### let RescriptCore.Intl.PluralRules.makeWithLocalesAndOptions

```rescript
let makeWithLocalesAndOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.PluralRules.makeWithOptions

```rescript
let makeWithOptions: (. {..}) => t
```

### let RescriptCore.Intl.PluralRules.supportedLocalesOf

```rescript
let supportedLocalesOf: (. array<string>) => t
```

### let RescriptCore.Intl.PluralRules.supportedLocalesOfWithOptions

```rescript
let supportedLocalesOfWithOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.PluralRules.resolvedOptions

```rescript
let resolvedOptions: (. t) => {..}
```

### type RescriptCore.Intl.PluralRules.rule

```rescript
type rule = [#few | #many | #one | #other | #two | #zero]
```

### let RescriptCore.Intl.PluralRules.select

```rescript
let select: (. t, float) => rule
```

### let RescriptCore.Intl.PluralRules.selectInt

```rescript
let selectInt: (. t, int) => rule
```

### let RescriptCore.Intl.PluralRules.selectBigInt

```rescript
let selectBigInt: (. t, Core__BigInt.t) => rule
```

## module RescriptCore.Intl.RelativeTimeFormat `alias`

### type RescriptCore.Intl.RelativeTimeFormat.t

```rescript
type t
```

### let RescriptCore.Intl.RelativeTimeFormat.make

```rescript
let make: (. unit) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocale

```rescript
let makeWithLocale: (. string) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocales

```rescript
let makeWithLocales: (. array<string>) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocaleAndOptions

```rescript
let makeWithLocaleAndOptions: (. string, {..}) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocalesAndOptions

```rescript
let makeWithLocalesAndOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.makeWithOptions

```rescript
let makeWithOptions: (. {..}) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.supportedLocalesOf

```rescript
let supportedLocalesOf: (. array<string>) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.supportedLocalesOfWithOptions

```rescript
let supportedLocalesOfWithOptions: (. array<string>, {..}) => t
```

### let RescriptCore.Intl.RelativeTimeFormat.resolvedOptions

```rescript
let resolvedOptions: (. t) => {..}
```

### type RescriptCore.Intl.RelativeTimeFormat.timeUnit

```rescript
type timeUnit = [
  | #day
  | #hour
  | #minute
  | #month
  | #quarter
  | #second
  | #week
  | #year
]
```

### let RescriptCore.Intl.RelativeTimeFormat.format

```rescript
let format: (. t, int, timeUnit) => string
```

### let RescriptCore.Intl.RelativeTimeFormat.formatToParts

```rescript
let formatToParts: (.
  t,
  int,
  timeUnit,
) => array<
  {"type": string, "unit": option<string>, "value": string},
>
```

### let RescriptCore.window

```rescript
let window: Dom.window
```

### let RescriptCore.document

```rescript
let document: Dom.document
```

### let RescriptCore.globalThis

```rescript
let globalThis: {..}
```

### let RescriptCore.null

```rescript
let null: Core__Nullable.t<'a>
```

### let RescriptCore.undefined

```rescript
let undefined: Core__Nullable.t<'a>
```

### let RescriptCore.typeof

```rescript
let typeof: (. 'a) => Core__Type.t
```

### type RescriptCore.t

```rescript
type t<'a> = Js.t<'a>
  constraint 'a = {..}
```

## module RescriptCore.MapperRt `alias`

## module RescriptCore.Internal `alias`

## module RescriptCore.Re `alias`

Functions for handling RegExp's in ReScript.

See [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp) on MDN.

### type RescriptCore.Re.t

```rescript
type t = Js.Re.t
```

Type representing an instantiated `RegExp`.

## module RescriptCore.Re.Result

### type RescriptCore.Re.Result.t

```rescript
type t = array<string>
```

Type representing the result of a `RegExp` execution.

### let RescriptCore.Re.Result.fullMatch

```rescript
let fullMatch: (. t) => string
```

`fullMatch(regExpResult)` returns the full string that matched in this result.

  ## Examples
  ```rescript
  // Match the first two words separated by a space
  let regexp = RegExp.fromString("(\\w+) (\\w+)")

  switch regexp-\>RegExp.exec("ReScript is pretty cool, right?") {
  | None =\> Console.log("Nope, no match...")
  | Some(result) =\> Console.log(result-\>RegExp.Result.fullMatch) // Prints the full string that matched, "ReScript is"
  }
  ```

### let RescriptCore.Re.Result.matches

```rescript
let matches: (. t) => array<string>
```

`matches(regExpResult)` returns all matches for `regExpResult`.

  ## Examples
  ```rescript
  // Match the first two words separated by a space
  let regexp = RegExp.fromString("(\\w+) (\\w+)")

  // This below will log "ReScript" and "is" to the console.
  switch regexp-\>RegExp.exec("ReScript is pretty cool, right?") {
  | None =\> Console.log("Nope, no match...")
  | Some(result) =\> switch result-\>RegExp.Result.matches {
    | [firstWord, secondWord] =\> Console.log2(firstWord, secondWord)
    | _ =\> Console.log("Didn't find exactly two words...")
    }
  }
  ```

### let RescriptCore.Re.Result.index

```rescript
let index: (. t) => int
```

### let RescriptCore.Re.Result.input

```rescript
let input: (. t) => string
```

`input(regExpResult)` returns the full input string that was passed to what produced the `RegExp.Result.t`.

  ## Examples
  ```rescript
  // Match the first two words separated by a space
  let regexp = RegExp.fromString("(\\w+) (\\w+)")

  // This below will log the full input string "ReScript is pretty cool, right?" to the console.
  switch regexp-\>RegExp.exec("ReScript is pretty cool, right?") {
  | None =\> Console.log("Nope, no match...")
  | Some(result) =\> Console.log(result-\>RegExp.Result.input)
  }
  ```

### let RescriptCore.Re.fromString

```rescript
let fromString: (. string) => t
```

`fromString(string)` creates a `RegExp.t` from the provided string. This can then be used to match on strings using `RegExp.exec`.

See [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints "ReScript"
}
```

### let RescriptCore.Re.fromStringWithFlags

```rescript
let fromStringWithFlags: (. string, ~flags: string) => t
```

`fromStringWithFlags(string)` creates a `RegExp.t` from the provided string, using the provided `flags`. This can then be used to match on strings using `RegExp.exec`.

See [`RegExp parameters`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp#parameters) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromStringWithFlags("\\w+", ~flags="g")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints "ReScript"
}
```

### let RescriptCore.Re.test

```rescript
let test: (. t, string) => bool
```

`test(regexp, string)` tests whether the provided `regexp` matches on the provided string.

See [`RegExp.test`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")

if regexp->RegExp.test("ReScript is cool!") {
  Console.log("Yay, there's a word in there.")
}
```

### let RescriptCore.Re.exec

```rescript
let exec: (. t, string) => option<Result.t>
```

`exec(regexp, string)` executes the provided regexp on the provided string, optionally returning a `RegExp.Result.t` if the regexp matches on the string.

See [`RegExp.exec`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints "ReScript"
}
```

### let RescriptCore.Re.lastIndex

```rescript
let lastIndex: (. t) => int
```

`lastIndex(regexp)` returns the index the next match will start from.

See [`RegExp.lastIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) on MDN.

#### Examples
```rescript
// Match the first word in a sentence
let regexp = RegExp.fromString("\\w+")
let someStr = "Many words here."

Console.log(regexp->RegExp.lastIndex) // Logs `0` to the console

regexp->RegExp.exec(someStr)->ignore

Console.log(regexp->RegExp.lastIndex) // Logs `4` to the console
```

### let RescriptCore.Re.ignoreCase

```rescript
let ignoreCase: (. t) => bool
```

`ignoreCase(regexp)` returns whether the ignore case (`i`) flag is set on this `RegExp`.

See [`RegExp.ignoreCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.ignoreCase) // Logs `false`, since `i` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="i")
Console.log(regexp2->RegExp.ignoreCase) // Logs `true`, since `i` is set
```

### let RescriptCore.Re.global

```rescript
let global: (. t) => bool
```

`global(regexp)` returns whether the global (`g`) flag is set on this `RegExp`.

See [`RegExp.global`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.global) // Logs `true`, since `g` is set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="i")
Console.log(regexp2->RegExp.global) // Logs `false`, since `g` is not set
```

### let RescriptCore.Re.multiline

```rescript
let multiline: (. t) => bool
```

`multiline(regexp)` returns whether the multiline (`m`) flag is set on this `RegExp`.

See [`RegExp.multiline`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.multiline) // Logs `false`, since `m` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="mi")
Console.log(regexp2->RegExp.multiline) // Logs `true`, since `m` is set
```

### let RescriptCore.Re.source

```rescript
let source: (. t) => string
```

`source(regexp)` returns the source text for this `RegExp`, without the two forward slashes (if present), and without any set flags.

See [`RegExp.source`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) on MDN.

#### Examples
```rescript
let regexp = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp->RegExp.source) // Logs `\w+`, the source text of the `RegExp`
```

### let RescriptCore.Re.sticky

```rescript
let sticky: (. t) => bool
```

`sticky(regexp)` returns whether the sticky (`y`) flag is set on this `RegExp`.

See [`RegExp.sticky`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.unicode) // Logs `false`, since `y` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="my")
Console.log(regexp2->RegExp.unicode) // Logs `true`, since `y` is set
```

### let RescriptCore.Re.unicode

```rescript
let unicode: (. t) => bool
```

`unicode(regexp)` returns whether the unicode (`y`) flag is set on this `RegExp`.

See [`RegExp.unicode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) on MDN.

#### Examples
```rescript
let regexp1 = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp1->RegExp.unicode) // Logs `false`, since `u` is not set

let regexp2 = RegExp.fromStringWithFlags("\\w+", ~flags="mu")
Console.log(regexp2->RegExp.unicode) // Logs `true`, since `u` is set
```

## module RescriptCore.Exn `alias`

## module RescriptCore.Option `alias`

We represent the existence and nonexistence of a value by wrapping it with
the `option` type. In order to make it a bit more convenient to work with
option-types, we provide utility-functions for it.

The `option` type is a part of the ReScript standard library which is defined
like this:

```rescript
type option<'a> = None | Some('a)
```

```rescript
let someString: option<string> = Some("hello")
```

### let RescriptCore.Option.filter

```rescript
let filter: (. option<'a>, (. 'a) => bool) => option<'a>
```

`filter(opt, f)` applies `f` to `opt`, if `f` returns `true`, then it returns `Some(value)`, otherwise returns `None`.

#### Examples

```rescript
Option.filter(Some(10), x => x > 5) // Some(10)
Option.filter(Some(4), x => x > 5) // None
Option.filter(None, x => x > 5) // None
```

### let RescriptCore.Option.forEach

```rescript
let forEach: (. option<'a>, (. 'a) => unit) => unit
```

`forEach(opt, f)` call `f` on `opt`. if `opt` is `Some(value)`, then if calls
`f`, otherwise returns `unit`.

#### Examples

```rescript
Option.forEach(Some("thing"), x => Console.log(x)) // logs "thing"
Option.forEach(None, x => Console.log(x)) // returns ()
```

### let RescriptCore.Option.getExn

```rescript
let getExn: (. option<'a>) => 'a
```

`getExn(opt)` returns `value` if `opt` is `Some(value)`, otherwise raises an exception.

```rescript
Option.getExn(Some(3)) // 3
Option.getExn(None) /* Raises an Error */
```

#### Exceptions

- Raises an error if `opt` is `None`

### let RescriptCore.Option.getUnsafe

```rescript
let getUnsafe: (. option<'a>) => 'a
```

`getUnsafe(opt)` returns `value` if `opt` is `Some(value)`, otherwise `undefined`.

#### Examples

```rescript
Option.getUnsafe(Some(3)) == 3
Option.getUnsafe(None: option<int>) // Returns `undefined`, which is not a valid `int`
```

#### Notes

- This is an unsafe operation. It assumes `value` is not `None`, and may cause undefined behaviour if it is.

### let RescriptCore.Option.mapOr

```rescript
let mapOr: (. option<'a>, 'b, (. 'a) => 'b) => 'b
```

`mapOr(opt, default, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `default`.

#### Examples

```rescript
let someValue = Some(3)
someValue->Option.mapOr(0, x => x + 5) // 8

let noneValue = None
noneValue->Option.mapOr(0, x => x + 5) // 0
```

### let RescriptCore.Option.mapWithDefault

*DEPRECATED:* Use mapOr instead  
```rescript
let mapWithDefault: (. option<'a>, 'b, (. 'a) => 'b) => 'b
```

### let RescriptCore.Option.map

```rescript
let map: (. option<'a>, (. 'a) => 'b) => option<'b>
```

`map(opt, f)` returns `Some(f(value))` if `opt` is `Some(value)`, otherwise `None`.

#### Examples

```rescript
Option.map(Some(3), x => x * x) // Some(9)
Option.map(None, x => x * x) // None
```

### let RescriptCore.Option.flatMap

```rescript
let flatMap: (. option<'a>, (. 'a) => option<'b>) => option<'b>
```

`flatMap(opt, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `None`.

#### Examples

```rescript
let addIfAboveOne = value =>
  if (value > 1) {
    Some(value + 1)
  } else {
    None
  }

Option.flatMap(Some(2), addIfAboveOne) // Some(3)
Option.flatMap(Some(-4), addIfAboveOne) // None
Option.flatMap(None, addIfAboveOne) // None
```

### let RescriptCore.Option.getOr

```rescript
let getOr: (. option<'a>, 'a) => 'a
```

`getOr(opt, default)` returns `value` if `opt` is `Some(value)`, otherwise `default`.

#### Examples

```rescript
Option.getOr(None, "Banana") // Banana
Option.getOr(Some("Apple"), "Banana") // Apple

let greet = (firstName: option<string>) =>
  "Greetings " ++ firstName->Option.getOr("Anonymous")

Some("Jane")->greet // "Greetings Jane"
None->greet // "Greetings Anonymous"
```

### let RescriptCore.Option.getWithDefault

*DEPRECATED:* Use getOr instead  
```rescript
let getWithDefault: (. option<'a>, 'a) => 'a
```

### let RescriptCore.Option.orElse

```rescript
let orElse: (. option<'a>, option<'a>) => option<'a>
```

`orElse(opt1, opt2)` returns `opt2` if `opt1` is `None`, otherwise `opt1`.

#### Examples

```rescript
Option.orElse(Some(1812), Some(1066)) == Some(1812)
Option.orElse(None, Some(1066) == Some(1066)
Option.orElse(None, None) == None
```

### let RescriptCore.Option.isSome

```rescript
let isSome: (. option<'a>) => bool
```

`isSome(opt)` returns `true` if `opt` is `Some(value)`, otherwise returns `false`.

#### Examples

```rescript
Option.isSome(None) // false
Option.isSome(Some(1)) // true
```

### let RescriptCore.Option.isNone

```rescript
let isNone: (. option<'a>) => bool
```

`isNone(opt)` returns `true` if `opt` is `None`, false otherwise.

#### Examples

```rescript
Option.isNone(None) // true
Option.isNone(Some(1)) // false
```

### let RescriptCore.Option.equal

```rescript
let equal: (. option<'a>, option<'b>, (. 'a, 'b) => bool) => bool
```

`equal(opt1, opt2, f)` evaluates two optional values for equality with respect to a predicate function `f`. If both `opt1` and `opt2` are `None`, returns `true`.
If one of the arguments is `Some(value)` and the other is `None`, returns
`false`.
If arguments are `Some(value1)` and `Some(value2)`, returns the result of
`f(value1, value2)`, the predicate function `f` must return a bool.

#### Examples

```rescript
let clockEqual = (a, b) => mod(a, 12) == mod(b, 12)

open Option

equal(Some(3), Some(15), clockEqual) // true
equal(Some(3), None, clockEqual) // false
equal(None, Some(3), clockEqual) // false
equal(None, None, clockEqual) // true
```

### let RescriptCore.Option.compare

```rescript
let compare: (.
  option<'a>,
  option<'b>,
  (. 'a, 'b) => Core__Ordering.t,
) => Core__Ordering.t
```

`compare(opt1, opt2, f)` compares two optional values with respect to given `f`.

If both `opt1` and `opt2` are `None`, it returns `0.`. If the first argument is `Some(value1)` and the second is `None`, returns `1.` (something is greater than nothing).

If the first argument is `None` and the second is `Some(value2)`, returns `-1.`
(nothing is less than something).

If the arguments are `Some(value1)` and `Some(value2)`, returns the result of
`f(value1, value2)`, `f` takes two arguments and returns `-1.` if the first
argument is less than the second, `0.` if the arguments are equal, and `1.` if
the first argument is greater than the second.

#### Examples

```rescript
let clockCompare = (a, b) => compare(mod(a, 12), mod(b, 12))

open Option

compare(Some(3), Some(15), clockCompare) // 0.
compare(Some(3), Some(14), clockCompare) // 1.
compare(Some(2), Some(15), clockCompare) // (-1.)
compare(None, Some(15), clockCompare) // (-1.)
compare(Some(14), None, clockCompare) // 1.
compare(None, None, clockCompare) // 0.
```

## module RescriptCore.List `alias`

### type RescriptCore.List.t

```rescript
type t<'a> = list<'a>
```

Collection functions for manipulating the `list` data structures, a singly-linked list.

**Prefer Array** if you need any of the following:

- Random access of element
- Better interop with JavaScript
- Better memory usage & performance.

### let RescriptCore.List.length

```rescript
let length: (. t<'a>) => int
```

`length(list)` returns the length of `list`.

#### Examples

```rescript
List.length(list{1, 2, 3}) // 3
```

### let RescriptCore.List.size

```rescript
let size: (. t<'a>) => int
```

`size(list)`. See [`length`](#length)

#### Examples

```rescript
List.size(list{1, 2, 3}) // 3
```

### let RescriptCore.List.head

```rescript
let head: (. t<'a>) => option<'a>
```

`head(list)` returns `Some(value)` where `value` is the first element in the
list, or `None` if `list` is an empty list.

#### Examples

```rescript
List.head(list{}) // None
List.head(list{1, 2, 3}) // Some(1)
```

### let RescriptCore.List.headExn

```rescript
let headExn: (. t<'a>) => 'a
```

`headExn(list)` same as [`head`](#head).

#### Examples

```rescript
List.headExn(list{1, 2, 3}) // 1

List.headExn(list{}) // Raises an Error
```

#### Exceptions

- Raises an Error if list is empty.

### let RescriptCore.List.tail

```rescript
let tail: (. t<'a>) => option<t<'a>>
```

`tail(list)` returns `None` if `list` is empty, otherwise it returns `Some(tail)`
where `tail` is everything except the first element of `list`.

#### Examples

```rescript
List.tail(list{1, 2, 3}) // Some(list{2, 3})

List.tail(list{}) // None
```

### let RescriptCore.List.tailExn

```rescript
let tailExn: (. t<'a>) => t<'a>
```

`tailExn(list)` same as [`tail`](#tail).

#### Examples

```rescript
List.tailExn(list{1, 2, 3}) // list{2, 3}

List.tailExn(list{}) // Raises an Error
```

#### Exceptions

- Raises an Error if list is empty.

### let RescriptCore.List.add

```rescript
let add: (. t<'a>, 'a) => t<'a>
```

`add(list, value)` adds a `value` to the beginning of list `list`.

#### Examples

```rescript
List.add(list{2, 3}, 1) // list{1, 2, 3}

List.add(list{"World", "!"}, "Hello") // list{"Hello", "World", "!"}
```

### let RescriptCore.List.get

```rescript
let get: (. t<'a>, int) => option<'a>
```

`get(list, index)` return the `index` element in `list`, or `None` if `index`
is larger than the length of list `list`.

#### Examples

```rescript
let abc = list{"A", "B", "C"}

abc->List.get(1) // Some("B")

abc->List.get(4) // None
```

### let RescriptCore.List.getExn

```rescript
let getExn: (. t<'a>, int) => 'a
```

`getExn(list, index)` same as [`get`](#get).

#### Examples

```rescript
let abc = list{"A", "B", "C"}

abc->List.getExn(1) // "B"

abc->List.getExn(4) // Raises an Error
```

#### Exceptions

- Raises an Error if `index` is larger than the length of list.

### let RescriptCore.List.make

```rescript
let make: (. int, 'a) => t<'a>
```

`make(length, value)` returns a list of length `length` with each element filled
with `value`. Returns an empty list if `value` is negative.

#### Examples

```rescript
List.make(3, 1) // list{1, 1, 1}
```

### let RescriptCore.List.makeBy

```rescript
let makeBy: (. int, (. int) => 'a) => t<'a>
```

`makeBy(length, f)` return a list of length `length` with element initialized
with `f`. Returns an empty list if `length` is negative.

#### Examples

```rescript
List.makeBy(5, i => i) // list{0, 1, 2, 3, 4}

List.makeBy(5, i => i * i) // list{0, 1, 4, 9, 16}
```

### let RescriptCore.List.toShuffled

```rescript
let toShuffled: (. t<'a>) => t<'a>
```

`toShuffled(list)` returns a new list in random order.

#### Examples

```rescript
List.toShuffled(list{1, 2, 3}) // list{2, 1, 3}
```

### let RescriptCore.List.drop

```rescript
let drop: (. t<'a>, int) => option<t<'a>>
```

`drop(list, value)` return a new list, dropping the first `value` element.
Returns `None` if `list` has fewer than `value` elements.

#### Examples

```rescript
list{1, 2, 3}->List.drop(2) // Some(list{3})

list{1, 2, 3}->List.drop(3) // Some(list{})

list{1, 2, 3}->List.drop(4) // None
```

### let RescriptCore.List.take

```rescript
let take: (. t<'a>, int) => option<t<'a>>
```

`take(list, value)` returns a list with the first `value` elements from `list`,
or `None` if `list` has fewer than `value` elements.

#### Examples

```rescript
list{1, 2, 3}->List.take(1) // Some(list{1})

list{1, 2, 3}->List.take(2) // Some(list{1, 2})

list{1, 2, 3}->List.take(4) // None
```

### let RescriptCore.List.splitAt

```rescript
let splitAt: (. t<'a>, int) => option<(list<'a>, list<'a>)>
```

`splitAt(list, n)` split the list `list` at `n`. Returns `None` when the length
of `list` is less than `n`.

#### Examples

```rescript
list{"Hello", "World"}->List.splitAt(1) // Some((list{"Hello"}, list{"World"}))

list{0, 1, 2, 3, 4}->List.splitAt(2) // Some((list{0, 1}, list{2, 3, 4}))
```

### let RescriptCore.List.concat

```rescript
let concat: (. t<'a>, t<'a>) => t<'a>
```

`concat(list1, list2)` returns the list obtained by adding `list1` after `list2`.

#### Examples

```rescript
List.concat(list{1, 2, 3}, list{4, 5}) // list{1, 2, 3, 4, 5}
```

### let RescriptCore.List.concatMany

```rescript
let concatMany: (. array<t<'a>>) => t<'a>
```

`concatMany(arr)` returns the list obtained by concatenating all the lists in
array `arr`, in order.

#### Examples

```rescript
List.concatMany([list{1, 2, 3}, list{}, list{3}]) // list{1, 2, 3, 3}
```

### let RescriptCore.List.reverseConcat

```rescript
let reverseConcat: (. t<'a>, t<'a>) => t<'a>
```

`reverseConcat(list1, list2)` is equivalent to writing: `concat(reverse(list1, list2)`

#### Examples

```rescript
List.reverseConcat(list{1, 2}, list{3, 4}) // list{2, 1, 3, 4}
```

### let RescriptCore.List.flatten

```rescript
let flatten: (. t<t<'a>>) => t<'a>
```

`flatten(list)` return the list obtained by concatenating all the lists in
`list`, in order.

#### Examples

```rescript
List.flatten(list{list{1, 2, 3}, list{}, list{3}}) // list{1, 2, 3, 3}
```

### let RescriptCore.List.map

```rescript
let map: (. t<'a>, (. 'a) => 'b) => t<'b>
```

`map(list, f)` returns a new list with `f` applied to each element of `list`.

#### Examples

```rescript
list{1, 2}->List.map(x => x + 1) // list{3, 4}
```

### let RescriptCore.List.zip

```rescript
let zip: (. t<'a>, t<'b>) => t<('a, 'b)>
```

`zip(list1, list2)` returns a list of pairs from the two lists with the length
of the shorter list.

#### Examples

```rescript
List.zip(list{1, 2}, list{3, 4, 5}) // list{(1, 3), (2, 4)}
```

### let RescriptCore.List.zipBy

```rescript
let zipBy: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => t<'c>
```

`zipBy(list1, list2, f)`. See [`zip`](#zip)

#### Examples

```rescript
List.zipBy(list{1, 2, 3}, list{4, 5}, (a, b) => 2 * a + b) // list{6, 9}
```

### let RescriptCore.List.mapWithIndex

```rescript
let mapWithIndex: (. t<'a>, (. int, 'a) => 'b) => t<'b>
```

`mapWithIndex(list, f)` applies `f` to each element of `list`. Function `f`
takes two arguments: the index starting from 0 and the element from `list`, in
that order.

#### Examples

```rescript
list{1, 2, 3}->List.mapWithIndex((index, x) => index + x) // list{1, 3, 5}
```

### let RescriptCore.List.fromArray

```rescript
let fromArray: (. array<'a>) => t<'a>
```

`fromArray(arr)` converts the given array `arr` to a list.

#### Examples

```rescript
List.fromArray([1, 2, 3]) // list{1, 2, 3}
```

### let RescriptCore.List.toArray

```rescript
let toArray: (. t<'a>) => array<'a>
```

`toArray(list)` converts the given list `list` to an array.

#### Examples

```rescript
List.toArray(list{1, 2, 3}) // [1, 2, 3]
```

### let RescriptCore.List.reverse

```rescript
let reverse: (. t<'a>) => t<'a>
```

`reverse(list)` returns a new list whose elements are those of `list` in
reversed order.

#### Examples

```rescript
List.reverse(list{1, 2, 3}) // list{3, 2, 1}
```

### let RescriptCore.List.mapReverse

```rescript
let mapReverse: (. t<'a>, (. 'a) => 'b) => t<'b>
```

`mapReverse(list, f)` is equivalent to `map` function.

#### Examples

```rescript
let f = x => x * x
let l = list{3, 4, 5}

let withMap = List.map(l, f)->List.reverse
let withMapReverse = l->List.mapReverse(f)

Console.log(withMap == withMapReverse) // true
```

### let RescriptCore.List.forEach

```rescript
let forEach: (. t<'a>, (. 'a) => 'b) => unit
```

`forEach(list, f)` call `f` on each element of `list` from the beginning to end.
`f` returns `unit`, so no new array is created. Use `forEach` when you are primarily
concerned with repetitively creating side effects.

#### Examples

```rescript
List.forEach(list{"a", "b", "c"}, x => Console.log("Item: " ++ x))
/*
  prints:
  Item: a
  Item: b
  Item: c
*/
```

### let RescriptCore.List.forEachWithIndex

```rescript
let forEachWithIndex: (. t<'a>, (. int, 'a) => 'b) => unit
```

`forEachWithIndex(list, f, index)` call `f` on each element of `list` from beginning
to end. Function `f` takes two arguments: the `index` starting from 0 and the
element from `list`. `f` returns `unit`.

#### Examples

```rescript
List.forEachWithIndex(list{"a", "b", "c"}, (index, x) => {
  Console.log("Item " ++ Int.toString(index) ++ " is " ++ x)
})
/*
  prints:
  Item 0 is a
  Item 1 is b
  Item 2 is cc
*/
```

### let RescriptCore.List.reduce

```rescript
let reduce: (. t<'a>, 'b, (. 'b, 'a) => 'b) => 'b
```

`reduce(list, initialValue, f)` applies `f` to each element of `list` from
beginning to end. Function `f` has two parameters: the item from the list and
an "accumulator", which starts with a value of `initialValue`. `reduce` returns
the final value of the accumulator.

#### Examples

```rescript
list{1, 2, 3, 4}->List.reduce(0, (a, b) => a + b) // 10

// same as

list{1, 2, 3, 4}->List.reduce(0, (acc, item) => acc + item) // 10
```

### let RescriptCore.List.reduceWithIndex

```rescript
let reduceWithIndex: (. t<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b
```

`reduceWithIndex(list, initialValue, f)` applies `f` to each element of `list`
from beginning to end. Function `f` has three parameters: the item from the list
and an "accumulator", which starts with a value of `initialValue` and the index
of each element. `reduceWithIndex` returns the final value of the accumulator.

#### Examples

```rescript
list{1, 2, 3, 4}->List.reduceWithIndex(0, (acc, item, index) => acc + item + index) // 16
```

### let RescriptCore.List.reduceReverse

```rescript
let reduceReverse: (. t<'a>, 'b, (. 'b, 'a) => 'b) => 'b
```

`reduceReverse(list, initialValue, f)` works like `reduce`, except that
function `f` is applied to each item of `list` from the last back to the first.

#### Examples

```rescript
list{1, 2, 3, 4}->List.reduceReverse(0, (a, b) => a + b) // 10

list{1, 2, 3, 4}->List.reduceReverse(10, (a, b) => a - b) // 0

list{1, 2, 3, 4}->List.reduceReverse(list{}, List.add) // list{1, 2, 3, 4}
```

### let RescriptCore.List.mapReverse2

```rescript
let mapReverse2: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => t<'c>
```

`mapReverse2(list1, list2, f)` is equivalent to `List.zipBy(list1, list2, f)-\>List.reverse`.

#### Examples

```rescript
List.mapReverse2(list{1, 2, 3}, list{1, 2}, (a, b) => a + b) // list{4, 2}
```

### let RescriptCore.List.forEach2

```rescript
let forEach2: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => unit
```

`forEach2(list1, list2, f)` is similar to `forEach`, but accepts two lists and
stops at the length of the shorter list.

#### Examples

```rescript
List.forEach2(list{"Z", "Y"}, list{"A", "B", "C"}, (x, y) => Console.log2(x, y))

/*
  prints:
  "Z" "A"
  "Y" "B"
*/
```

### let RescriptCore.List.reduce2

```rescript
let reduce2: (. t<'b>, t<'c>, 'a, (. 'a, 'b, 'c) => 'a) => 'a
```

`reduce2(list1, list2, initialValue, f)` applies `f` to each element of `list1`
and `list2` from beginning to end. Stops with the shorter list. Function `f` has
three parameters: an accumulator which starts with a value of `initialValue`, an
item from `l1`, and an item from `l2`. `reduce2` returns the final value of the
accumulator.

#### Examples

```rescript
List.reduce2(list{1, 2, 3}, list{4, 5}, 0, (acc, x, y) => acc + x * x + y) // 0 + (1 * 1 + 4) + (2 * 2 + 5)
```

### let RescriptCore.List.reduceReverse2

```rescript
let reduceReverse2: (. t<'a>, t<'b>, 'c, (. 'c, 'a, 'b) => 'c) => 'c
```

`reduceReverse2(list1, list2, initialValue, f)` applies `f` to each element of
`list1` and `list2`from end to beginning. Stops with the shorter list. Function
`f` has three parameters: an accumulator which starts with a value of
`initialValue`, an item from `l1`, and an item from `l2`. `reduce2` returns the
final value of the accumulator.

#### Examples

```rescript
List.reduceReverse2(list{1, 2, 3}, list{4, 5}, 0, (acc, x, y) => acc + x * x + y) //  + (1 * 1 + 4) + (2 * 2 + 5)
```

### let RescriptCore.List.every

```rescript
let every: (. t<'a>, (. 'a) => bool) => bool
```

`every(list, f)` returns `true` if all elements in `list` satisfy `f`, where `f`
is a predicate: a function taking an element and returning a bool.

#### Examples

```rescript
let isBelow10 = value => value < 10

list{1, 9, 8, 2}->List.every(isBelow10) // true

list{1, 99, 8, 2}->List.every(isBelow10) // false
```

### let RescriptCore.List.some

```rescript
let some: (. t<'a>, (. 'a) => bool) => bool
```

`some(list, f)` returns `true` if at least _one_ of the elements in `list`
satisfies `f`, where `f` is a predicate: a function taking an element and
returning a bool.

#### Examples

```rescript
let isAbove100 = value => value > 100

list{101, 1, 2, 3}->List.some(isAbove100) // true

list{1, 2, 3, 4}->List.some(isAbove100) // false
```

### let RescriptCore.List.every2

```rescript
let every2: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool
```

`every2(list1, list2, f)` returns `true` if predicate `f` is `true` for all
pairs of elements up to the shorter length (i.e. `min(length(list1), length(list2))`)

#### Examples

```rescript
List.every2(list{1, 2, 3}, list{0, 1}, (a, b) => a > b) // true

List.every2(list{}, list{1}, (a, b) => a > b) // true

List.every2(list{2, 3}, list{1}, (a, b) => a > b) // true

List.every2(list{0, 1}, list{5, 0}, (a, b) => a > b) // false
```

### let RescriptCore.List.some2

```rescript
let some2: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool
```

`some2(list1, list2, f)` returns `true` if predicate `f` is `true` for any pair
of elements up to the shorter length (i.e. `min(length(list1), length(list2))`)

#### Examples

```rescript
List.some2(list{1, 2, 3}, list{0, 1}, (a, b) => a > b) // true

List.some2(list{}, list{1}, (a, b) => a > b) // false

List.some2(list{2, 3}, list{1}, (a, b) => a > b) // true

List.some2(list{0, 1}, list{5, 0}, (a, b) => a > b) // true
```

### let RescriptCore.List.compareLength

```rescript
let compareLength: (. t<'a>, t<'a>) => Core__Ordering.t
```

`compareLength(list1, list2)` compare two lists solely by length. Returns `-1.` if
`length(list1)` is less than `length(list2)`, `0.` if `length(list1)` equals
`length(list2)`, and `1.` if `length(list1)` is greater than `length(list2)`.

#### Examples

```rescript
List.compareLength(list{1, 2}, list{3, 4, 5, 6}) // -1.

List.compareLength(list{1, 2, 3}, list{4, 5, 6}) // 0.

List.compareLength(list{1, 2, 3, 4}, list{5, 6}) // 1.
```

### let RescriptCore.List.compare

```rescript
let compare: (.
  t<'a>,
  t<'a>,
  (. 'a, 'a) => Core__Ordering.t,
) => Core__Ordering.t
```

`compare(list1, list2, f)` compare elements one by one `f`. `f` returns a negative
number if `list1` is "less than" `list2`, zero if `list1` is "equal to" `list2`,
a positive number if `list1` is "greater than" `list2`.

The comparison returns the first non-zero result of `f`, or zero if `f` returns
zero for all `list1` and `list2`.

- If all items have compared equal, but `list1` is exhausted first, return `-1.`. (`list1` is shorter).
- If all items have compared equal, but `list2` is exhausted first, return `1.` (`list1` is longer).

#### Examples

```rescript
List.compare(list{3}, list{3, 7}, (a, b) => compare(a, b)) /* (-1.) */

List.compare(list{5, 3}, list{5}, (a, b) => compare(a, b)) /* 1. */

List.compare(list{1, 3, 5}, list{1, 4, 2}, (a, b) => compare(a, b)) /* (-1.) */

List.compare(list{1, 3, 5}, list{1, 2, 3}, (a, b) => compare(a, b)) /* 1. */

List.compare(list{1, 3, 5}, list{1, 3, 5}, (a, b) => compare(a, b)) /* 0. */
```

**Please note:** The total ordering of List is different from Array,
for Array, we compare the length first and, only if the lengths are equal, elements one by one.
For lists, we just compare elements one by one.

### let RescriptCore.List.equal

```rescript
let equal: (. t<'a>, t<'a>, (. 'a, 'a) => bool) => bool
```

`equal(list1, list2, f)` check equality of `list2` and `list2` using `f` for
equality on elements, where `f` is a function that returns `true` if items `x` and
`y` meet some criterion for equality, `false` otherwise. equal `false` if length
of `list1` and `list2` are not the same.

#### Examples

```rescript
List.equal(list{1, 2, 3}, list{1, 2}, (a, b) => a == b) // false

List.equal(list{1, 2}, list{1, 2}, (a, b) => a == b) // true

List.equal(list{1, 2, 3}, list{(-1), (-2), (-3)}, (a, b) => abs(a) == abs(b)) // true
```

### let RescriptCore.List.has

```rescript
let has: (. t<'a>, 'b, (. 'a, 'b) => bool) => bool
```

`has(list, element, f)` returns `true` if the list contains at least one
`element` for which `f` returns `true'.

#### Examples

```rescript
list{1, 2, 3}->List.has(2, (a, b) => a == b) // true

list{1, 2, 3}->List.has(4, (a, b) => a == b) // false

list{(-1), (-2), (-3)}->List.has(2, (a, b) => abs(a) == abs(b)) // true
```

### let RescriptCore.List.getBy

```rescript
let getBy: (. t<'a>, (. 'a) => bool) => option<'a>
```

`getBy(list, f)` returns `Some(value)` for the first value in `list` that
satisfies the predicate function `f`. Returns `None` if no element satisfies
the function.

#### Examples

```rescript
List.getBy(list{1, 4, 3, 2}, x => x > 3) // Some(4)

List.getBy(list{1, 4, 3, 2}, x => x > 4) // None
```

### let RescriptCore.List.filter

```rescript
let filter: (. t<'a>, (. 'a) => bool) => t<'a>
```

`filter(list, f)` returns a list of all elements in `list` which satisfy the
predicate function `f`.

#### Examples

```rescript
let isEven = x => mod(x, 2) == 0

List.filter(list{1, 2, 3, 4}, isEven) // list{2, 4}

List.filter(list{None, Some(2), Some(3), None}, Option.isSome) // list{Some(2), Some(3)}
```

### let RescriptCore.List.filterWithIndex

```rescript
let filterWithIndex: (. t<'a>, (. 'a, int) => bool) => t<'a>
```

`filterWithIndex(list, f)` returns a list of all elements in `list` which
satisfy the predicate function `f`.

#### Examples

```rescript
let isEven = x => mod(x, 2) == 0

List.filterWithIndex(list{1, 2, 3, 4}, (_x, index) => isEven(index)) // list{1, 3}
```

### let RescriptCore.List.filterMap

```rescript
let filterMap: (. t<'a>, (. 'a) => option<'b>) => t<'b>
```

`filterMap(list, f)` applies `f` to each element of `list`. If `f` returns
`Some(value)`, then `value` is _kept_ in the resulting list. If `f` returns
`None`, the element is _not_ retained in the result.

#### Examples

```rescript
let isEven = x => mod(x, 2) == 0

list{1, 2, 3, 4}
->List.filterMap(x =>
    if (isEven(x)) {
      Some(x)
    } else {
      None
    }
  ) // list{2, 4}

list{Some(1), Some(2), None}->List.filterMap(x => x) // list{1, 2}
```

### let RescriptCore.List.partition

```rescript
let partition: (. t<'a>, (. 'a) => bool) => (t<'a>, t<'a>)
```

`partition(list, f)` creates a pair of lists; the first list consists of all
elements of `list` that satisfy the predicate function `f`, the second list
consists of all elements of `list` that _do not_ satisfy `f`.

#### Examples

```rescript
// (elementsThatSatisfies, elementsThatDoesNotSatisfy)

List.partition(list{1, 2, 3, 4}, x => x > 2) // (list{3, 4}, list{1, 2})
```

### let RescriptCore.List.unzip

```rescript
let unzip: (. t<('a, 'b)>) => (t<'a>, t<'b>)
```

`unzip(list)` takes a list of pairs and creates a pair of lists. The first list
contains all the first items of the pairs, the second list contains all the
second items.

#### Examples

```rescript
List.unzip(list{(1, 2), (3, 4)}) // (list{1, 3}, list{2, 4})

List.unzip(list{("H", "W"), ("e", "o"), ("l", "r"), ("l", "l"), ("o", "d"), (" ", "!")})
// (list{"H", "e", "l", "l", "o", " "}, list{"W", "o", "r", "l", "d", "!"})
```

### let RescriptCore.List.getAssoc

```rescript
let getAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => option<'c>
```

`getAssoc(list, k, f)` return the second element of a pair in `list` where
the first element equals `k` as per the predicate function `f`, or `None` if
not found.

#### Examples

```rescript
list{(1, "a"), (2, "b"), (3, "c")}->List.getAssoc(3, (a, b) => a == b) // Some("c")

list{(9, "morning"), (15, "afternoon"), (22, "night")}
->List.getAssoc(15, (k, item) => k /* 15 */ == item /* 9, 5, 22 */)
// Some("afternoon")
```

### let RescriptCore.List.hasAssoc

```rescript
let hasAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => bool
```

`hasAssoc(list, k, f)` returns `true` if there is a pair in `list` where the
first element equals `k` as per the predicate function `f`.

#### Examples

```rescript
list{(1, "a"), (2, "b"), (3, "c")}->List.hasAssoc(1, (a, b) => a == b) // true

list{(9, "morning"), (15, "afternoon"), (22, "night")}
->List.hasAssoc(25, (k, item) => k /* 25 */ == item /* 9, 5, 22 */) // false
```

### let RescriptCore.List.removeAssoc

```rescript
let removeAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => t<('a, 'c)>
```

`removeAssoc(list, k, f)` return a list after removing the first pair whose
first value is `k` per the equality predicate `f`, if not found, return a new
list identical to `list`.

#### Examples

```rescript
list{(1, "a"), (2, "b"), (3, "c")}->List.removeAssoc(1, (a, b) => a == b) // list{(2, "b"), (3, "c")}

list{(9, "morning"), (15, "afternoon"), (22, "night")}
->List.removeAssoc(9, (k, item) => k /* 9 */ == item /* 9, 5, 22 */)
// list{(15, "afternoon"), (22, "night")}
```

### let RescriptCore.List.setAssoc

```rescript
let setAssoc: (. t<('a, 'c)>, 'a, 'c, (. 'a, 'a) => bool) => t<('a, 'c)>
```

`setAssoc(list, k, v, f)`. If `k` exists in `list` by satisfying the `f`
predicate, return a new list with the key and value replaced by the new `k` and
`v`, otherwise, return a new list with the pair `k`, `v` added to the head of
`list`.

#### Examples

```rescript
list{(1, "a"), (2, "b"), (3, "c")}->List.setAssoc(2, "x", (a, b) => a == b) // list{(1, "a"), (2, "x"), (3, "c")}

list{(1, "a"), (3, "c")}->List.setAssoc(2, "b", (a, b) => a == b) // list{(2, "b"), (1, "a"), (3, "c")}

list{(9, "morning"), (3, "morning?!"), (22, "night")}
->List.setAssoc(15, "afternoon", (a, b) => mod(a, 12) == mod(b, 12))
// list{(9, "morning"), (15, "afternoon"), (22, "night")}
```

**Please note**: In the last example, since: `15 mod 12` equals `3 mod 12`. Both
the key _and_ the value are replaced in the list.

### let RescriptCore.List.sort

```rescript
let sort: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => t<'a>
```

`sort(list, f)` returns a sorted list.

#### Examples

```rescript
List.sort(list{5, 4, 9, 3, 7}, Int.compare) // list{3, 4, 5, 7, 9}
```

## module RescriptCore.Result `alias`

### type RescriptCore.Result.t

```rescript
type t<'a, 'b> = result<'a, 'b> = Ok('a) | Error('b)
```

Result types are really useful to describe the result of a certain operation
  without relying on exceptions or `option` types.

  This module gives you useful utilities to create and combine `Result` data.

**Variant Constructor:**

```rescript
Ok('a)
```

**Variant Constructor:**

```rescript
Error('b)
```

### let RescriptCore.Result.getExn

```rescript
let getExn: (. t<'a, 'b>) => 'a
```

`getExn(res)`: when `res` is `Ok(n)`, returns `n` when `res` is `Error(m)`, raise an exception

  ```res example
  Result.getExn(Result.Ok(42)) == 42

  Result.getExn(Result.Error("Invalid data")) /* raises exception */
  ```

### let RescriptCore.Result.mapOr

```rescript
let mapOr: (. t<'a, 'c>, 'b, (. 'a) => 'b) => 'b
```

`mapOr(res, default, f)`: When res is `Ok(n)`, returns `f(n)`,
  otherwise `default`.

  ```res example
  let ok = Result.Ok(42)
  Result.mapOr(ok, 0, (x) =\> x / 2) == 21

  let error = Result.Error("Invalid data")
  Result.mapOr(error, 0, (x) =\> x / 2) == 0
  ```

### let RescriptCore.Result.mapWithDefault

*DEPRECATED:* Use mapOr instead  
```rescript
let mapWithDefault: (. t<'a, 'c>, 'b, (. 'a) => 'b) => 'b
```

### let RescriptCore.Result.map

```rescript
let map: (. t<'a, 'c>, (. 'a) => 'b) => t<'b, 'c>
```

`map(res, f)`: When res is `Ok(n)`, returns `Ok(f(n))`. Otherwise returns res
  unchanged. Function `f` takes a value of the same type as `n` and returns an
  ordinary value.

  ```res example
  let f = (x) =\> sqrt(Int.toFloat(x))

  Result.map(Ok(64), f) == Ok(8.0)

  Result.map(Error("Invalid data"), f) == Error("Invalid data")
  ```

### let RescriptCore.Result.flatMap

```rescript
let flatMap: (. t<'a, 'c>, (. 'a) => t<'b, 'c>) => t<'b, 'c>
```

`flatMap(res, f)`: When res is `Ok(n)`, returns `f(n)`. Otherwise, returns res
  unchanged. Function `f` takes a value of the same type as `n` and returns a
  `Result`.

  ```res example
  let recip = (x) =\>
    if (x !== 0.0) {
      Result.Ok(1.0 /. x)
    } else {
      Result.Error("Divide by zero")
    }

  Result.flatMap(Ok(2.0), recip) == Ok(0.5)

  Result.flatMap(Ok(0.0), recip) == Error("Divide by zero")

  Result.flatMap(Error("Already bad"), recip) == Error("Already bad")
  ```

### let RescriptCore.Result.getOr

```rescript
let getOr: (. t<'a, 'b>, 'a) => 'a
```

`getOr(res, defaultValue)`: If `res` is `Ok(n)`, returns `n`,
  otherwise `default`

  ```res example
  Result.getOr(Ok(42), 0) == 42

  Result.getOr(Error("Invalid Data"), 0) == 0
  ```

### let RescriptCore.Result.getWithDefault

*DEPRECATED:* Use getOr instead  
```rescript
let getWithDefault: (. t<'a, 'b>, 'a) => 'a
```

### let RescriptCore.Result.isOk

```rescript
let isOk: (. t<'a, 'b>) => bool
```

`isOk(res)`: Returns `true` if `res` is of the form `Ok(n)`, `false` if it is
  the `Error(e)` variant.

### let RescriptCore.Result.isError

```rescript
let isError: (. t<'a, 'b>) => bool
```

`isError(res)`: Returns `true` if `res` is of the form `Error(e)`, `false` if
  it is the `Ok(n)` variant.

### let RescriptCore.Result.equal

```rescript
let equal: (. t<'a, 'c>, t<'b, 'd>, (. 'a, 'b) => bool) => bool
```

`equal(res1, res2, f)`: Determine if two `Result` variables are equal with
  respect to an equality function. If `res1` and `res2` are of the form `Ok(n)`
  and `Ok(m)`, return the result of `f(n, m)`. If one of `res1` and `res2` are of
  the form `Error(e)`, return false If both `res1` and `res2` are of the form
  `Error(e)`, return true

  ```res example
  let good1 = Result.Ok(42)

  let good2 = Result.Ok(32)

  let bad1 = Result.Error("invalid")

  let bad2 = Result.Error("really invalid")

  let mod10equal = (a, b) =\> mod(a, 10) === mod(b, 10)

  Result.equal(good1, good2, mod10equal) == true

  Result.equal(good1, bad1, mod10equal) == false

  Result.equal(bad2, good2, mod10equal) == false

  Result.equal(bad1, bad2, mod10equal) == true
  ```

### let RescriptCore.Result.compare

```rescript
let compare: (.
  t<'a, 'c>,
  t<'b, 'd>,
  (. 'a, 'b) => Core__Ordering.t,
) => Core__Ordering.t
```

`compare(res1, res2, f)`: Compare two `Result` variables with respect to a
  comparison function. The comparison function returns -1. if the first variable
  is "less than" the second, 0. if the two variables are equal, and 1. if the first
  is "greater than" the second.

  If `res1` and `res2` are of the form `Ok(n)` and `Ok(m)`, return the result of
  `f(n, m)`. If `res1` is of the form `Error(e)` and `res2` of the form `Ok(n)`,
  return -1. (nothing is less than something) If `res1` is of the form `Ok(n)` and
  `res2` of the form `Error(e)`, return 1. (something is greater than nothing) If
  both `res1` and `res2` are of the form `Error(e)`, return 0. (equal)

  ```res example
  let good1 = Result.Ok(59)

  let good2 = Result.Ok(37)

  let bad1 = Result.Error("invalid")

  let bad2 = Result.Error("really invalid")

  let mod10cmp = (a, b) =\> Pervasives.compare(mod(a, 10), mod(b, 10))

  Result.compare(Ok(39), Ok(57), mod10cmp) == 1.

  Result.compare(Ok(57), Ok(39), mod10cmp) == (-1.)

  Result.compare(Ok(39), Error("y"), mod10cmp) == 1.

  Result.compare(Error("x"), Ok(57), mod10cmp) == (-1.)

  Result.compare(Error("x"), Error("y"), mod10cmp) == 0.
  ```

### let RescriptCore.Result.forEach

```rescript
let forEach: (. t<'a, 'b>, (. 'a) => unit) => unit
```

`forEach(res, f)` runs the provided function `f` on the `Ok` value. If `res` is `Error`, nothing happens.

#### Examples

```rescript
Result.forEach(Ok(3), Console.log) // Logs "3", returns ()
Result.forEach(Error("x"), Console.log) // Does nothing, returns ()
```

### let RescriptCore.Result.mapError

```rescript
let mapError: (. result<'a, 'b>, (. 'b) => 'c) => result<'a, 'c>
```

`mapError(r, f)` generates a new `result` by applying the function `f` to the `Error` value. If the source is `Ok`, return it as-is.

#### Examples

```rescript
let format = n => `Error code: ${n->Int.toString}`
mapError(Error(14), format) // Error("Error code: 14")
mapError(Ok("abc"), format) // Ok("abc")
```

### type RescriptCore.null

```rescript
type null<'a> = Js.null<'a>
```

**Variant Constructor:**

```rescript
Value('a)
```

**Variant Constructor:**

```rescript
Null
```

### type RescriptCore.undefined

```rescript
type undefined<'a> = Js.undefined<'a>
```

### type RescriptCore.nullable

```rescript
type nullable<'a> = Js.nullable<'a>
```

**Variant Constructor:**

```rescript
Value('a)
```

**Variant Constructor:**

```rescript
Null
```

**Variant Constructor:**

```rescript
Undefined
```

### let RescriptCore.panic

```rescript
let panic: (. string) => 'a
```



# JSON

```json

{
  "name": "RescriptCore",
  "docstrings": [],
  "items": [
  {
    "id": "RescriptCore.timeoutId",
    "kind": "type",
    "name": "timeoutId",
    "signature": "type timeoutId = Js.Global.timeoutId",
    "docstrings": ["An `id` representing a timeout started via `setTimeout`.\n\nSee [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN."]
  }, 
  {
    "id": "RescriptCore.setTimeout",
    "kind": "value",
    "name": "setTimeout",
    "signature": "let setTimeout: (. (. unit) => unit, int) => timeoutId",
    "docstrings": ["`setTimeout(callback, durationInMilliseconds)` starts a timer that will execute `callback` after `durationInMilliseconds`.\n\nSee [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN.\n\n## Examples\n```rescript\n// Log to the console after 2 seconds (2000 milliseconds).\nlet timeoutId = setTimeout(() => {\n  Console.log(\"This prints in 2 seconds.\")\n}, 2000)\n```"]
  }, 
  {
    "id": "RescriptCore.setTimeoutFloat",
    "kind": "value",
    "name": "setTimeoutFloat",
    "signature": "let setTimeoutFloat: (. (. unit) => unit, float) => timeoutId",
    "docstrings": ["`setTimeoutFloat(callback, durationInMilliseconds)` starts a timer that will execute `callback` after `durationInMilliseconds`.\n\nThe same as `setTimeout`, but allows you to pass a `float` instead of an `int` for the duration.\n\nSee [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN.\n\n## Examples\n```rescript\n// Log to the console after 2 seconds (2000 milliseconds).\nlet timeoutId = setTimeoutFloat(() => {\n  Console.log(\"This prints in 2 seconds.\")\n}, 2000.)\n```"]
  }, 
  {
    "id": "RescriptCore.clearTimeout",
    "kind": "value",
    "name": "clearTimeout",
    "signature": "let clearTimeout: (. timeoutId) => unit",
    "docstrings": ["`clearTimeout(timeoutId)` clears a scheduled timeout if it hasn't already executed.\n\nSee [`clearTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/clearTimeout) on MDN.\n\n## Examples\n```rescript\nlet timeoutId = setTimeout(() => {\n  Console.log(\"This prints in 2 seconds.\")\n}, 2000)\n\n// Clearing the timeout right away, before 2 seconds has passed, means that the above callback logging to the console will never run.\nclearTimeout(timeoutId)\n```"]
  }, 
  {
    "id": "RescriptCore.intervalId",
    "kind": "type",
    "name": "intervalId",
    "signature": "type intervalId = Js.Global.intervalId",
    "docstrings": ["An `id` representing an interval started via `setInterval`.\n\nSee [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN."]
  }, 
  {
    "id": "RescriptCore.setInterval",
    "kind": "value",
    "name": "setInterval",
    "signature": "let setInterval: (. (. unit) => unit, int) => intervalId",
    "docstrings": ["`setInterval(callback, intervalInMilliseconds)` starts an interval that will execute `callback` every `durationInMilliseconds` milliseconds.\n\nSee [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.\n\n## Examples\n```rescript\n// Log to the console ever 2 seconds (2000 milliseconds).\nlet intervalId = setInterval(() => {\n  Console.log(\"This prints every 2 seconds.\")\n}, 2000)\n```"]
  }, 
  {
    "id": "RescriptCore.setIntervalFloat",
    "kind": "value",
    "name": "setIntervalFloat",
    "signature": "let setIntervalFloat: (. (. unit) => unit, float) => intervalId",
    "docstrings": ["`setIntervalFloat(callback, intervalInMilliseconds)` starts an interval that will execute `callback` every `durationInMilliseconds` milliseconds.\n\nThe same as `setInterval`, but allows you to pass a `float` instead of an `int` for the duration.\n\nSee [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.\n\n## Examples\n```rescript\n// Log to the console ever 2 seconds (2000 milliseconds).\nlet intervalId = setIntervalFloat(() => {\n  Console.log(\"This prints every 2 seconds.\")\n}, 2000.)\n```"]
  }, 
  {
    "id": "RescriptCore.clearInterval",
    "kind": "value",
    "name": "clearInterval",
    "signature": "let clearInterval: (. intervalId) => unit",
    "docstrings": ["`clearInterval(intervalId)` clears a scheduled interval.\n\nSee [`clearInterval`](https://developer.mozilla.org/en-US/docs/Web/API/clearInterval) on MDN.\n\n## Examples\n```rescript\nlet intervalId = setInterval(() => {\n  Console.log(\"This prints in 2 seconds.\")\n}, 2000)\n\n// Stop the interval after 10 seconds\nlet timeoutId = setTimeout(() => {\n  clearInterval(intervalId)\n}, 10000)\n```"]
  }, 
  {
    "id": "RescriptCore.encodeURI",
    "kind": "value",
    "name": "encodeURI",
    "signature": "let encodeURI: (. string) => string",
    "docstrings": ["Encodes a URI by replacing characters in the provided string that aren't valid in a URL.\n\nThis is intended to operate on full URIs, so it encodes fewer characters than what `encodeURIComponent` does.\nIf you're looking to encode just parts of a URI, like a query parameter, prefer `encodeURIComponent`.\n\nSee [`encodeURI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) on MDN.\n\n## Examples\n```rescript\nConsole.log(encodeURI(\"https://rescript-lang.org?array=[someValue]\"))\n// Logs \"https://rescript-lang.org?array=%5BsomeValue%5D\" to the console.\n```"]
  }, 
  {
    "id": "RescriptCore.decodeURI",
    "kind": "value",
    "name": "decodeURI",
    "signature": "let decodeURI: (. string) => string",
    "docstrings": ["Decodes a previously encoded URI back to a regular string.\n\nThis is intended to operate on full URIs, so it decodes fewer characters than what `decodeURIComponent` does.\nIf you're looking to decode just parts of a URI, like a query parameter, prefer `decodeURIComponent`.\n\nSee [`decodeURI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURI) on MDN.\n\n## Examples\n```rescript\nConsole.log(decodeURI(\"https://rescript-lang.org?array=%5BsomeValue%5D\"))\n// Logs \"https://rescript-lang.org?array=[someValue]\" to the console.\n```"]
  }, 
  {
    "id": "RescriptCore.encodeURIComponent",
    "kind": "value",
    "name": "encodeURIComponent",
    "signature": "let encodeURIComponent: (. string) => string",
    "docstrings": ["Encodes a string so it can be used as part of a URI.\n\nSee [`encodeURIComponent`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) on MDN.\n\n## Examples\n```rescript\nConsole.log(encodeURIComponent(\"array=[someValue]\"))\n// Logs \"array%3D%5BsomeValue%5D\" to the console.\n```"]
  }, 
  {
    "id": "RescriptCore.decodeURIComponent",
    "kind": "value",
    "name": "decodeURIComponent",
    "signature": "let decodeURIComponent: (. string) => string",
    "docstrings": ["Decodes a previously URI encoded string back to its original form.\n\nSee [`decodeURIComponent`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURIComponent) on MDN.\n\n## Examples\n```rescript\nConsole.log(decodeURIComponent(\"array%3D%5BsomeValue%5D\"))\n// Logs \"array=[someValue]\" to the console.\n```"]
  }, 
  {
    "id": "RescriptCore.Array",
    "kind": "moduleAlias",
    "name": "Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Array.fromIterator",
      "kind": "value",
      "name": "fromIterator",
      "signature": "let fromIterator: (. Core__Iterator.t<'a>) => array<'a>",
      "docstrings": ["`fromIterator(iterator)`\n\n  Creates an array from the provided `iterator`\n\n  ```res example\n  let map = Map.fromArray([(\"foo\", 1), (\"bar\", 2)])\n\n  Array.fromIterator(map->Map.values) // [1, 2]\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.fromArrayLike",
      "kind": "value",
      "name": "fromArrayLike",
      "signature": "let fromArrayLike: (. Js.Array2.array_like<'a>) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.fromArrayLikeWithMap",
      "kind": "value",
      "name": "fromArrayLikeWithMap",
      "signature": "let fromArrayLikeWithMap: (. Js.Array2.array_like<'a>, (. 'a) => 'b) => array<'b>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. ~length: int, 'a) => array<'a>",
      "docstrings": ["`make(~length, init)`\n\n  Creates an array of length `length` initialized with the value of `init`.\n\n  ```res example\n  Array.make(~length=3, #apple) == [#apple, #apple, #apple]\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.fromInitializer",
      "kind": "value",
      "name": "fromInitializer",
      "signature": "let fromInitializer: (. ~length: int, (. int) => 'a) => array<'a>",
      "docstrings": ["`fromInitializer(~length, f)`\n\n  Creates an array of length `length` initialized with the value returned from `f ` for each index.\n\n  ```res example\n  Array.make(~length=3, i => i + 3) == [3, 4, 5]\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. array<'a>, array<'a>, (. 'a, 'a) => bool) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (.\n  array<'a>,\n  array<'a>,\n  (. 'a, 'a) => Core__Ordering.t,\n) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.isArray",
      "kind": "value",
      "name": "isArray",
      "signature": "let isArray: (. 'a) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.length",
      "kind": "value",
      "name": "length",
      "signature": "let length: (. array<'a>) => int",
      "docstrings": ["`length(array)` returns the length of (i.e. number of items in) the array.\n\nSee [`Array.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\n\nConsole.log(someArray->Array.length) // 2\n```"]
    }, 
    {
      "id": "RescriptCore.Array.copyAllWithin",
      "kind": "value",
      "name": "copyAllWithin",
      "signature": "let copyAllWithin: (. array<'a>, ~target: int) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.copyWithinToEnd",
      "kind": "value",
      "name": "copyWithinToEnd",
      "signature": "let copyWithinToEnd: (. array<'a>, ~target: int, ~start: int) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.copyWithin",
      "kind": "value",
      "name": "copyWithin",
      "signature": "let copyWithin: (.\n  array<'a>,\n  ~target: int,\n  ~start: int,\n  ~end: int,\n) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.fillAll",
      "kind": "value",
      "name": "fillAll",
      "signature": "let fillAll: (. array<'a>, 'a) => unit",
      "docstrings": ["`fillAll(array, value)` fills the entire `array` with `value`.\n\nBeware this will *mutate* the array.\n\nSee [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.\n\n## Examples\n```rescript\nlet myArray = [1, 2, 3, 4]\nmyArray->Array.fillAll(9)\n\nConsole.log(myArray) // [9, 9, 9, 9]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.fillToEnd",
      "kind": "value",
      "name": "fillToEnd",
      "signature": "let fillToEnd: (. array<'a>, 'a, ~start: int) => unit",
      "docstrings": ["`fillToEnd(array, value, ~start)` fills `array` with `value` from the `start` index.\n\nBeware this will *mutate* the array.\n\nSee [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.\n\n## Examples\n```rescript\nlet myArray = [1, 2, 3, 4]\nmyArray->Array.fillToEnd(9, ~start=1)\n\nConsole.log(myArray) // [1, 9, 9, 9]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.fill",
      "kind": "value",
      "name": "fill",
      "signature": "let fill: (. array<'a>, 'a, ~start: int, ~end: int) => unit",
      "docstrings": ["`fill(array, value, ~start, ~end)` fills `array` with `value` from `start` to `end`.\n\nBeware this will *mutate* the array.\n\nSee [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.\n\n## Examples\n```rescript\nlet myArray = [1, 2, 3, 4]\nmyArray->Array.fill(9, ~start=1, ~end=2)\n\nConsole.log(myArray) // [1, 9, 9, 4]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.pop",
      "kind": "value",
      "name": "pop",
      "signature": "let pop: (. array<'a>) => option<'a>",
      "docstrings": ["`pop(array)` removes the last item from `array` and returns it.\n\nBeware this will *mutate* the array.\n\nSee [`Array.pop`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nlet lastItem = someArray->Array.pop // \"hello\"\n\nConsole.log(someArray) // [\"hi\"]. Notice last item is gone.\n```"]
    }, 
    {
      "id": "RescriptCore.Array.push",
      "kind": "value",
      "name": "push",
      "signature": "let push: (. array<'a>, 'a) => unit",
      "docstrings": ["`push(array, item)` appends `item` to the end of `array`.\n\nBeware this will *mutate* the array.\n\nSee [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nsomeArray->Array.push(\"yay\")\n\nConsole.log(someArray) // [\"hi\", \"hello\", \"yay\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.pushMany",
      "kind": "value",
      "name": "pushMany",
      "signature": "let pushMany: (. array<'a>, array<'a>) => unit",
      "docstrings": ["`pushMany(array, itemsArray)` appends many new items to the end of the array.\n\nBeware this will *mutate* the array.\n\nSee [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nsomeArray->Array.pushMany([\"yay\", \"wehoo\"])\n\nConsole.log(someArray) // [\"hi\", \"hello\", \"yay\", \"wehoo\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.reverse",
      "kind": "value",
      "name": "reverse",
      "signature": "let reverse: (. array<'a>) => unit",
      "docstrings": ["`reverse(array)` reverses the order of the items in `array`.\n\nBeware this will *mutate* the array.\n\nSee [`Array.reverse`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nsomeArray->Array.reverse\n\nConsole.log(someArray) // [\"hello\", \"h1\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.shift",
      "kind": "value",
      "name": "shift",
      "signature": "let shift: (. array<'a>) => option<'a>",
      "docstrings": ["`shift(array)` removes the first item in the array, and returns it.\n\nBeware this will *mutate* the array.\n\nSee [`Array.shift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nlet lastItem = someArray->Array.shift // \"hi\"\n\nConsole.log(someArray) // [\"hello\"]. Notice first item is gone.\n```"]
    }, 
    {
      "id": "RescriptCore.Array.toSorted",
      "kind": "value",
      "name": "toSorted",
      "signature": "let toSorted: (. array<'a>, (. 'a, 'a) => Core__Ordering.t) => array<'a>",
      "docstrings": ["`toSorted(array, comparator)` returns a new, sorted array from `array`, using the `comparator` function.\n\nSee [`Array.toSorted`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted) on MDN.\n\n## Examples\n```rescript\nlet someArray = [3, 2, 1]\nlet sorted = someArray->Array.toSorted(Int.compare)\n\nConsole.log(sorted) // [1, 2, 3]\nConsole.log(someArray) // [3, 2, 1]. Original unchanged\n```"]
    }, 
    {
      "id": "RescriptCore.Array.sort",
      "kind": "value",
      "name": "sort",
      "signature": "let sort: (. array<'a>, (. 'a, 'a) => Core__Ordering.t) => unit",
      "docstrings": ["`sort(array, comparator)` sorts `array` in-place using the `comparator` function.\n\nBeware this will *mutate* the array.\n\nSee [`Array.sort`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on MDN.\n\n## Examples\n```rescript\nlet someArray = [3, 2, 1]\nsomeArray->Array.sort((a, b) => float(a - b))\n\nConsole.log(someArray) // [1, 2, 3]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.splice",
      "kind": "value",
      "name": "splice",
      "signature": "let splice: (.\n  array<'a>,\n  ~start: int,\n  ~remove: int,\n  ~insert: array<'a>,\n) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.toSpliced",
      "kind": "value",
      "name": "toSpliced",
      "signature": "let toSpliced: (.\n  array<'a>,\n  ~start: int,\n  ~remove: int,\n  ~insert: array<'a>,\n) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.with",
      "kind": "value",
      "name": "with",
      "signature": "let with: (. array<'a>, int, 'a) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.unshift",
      "kind": "value",
      "name": "unshift",
      "signature": "let unshift: (. array<'a>, 'a) => unit",
      "docstrings": ["`unshift(array, item)` inserts a new item at the start of the array.\n\nBeware this will *mutate* the array.\n\nSee [`Array.unshift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nsomeArray->Array.unshift(\"yay\")\n\nConsole.log(someArray) // [\"yay\", \"hi\", \"hello\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.unshiftMany",
      "kind": "value",
      "name": "unshiftMany",
      "signature": "let unshiftMany: (. array<'a>, array<'a>) => unit",
      "docstrings": ["`unshiftMany(array, itemsArray)` inserts many new items to the start of the array.\n\nBeware this will *mutate* the array.\n\nSee [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nsomeArray->Array.unshiftMany([\"yay\", \"wehoo\"])\n\nConsole.log(someArray) // [\"yay\", \"wehoo\", \"hi\", \"hello\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.concat",
      "kind": "value",
      "name": "concat",
      "signature": "let concat: (. array<'a>, array<'a>) => array<'a>",
      "docstrings": ["`concat(array1, array2)` concatenates the two arrays, creating a new array.\n\nSee [`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) on MDN.\n\n## Examples\n```rescript\nlet array1 = [\"hi\", \"hello\"]\nlet array2 = [\"yay\", \"wehoo\"]\n\nlet someArray = array1->Array.concat(array2)\n\nConsole.log(someArray) // [\"hi\", \"hello\", \"yay\", \"wehoo\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.concatMany",
      "kind": "value",
      "name": "concatMany",
      "signature": "let concatMany: (. array<'a>, array<array<'a>>) => array<'a>",
      "docstrings": ["`concatMany(array1, arrays)` concatenates array1 with several other arrays, creating a new array.\n\nSee [`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) on MDN.\n\n## Examples\n```rescript\nlet array1 = [\"hi\", \"hello\"]\nlet array2 = [\"yay\"]\nlet array3 = [\"wehoo\"]\n\nlet someArray = array1->Array.concatMany([array2, array3])\n\nConsole.log(someArray) // [\"hi\", \"hello\", \"yay\", \"wehoo\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.flat",
      "kind": "value",
      "name": "flat",
      "signature": "let flat: (. array<array<'a>>) => array<'a>",
      "docstrings": ["`flat(arrays)` concatenates an array of arrays into a single array.\n\nSee [`Array.flat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) on MDN.\n\n## Examples\n```rescript\nConsole.log([[1], [2], [3, 4]]->Array.flat) // [1, 2, 3, 4]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.includes",
      "kind": "value",
      "name": "includes",
      "signature": "let includes: (. array<'a>, 'a) => bool",
      "docstrings": ["`includes(array, item)` checks whether `array` includes `item`, by doing a [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).\n\nSee [`Array.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) on MDN.\n\n## Examples\n```rescript\nConsole.log([1, 2]->Array.includes(1)) // true\nConsole.log([1, 2]->Array.includes(3)) // false\nConsole.log([{\"language\": \"ReScript\"}]->Array.includes({\"language\": \"ReScript\"})) // false, because of strict equality\n```"]
    }, 
    {
      "id": "RescriptCore.Array.indexOf",
      "kind": "value",
      "name": "indexOf",
      "signature": "let indexOf: (. array<'a>, 'a) => int",
      "docstrings": ["`indexOf(array, item)` returns the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.\n\nReturns `-1` if the item doesn not exist. Check out `Array.indexOfOpt` for a version that returns `None` instead of `-1` if the item does not exist.\n\nSee [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.\n\n## Examples\n```rescript\nConsole.log([1, 2]->Array.indexOf(2)) // 1\nConsole.log([1, 2]->Array.indexOf(3)) // -1\nConsole.log([{\"language\": \"ReScript\"}]->Array.indexOf({\"language\": \"ReScript\"})) // -1, because of strict equality\n```"]
    }, 
    {
      "id": "RescriptCore.Array.indexOfOpt",
      "kind": "value",
      "name": "indexOfOpt",
      "signature": "let indexOfOpt: (. array<'a>, 'a) => option<int>",
      "docstrings": ["`indexOfOpt(array, item)` returns an option of the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.\n\nSee [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.\n\n## Examples\n```rescript\nConsole.log([1, 2]->Array.indexOfOpt(2)) // Some(1)\nConsole.log([1, 2]->Array.indexOfOpt(3)) // None\nConsole.log([{\"language\": \"ReScript\"}]->Array.indexOfOpt({\"language\": \"ReScript\"})) // None, because of strict equality\n```"]
    }, 
    {
      "id": "RescriptCore.Array.indexOfFrom",
      "kind": "value",
      "name": "indexOfFrom",
      "signature": "let indexOfFrom: (. array<'a>, 'a, int) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.joinWith",
      "kind": "value",
      "name": "joinWith",
      "signature": "let joinWith: (. array<string>, string) => string",
      "docstrings": ["`joinWith(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Array items must be strings, to join number or other arrays, use `joinWithUnsafe`. Under the hood this will run JavaScript's `toString` on all the array items.\n\n## Examples\n```rescript\nlet array = [\"One\", \"Two\", \"Three\"]\n\nConsole.log(array->Array.joinWith(\" -- \")) // One -- Two -- Three\n```"]
    }, 
    {
      "id": "RescriptCore.Array.joinWithUnsafe",
      "kind": "value",
      "name": "joinWithUnsafe",
      "signature": "let joinWithUnsafe: (. array<'a>, string) => string",
      "docstrings": ["`joinWithUnsafe(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Under the hood this will run JavaScript's `toString` on all the array items.\n\n## Examples\n```rescript\nlet array = [1, 2, 3]\n\nConsole.log(array->Array.joinWithUnsafe(\" -- \")) // 1 -- 2 -- 3\n```"]
    }, 
    {
      "id": "RescriptCore.Array.lastIndexOf",
      "kind": "value",
      "name": "lastIndexOf",
      "signature": "let lastIndexOf: (. array<'a>, 'a) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.lastIndexOfOpt",
      "kind": "value",
      "name": "lastIndexOfOpt",
      "signature": "let lastIndexOfOpt: (. array<'a>, 'a) => option<int>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.lastIndexOfFrom",
      "kind": "value",
      "name": "lastIndexOfFrom",
      "signature": "let lastIndexOfFrom: (. array<'a>, 'a, int) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.slice",
      "kind": "value",
      "name": "slice",
      "signature": "let slice: (. array<'a>, ~start: int, ~end: int) => array<'a>",
      "docstrings": ["`slice(array, ~start, ~end)` creates a new array of items copied from `array` from `start` until (but not including) `end`.\n\nSee [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.\n\n## Examples\n```rescript\nlet myArray = [1, 2, 3, 4]\n\nConsole.log(myArray->Array.slice(~start=1, ~end=3)) // [2, 3]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.sliceToEnd",
      "kind": "value",
      "name": "sliceToEnd",
      "signature": "let sliceToEnd: (. array<'a>, ~start: int) => array<'a>",
      "docstrings": ["`sliceToEnd(array, start)` creates a new array from `array`, with all items from `array` starting from `start`.\n\nSee [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.\n\n## Examples\n```rescript\nlet myArray = [1, 2, 3, 4]\n\nConsole.log(myArray->Array.sliceToEnd(~start=1)) // [2, 3, 4]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.copy",
      "kind": "value",
      "name": "copy",
      "signature": "let copy: (. array<'a>) => array<'a>",
      "docstrings": ["`copy(array)` makes a copy of the array with the items in it, but does not make copies of the items themselves.\n\n## Examples\n```rescript\nlet myArray = [1, 2, 3]\nlet copyOfMyArray = myArray->Array.copy\n\nConsole.log(copyOfMyArray) // [1, 2, 3]\nConsole.log(myArray === copyOfMyArray) // false\n```"]
    }, 
    {
      "id": "RescriptCore.Array.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. array<'a>) => string",
      "docstrings": ["`toString(array)` stringifies `array` by running `toString` on all of the array elements and joining them with \",\".\n\nSee [`Array.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) on MDN.\n\n## Examples\n```rescript\nlet array = [1, 2, 3, 4]\n\nConsole.log(array->Array.toString) // \"1,2,3,4\"\n```"]
    }, 
    {
      "id": "RescriptCore.Array.toLocaleString",
      "kind": "value",
      "name": "toLocaleString",
      "signature": "let toLocaleString: (. array<'a>) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.every",
      "kind": "value",
      "name": "every",
      "signature": "let every: (. array<'a>, (. 'a) => bool) => bool",
      "docstrings": ["`every(array, predicate)` returns true if `predicate` returns true for all items in `array`.\n\nSee [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.\n\n## Examples\n```rescript\nlet array = [1, 2, 3, 4]\n\nConsole.log(array->Array.every(num => num > 4)) // true\nConsole.log(array->Array.every(num => num === 1)) // false\n```"]
    }, 
    {
      "id": "RescriptCore.Array.everyWithIndex",
      "kind": "value",
      "name": "everyWithIndex",
      "signature": "let everyWithIndex: (. array<'a>, (. 'a, int) => bool) => bool",
      "docstrings": ["`everyWithIndex(array, checker)` returns true if all items in `array` returns true when running the provided `checker` function.\n\nSee [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.\n\n## Examples\n```rescript\nlet array = [1, 2, 3, 4]\n\nConsole.log(array->Array.everyWithIndex((num, index) => index < 2 && num <= 2)) // true\nConsole.log(array->Array.everyWithIndex((num, index) => index < 2 && num >= 2)) // false\n```"]
    }, 
    {
      "id": "RescriptCore.Array.filter",
      "kind": "value",
      "name": "filter",
      "signature": "let filter: (. array<'a>, (. 'a) => bool) => array<'a>",
      "docstrings": ["`filter(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.\n\nSee [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.\n\n## Examples\n```rescript\nlet array = [1, 2, 3, 4]\n\nConsole.log(array->Array.filter(num => num > 2)) // [3, 4]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.filterWithIndex",
      "kind": "value",
      "name": "filterWithIndex",
      "signature": "let filterWithIndex: (. array<'a>, (. 'a, int) => bool) => array<'a>",
      "docstrings": ["`filterWithIndex(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.\n\nSee [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.\n\n## Examples\n```rescript\nlet array = [1, 2, 3, 4]\n\nConsole.log(array->Array.filterWithIndex((num, index) => index === 0 || num === 2)) // [1, 2]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.find",
      "kind": "value",
      "name": "find",
      "signature": "let find: (. array<'a>, (. 'a) => bool) => option<'a>",
      "docstrings": ["`find(array, checker)` returns the first element of `array` where the provided `checker` function returns true.\n\nSee [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.\n\n## Examples\n```rescript\ntype languages = ReScript | TypeScript | JavaScript\n\nlet array = [ReScript, TypeScript, JavaScript]\n\nswitch array->Array.find(item => item == ReScript) {\n| None => Console.log(\"No item...\")\n| Some(_) => Console.log(\"Yay, ReScript!\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Array.findWithIndex",
      "kind": "value",
      "name": "findWithIndex",
      "signature": "let findWithIndex: (. array<'a>, (. 'a, int) => bool) => option<'a>",
      "docstrings": ["`findWithIndex(array, checker)` returns the first element of `array` where the provided `checker` function returns true.\n\nSee [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.\n\n## Examples\n```rescript\ntype languages = ReScript | TypeScript | JavaScript\n\nlet array = [TypeScript, JavaScript, ReScript]\n\nswitch array->Array.findWithIndex((item, index) => index > 1 && item == ReScript) {\n| None => Console.log(\"No item...\")\n| Some(_) => Console.log(\"Yay, ReScript exists in a later position!\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Array.findIndex",
      "kind": "value",
      "name": "findIndex",
      "signature": "let findIndex: (. array<'a>, (. 'a) => bool) => int",
      "docstrings": ["`findIndex(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.\n\nReturns `-1` if the item does not exist. Consider using `Array.findIndexOpt` if you want an option instead (where `-1` would be `None`).\n\nSee [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.\n\n## Examples\n```rescript\ntype languages = ReScript | TypeScript | JavaScript\n\nlet array = [ReScript, JavaScript]\n\nConsole.log(array->Array.findIndex(item => item == ReScript)) // 0\nConsole.log(array->Array.findIndex(item => item == TypeScript)) // -1\n```"]
    }, 
    {
      "id": "RescriptCore.Array.findIndexWithIndex",
      "kind": "value",
      "name": "findIndexWithIndex",
      "signature": "let findIndexWithIndex: (. array<'a>, (. 'a, int) => bool) => int",
      "docstrings": ["`findIndexWithIndex(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.\n\nReturns `-1` if the item does not exist. Consider using `Array.findIndexOpt` if you want an option instead (where `-1` would be `None`).\n\nSee [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.\n\n## Examples\n```rescript\ntype languages = ReScript | TypeScript | JavaScript\n\nlet array = [ReScript, JavaScript]\n\nConsole.log(array->Array.findIndexWithIndex((item, index) => index === 0 && item == ReScript)) // 0\nConsole.log(array->Array.findIndex((item, index) => index === 0 && item == TypeScript)) // -1\n```"]
    }, 
    {
      "id": "RescriptCore.Array.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. array<'a>, (. 'a) => unit) => unit",
      "docstrings": ["`forEach(array, fn)` runs the provided `fn` on every element of `array`.\n\nSee [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\narray->Array.forEach(item => {\n  Console.log(item)\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Array.forEachWithIndex",
      "kind": "value",
      "name": "forEachWithIndex",
      "signature": "let forEachWithIndex: (. array<'a>, (. 'a, int) => unit) => unit",
      "docstrings": ["`forEachWithIndex(array, fn)` runs the provided `fn` on every element of `array`.\n\nSee [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\narray->Array.forEachWithIndex((item, index) => {\n  Console.log(\"At item \" ++ Int.toString(index) ++ \": \" ++ item)\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Array.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. array<'a>, (. 'a) => 'b) => array<'b>",
      "docstrings": ["`map(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.\n\nSee [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\nlet mappedArray = array->Array.map(greeting => greeting ++ \" to you\")\n\nConsole.log(mappedArray) // [\"Hello to you\", \"Hi to you\", \"Good bye to you\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.mapWithIndex",
      "kind": "value",
      "name": "mapWithIndex",
      "signature": "let mapWithIndex: (. array<'a>, (. 'a, int) => 'b) => array<'b>",
      "docstrings": ["`mapWithIndex(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.\n\nSee [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\nlet mappedArray =\n  array->Array.mapWithIndex((greeting, index) =>\n    greeting ++ \" at position \" ++ Int.toString(index)\n  )\n\nConsole.log(mappedArray) // [\"Hello at position 0\", \"Hi at position 1\", \"Good bye at position 2\"]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.reduce",
      "kind": "value",
      "name": "reduce",
      "signature": "let reduce: (. array<'a>, 'b, (. 'b, 'a) => 'b) => 'b",
      "docstrings": ["`reduce(xs, fn, init)`\n\n  Applies `fn` to each element of `xs` from beginning to end. Function `fn` has two parameters: the item from the list and an “accumulator”; which starts with a value of `init`. `reduce` returns the final value of the accumulator.\n\n  ```res example\n  Array.reduce([2, 3, 4], (a, b) => a + b, 1) == 10\n\n  Array.reduce([\"a\", \"b\", \"c\", \"d\"], (a, b) => a ++ b, \"\") == \"abcd\"\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.reduceWithIndex",
      "kind": "value",
      "name": "reduceWithIndex",
      "signature": "let reduceWithIndex: (. array<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b",
      "docstrings": ["`reduceWithIndex(xs, fn, init)`\n\n  Applies `fn` to each element of `xs` from beginning to end. Function `fn` has three parameters: the item from the array and an “accumulator”, which starts with a value of `init` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.\n\n  ```res example\n  Array.reduceWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.reduceRight",
      "kind": "value",
      "name": "reduceRight",
      "signature": "let reduceRight: (. array<'a>, 'b, (. 'b, 'a) => 'b) => 'b",
      "docstrings": ["`reduceRight(xs, fn, init)`\n\n  Works like `Array.reduce`; except that function `fn` is applied to each item of `xs` from the last back to the first.\n\n  ```res example\n  Array.reduceRight([\"a\", \"b\", \"c\", \"d\"], (a, b) => a ++ b, \"\") == \"dcba\"\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.reduceRightWithIndex",
      "kind": "value",
      "name": "reduceRightWithIndex",
      "signature": "let reduceRightWithIndex: (. array<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b",
      "docstrings": ["`reduceRightWithIndex(xs, f, init)`\n\n  Like `reduceRight`, but with an additional index argument on the callback function.\n\n  ```res example\n  Array.reduceRightWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.some",
      "kind": "value",
      "name": "some",
      "signature": "let some: (. array<'a>, (. 'a) => bool) => bool",
      "docstrings": ["`some(array, predicate)` returns true if `predicate` returns true for any element in `array`.\n\nSee [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\nConsole.log(array->Array.some(greeting => greeting === \"Hello\")) // true\n```"]
    }, 
    {
      "id": "RescriptCore.Array.someWithIndex",
      "kind": "value",
      "name": "someWithIndex",
      "signature": "let someWithIndex: (. array<'a>, (. 'a, int) => bool) => bool",
      "docstrings": ["`someWithIndex(array, checker)` returns true if running the provided `checker` function on any element in `array` returns true.\n\nSee [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\nConsole.log(array->Array.someWithIndex((greeting, index) => greeting === \"Hello\" && index === 0)) // true\n```"]
    }, 
    {
      "id": "RescriptCore.Array.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. array<'a>, int) => option<'a>",
      "docstrings": ["`get(array, index)` returns the element at `index` of `array`.\n\nReturns `None` if the index does not exist in the array. Equivalent to doing `array[index]` in JavaScript.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\narray->Array.get(0) == Some(\"Hello\") // true\narray->Array.get(3) == None // true\n```"]
    }, 
    {
      "id": "RescriptCore.Array.set",
      "kind": "value",
      "name": "set",
      "signature": "let set: (. array<'a>, int, 'a) => unit",
      "docstrings": ["`set(array, index, item)` sets the provided `item` at `index` of `array`.\n\nBeware this will *mutate* the array.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\narray->Array.set(1, \"Hello\")\n\nConsole.log(array[1]) // \"Hello\"\n```"]
    }, 
    {
      "id": "RescriptCore.Array.getSymbol",
      "kind": "value",
      "name": "getSymbol",
      "signature": "let getSymbol: (. array<'a>, Core__Symbol.t) => option<'b>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.getSymbolUnsafe",
      "kind": "value",
      "name": "getSymbolUnsafe",
      "signature": "let getSymbolUnsafe: (. array<'a>, Core__Symbol.t) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.setSymbol",
      "kind": "value",
      "name": "setSymbol",
      "signature": "let setSymbol: (. array<'a>, Core__Symbol.t, 'b) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Array.getUnsafe",
      "kind": "value",
      "name": "getUnsafe",
      "signature": "let getUnsafe: (. array<'a>, int) => 'a",
      "docstrings": ["`getUnsafe(array, index)` returns the element at `index` of `array`.\n\nThis is _unsafe_, meaning it will return `undefined` value if `index` does not exist in `array`.\n\nUse `Array.getUnsafe` only when you are sure the `index` exists (i.e. when using for-loop).\n\n## Examples\n```rescript\nfor index in 0 to array->Array.length - 1 {\n  let value = array->Array.getUnsafe(index)\n  Console.log(value)\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Array.setUnsafe",
      "kind": "value",
      "name": "setUnsafe",
      "signature": "let setUnsafe: (. array<'a>, int, 'a) => unit",
      "docstrings": ["`setUnsafe(array, index, item)` sets the provided `item` at `index` of `array`.\n\nBeware this will *mutate* the array, and is *unsafe*.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\narray->Array.setUnsafe(1, \"Hello\")\n\nConsole.log(array[1]) // \"Hello\"\n```"]
    }, 
    {
      "id": "RescriptCore.Array.findIndexOpt",
      "kind": "value",
      "name": "findIndexOpt",
      "signature": "let findIndexOpt: (. array<'a>, (. 'a) => bool) => option<int>",
      "docstrings": ["`findIndexOpt(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.\n\nReturns `None` if no item matches.\n\nSee [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.\n\n## Examples\n```rescript\ntype languages = ReScript | TypeScript | JavaScript\n\nlet array = [ReScript, TypeScript, JavaScript]\n\nswitch array->Array.findIndexOpt(item => item == ReScript) {\n| None => Console.log(\"Ahh, no ReScript...\")\n| Some(index) => Console.log(\"Yay, ReScript at index \" ++ Int.toString(index))\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Array.toReversed",
      "kind": "value",
      "name": "toReversed",
      "signature": "let toReversed: (. array<'a>) => array<'a>",
      "docstrings": ["`toReversed(array)` creates a new array with all items from `array` in reversed order.\n\nSee [`Array.toReversed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toReversed) on MDN.\n\n## Examples\n```rescript\nlet someArray = [\"hi\", \"hello\"]\nlet reversed = someArray->Array.toReversed\n\nConsole.log(reversed) // [\"hello\", \"h1\"]\nConsole.log(someArray) // [\"h1\", \"hello\"]. Original unchanged\n```"]
    }, 
    {
      "id": "RescriptCore.Array.filterMap",
      "kind": "value",
      "name": "filterMap",
      "signature": "let filterMap: (. array<'a>, (. 'a) => option<'b>) => array<'b>",
      "docstrings": ["`filterMap(array, fn)`\n\nCalls `fn` for each element and returns a new array containing results of the `fn` calls which are not `None`.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\nConsole.log(\n  array->Array.filterMap(item =>\n    switch item {\n    | \"Hello\" => Some(item->String.length)\n    | _ => None\n    }\n  ),\n) // [5]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.keepSome",
      "kind": "value",
      "name": "keepSome",
      "signature": "let keepSome: (. array<option<'a>>) => array<'a>",
      "docstrings": ["`keepSome(arr)`\n\n  Returns a new array containing `value` for all elements that are `Some(value)`\n  and ignoring every value that is `None`\n\n  ```res example\n  Array.keepSome([Some(1), None, Some(3)]) == [1, 3]\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.toShuffled",
      "kind": "value",
      "name": "toShuffled",
      "signature": "let toShuffled: (. array<'a>) => array<'a>",
      "docstrings": ["`toShuffled(array)` returns a new array with all items in `array` in a random order.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\nlet shuffledArray = array->Array.toShuffled\n\nConsole.log(shuffledArray)\n```"]
    }, 
    {
      "id": "RescriptCore.Array.shuffle",
      "kind": "value",
      "name": "shuffle",
      "signature": "let shuffle: (. array<'a>) => unit",
      "docstrings": ["`shuffle(array)` randomizes the position of all items in `array`.\n\nBeware this will *mutate* the array.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\narray->Array.shuffle\n\nConsole.log(array)\n```"]
    }, 
    {
      "id": "RescriptCore.Array.flatMap",
      "kind": "value",
      "name": "flatMap",
      "signature": "let flatMap: (. array<'a>, (. 'a) => array<'b>) => array<'b>",
      "docstrings": ["`flatMap(array, mapper)` returns a new array concatenating the arrays returned from running `mapper` on all items in `array`.\n\n## Examples\n```rescript\ntype language = ReScript | TypeScript | JavaScript\n\nlet array = [ReScript, TypeScript, JavaScript]\n\nConsole.log(\n  array->Array.flatMap(item =>\n    switch item {\n    | ReScript => [1, 2, 3]\n    | TypeScript => [4, 5, 6]\n    | JavaScript => [7, 8, 9]\n    }\n  ),\n)\n// [1, 2, 3, 4, 5, 6, 7, 8, 9]\n```"]
    }, 
    {
      "id": "RescriptCore.Array.findMap",
      "kind": "value",
      "name": "findMap",
      "signature": "let findMap: (. array<'a>, (. 'a) => option<'b>) => option<'b>",
      "docstrings": ["`findMap(arr, fn)`\n\n  Calls `fn` for each element and returns the first value from `fn` that is `Some(_)`.\n  Otherwise returns `None`\n\n  ```res example\n  Array.findMap([1, 2, 3], n => mod(n, 2) ? Some(n - 2) : None) == 0\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.at",
      "kind": "value",
      "name": "at",
      "signature": "let at: (. array<'a>, int) => option<'a>",
      "docstrings": ["`at(array, index)`\n\n  Get an element by its index. Negative indices count backwards from the last item.\n\n  ## Examples\n  ```rescript\n  [\"a\", \"b\", \"c\"]->Array.at(0) // Some(\"a\")\n  [\"a\", \"b\", \"c\"]->Array.at(2) // Some(\"c\")\n  [\"a\", \"b\", \"c\"]->Array.at(3) // None\n  [\"a\", \"b\", \"c\"]->Array.at(-1) // Some(\"c\")\n  [\"a\", \"b\", \"c\"]->Array.at(-3) // Some(\"a\")\n  [\"a\", \"b\", \"c\"]->Array.at(-4) // None\n  ```"]
    }, 
    {
      "id": "RescriptCore.Array.last",
      "kind": "value",
      "name": "last",
      "signature": "let last: (. array<'a>) => option<'a>",
      "docstrings": ["`last(array)` returns the last element of `array`.\n\nReturns `None` if the array is empty.\n\n## Examples\n```rescript\nlet array = [\"Hello\", \"Hi\", \"Good bye\"]\n\narray->Array.last == Some(\"Good bye\") // true\n[]->Array.last == None // true\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Console",
    "kind": "moduleAlias",
    "name": "Console",
    "docstrings": ["Functions for interacting with JavaScript console.\n\nSee: [`console`](https://developer.mozilla.org/en-US/docs/Web/API/Console)."],
    "items": [
    {
      "id": "RescriptCore.Console.assert_",
      "kind": "value",
      "name": "assert_",
      "signature": "let assert_: (. bool, 'a) => unit",
      "docstrings": ["`assert_(assertion, value)` print a message to console if `assertion` evaluates `false`. Does nothing if it's `true`.\n\nSee [`console.assert`](https://developer.mozilla.org/en-US/docs/Web/API/console/assert)\non MDN.\n\n## Examples\n\n```rescript\nConsole.assert_(false, \"Hello World!\")\nConsole.assert_(n == 42, \"The answer\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.assert2",
      "kind": "value",
      "name": "assert2",
      "signature": "let assert2: (. bool, 'a, 'b) => unit",
      "docstrings": ["`assert2(v1, v2)`. Like `assert_`, but with two arguments.\n\n## Examples\n\n```rescript\nConsole.assert2(false, \"Hello\", \"World\")\nConsole.assert2(n == 42, [1, 2, 3], '4')\n```"]
    }, 
    {
      "id": "RescriptCore.Console.assert3",
      "kind": "value",
      "name": "assert3",
      "signature": "let assert3: (. bool, 'a, 'b, 'c) => unit",
      "docstrings": ["`assert3(v1, v2, v3)`. Like `assert_`, but with three arguments.\n\n## Examples\n\n```rescript\nConsole.assert3(false, \"Hello\", \"World\", \"ReScript\")\nConsole.assert3(n == 42, \"One\", 2, #3)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.assert4",
      "kind": "value",
      "name": "assert4",
      "signature": "let assert4: (. bool, 'a, 'b, 'c, 'd) => unit",
      "docstrings": ["`assert4(v1, v2, v3, v4)`. Like `assert_`, but with four arguments.\n\n## Examples\n\n```rescript\nConsole.assert4(false, \"Hello\", \"World\", \"ReScript\", \"!!!\")\nConsole.assert4(m == 42, [1, 2], (3, 4), [#5, #6], #\"polyvar\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.assert5",
      "kind": "value",
      "name": "assert5",
      "signature": "let assert5: (. bool, 'a, 'b, 'c, 'd, 'e) => unit",
      "docstrings": ["`assert5(v1, v2, v3, v4, v5)`. Like `assert_`, but with five arguments.\n\n## Examples\n\n```rescript\nConsole.assert5(false, \"Hello\", \"World\", \"JS\", '!', '!')\nConsole.assert5(n == 42, [1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.assert6",
      "kind": "value",
      "name": "assert6",
      "signature": "let assert6: (. bool, 'a, 'b, 'c, 'd, 'e, 'f) => unit",
      "docstrings": ["`assert6(v1, v2)`. Like `assert_`, but with six arguments.\n\n## Examples\n\n```rescript\nConsole.assert6(false, \"Hello\", \"World\", \"JS\", '!', '!', '?')\nConsole.assert6(n == 42, [1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"}, 42)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.assertMany",
      "kind": "value",
      "name": "assertMany",
      "signature": "let assertMany: (. bool, array<'a>) => unit",
      "docstrings": ["`assertMany(assertion, arr)`. Like `assert_`, but variadic.\n\n## Examples\n\n```rescript\nConsole.assertMany(false, [\"Hello\", \"World\"])\nConsole.assertMany(n == 42, [1, 2, 3])\n```"]
    }, 
    {
      "id": "RescriptCore.Console.clear",
      "kind": "value",
      "name": "clear",
      "signature": "let clear: (. unit) => unit",
      "docstrings": ["`clear()` clears the console, if allowed.\n\nSee [`console.clear`](https://developer.mozilla.org/en-US/docs/Web/API/console/clear)\non MDN.\n\n## Examples\n\n```rescript\nConsole.clear()\n```"]
    }, 
    {
      "id": "RescriptCore.Console.count",
      "kind": "value",
      "name": "count",
      "signature": "let count: (. string) => unit",
      "docstrings": ["`count(label)` prints to the console the number of times it's been called with the given label.\n\nSee [`console.count`](https://developer.mozilla.org/en-US/docs/Web/API/console/count)\non MDN.\n\n## Examples\n\n```rescript\nConsole.count(\"rescript\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.countReset",
      "kind": "value",
      "name": "countReset",
      "signature": "let countReset: (. string) => unit",
      "docstrings": ["`countReset(label)` resets the count for the given label to 0.\n\nSee [`console.countReset`](https://developer.mozilla.org/en-US/docs/Web/API/console/countReset)\non MDN.\n\n## Examples\n\n```rescript\nConsole.countReset(\"rescript\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debug",
      "kind": "value",
      "name": "debug",
      "signature": "let debug: (. 'a) => unit",
      "docstrings": ["`debug(value)` print a debug message to console.\n\nSee [`console.debug`](https://developer.mozilla.org/en-US/docs/Web/API/console/debug)\non MDN.\n\n## Examples\n\n```rescript\nConsole.debug(\"Hello\")\nlet obj = {\"name\": \"ReScript\", \"version\": 10}\nConsole.debug(obj)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debug2",
      "kind": "value",
      "name": "debug2",
      "signature": "let debug2: (. 'a, 'b) => unit",
      "docstrings": ["`debug2(v1, v2)`. Like `debug`, but with two arguments.\n\n## Examples\n\n```rescript\nConsole.debug2(\"Hello\", \"World\")\nConsole.debug2([1, 2, 3], '4')\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debug3",
      "kind": "value",
      "name": "debug3",
      "signature": "let debug3: (. 'a, 'b, 'c) => unit",
      "docstrings": ["`debug3(v1, v2, v3)`. Like `debug`, but with three arguments.\n\n## Examples\n\n```rescript\nConsole.debug3(\"Hello\", \"World\", \"ReScript\")\nConsole.debug3(\"One\", 2, #3)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debug4",
      "kind": "value",
      "name": "debug4",
      "signature": "let debug4: (. 'a, 'b, 'c, 'd) => unit",
      "docstrings": ["`debug4(v1, v2, v3, v4)`. Like `debug`, but with four arguments.\n\n## Examples\n\n```rescript\nConsole.debug4(\"Hello\", \"World\", \"ReScript\", \"!!!\")\nConsole.debug4([1, 2], (3, 4), [#5, #6], #\"polyvar\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debug5",
      "kind": "value",
      "name": "debug5",
      "signature": "let debug5: (. 'a, 'b, 'c, 'd, 'e) => unit",
      "docstrings": ["`debug5(v1, v2, v3, v4, v5)`. Like `debug`, but with five arguments.\n\n## Examples\n\n```rescript\nConsole.debug5(\"Hello\", \"World\", \"JS\", '!', '!')\nConsole.debug5([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debug6",
      "kind": "value",
      "name": "debug6",
      "signature": "let debug6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit",
      "docstrings": ["`debug6(v1, v2, v3, v4, v5, v6)`. Like `debug`, but with six arguments.\n\n## Examples\n\n```rescript\nConsole.debug6(\"Hello\", \"World\", \"JS\", '!', '!', '?')\nConsole.debug6([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"}, 42)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.debugMany",
      "kind": "value",
      "name": "debugMany",
      "signature": "let debugMany: (. array<'a>) => unit",
      "docstrings": ["`debugMany(arr)`. Like `debug`, but variadic.\n\n## Examples\n\n```rescript\nConsole.debugMany([\"Hello\", \"World\"])\nConsole.debugMany([1, 2, 3])\n```"]
    }, 
    {
      "id": "RescriptCore.Console.dir",
      "kind": "value",
      "name": "dir",
      "signature": "let dir: (. 'a) => unit",
      "docstrings": ["`dir(object)` displays an interactive view of the object in the console.\n\nSee [`console.dir`](https://developer.mozilla.org/en-US/docs/Web/API/console/dir)\non MDN.\n\n## Examples\n\n```rescript\nConsole.dir({\"language\": \"rescript\", \"version\": 10.1.2})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.dirxml",
      "kind": "value",
      "name": "dirxml",
      "signature": "let dirxml: (. 'a) => unit",
      "docstrings": ["`dirxml(object)` displays an interactive tree view of an XML/HTML element in the console.\n\nSee [`console.dirxml`](https://developer.mozilla.org/en-US/docs/Web/API/console/dirxml)\non MDN."]
    }, 
    {
      "id": "RescriptCore.Console.error",
      "kind": "value",
      "name": "error",
      "signature": "let error: (. 'a) => unit",
      "docstrings": ["`error(value)` prints an error message to console.\n\nSee [`console.error`](https://developer.mozilla.org/en-US/docs/Web/API/console/error)\non MDN.\n\n## Examples\n\n```rescript\nConsole.error(\"error message\")\nConsole.error((\"error\", \"invalid value\"))\n```"]
    }, 
    {
      "id": "RescriptCore.Console.error2",
      "kind": "value",
      "name": "error2",
      "signature": "let error2: (. 'a, 'b) => unit",
      "docstrings": ["`error(v1, v2)`. Like `error`, but two arguments.\n\n## Examples\n\n```rescript\nConsole.error2(\"Error\", \"here\")\nConsole.error2((\"log\", \"error\"), \"message\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.error3",
      "kind": "value",
      "name": "error3",
      "signature": "let error3: (. 'a, 'b, 'c) => unit",
      "docstrings": ["`error3(v1, v2, v3)`. Like `error`, but three arguments.\n\n## Examples\n\n```rescript\nConsole.error3(\"Hello\", \"World\", \"!!!\")\nConsole.error3(#first, #second, #third)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.error4",
      "kind": "value",
      "name": "error4",
      "signature": "let error4: (. 'a, 'b, 'c, 'd) => unit",
      "docstrings": ["`error4(v1, v2, v3, v4)`. Like `error`, but with four arguments.\n\n## Examples\n\n```rescript\nConsole.error4(\"Hello\", \"World\", \"ReScript\", '!')\nConsole.error4(#first, #second, #third, (\"fourth\"))\n```"]
    }, 
    {
      "id": "RescriptCore.Console.error5",
      "kind": "value",
      "name": "error5",
      "signature": "let error5: (. 'a, 'b, 'c, 'd, 'e) => unit",
      "docstrings": ["`error5(v1, v2, v3, v4, v5)`. Like `error`, but with five arguments.\n\n## Examples\n\n```rescript\nConsole.error5('e', 'r, 'r', 'o', 'r')\nConsole.error5(1, #second, #third, (\"fourth\"), 'c')\n```"]
    }, 
    {
      "id": "RescriptCore.Console.error6",
      "kind": "value",
      "name": "error6",
      "signature": "let error6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit",
      "docstrings": ["`error6(v1, v2, v3, v4, v5, v6)`. Like `error`, but with six arguments.\n\n## Examples\n\n```rescript\nConsole.error6(\"Hello\", \"World\", \"from\", \"JS\", \"!!!\", '!')\nConsole.error6([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"}, 42)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.group",
      "kind": "value",
      "name": "group",
      "signature": "let group: (. string) => unit",
      "docstrings": ["`group(label)` creates a new \"group\" level with the given label.\n\nSee [`console.group`](https://developer.mozilla.org/en-US/docs/Web/API/console/group)\non MDN.\n\n## Example\n\n```rescript\nConsole.group(\"first group\")\nConsole.group(\"second group\")\nConsole.log(\"a message on the second level\")\nConsole.groupEnd()\nConsole.log(\"a message message on the first level\")\nConsole.groupEnd()\n```"]
    }, 
    {
      "id": "RescriptCore.Console.groupCollapsed",
      "kind": "value",
      "name": "groupCollapsed",
      "signature": "let groupCollapsed: (. string) => unit",
      "docstrings": ["`groupCollapsed(label)`. Like `group` but collapses the group initially.\n\nSee [`console.groupCollapsed`](https://developer.mozilla.org/en-US/docs/Web/API/console/groupCollapsed)\non MDN."]
    }, 
    {
      "id": "RescriptCore.Console.groupEnd",
      "kind": "value",
      "name": "groupEnd",
      "signature": "let groupEnd: (. unit) => unit",
      "docstrings": ["`groupEnd()` ends the current group.\n\nSee [`console.groupEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/groupEnd)\non MDN."]
    }, 
    {
      "id": "RescriptCore.Console.errorMany",
      "kind": "value",
      "name": "errorMany",
      "signature": "let errorMany: (. array<'a>) => unit",
      "docstrings": ["`errorMany(arr)`. Like `error`, but variadic.\n\n## Examples\n\n```rescript\nConsole.errorMany([\"Hello\", \"World\"])\nConsole.errorMany([1, 2, 3])\n```"]
    }, 
    {
      "id": "RescriptCore.Console.info",
      "kind": "value",
      "name": "info",
      "signature": "let info: (. 'a) => unit",
      "docstrings": ["`info(value)` print an informational message to console.\n\nSee [`console.info`](https://developer.mozilla.org/en-US/docs/Web/API/console/info)\non MDN.\n\n## Examples\n\n```rescript\nConsole.info(\"Information\")\nConsole.info((\"Hello\", \"JS\"))\n```"]
    }, 
    {
      "id": "RescriptCore.Console.info2",
      "kind": "value",
      "name": "info2",
      "signature": "let info2: (. 'a, 'b) => unit",
      "docstrings": ["`info2(v1, v2)`. Like `info`, but with two arguments.\n\n## Examples\n\n```rescript\nConsole.info2(\"Info\", \"failed to download\")\nConsole.info2(#info, {\"name\": \"ReScript\"})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.info3",
      "kind": "value",
      "name": "info3",
      "signature": "let info3: (. 'a, 'b, 'c) => unit",
      "docstrings": ["`info3(v1, v2, v3)`. Like `info`, but with three arguments.\n\n## Examples\n\n```rescript\nConsole.info3(\"Hello\", \"World\", \"ReScript\")\nConsole.info3([1, 2, 3], #4, #5)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.info4",
      "kind": "value",
      "name": "info4",
      "signature": "let info4: (. 'a, 'b, 'c, 'd) => unit",
      "docstrings": ["`info4(v1, v2, v3, v4)`. Like `info`, but with four arguments.\n\n## Examples\n\n```rescript\nConsole.info4(\"Hello\", \"World\", \"ReScript\", '!')\nConsole.info4([1, 2, 3], #4, #5, #lastinfo)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.info5",
      "kind": "value",
      "name": "info5",
      "signature": "let info5: (. 'a, 'b, 'c, 'd, 'e) => unit",
      "docstrings": ["`info5(v1, v2, v3, v4, v5)`. Like `info`, but with five arguments.\n\n## Examples\n\n```rescript\nConsole.info5(\"Hello\", \"World\", \"from\", \"JS\", \"!!!\")\nConsole.info5([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.info6",
      "kind": "value",
      "name": "info6",
      "signature": "let info6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit",
      "docstrings": ["`info6(v1, v2, v3, v4, v5, v6)`. Like `info`, but with six arguments.\n\n## Examples\n\n```rescript\nConsole.info6(\"Hello\", \"World\", \"from\", \"JS\", \"!!!\", '!')\nConsole.info6([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"}, 42)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.infoMany",
      "kind": "value",
      "name": "infoMany",
      "signature": "let infoMany: (. array<'a>) => unit",
      "docstrings": ["`infoMany(arr)`. Like `info`, but variadic.\n\n## Examples\n\n```rescript\nConsole.infoMany([\"Hello\", \"World\"])\nConsole.infoMany([1, 2, 3])\n```"]
    }, 
    {
      "id": "RescriptCore.Console.log",
      "kind": "value",
      "name": "log",
      "signature": "let log: (. 'a) => unit",
      "docstrings": ["`log(value)` print a message to console.\n\nSee [`console.log`](https://developer.mozilla.org/en-US/docs/Web/API/console/log)\non MDN.\n\n## Examples\n\n```rescript\nConsole.log(\"Hello\")\nlet obj = {\"name\": \"ReScript\", \"version\": 10}\nConsole.log(obj)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.log2",
      "kind": "value",
      "name": "log2",
      "signature": "let log2: (. 'a, 'b) => unit",
      "docstrings": ["`log2(v1, v2)`. Like `log`, but with two arguments.\n\n## Examples\n\n```rescript\nConsole.log2(\"Hello\", \"World\")\nConsole.log2([1, 2, 3], '4')\n```"]
    }, 
    {
      "id": "RescriptCore.Console.log3",
      "kind": "value",
      "name": "log3",
      "signature": "let log3: (. 'a, 'b, 'c) => unit",
      "docstrings": ["`log3(v1, v2, v3)`. Like `log`, but with three arguments.\n\n## Examples\n\n```rescript\nConsole.log3(\"Hello\", \"World\", \"ReScript\")\nConsole.log3(\"One\", 2, #3)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.log4",
      "kind": "value",
      "name": "log4",
      "signature": "let log4: (. 'a, 'b, 'c, 'd) => unit",
      "docstrings": ["`log4(v1, v2, v3, v4)`. Like `log`, but with four arguments.\n\n## Examples\n\n```rescript\nConsole.log4(\"Hello\", \"World\", \"ReScript\", \"!!!\")\nConsole.log4([1, 2], (3, 4), [#5, #6], #\"polyvar\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.log5",
      "kind": "value",
      "name": "log5",
      "signature": "let log5: (. 'a, 'b, 'c, 'd, 'e) => unit",
      "docstrings": ["`log5(v1, v2, v3, v4, v5)`. Like `log`, but with five arguments.\n\n## Examples\n\n```rescript\nConsole.log5(\"Hello\", \"World\", \"JS\", '!', '!')\nConsole.log5([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.log6",
      "kind": "value",
      "name": "log6",
      "signature": "let log6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit",
      "docstrings": ["`log6(v1, v2, v3, v4, v5, v6)`. Like `log`, but with six arguments.\n\n## Examples\n\n```rescript\nConsole.log6(\"Hello\", \"World\", \"JS\", '!', '!', '?')\nConsole.log6([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"}, 42)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.logMany",
      "kind": "value",
      "name": "logMany",
      "signature": "let logMany: (. array<'a>) => unit",
      "docstrings": ["`logMany(arr)`. Like `log`, but variadic.\n\n## Examples\n\n```rescript\nConsole.logMany([\"Hello\", \"World\"])\nConsole.logMany([1, 2, 3])\n```"]
    }, 
    {
      "id": "RescriptCore.Console.table",
      "kind": "value",
      "name": "table",
      "signature": "let table: (. 'a) => unit",
      "docstrings": ["`table(object)` displays an tabular view of the object in the console.\n\nSee [`console.table`](https://developer.mozilla.org/en-US/docs/Web/API/console/table)\non MDN.\n\n## Examples\n\n```rescript\nConsole.table({\"language\": \"rescript\", \"version\": 10.1.2})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.time",
      "kind": "value",
      "name": "time",
      "signature": "let time: (. string) => unit",
      "docstrings": ["`time(label)` creates a timer to measure how long an operation takes. `label`\nmust be a unique name. Call `console.timeEnd` with the same `label` to print\noutput time.\n\nSee [`console.time`](https://developer.mozilla.org/en-US/docs/Web/API/console/time)\non MDN.\n\n## Examples\n\n```rescript\nConsole.time(\"for_time\")\nfor x in 3 downto 1 {\n  Console.log(x)\n  Console.timeLog(\"for_time\")\n}\nConsole.timeEnd(\"for_time\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.timeEnd",
      "kind": "value",
      "name": "timeEnd",
      "signature": "let timeEnd: (. string) => unit",
      "docstrings": ["`timeEnd(label)` stops a timer created by `time`.\n\nSee [`console.timeEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/timeEnd)\non MDN.\n\n## Examples\n\n```rescript\nConsole.time(\"for_time\")\nfor x in 3 downto 1 {\n  Console.log(x)\n  Console.timeLog(\"for_time\")\n}\nConsole.timeEnd(\"for_time\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.timeLog",
      "kind": "value",
      "name": "timeLog",
      "signature": "let timeLog: (. string) => unit",
      "docstrings": ["`timeLog(label)` prints the current elapsed time of the given timer to the console.\n\nSee [`console.timeLog`](https://developer.mozilla.org/en-US/docs/Web/API/console/timeLog)\non MDN.\n\n## Examples\n\n```rescript\nConsole.time(\"for_time\")\nfor x in 3 downto 1 {\n  Console.log(x)\n  Console.timeLog(\"for_time\")\n}\nConsole.timeEnd(\"for_time\")\n```"]
    }, 
    {
      "id": "RescriptCore.Console.trace",
      "kind": "value",
      "name": "trace",
      "signature": "let trace: (. unit) => unit",
      "docstrings": ["`trace()` print a stack trace to console.\n\nSee [`console.trace`](https://developer.mozilla.org/en-US/docs/Web/API/console/trace)\non MDN.\n\n## Examples\n\n```rescript\nlet main = () => {\n  Console.trace()\n}\nmain()\n// In the console, the following trace will be displayed:\n// main\n// <anonymous>\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warn",
      "kind": "value",
      "name": "warn",
      "signature": "let warn: (. 'a) => unit",
      "docstrings": ["`warn(value)` print a warning message to console.\n\nSee [`console.warn`](https://developer.mozilla.org/en-US/docs/Web/API/console/warn)\non MDN.\n\n## Examples\n\n```rescript\nConsole.warn(\"Warning\")\nConsole.warn((\"Warning\", \"invalid number\"))\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warn2",
      "kind": "value",
      "name": "warn2",
      "signature": "let warn2: (. 'a, 'b) => unit",
      "docstrings": ["`warn2(v1, v2)`. Like `warn`, but two arguments.\n\n## Examples\n\n```rescript\nConsole.warn2(\"Hello\", \"World\")\nConsole.warn2([1, 2, 3], 4)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warn3",
      "kind": "value",
      "name": "warn3",
      "signature": "let warn3: (. 'a, 'b, 'c) => unit",
      "docstrings": ["`warn3(v1, v2, v3)`. Like `warn`, but three arguments.\n\n## Examples\n\n```rescript\nConsole.warn3(\"Hello\", \"World\", \"ReScript\")\nConsole.warn3([1, 2, 3], #4, #5)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warn4",
      "kind": "value",
      "name": "warn4",
      "signature": "let warn4: (. 'a, 'b, 'c, 'd) => unit",
      "docstrings": ["`warn4(v1, v2, v3, v4)`. Like `warn`, but with four arguments.\n\n## Examples\n\n```rescript\nConsole.warn4(\"Hello\", \"World\", \"ReScript\", \"!!!\")\nConsole.warn4(#first, #second, #third, (\"fourth\"))\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warn5",
      "kind": "value",
      "name": "warn5",
      "signature": "let warn5: (. 'a, 'b, 'c, 'd, 'e) => unit",
      "docstrings": ["`warn5(v1, v2, v3, v4, v5)`. Like `warn`, but with five arguments.\n\n## Examples\n\n```rescript\nConsole.warn5(\"Hello\", \"World\", \"from\", \"JS\", \"!!!\")\nConsole.warn5([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"})\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warn6",
      "kind": "value",
      "name": "warn6",
      "signature": "let warn6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit",
      "docstrings": ["`warn6(v1, v2, v3, v4, v5, v6)`. Like `warn`, but with six arguments.\n\n## Examples\n\n```rescript\nConsole.warn6(\"Hello\", \"World\", \"from\", \"JS\", \"!!!\", '!')\nConsole.warn6([1, 2], (3, 4), [#5, #6], #\"polyvar\", {\"name\": \"ReScript\"}, 42)\n```"]
    }, 
    {
      "id": "RescriptCore.Console.warnMany",
      "kind": "value",
      "name": "warnMany",
      "signature": "let warnMany: (. array<'a>) => unit",
      "docstrings": ["`warnMany(arr)`. Like `warn`, but variadic.\n\n## Examples\n\n```rescript\nConsole.warnMany([\"Hello\", \"World\"])\nConsole.warnMany([1, 2, 3])\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.DataView",
    "kind": "moduleAlias",
    "name": "DataView",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.DataView.t",
      "kind": "type",
      "name": "t",
      "signature": "type t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.buffer",
      "kind": "value",
      "name": "buffer",
      "signature": "let buffer: (. t) => Core__ArrayBuffer.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.byteLength",
      "kind": "value",
      "name": "byteLength",
      "signature": "let byteLength: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.byteOffset",
      "kind": "value",
      "name": "byteOffset",
      "signature": "let byteOffset: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getInt8",
      "kind": "value",
      "name": "getInt8",
      "signature": "let getInt8: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getUint8",
      "kind": "value",
      "name": "getUint8",
      "signature": "let getUint8: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getInt16",
      "kind": "value",
      "name": "getInt16",
      "signature": "let getInt16: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getUint16",
      "kind": "value",
      "name": "getUint16",
      "signature": "let getUint16: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getInt32",
      "kind": "value",
      "name": "getInt32",
      "signature": "let getInt32: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getUint32",
      "kind": "value",
      "name": "getUint32",
      "signature": "let getUint32: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getFloat32",
      "kind": "value",
      "name": "getFloat32",
      "signature": "let getFloat32: (. t) => float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getFloat64",
      "kind": "value",
      "name": "getFloat64",
      "signature": "let getFloat64: (. t) => float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getBigInt64",
      "kind": "value",
      "name": "getBigInt64",
      "signature": "let getBigInt64: (. t) => Core__BigInt.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.getBigUint64",
      "kind": "value",
      "name": "getBigUint64",
      "signature": "let getBigUint64: (. t) => Core__BigInt.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setInt8",
      "kind": "value",
      "name": "setInt8",
      "signature": "let setInt8: (. t, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setUint8",
      "kind": "value",
      "name": "setUint8",
      "signature": "let setUint8: (. t, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setInt16",
      "kind": "value",
      "name": "setInt16",
      "signature": "let setInt16: (. t, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setUint16",
      "kind": "value",
      "name": "setUint16",
      "signature": "let setUint16: (. t, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setInt32",
      "kind": "value",
      "name": "setInt32",
      "signature": "let setInt32: (. t, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setUint32",
      "kind": "value",
      "name": "setUint32",
      "signature": "let setUint32: (. t, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setFloat32",
      "kind": "value",
      "name": "setFloat32",
      "signature": "let setFloat32: (. t, float) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setFloat64",
      "kind": "value",
      "name": "setFloat64",
      "signature": "let setFloat64: (. t, float) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setBigInt64",
      "kind": "value",
      "name": "setBigInt64",
      "signature": "let setBigInt64: (. t, Core__BigInt.t) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.DataView.setBigUint64",
      "kind": "value",
      "name": "setBigUint64",
      "signature": "let setBigUint64: (. t, Core__BigInt.t) => unit",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.Date",
    "kind": "moduleAlias",
    "name": "Date",
    "docstrings": ["Functions for interacting with JavaScript Dates."],
    "items": [
    {
      "id": "RescriptCore.Date.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Date.t",
      "docstrings": ["A type representing a JavaScript date."]
    }, 
    {
      "id": "RescriptCore.Date.msSinceEpoch",
      "kind": "type",
      "name": "msSinceEpoch",
      "signature": "type msSinceEpoch = float",
      "docstrings": ["Time, in milliseconds, since / until the UNIX epoch (January 1, 1970 00:00:00 UTC).\nPositive numbers represent dates after, negative numbers dates before epoch."]
    }, 
    {
      "id": "RescriptCore.Date.localeOptions",
      "kind": "type",
      "name": "localeOptions",
      "signature": "type localeOptions = {\n  dateStyle?: [#full | #long | #medium | #short],\n  timeStyle?: [#full | #long | #medium | #short],\n  weekday?: [#long | #narrow | #short],\n  era?: [#long | #narrow | #short],\n  year?: [#\"2-digit\" | #numeric],\n  month?: [\n    | #\"2-digit\"\n    | #long\n    | #narrow\n    | #numeric\n    | #short\n  ],\n  day?: [#\"2-digit\" | #numeric],\n  hour?: [#\"2-digit\" | #numeric],\n  minute?: [#\"2-digit\" | #numeric],\n  second?: [#\"2-digit\" | #numeric],\n  timeZoneName?: [#long | #short],\n}",
      "docstrings": ["A type representing date time format options.\n\nNote: There are some properties missing:\n- fractionalSecondDigits\n- dayPeriod\n- calendar\n- numberingSystem\n- localeMatcher\n- timeZone\n- hour12\n- hourCycle\n- formatMatcher\n\nSee full spec at https://tc39.es/ecma402/#datetimeformat-objects"],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "dateStyle",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#full | #long | #medium | #short]>"
        }, {
          "name": "timeStyle",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#full | #long | #medium | #short]>"
        }, {
          "name": "weekday",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#long | #narrow | #short]>"
        }, {
          "name": "era",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#long | #narrow | #short]>"
        }, {
          "name": "year",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#\"2-digit\" | #numeric]>"
        }, {
          "name": "month",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#\"2-digit\" | #long | #narrow | #numeric | #short]>"
        }, {
          "name": "day",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#\"2-digit\" | #numeric]>"
        }, {
          "name": "hour",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#\"2-digit\" | #numeric]>"
        }, {
          "name": "minute",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#\"2-digit\" | #numeric]>"
        }, {
          "name": "second",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#\"2-digit\" | #numeric]>"
        }, {
          "name": "timeZoneName",
          "optional": true,
          "docstrings": [],
          "signature": "option<[#long | #short]>"
        }]
      }
    }, 
    {
      "id": "RescriptCore.Date.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. unit) => t",
      "docstrings": ["`make()`\n\nCreates a date object with the current date time as value.\n\n## Examples\n```rescript\nDate.make()\n```"]
    }, 
    {
      "id": "RescriptCore.Date.fromString",
      "kind": "value",
      "name": "fromString",
      "signature": "let fromString: (. string) => t",
      "docstrings": ["`fromString(dateTimeString)`\n\nCreates a date object from given date time string.\nThe string has to be in the ISO 8601 format YYYY-MM-DDTHH:mm:ss.sssZ (https://tc39.es/ecma262/#sec-date-time-string-format).\n\nInvalid date time strings will create invalid dates.\nYou can use the result like any valid date, but many functions like `toString` will return \"Invalid Date\" or functions like `Date.getTime` will return NaN.\n\n## Examples\n```rescript\nDate.fromString(\"2023\")\n// 2023-01-01T00:00:00.000Z\n\nDate.fromString(\"2023-02-20\")\n// 2023-02-20T00:00:00.000Z\n\nDate.fromString(\"2023-02-20T16:40:00.00Z\")\n// 2023-02-20T16:40:00.000Z\n\nDate.fromString(\"\")\n// Invalid Date\n\nDate.fromString(\"\")->getTime\n// NaN\n```"]
    }, 
    {
      "id": "RescriptCore.Date.fromTime",
      "kind": "value",
      "name": "fromTime",
      "signature": "let fromTime: (. msSinceEpoch) => t",
      "docstrings": ["`fromTime(msSinceEpoch)`\n\nCreates a date object from the given time in milliseconds since / until UNIX epoch (January 1, 1970 00:00:00 UTC).\nPositive numbers create dates after epoch, negative numbers create dates before epoch.\n\n## Examples\n```rescript\nDate.fromTime(0.0)\n// 1970-01-01T00:00:00.000Z\n\nDate.fromTime(-86_400_000.0)\n// 1969-12-31T00:00:00.000Z\n\nDate.fromTime(86_400_000.0)\n// 1970-01-02T00:00:00.000Z\n```"]
    }, 
    {
      "id": "RescriptCore.Date.makeWithYM",
      "kind": "value",
      "name": "makeWithYM",
      "signature": "let makeWithYM: (. ~year: int, ~month: int) => t",
      "docstrings": ["Creates a date object with the given year and month.\nBe aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\nMonths are 0-indexed (0 = January, 11 = December).\nValues, which are out of range, will be carried over to the next bigger unit (s. example).\n\n## Examples\n```rescript\nDate.makeWithYM(~year=2023, ~month=0)\n// 2023-01-01T00:00:00.000Z\n\nDate.makeWithYM(~year=2023, ~month=11)\n// 2023-12-01T00:00:00.000Z\n\nDate.makeWithYM(~year=2023, ~month=12)\n// 2024-01-01T00:00:00.000Z\n\nDate.makeWithYM(~year=2023, ~month=-1)\n// 2022-12-01T00:00:00.000Z\n\n// Note: The output depends on your local time zone.\n// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)\n\n```"]
    }, 
    {
      "id": "RescriptCore.Date.makeWithYMD",
      "kind": "value",
      "name": "makeWithYMD",
      "signature": "let makeWithYMD: (. ~year: int, ~month: int, ~date: int) => t",
      "docstrings": ["Creates a date object with the given year, month and date (day of month).\nBe aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\nMonths are 0-indexed (0 = January, 11 = December).\nValues, which are out of range, will be carried over to the next bigger unit (s. example).\n\n## Examples\n```rescript\nDate.makeWithYMD(~year=2023, ~month=1, ~date=20)\n// 2023-02-20T00:00:00.000Z\n\nDate.makeWithYMD(~year=2023, ~month=1, ~date=-1)\n// 2022-11-29T00:00:00.000Z\n\nDate.makeWithYMD(~year=2023, ~month=1, ~date=29)\n// 2023-03-01T00:00:00.000Z\n```"]
    }, 
    {
      "id": "RescriptCore.Date.makeWithYMDH",
      "kind": "value",
      "name": "makeWithYMDH",
      "signature": "let makeWithYMDH: (. ~year: int, ~month: int, ~date: int, ~hours: int) => t",
      "docstrings": ["Creates a date object with the given year, month, date (day of month) and hours.\nBe aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\nMonths are 0-indexed (0 = January, 11 = December).\nValues, which are out of range, will be carried over to the next bigger unit (s. example).\n\n## Examples\n```rescript\nDate.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=16)\n// 2023-02-20T16:00:00.000Z\n\nDate.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=24)\n// 2023-02-21T00:00:00.000Z\n\nDate.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=-1)\n// 2023-02-19T23:00:00.000Z\n\n// Note: The output depends on your local time zone.\n// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)\n\n```"]
    }, 
    {
      "id": "RescriptCore.Date.makeWithYMDHM",
      "kind": "value",
      "name": "makeWithYMDHM",
      "signature": "let makeWithYMDHM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n) => t",
      "docstrings": ["Creates a date object with the given year, month, date (day of month), hours and minutes.\nBe aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\nMonths are 0-indexed (0 = January, 11 = December).\nValues, which are out of range, will be carried over to the next bigger unit (s. example).\n\n## Examples\n```rescript\nDate.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40)\n// 2023-02-20T16:40:00.000Z\n\nDate.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=60)\n// 2023-02-20T17:00:00.000Z\n\nDate.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=-1)\n// 2023-02-20T15:59:00.000Z\n\n// Note: The output depends on your local time zone.\n// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)\n\n```"]
    }, 
    {
      "id": "RescriptCore.Date.makeWithYMDHMS",
      "kind": "value",
      "name": "makeWithYMDHMS",
      "signature": "let makeWithYMDHMS: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n) => t",
      "docstrings": ["Creates a date object with the given year, month, date (day of month), hours, minutes and seconds.\nBe aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\nMonths are 0-indexed (0 = January, 11 = December).\nValues, which are out of range, will be carried over to the next bigger unit (s. example).\n\n## Examples\n```rescript\nDate.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0)\n// 2023-02-20T16:40:00.000Z\n\nDate.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=60)\n// 2023-02-20T16:41:00.000Z\n\nDate.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=-1)\n// 2023-02-20T16:39:59.000Z\n\n// Note: The output depends on your local time zone.\n// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)\n\n```"]
    }, 
    {
      "id": "RescriptCore.Date.makeWithYMDHMSM",
      "kind": "value",
      "name": "makeWithYMDHMSM",
      "signature": "let makeWithYMDHMSM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => t",
      "docstrings": ["Creates a date object with the given year, month, date (day of month), hours, minutes, seconds and milliseconds.\nBe aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\nMonths are 0-indexed (0 = January, 11 = December).\nValues, which are out of range, will be carried over to the next bigger unit (s. example).\n\n## Examples\n```rescript\nDate.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=0)\n// 2023-02-20T16:40:00.000Z\n\nDate.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=1000)\n// 2023-02-20T16:40:01.000Z\n\nDate.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=-1)\n// 2023-02-20T16:39:59.999Z\n\n// Note: The output depends on your local time zone.\n// In nodejs you can change it by using the TZ env (`export TZ='Europe/London' && node index.bs.js`)\n\n```"]
    }, 
    {
      "id": "RescriptCore.Date.UTC",
      "name": "UTC",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Date.UTC.makeWithYM",
        "kind": "value",
        "name": "makeWithYM",
        "signature": "let makeWithYM: (. ~year: int, ~month: int) => msSinceEpoch",
        "docstrings": ["Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).\n  Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\n  Months are 0-indexed (0 = January, 11 = December).\n  Values, which are out of range, will be carried over to the next bigger unit (s. example).\n\n  ## Examples\n  ```rescript\n  Date.UTC.makeWithYM(~year=2023, ~month=0)\n  // 1672531200000\n\n  Date.UTC.makeWithYM(~year=2023, ~month=11)\n  // 1701388800000\n\n  Date.UTC.makeWithYM(~year=2023, ~month=12)\n  // 1704067200000\n\n  Date.UTC.makeWithYM(~year=2023, ~month=-1)\n  // 1669852800000\n  ```"]
      }, 
      {
        "id": "RescriptCore.Date.UTC.makeWithYMD",
        "kind": "value",
        "name": "makeWithYMD",
        "signature": "let makeWithYMD: (. ~year: int, ~month: int, ~date: int) => msSinceEpoch",
        "docstrings": ["Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).\n  Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\n  Months are 0-indexed (0 = January, 11 = December).\n  Values, which are out of range, will be carried over to the next bigger unit (s. example).\n\n  ## Examples\n  ```rescript\n  Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=20)\n  // 1676851200000\n\n  Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=-1)\n  // 1675036800000\n\n  Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=29)\n  // 1677628800000\n  ```"]
      }, 
      {
        "id": "RescriptCore.Date.UTC.makeWithYMDH",
        "kind": "value",
        "name": "makeWithYMDH",
        "signature": "let makeWithYMDH: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n) => msSinceEpoch",
        "docstrings": ["Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).\n  Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\n  Months are 0-indexed (0 = January, 11 = December).\n  Values, which are out of range, will be carried over to the next bigger unit (s. example).\n\n  ## Examples\n  ```rescript\n  Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=16)\n  // 1676908800000\n\n  Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=24)\n  // 1676937600000\n\n  Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=-1)\n  // 1676847600000\n  ```"]
      }, 
      {
        "id": "RescriptCore.Date.UTC.makeWithYMDHM",
        "kind": "value",
        "name": "makeWithYMDHM",
        "signature": "let makeWithYMDHM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n) => msSinceEpoch",
        "docstrings": ["Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).\n  Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\n  Months are 0-indexed (0 = January, 11 = December).\n  Values, which are out of range, will be carried over to the next bigger unit (s. example).\n\n  ## Examples\n  ```rescript\n  Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40)\n  // 1676911200000\n\n  Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=60)\n  // 1676912400000\n\n  Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=-1)\n  // 1676908740000\n  ```"]
      }, 
      {
        "id": "RescriptCore.Date.UTC.makeWithYMDHMS",
        "kind": "value",
        "name": "makeWithYMDHMS",
        "signature": "let makeWithYMDHMS: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n) => msSinceEpoch",
        "docstrings": ["Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).\n  Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\n  Months are 0-indexed (0 = January, 11 = December).\n  Values, which are out of range, will be carried over to the next bigger unit (s. example).\n\n  ## Examples\n  ```rescript\n  Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0)\n  // 1676911200000\n\n  Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=60)\n  // 1676911260000\n\n  Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=-1)\n  // 1676911199000\n  ```"]
      }, 
      {
        "id": "RescriptCore.Date.UTC.makeWithYMDHMSM",
        "kind": "value",
        "name": "makeWithYMDHMSM",
        "signature": "let makeWithYMDHMSM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => msSinceEpoch",
        "docstrings": ["Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).\n  Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).\n  Months are 0-indexed (0 = January, 11 = December).\n  Values, which are out of range, will be carried over to the next bigger unit (s. example).\n\n  ## Examples\n  ```rescript\n  ```\n  Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=0)->Console.log\n  // 1676911200000\n\n  Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=1000)->Console.log\n  // 1676911201000\n\n  Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=-1)->Console.log\n  // 1676911199999"]
      }]
    }, 
    {
      "id": "RescriptCore.Date.now",
      "kind": "value",
      "name": "now",
      "signature": "let now: (. unit) => msSinceEpoch",
      "docstrings": ["`now()`\n\nReturns the time, in milliseconds, between UNIX epoch (January 1, 1970 00:00:00 UTC) and the current date time."]
    }, 
    {
      "id": "RescriptCore.Date.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. t, t) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Date.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (. t, t) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Date.getTime",
      "kind": "value",
      "name": "getTime",
      "signature": "let getTime: (. t) => msSinceEpoch",
      "docstrings": ["`getTime(date)`\n\nReturns the time, in milliseconds, between UNIX epoch (January 1, 1970 00:00:00 UTC) and the current date time.\nInvalid dates will return NaN.\nDates before epoch will return negative numbers.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20\")->Date.getTime\n// 1676851200000\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getTimezoneOffset",
      "kind": "value",
      "name": "getTimezoneOffset",
      "signature": "let getTimezoneOffset: (. t) => int",
      "docstrings": ["`getTimezoneOffset(date)`\n\nReturns the time in minutes between the UTC time and the locale time.\nThe timezone of the given date doesn't matter.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01\")->Date.getTimezoneOffset\n// -60 with local time zone = Europe/Berlin\n\nDate.fromString(\"2023-06-01\")->Date.getTimezoneOffset\n// -120 with local time zone = Europe/Berlin\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getFullYear",
      "kind": "value",
      "name": "getFullYear",
      "signature": "let getFullYear: (. t) => int",
      "docstrings": ["`getFullYear(date)`\n\nReturns the year of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20\")->Date.getFullYear\n// 2023\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getMonth",
      "kind": "value",
      "name": "getMonth",
      "signature": "let getMonth: (. t) => int",
      "docstrings": ["`getMonth(date)`\n\nReturns the month (0-indexed) of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01\")->Date.getMonth\n// 0\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getDate",
      "kind": "value",
      "name": "getDate",
      "signature": "let getDate: (. t) => int",
      "docstrings": ["`getDate(date)`\n\nReturns the date (day of month) of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.getDate\n// 20\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getHours",
      "kind": "value",
      "name": "getHours",
      "signature": "let getHours: (. t) => int",
      "docstrings": ["`getHours(date)`\n\nReturns the hours of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.getHours\n// 16\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getMinutes",
      "kind": "value",
      "name": "getMinutes",
      "signature": "let getMinutes: (. t) => int",
      "docstrings": ["`getMinutes(date)`\n\nReturns the minutes of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.getMinutes\n// 40\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getSeconds",
      "kind": "value",
      "name": "getSeconds",
      "signature": "let getSeconds: (. t) => int",
      "docstrings": ["`getSeconds(date)`\n\nReturns the seconds of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.getSeconds\n// 0\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getMilliseconds",
      "kind": "value",
      "name": "getMilliseconds",
      "signature": "let getMilliseconds: (. t) => int",
      "docstrings": ["`getMilliseconds(date)`\n\nReturns the milliseconds of a given date (according to local time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.getMilliseconds\n// 0\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getDay",
      "kind": "value",
      "name": "getDay",
      "signature": "let getDay: (. t) => int",
      "docstrings": ["`getDay(date)`\n\nReturns the day of week of a given date (according to local time).\n0 = Sunday, 1 = Monday, ... 6 = Saturday\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.getDay\n// 1\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setFullYear",
      "kind": "value",
      "name": "setFullYear",
      "signature": "let setFullYear: (. t, int) => unit",
      "docstrings": ["`setFullYear(date, year)`\n\nSets the year of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setFullYear(2024)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setFullYearM",
      "kind": "value",
      "name": "setFullYearM",
      "signature": "let setFullYearM: (. t, ~year: int, ~month: int) => unit",
      "docstrings": ["`setFullYearM(date, ~year, ~month)`\n\nSets the year and month of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setFullYearM(~year=2024, ~month=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setFullYearMD",
      "kind": "value",
      "name": "setFullYearMD",
      "signature": "let setFullYearMD: (. t, ~year: int, ~month: int, ~date: int) => unit",
      "docstrings": ["`setFullYearMD(date, ~year, ~month, ~date)`\n\nSets the year, month and date (day of month) of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setFullYearMD(~year=2024, ~month=0, ~date=1)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setMonth",
      "kind": "value",
      "name": "setMonth",
      "signature": "let setMonth: (. t, int) => unit",
      "docstrings": ["`setMonth(date, month)`\n\nSets the month of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setMonth(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setDate",
      "kind": "value",
      "name": "setDate",
      "signature": "let setDate: (. t, int) => unit",
      "docstrings": ["`setDate(date, day)`\n\nSets the date (day of month) of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setDate(1)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setHours",
      "kind": "value",
      "name": "setHours",
      "signature": "let setHours: (. t, int) => unit",
      "docstrings": ["`setHours(date, hours)`\n\nSets the hours of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setHours(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setHoursM",
      "kind": "value",
      "name": "setHoursM",
      "signature": "let setHoursM: (. t, ~hours: int, ~minutes: int) => unit",
      "docstrings": ["`setHoursM(date, ~hours, ~minutes)`\n\nSets the hours and minutes of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setHoursM(~hours=0, ~minutes=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setHoursMS",
      "kind": "value",
      "name": "setHoursMS",
      "signature": "let setHoursMS: (. t, ~hours: int, ~minutes: int, ~seconds: int) => unit",
      "docstrings": ["`setHoursMS(date, ~hours, ~minutes, ~seconds)`\n\nSets the hours, minutes and seconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setHoursMS(~hours=0, ~minutes=0, ~seconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setHoursMSMs",
      "kind": "value",
      "name": "setHoursMSMs",
      "signature": "let setHoursMSMs: (.\n  t,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit",
      "docstrings": ["`setHoursMSMs(date, ~hours, ~minutes, ~seconds, ~milliseconds)`\n\nSets the hours, minutes, seconds and milliseconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setMinutes",
      "kind": "value",
      "name": "setMinutes",
      "signature": "let setMinutes: (. t, int) => unit",
      "docstrings": ["`setMinutes(date, minutes)`\n\nSets the minutes of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setMinutes(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setMinutesS",
      "kind": "value",
      "name": "setMinutesS",
      "signature": "let setMinutesS: (. t, ~minutes: int, ~seconds: int) => unit",
      "docstrings": ["`setMinutesS(date, ~minutes, ~seconds)`\n\nSets the minutes and seconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setMinutesS(~minutes=0, ~seconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setMinutesSMs",
      "kind": "value",
      "name": "setMinutesSMs",
      "signature": "let setMinutesSMs: (.\n  t,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit",
      "docstrings": ["`setMinutesSMs(date, ~minutes, ~seconds, ~milliseconds)`\n\nSets the minutes, seconds and milliseconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setMinutesSMs(~minutes=0, ~seconds=0, ~milliseconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setSeconds",
      "kind": "value",
      "name": "setSeconds",
      "signature": "let setSeconds: (. t, int) => unit",
      "docstrings": ["`setSeconds(date, seconds)`\n\nSets the seconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setSeconds(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setSecondsMs",
      "kind": "value",
      "name": "setSecondsMs",
      "signature": "let setSecondsMs: (. t, ~seconds: int, ~milliseconds: int) => unit",
      "docstrings": ["`setSecondsMs(date, ~seconds, ~milliseconds)`\n\nSets the seconds and milliseconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setSecondsMs(~seconds=0, ~milliseconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setMilliseconds",
      "kind": "value",
      "name": "setMilliseconds",
      "signature": "let setMilliseconds: (. t, int) => unit",
      "docstrings": ["`setMilliseconds(date, milliseconds)`\n\nSets the milliseconds of a date (according to local time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setMilliseconds(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCFullYear",
      "kind": "value",
      "name": "getUTCFullYear",
      "signature": "let getUTCFullYear: (. t) => int",
      "docstrings": ["`getUTCFullYear(date)`\n\nReturns the year of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCFullYear\n// 2022\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCMonth",
      "kind": "value",
      "name": "getUTCMonth",
      "signature": "let getUTCMonth: (. t) => int",
      "docstrings": ["`getUTCMonth(date)`\n\nReturns the month of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCMonth\n// 11\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCDate",
      "kind": "value",
      "name": "getUTCDate",
      "signature": "let getUTCDate: (. t) => int",
      "docstrings": ["`getUTCDate(date)`\n\nReturns the date (day of month) of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCDate\n// 31\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCHours",
      "kind": "value",
      "name": "getUTCHours",
      "signature": "let getUTCHours: (. t) => int",
      "docstrings": ["`getUTCHours(date)`\n\nReturns the hours of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCHours\n// 23\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCMinutes",
      "kind": "value",
      "name": "getUTCMinutes",
      "signature": "let getUTCMinutes: (. t) => int",
      "docstrings": ["`getUTCMinutes(date)`\n\nReturns the minutes of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCMinutes\n// 0\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCSeconds",
      "kind": "value",
      "name": "getUTCSeconds",
      "signature": "let getUTCSeconds: (. t) => int",
      "docstrings": ["`getUTCSeconds(date)`\n\nReturns the seconds of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCSeconds\n// 0\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCMilliseconds",
      "kind": "value",
      "name": "getUTCMilliseconds",
      "signature": "let getUTCMilliseconds: (. t) => int",
      "docstrings": ["`getUTCMilliseconds(date)`\n\nReturns the milliseconds of a given date (according to UTC time).\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCMilliseconds\n// 0\n```"]
    }, 
    {
      "id": "RescriptCore.Date.getUTCDay",
      "kind": "value",
      "name": "getUTCDay",
      "signature": "let getUTCDay: (. t) => int",
      "docstrings": ["`getUTCDay(date)`\n\nReturns the day (day of week) of a given date (according to UTC time).\n0 = Sunday, 1 = Monday, ... 6 = Saturday\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\").getUTCDay\n// 6\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCFullYear",
      "kind": "value",
      "name": "setUTCFullYear",
      "signature": "let setUTCFullYear: (. t, int) => unit",
      "docstrings": ["`setUTCFullYear(date, year)`\n\nSets the year of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCFullYear(2024)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCFullYearM",
      "kind": "value",
      "name": "setUTCFullYearM",
      "signature": "let setUTCFullYearM: (. t, ~year: int, ~month: int) => unit",
      "docstrings": ["`setUTCFullYearM(date, ~year, ~month)`\n\nSets the year and month of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCFullYearM(~year=2024, ~month=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCFullYearMD",
      "kind": "value",
      "name": "setUTCFullYearMD",
      "signature": "let setUTCFullYearMD: (. t, ~year: int, ~month: int, ~date: int) => unit",
      "docstrings": ["`setUTCFullYearMD(date, ~year, ~month, ~date)`\n\nSets the year, month and date (day of month) of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCFullYearMD(~year=2024, ~month=0, ~date=1)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCMonth",
      "kind": "value",
      "name": "setUTCMonth",
      "signature": "let setUTCMonth: (. t, int) => unit",
      "docstrings": ["`setUTCMonth(date, month)`\n\nSets the month of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCMonth(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCDate",
      "kind": "value",
      "name": "setUTCDate",
      "signature": "let setUTCDate: (. t, int) => unit",
      "docstrings": ["`setDate(date, day)`\n\nSets the date (day of month) of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCDate(1)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCHours",
      "kind": "value",
      "name": "setUTCHours",
      "signature": "let setUTCHours: (. t, int) => unit",
      "docstrings": ["`setUTCHours(date, hours)`\n\nSets the hours of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCHours(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCHoursM",
      "kind": "value",
      "name": "setUTCHoursM",
      "signature": "let setUTCHoursM: (. t, ~hours: int, ~minutes: int) => unit",
      "docstrings": ["`setHoursM(date, ~hours, ~minutes)`\n\nSets the hours and minutes of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCHoursM(~hours=0, ~minutes=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCHoursMS",
      "kind": "value",
      "name": "setUTCHoursMS",
      "signature": "let setUTCHoursMS: (. t, ~hours: int, ~minutes: int, ~seconds: int) => unit",
      "docstrings": ["`setUTCHoursMS(date, ~hours, ~minutes, ~seconds)`\n\nSets the hours, minutes and seconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCHoursMS(~hours=0, ~minutes=0, ~seconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCHoursMSMs",
      "kind": "value",
      "name": "setUTCHoursMSMs",
      "signature": "let setUTCHoursMSMs: (.\n  t,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit",
      "docstrings": ["`setUTCHoursMSMs(date, ~hours, ~minutes, ~seconds, ~milliseconds)`\n\nSets the hours, minutes, seconds and milliseconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCMinutes",
      "kind": "value",
      "name": "setUTCMinutes",
      "signature": "let setUTCMinutes: (. t, int) => unit",
      "docstrings": ["`setUTCMinutes(date, minutes)`\n\nSets the minutes of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCMinutes(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCMinutesS",
      "kind": "value",
      "name": "setUTCMinutesS",
      "signature": "let setUTCMinutesS: (. t, ~minutes: int, ~seconds: int) => unit",
      "docstrings": ["`setUTCMinutesS(date, ~minutes, ~seconds)`\n\nSets the minutes and seconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCMinutesS(~minutes=0, ~seconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCMinutesSMs",
      "kind": "value",
      "name": "setUTCMinutesSMs",
      "signature": "let setUTCMinutesSMs: (.\n  t,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit",
      "docstrings": ["`setUTCMinutesSMs(date, ~minutes, ~seconds, ~milliseconds)`\n\nSets the minutes, seconds and milliseconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCMinutesSMs(~minutes=0, ~seconds=0, ~milliseconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCSeconds",
      "kind": "value",
      "name": "setUTCSeconds",
      "signature": "let setUTCSeconds: (. t, int) => unit",
      "docstrings": ["`setUTCSeconds(date, seconds)`\n\nSets the seconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCSeconds(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCSecondsMs",
      "kind": "value",
      "name": "setUTCSecondsMs",
      "signature": "let setUTCSecondsMs: (. t, ~seconds: int, ~milliseconds: int) => unit",
      "docstrings": ["`setUTCSecondsMs(date, ~seconds, ~milliseconds)`\n\nSets the seconds and milliseconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCSecondsMs(~seconds=0, ~milliseconds=0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.setUTCMilliseconds",
      "kind": "value",
      "name": "setUTCMilliseconds",
      "signature": "let setUTCMilliseconds: (. t, int) => unit",
      "docstrings": ["`setUTCMilliseconds(date, milliseconds)`\n\nSets the milliseconds of a date (according to UTC time).\nBeware this will *mutate* the date.\n\n## Examples\n```rescript\nDate.fromString(\"2023-02-20T16:40:00.00\")->Date.setUTCMilliseconds(0)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toDateString",
      "kind": "value",
      "name": "toDateString",
      "signature": "let toDateString: (. t) => string",
      "docstrings": ["`toDateString(date)`\n\nConverts a JavaScript date to a standard date string. The date will be mapped to the current time zone.\nIf you want to convert it to a localized string, use `Date.toLocaleDateString` instead.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\")->Date.toDateString->Console.log\n// Sun Jan 01 2023\n\nDate.fromString(\"2023-01-01T00:00:00.00+08:00\")->Date.toDateString->Console.log\n// Sat Dec 31 2022\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t) => string",
      "docstrings": ["`toString(date)`\n\nConverts a JavaScript date to a standard date time string. The date will be mapped to the current time zone.\nIf you want to convert it to a localized string, use `Date.toLocaleString` instead.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\")->Date.toString->Console.log\n// Sun Jan 01 2023 00:00:00 GMT+0100 (Central European Standard Time)\n\nDate.fromString(\"2023-06-01T00:00:00.00+01:00\")->Date.toString->Console.log\n// Thu Jun 01 2023 01:00:00 GMT+0200 (Central European Summer Time)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toTimeString",
      "kind": "value",
      "name": "toTimeString",
      "signature": "let toTimeString: (. t) => string",
      "docstrings": ["`toTimeString(date)`\n\nConverts a JavaScript date to a standard time string. The date will be mapped to the current time zone.\nIf you want to convert it to a localized string, use `Date.toLocaleStimeString` instead.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+01:00\")->Date.toTimeString->Console.log\n// 00:00:00 GMT+0100 (Central European Standard Time)\n\nDate.fromString(\"2023-01-01T00:00:00.00+08:00\")->Date.toTimeString->Console.log\n// 17:00:00 GMT+0100 (Central European Standard Time)\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleDateString",
      "kind": "value",
      "name": "toLocaleDateString",
      "signature": "let toLocaleDateString: (. t) => string",
      "docstrings": ["`toLocaleDateString(date)`\n\nConverts a JavaScript date to a localized date string. It will use the current locale.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleDateString->Console.log\n// 2/19/2023\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleDateStringWithLocale",
      "kind": "value",
      "name": "toLocaleDateStringWithLocale",
      "signature": "let toLocaleDateStringWithLocale: (. t, string) => string",
      "docstrings": ["`toLocaleDateStringWithLocale(date, locale)`\n\nConverts a JavaScript date to a localized date string. It will use the specified locale.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleDateStringWithLocale(\"en-US\")->Console.log\n// 2/19/2023\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleDateStringWithLocaleAndOptions",
      "kind": "value",
      "name": "toLocaleDateStringWithLocaleAndOptions",
      "signature": "let toLocaleDateStringWithLocaleAndOptions: (. t, string, localeOptions) => string",
      "docstrings": ["`toLocaleDateStringWithLocaleAndOptions(date, locale, options)`\n\nConverts a JavaScript date to a localized date string. It will use the specified locale and formatting options.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleDateStringWithLocaleAndOptions(\"en-US\", { dateStyle: #long })->Console.log\n// February 19, 2023\n\nDate.make()->Date.toLocaleDateStringWithLocaleAndOptions(\"de\", { hour: #\"2-digit\", minute: #\"2-digit\" })->Console.log\n// 19.2.2023, 15:40\n\nDate.make()->Date.toLocaleDateStringWithLocaleAndOptions(\"de\", { year: #numeric })->Console.log\n// 2023\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleString",
      "kind": "value",
      "name": "toLocaleString",
      "signature": "let toLocaleString: (. t) => string",
      "docstrings": ["`toLocaleString(date)`\n\nConverts a JavaScript date to a localized date-time string. It will use the current locale.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleString->Console.log\n// 2/19/2023, 3:40:00 PM\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleStringWithLocale",
      "kind": "value",
      "name": "toLocaleStringWithLocale",
      "signature": "let toLocaleStringWithLocale: (. t, string) => string",
      "docstrings": ["`toLocaleStringWithLocale(date, locale)`\n\nConverts a JavaScript date to a localized date-time string. It will use the specified locale.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleStringWithLocale(\"en-US\")->Console.log\n// 2/19/2023, 3:40:00 PM\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleStringWithLocaleAndOptions",
      "kind": "value",
      "name": "toLocaleStringWithLocaleAndOptions",
      "signature": "let toLocaleStringWithLocaleAndOptions: (. t, string, localeOptions) => string",
      "docstrings": ["`toLocaleStringWithLocaleAndOptions(date, locale, options)`\n\nConverts a JavaScript date to a localized date-time string. It will use the specified locale and formatting options.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleStringWithLocaleAndOptions(\"en\", { dateStyle: #short, timeStyle: #short })->Console.log\n// 2/19/23, 3:40 PM\n\nDate.make()->Date.toLocaleStringWithLocaleAndOptions(\"en\", { era: #long, year: #numeric, month: #\"2-digit\", day: #\"2-digit\", hour: #numeric, timeZoneName: #short })->Console.log\n// 02/19/2023 Anno Domini, 3 PM GMT+1\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleTimeString",
      "kind": "value",
      "name": "toLocaleTimeString",
      "signature": "let toLocaleTimeString: (. t) => string",
      "docstrings": ["`toLocaleTimeString(date)`\n\nConverts a JavaScript date to a localized time string. It will use the current locale.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleTimeString->Console.log\n// 3:40:00 PM\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleTimeStringWithLocale",
      "kind": "value",
      "name": "toLocaleTimeStringWithLocale",
      "signature": "let toLocaleTimeStringWithLocale: (. t, string) => string",
      "docstrings": ["`toLocaleTimeStringWithLocale(date, locale)`\n\nConverts a JavaScript date to a localized time string. It will use the specified locale.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleTimeStringWithLocale(\"en-US\")->Console.log\n// 3:40:00 PM\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toLocaleTimeStringWithLocaleAndOptions",
      "kind": "value",
      "name": "toLocaleTimeStringWithLocaleAndOptions",
      "signature": "let toLocaleTimeStringWithLocaleAndOptions: (. t, string, localeOptions) => string",
      "docstrings": ["`toLocaleTimeStringWithLocaleAndOptions(date, locale, options)`\n\nConverts a JavaScript date to a localized time string. It will use the specified locale and formatting options.\n\n## Examples\n```rescript\nDate.make()->Date.toLocaleTimeStringWithLocaleAndOptions(\"en-US\", { timeStyle: #long })->Console.log\n// 3:40:00 PM GMT+1\n\nDate.make()->Date.toLocaleTimeStringWithLocaleAndOptions(\"de\", { hour: #\"2-digit\", minute: #\"2-digit\" })->Console.log\n// 15:40\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toISOString",
      "kind": "value",
      "name": "toISOString",
      "signature": "let toISOString: (. t) => string",
      "docstrings": ["`toISOString(date)`\n\nConverts a JavaScript date to a ISO 8601 string (YYYY-MM-DDTHH:mm:ss.sssZ). The date will be mapped to the UTC time.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+00:00\")->Date.toISOString->Console.log\n// 2023-01-01T00:00:00.000Z\n\nDate.fromString(\"2023-01-01T00:00:00.00+08:00\")->Date.toISOString->Console.log\n// 2022-12-31T16:00:00.000Z\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toUTCString",
      "kind": "value",
      "name": "toUTCString",
      "signature": "let toUTCString: (. t) => string",
      "docstrings": ["`toUTCString(date)`\n\nConverts a JavaScript date to date time string. The date will be mapped to the UTC time.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+00:00\")->Date.toUTCString->Console.log\n// Sun, 01 Jan 2023 00:00:00 GMT\n\nDate.fromString(\"2023-01-01T00:00:00.00+08:00\")->Date.toUTCString->Console.log\n// Sat, 31 Dec 2022 16:00:00 GMT\n```"]
    }, 
    {
      "id": "RescriptCore.Date.toJSON",
      "kind": "value",
      "name": "toJSON",
      "signature": "let toJSON: (. t) => option<string>",
      "docstrings": ["`toJSON(date)`\n\nConverts a JavaScript date to a string.\nIf the date is valid, the function will return the same result as `Date.toISOString`.\nInvalid dates will return `None`.\n\n## Examples\n```rescript\nDate.fromString(\"2023-01-01T00:00:00.00+00:00\")->Date.toJSON\n// Some(\"2023-01-01T00:00:00.000Z\")\n\nDate.fromString(\"\")->Date.toJSON\n// None\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Dict",
    "kind": "moduleAlias",
    "name": "Dict",
    "docstrings": ["A mutable dictionary with string keys.\n\nCompiles to a regular JavaScript object."],
    "items": [
    {
      "id": "RescriptCore.Dict.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = Js.Dict.t<'a>",
      "docstrings": ["Type representing a dictionary of value `'a`."]
    }, 
    {
      "id": "RescriptCore.Dict.getUnsafe",
      "kind": "value",
      "name": "getUnsafe",
      "signature": "let getUnsafe: (. t<'a>, string) => 'a",
      "docstrings": ["`getUnsafe(dict, key)` Returns the `value` at the provided `key`.\n\nThis is _unsafe_, meaning it will return `undefined` value if `key` does not exist in `dict`.\n\nUse `Dict.getUnsafe` only when you are sure the key exists (i.e. when iterating `Dict.keys` result).\n\n## Examples\n```rescript\nlet keys = dict->Dict.keys\nkeys->Array.forEach(key => {\n  let value = dict->Dict.getUnsafe(key)\n  Console.log(value)\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. t<'a>, string) => option<'a>",
      "docstrings": ["Returns the value at the provided key, if it exists. Returns an option.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([(\"someKey\", \"someValue\")])\n\nswitch dict->Dict.get(\"someKey\") {\n| None => Console.log(\"Nope, didn't have the key.\")\n| Some(value) => Console.log(value)\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.set",
      "kind": "value",
      "name": "set",
      "signature": "let set: (. t<'a>, string, 'a) => unit",
      "docstrings": ["`set(dictionary, key, value)` sets the value at the provided key to the provided value.\n\n## Examples\n```rescript\nlet dict = Dict.make()\n\ndict->Dict.set(\"someKey\", \"someValue\")\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.delete",
      "kind": "value",
      "name": "delete",
      "signature": "let delete: (. t<'a>, string) => unit",
      "docstrings": ["`delete(dictionary, key)` deletes the value at `key`, if it exists.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([(\"someKey\", \"someValue\")])\n\ndict->Dict.delete(\"someKey\")\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. unit) => t<'a>",
      "docstrings": ["`make()` creates a new, empty dictionary.\n\n## Examples\n```rescript\nlet dict1: Dict.t<int> = Dict.make() // You can annotate the type of the values of your dict yourself if you want\n\nlet dict2 = Dict.make() // Or you can let ReScript infer it via usage.\ndict2->Dict.set(\"someKey\", 12)\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<(string, 'a)>) => t<'a>",
      "docstrings": ["`fromArray(entries)` creates a new dictionary from the provided array of key/value pairs.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([(\"key1\", \"value1\"), (\"key2\", \"value2\")])\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.fromIterator",
      "kind": "value",
      "name": "fromIterator",
      "signature": "let fromIterator: (. Core__Iterator.t<(string, 'a)>) => t<'a>",
      "docstrings": ["`fromIterator(entries)` creates a new dictionary from the provided iterator of key/value pairs.\n\n## Examples\n```rescript\n// Pretend we have an iterator of the correct shape\n@val external someIterator: Iterator.t<(string, int)> = \"someIterator\"\n\nlet dict = Dict.fromIterator(someIterator) // Dict.t<int>\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.toArray",
      "kind": "value",
      "name": "toArray",
      "signature": "let toArray: (. t<'a>) => array<(string, 'a)>",
      "docstrings": ["`toArray(dictionary)` returns an array of all the key/value pairs of the dictionary.\n\n## Examples\n```rescript\nlet dict = Dict.make()\ndict->Dict.set(\"someKey\", 1)\ndict->Dict.set(\"someKey2\", 2)\nlet asArray = dict->Dict.toArray\nConsole.log(asArray) // Logs `[[\"someKey\", 1], [\"someKey2\", 2]]` to the console\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.keysToArray",
      "kind": "value",
      "name": "keysToArray",
      "signature": "let keysToArray: (. t<'a>) => array<string>",
      "docstrings": ["`keysToArray(dictionary)` returns an array of all the keys of the dictionary.\n\n## Examples\n```rescript\nlet dict = Dict.make()\ndict->Dict.set(\"someKey\", 1)\ndict->Dict.set(\"someKey2\", 2)\nlet keys = dict->Dict.keysToArray\nConsole.log(keys) // Logs `[\"someKey\", \"someKey2\"]` to the console\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.valuesToArray",
      "kind": "value",
      "name": "valuesToArray",
      "signature": "let valuesToArray: (. t<'a>) => array<'a>",
      "docstrings": ["`valuesToArray(dictionary)` returns an array of all the values of the dictionary.\n\n## Examples\n```rescript\nlet dict = Dict.make()\ndict->Dict.set(\"someKey\", 1)\ndict->Dict.set(\"someKey2\", 2)\nlet values = dict->Dict.valuesToArray\nConsole.log(values) // Logs `[1, 2]` to the console\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.assign",
      "kind": "value",
      "name": "assign",
      "signature": "let assign: (. t<'a>, t<'a>) => t<'a>",
      "docstrings": ["`assign(dictionary1, dictionary2)` [shallowly](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) merges dictionary2 into dictionary1, and returns dictionary1.\n\nBeware this will *mutate* dictionary1. If you're looking for a way to copy a dictionary, check out `Dict.copy`.\n\n## Examples\n```rescript\nlet dict1 = Dict.make()\ndict1->Dict.set(\"firstKey\", 1)\nConsole.log(dict1->Dict.keysToArray) // Logs `[\"firstKey\"]`\n\nlet dict2 = Dict.make()\ndict2->Dict.set(\"someKey\", 2)\ndict2->Dict.set(\"someKey2\", 3)\n\nlet dict1 = dict1->Dict.assign(dict2)\n\nConsole.log(dict1->Dict.keysToArray) // Logs `[\"firstKey\", \"someKey\", \"someKey2\"]`\n\n```"]
    }, 
    {
      "id": "RescriptCore.Dict.copy",
      "kind": "value",
      "name": "copy",
      "signature": "let copy: (. t<'a>) => t<'a>",
      "docstrings": ["`copy(dictionary)` [shallowly copies](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) the provided dictionary to a new dictionary.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([(\"key1\", \"value1\"), (\"key2\", \"value2\")])\nlet dict2 = dict->Dict.copy\n\n// Both log `[\"key1\", \"key2\"]` here.\nConsole.log2(dict->Dict.keysToArray, dict2->Dict.keysToArray)\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Error",
    "kind": "moduleAlias",
    "name": "Error",
    "docstrings": ["Functions for working with JavaScript exceptions.\n\nSee [`Error`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error) on MDN."],
    "items": [
    {
      "id": "RescriptCore.Error.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Exn.t",
      "docstrings": ["Represents a JavaScript exception."]
    }, 
    {
      "id": "RescriptCore.Error.fromException",
      "kind": "value",
      "name": "fromException",
      "signature": "let fromException: (. exn) => option<t>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Error.toException",
      "kind": "value",
      "name": "toException",
      "signature": "let toException: (. t) => exn",
      "docstrings": ["Turns an `Error.t` into an `exn`.\n\n## Examples\n```rescript\nlet error = Error.make(\"Something went wrong.\")\n\nlet asExn = error->Error.toException // `asExn` is now type `exn`\n```"]
    }, 
    {
      "id": "RescriptCore.Error.stack",
      "kind": "value",
      "name": "stack",
      "signature": "let stack: (. t) => option<string>",
      "docstrings": ["`stack(error)` retrieves the `stack` property of the error, if it exists. The stack is a list of what functions were called, and what files they are defined in, prior to the error happening.\n\nSee [`Error.prototype.stack`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Stack) on MDN.\n\n## Example\n```rescript\nConsole.log(someError->Error.stack) // Logs `stack` if it exists on `someError`\n```"]
    }, 
    {
      "id": "RescriptCore.Error.message",
      "kind": "value",
      "name": "message",
      "signature": "let message: (. t) => option<string>",
      "docstrings": ["`message(error)` retrieves the `message` property of the error, if it exists.\n\nSee [`Error.prototype.message`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message) on MDN.\n\n## Example\n```rescript\nlet error = Error.SyntaxError.make(\"Some message here\")\nConsole.log(error->Error.message) // Logs \"Some message here\" to the console\n```"]
    }, 
    {
      "id": "RescriptCore.Error.name",
      "kind": "value",
      "name": "name",
      "signature": "let name: (. t) => option<string>",
      "docstrings": ["`name(error)` retrieves the `name` property of the error, if it exists.\n\nSee [`Error.prototype.name`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name) on MDN.\n\n## Example\n```rescript\nlet error = Error.SyntaxError.make(\"Some message here\")\nConsole.log(error->Error.name) // Logs \"SyntaxError\" to the console\n```"]
    }, 
    {
      "id": "RescriptCore.Error.fileName",
      "kind": "value",
      "name": "fileName",
      "signature": "let fileName: (. t) => option<string>",
      "docstrings": ["`fileName(error)` retrieves the `fileName` property of the error, if it exists.\n\nSee [`Error.prototype.fileName`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/fileName) on MDN."]
    }, 
    {
      "id": "RescriptCore.Error.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. string) => t",
      "docstrings": ["`make(message)` creates a new error, setting its `message` to the provided value.\n\nSee [`Error`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Error) on MDN.\n\n## Example\n```rescript\nlet error = Error.make(\"Some message here\")\nConsole.log(error->Error.message) // Logs \"Some message here\" to the console\nConsole.log(error->Error.name) // Logs \"Error\" to the console, because this is a regular error\n```"]
    }, 
    {
      "id": "RescriptCore.Error.EvalError",
      "name": "EvalError",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Error.EvalError.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": ["Creates a new `EvalError` with the provided `message`.\n\n  See [`EvalError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/EvalError) on MDN."]
      }]
    }, 
    {
      "id": "RescriptCore.Error.RangeError",
      "name": "RangeError",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Error.RangeError.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": ["Creates a new `RangeError` with the provided `message`.\n\n  See [`RangeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RangeError) on MDN."]
      }]
    }, 
    {
      "id": "RescriptCore.Error.ReferenceError",
      "name": "ReferenceError",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Error.ReferenceError.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": ["Creates a new `ReferenceError` with the provided `message`.\n\n  See [`ReferenceError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError) on MDN."]
      }]
    }, 
    {
      "id": "RescriptCore.Error.SyntaxError",
      "name": "SyntaxError",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Error.SyntaxError.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": ["Creates a new `SyntaxError` with the provided `message`.\n\n  See [`SyntaxError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError) on MDN."]
      }]
    }, 
    {
      "id": "RescriptCore.Error.TypeError",
      "name": "TypeError",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Error.TypeError.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": ["Creates a new `TypeError` with the provided `message`.\n\n  See [`TypeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) on MDN."]
      }]
    }, 
    {
      "id": "RescriptCore.Error.URIError",
      "name": "URIError",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Error.URIError.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": ["Creates a new `URIError` with the provided `message`.\n\n  See [`URIError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/URIError) on MDN."]
      }]
    }, 
    {
      "id": "RescriptCore.Error.raise",
      "kind": "value",
      "name": "raise",
      "signature": "let raise: (. t) => 'a",
      "docstrings": ["Raises (throws in JavaScript language) the provided `Error.t`, which will stop execution.\n\n## Examples\n```rescript\nlet error = Error.make(\"Everything is upside down.\")\n\nif 5 > 10 {\n  error->Error.raise\n} else {\n  Console.log(\"Phew, sanity still rules.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Error.panic",
      "kind": "value",
      "name": "panic",
      "signature": "let panic: (. string) => 'a",
      "docstrings": ["Raises a panic exception with the given message.\n\nA panic exception is a native JavaScript exception that is not intended to be caught and\nhandled. Compared to a ReScript exception this will give a better stack trace and\ndebugging experience.\n\n## Examples\n```rescript\nError.panic(\"Uh oh. This was unexpected!\")\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Float",
    "kind": "moduleAlias",
    "name": "Float",
    "docstrings": ["Functions for interacting with float."],
    "items": [
    {
      "id": "RescriptCore.Float.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Float.Constants.nan",
        "kind": "value",
        "name": "nan",
        "signature": "let nan: float",
        "docstrings": ["The special value \"Not a Number\"\n  See [`NaN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Float.Constants.nan\n  ```"]
      }, 
      {
        "id": "RescriptCore.Float.Constants.epsilon",
        "kind": "value",
        "name": "epsilon",
        "signature": "let epsilon: float",
        "docstrings": ["Represents the difference between 1 and the smallest floating point number greater than 1.\n  See [`Number.EPSILON`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/EPSILON) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Float.Constants.epsilon\n  ```"]
      }, 
      {
        "id": "RescriptCore.Float.Constants.positiveInfinity",
        "kind": "value",
        "name": "positiveInfinity",
        "signature": "let positiveInfinity: float",
        "docstrings": ["The positive Infinity value\n  See [`Number.POSITIVE_INFINITY`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Float.Constants.positiveInfinity\n  ```"]
      }, 
      {
        "id": "RescriptCore.Float.Constants.negativeInfinity",
        "kind": "value",
        "name": "negativeInfinity",
        "signature": "let negativeInfinity: float",
        "docstrings": ["The negative Infinity value\n  See [`Number.NEGATIVE_INFINITY`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Float.Constants.negativeInfinity\n  ```"]
      }, 
      {
        "id": "RescriptCore.Float.Constants.minValue",
        "kind": "value",
        "name": "minValue",
        "signature": "let minValue: float",
        "docstrings": ["The smallest positive numeric value representable in JavaScript.\n  See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Float.Constants.minValue\n  ```"]
      }, 
      {
        "id": "RescriptCore.Float.Constants.maxValue",
        "kind": "value",
        "name": "maxValue",
        "signature": "let maxValue: float",
        "docstrings": ["The maximum positive numeric value representable in JavaScript.\n  See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Float.Constants.minValue\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.Float.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. float, float) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Float.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (. float, float) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Float.isNaN",
      "kind": "value",
      "name": "isNaN",
      "signature": "let isNaN: (. float) => bool",
      "docstrings": ["`isNaN(v)` tests if the given `v` is `NaN`.\nSee [`NaN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) on MDN.\n\n## Examples\n\n```rescript\nFloat.isNaN(3.0) // false\nFloat.isNaN(Float.Constants.nan) // true\n```"]
    }, 
    {
      "id": "RescriptCore.Float.isFinite",
      "kind": "value",
      "name": "isFinite",
      "signature": "let isFinite: (. float) => bool",
      "docstrings": ["`isFinite(v)` tests if the given `v` is finite.\nSee [`isFinite`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/isFinite) on MDN.\n\n## Examples\n\n```rescript\nFloat.isFinite(1.0) // true\nFloat.isFinite(Float.Constants.nan) // false\nFloat.isFinite(Float.Constants.positiveInfinity) // false\n```"]
    }, 
    {
      "id": "RescriptCore.Float.parseFloat",
      "kind": "value",
      "name": "parseFloat",
      "signature": "let parseFloat: (. string) => float",
      "docstrings": ["`parseFloat(v)` parse the given `v` and returns a float. Leading whitespace in\n`v` is ignored. Returns `NaN` if `v` can't be parsed. Use [`fromString`] to\nensure it returns a valid float and not `NaN`.\nSee [`parseFloat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseFloat) on MDN.\n\n## Examples\n\n```rescript\nFloat.parseFloat(\"1.0\") // 1.0\nFloat.parseFloat(\"  3.14   \") // 3.14\nFloat.parseFloat(3.0) // 3.0\nFloat.parseFloat(\"3.14some non-digit characters\") // 3.14\nFloat.parseFloat(\"error\")->Float.isNaN // true\n```"]
    }, 
    {
      "id": "RescriptCore.Float.parseInt",
      "kind": "value",
      "name": "parseInt",
      "signature": "let parseInt: (. 'a) => float",
      "docstrings": ["`parseInt(v)` parse the given `v` and returns a float. Leading whitespace in\n`v` is ignored. Returns `NaN` if `v` can't be parsed.\nSee [`parseInt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) on MDN.\n\n## Examples\n\n```rescript\nFloat.parseInt(\"1.0\") // 1.0\nFloat.parseInt(\"  3.14   \") // 3.0\nFloat.parseInt(3) // 3.0\nFloat.parseInt(\"3.14some non-digit characters\") // 3.0\nFloat.parseInt(\"error\")->Float.isNaN // true\n```"]
    }, 
    {
      "id": "RescriptCore.Float.parseIntWithRadix",
      "kind": "value",
      "name": "parseIntWithRadix",
      "signature": "let parseIntWithRadix: (. 'a, ~radix: int) => float",
      "docstrings": ["`parseIntWithRadix(v, ~radix)` parse the given `v` and returns a float. Leading\nwhitespace in this argument `v`is ignored. `radix` specifies the radix base to\nuse for the formatted number. The value must be in the range [2, 36] (inclusive).\nReturns `NaN` if `v` can't be parsed and `radix` is smaller than 2 or bigger\nthan 36.\nSee [`parseInt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt) on MDN.\n\n## Examples\n\n```rescript\nFloat.parseInt(\"10.0\", ~radix=2) // 2.0\nFloat.parseInt(\"15 * 3\", ~radix=10) // 15.0\nFloat.parseInt(\"12\", ~radix=13) // 15.0\nFloat.parseInt(\"17\", ~radix=40)->Float.isNaN // true\n```"]
    }, 
    {
      "id": "RescriptCore.Float.toExponential",
      "kind": "value",
      "name": "toExponential",
      "signature": "let toExponential: (. float) => string",
      "docstrings": ["`toExponential(v)` return a `string` representing the given value in exponential\nnotation.\nSee [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential) on MDN.\n\n## Examples\n\n```rescript\nFloat.toExponential(1000.0) // \"1e+3\"\nFloat.toExponential(-1000.0) // \"-1e+3\"\n```"]
    }, 
    {
      "id": "RescriptCore.Float.toExponentialWithPrecision",
      "kind": "value",
      "name": "toExponentialWithPrecision",
      "signature": "let toExponentialWithPrecision: (. float, ~digits: int) => string",
      "docstrings": ["`toExponential(v, ~digits)` return a `string` representing the given value in\nexponential notation. `digits` specifies how many digits should appear after\nthe decimal point.\nSee [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential) on MDN.\n\n## Examples\n\n```rescript\nFloat.toExponentialWithPrecision(77.0, ~digits=2) // \"7.70e+1\"\nFloat.toExponentialWithPrecision(5678.0, ~digits=2) // \"5.68e+3\"\n```\n\n## Exceptions\n\n- `RangeError`: If `digits` less than 0 or greater than 10."]
    }, 
    {
      "id": "RescriptCore.Float.toFixed",
      "kind": "value",
      "name": "toFixed",
      "signature": "let toFixed: (. float) => string",
      "docstrings": ["`toFixed(v)` return a `string` representing the given value using fixed-point\nnotation.\nSee [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed) on MDN.\n\n## Examples\n\n```rescript\nFloat.toFixed(123456.0) // \"123456.00\"\nFloat.toFixed(10.0) // \"10.00\"\n```"]
    }, 
    {
      "id": "RescriptCore.Float.toFixedWithPrecision",
      "kind": "value",
      "name": "toFixedWithPrecision",
      "signature": "let toFixedWithPrecision: (. float, ~digits: int) => string",
      "docstrings": ["`toFixedWithPrecision(v, ~digits)` return a `string` representing the given\nvalue using fixed-point notation. `digits` specifies how many digits should\nappear after the decimal point.\nSee [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed) on MDN.\n\n## Examples\n\n```rescript\nFloat.toFixed(300.0, ~digits=4) // \"300.0000\"\nFloat.toFixed(300.0, ~digits=1) // \"300.0\"\n```\n\n## Exceptions\n\n- `RangeError`: If `digits` is less than 0 or larger than 100."]
    }, 
    {
      "id": "RescriptCore.Float.toPrecision",
      "kind": "value",
      "name": "toPrecision",
      "signature": "let toPrecision: (. float) => string",
      "docstrings": ["`toPrecision(v)` return a `string` representing the giver value with precision.\nThis function omits the argument that controls precision, so it behaves like\n`toString`. See `toPrecisionWithPrecision` to control precision.\nSee [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.\n\n## Examples\n\n```rescript\nFloat.toPrecision(100.0) // \"100\"\nFloat.toPrecision(1.0) // \"1\"\n```"]
    }, 
    {
      "id": "RescriptCore.Float.toPrecisionWithPrecision",
      "kind": "value",
      "name": "toPrecisionWithPrecision",
      "signature": "let toPrecisionWithPrecision: (. float, ~digits: int) => string",
      "docstrings": ["`toPrecision(v, ~digits)` return a `string` representing the giver value with\nprecision. `digits` specifies the number of significant digits.\nSee [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.\n\n## Examples\n\n```rescript\nFloat.toPrecision(100.0, ~digits=2) // \"1.0e+2\"\nFloat.toPrecision(1.0) // \"1.0\"\n```\n\n## Exceptions\n\n- `RangeError`: If `digits` is not between 1 and 100 (inclusive).\nImplementations are allowed to support larger and smaller values as well.\nECMA-262 only requires a precision of up to 21 significant digits."]
    }, 
    {
      "id": "RescriptCore.Float.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. float) => string",
      "docstrings": ["`toString(v)` return a `string` representing the given value.\nSee [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) on MDN.\n\n## Examples\n\n```rescript\nFloat.toString(1000.0) // \"1000\"\nFloat.toString(-1000.0) // \"-1000\"\n```"]
    }, 
    {
      "id": "RescriptCore.Float.toStringWithRadix",
      "kind": "value",
      "name": "toStringWithRadix",
      "signature": "let toStringWithRadix: (. float, ~radix: int) => string",
      "docstrings": ["`toStringWithRadix(v, ~radix)` return a `string` representing the given value.\n`~radix` specifies the radix base to use for the formatted number.\nSee [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) on MDN.\n\n## Examples\n\n```rescript\nFloat.toString(6.0, ~radix=2) // \"110\"\nFloat.toString(3735928559.0, ~radix=16) // \"deadbeef\"\nFloat.toStringWithRadix(123456.0, ~radix=36) // \"2n9c\"\n```\n\n## Exceptions\n\n`RangeError`: if `radix` is less than 2 or greater than 36."]
    }, 
    {
      "id": "RescriptCore.Float.toLocaleString",
      "kind": "value",
      "name": "toLocaleString",
      "signature": "let toLocaleString: (. float) => string",
      "docstrings": ["`toLocaleString(v)` return a `string` with language-sensitive representing the\ngiven value.\nSee [`Number.toLocaleString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString) on MDN.\n\n## Examples\n\n```rescript\n// If the application uses English as the default language\nInt.toLocaleString(1000.0) // \"1,000\"\n\n// If the application uses Portuguese Brazil as the default language\nInt.toLocaleString(1000.0) // \"1.000\"\n```"]
    }, 
    {
      "id": "RescriptCore.Float.fromString",
      "kind": "value",
      "name": "fromString",
      "signature": "let fromString: (. string) => option<float>",
      "docstrings": ["`fromString(str)` return an `option<int>` representing the given value `str`.\n\n## Examples\n\n```rescript\nFloat.fromString(\"0\") == Some(0.0)\nFloat.fromString(\"NaN\") == None\nFloat.fromString(\"6\") == Some(6.0)\n```"]
    }, 
    {
      "id": "RescriptCore.Float.toInt",
      "kind": "value",
      "name": "toInt",
      "signature": "let toInt: (. float) => int",
      "docstrings": ["`toInt(v)` returns an int to given float `v`.\n\n## Examples\n\n```rescript\nFloat.toInt(2.0) == 2\nFloat.toInt(1.0) == 1\nFloat.toInt(1.1) == 1\nFloat.toInt(1.6) == 1\n```"]
    }, 
    {
      "id": "RescriptCore.Float.fromInt",
      "kind": "value",
      "name": "fromInt",
      "signature": "let fromInt: (. int) => float",
      "docstrings": ["`fromInt(v)` returns a float to given int `v`.\n\n## Examples\n\n```rescript\nFloat.fromInt(2) == 2.0\nFloat.fromInt(1) == 1.0\n```"]
    }, 
    {
      "id": "RescriptCore.Float.mod",
      "kind": "value",
      "name": "mod",
      "signature": "let mod: (. float, float) => float",
      "docstrings": ["`mod(n1, n2)` calculates the modulo (remainder after division) of two floats.\n\n## Examples\n\n```rescript\nInt.mod(7.0, 4.0) == 3\n```"]
    }, 
    {
      "id": "RescriptCore.Float.clamp",
      "kind": "value",
      "name": "clamp",
      "signature": "let clamp: (. ~min: float=?, ~max: float=?, float) => float",
      "docstrings": ["`clamp(~min=?, ~max=?, value)` returns `value`, optionally bounded by `min` and `max`.\n\nif `max` < `min` returns `min`.\n\n## Examples\n\n```rescript\nInt.clamp(4.2) == 4.2\nInt.clamp(4.2, ~min=4.3) == 4.3\nInt.clamp(4.2, ~max=4.1) == 4.1\nInt.clamp(4.2, ~min=4.3, ~max=4.1) == 4.3\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Int",
    "kind": "moduleAlias",
    "name": "Int",
    "docstrings": ["Functions for interacting with JavaScript Number.\nSee: [`Number`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)."],
    "items": [
    {
      "id": "RescriptCore.Int.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Int.Constants.minValue",
        "kind": "value",
        "name": "minValue",
        "signature": "let minValue: int",
        "docstrings": ["The smallest positive number represented in JavaScript.\n  See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE)\n  on MDN.\n\n  ## Examples\n\n  ```rescript\n  Console.log(Int.Constants.minValue)\n  ```"]
      }, 
      {
        "id": "RescriptCore.Int.Constants.maxValue",
        "kind": "value",
        "name": "maxValue",
        "signature": "let maxValue: int",
        "docstrings": ["The largest positive number represented in JavaScript.\n  See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE)\n  on MDN.\n\n  ## Examples\n\n  ```rescript\n  Console.log(Int.Constants.maxValue)\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.Int.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. int, int) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Int.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (. int, int) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Int.toExponential",
      "kind": "value",
      "name": "toExponential",
      "signature": "let toExponential: (. int) => string",
      "docstrings": ["`toExponential(n)` return a `string` representing the given value in exponential\nnotation.\nSee [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)\non MDN.\n\n## Examples\n\n```rescript\nInt.toExponential(1000) // \"1e+3\"\nInt.toExponential(-1000) // \"-1e+3\"\n```"]
    }, 
    {
      "id": "RescriptCore.Int.toExponentialWithPrecision",
      "kind": "value",
      "name": "toExponentialWithPrecision",
      "signature": "let toExponentialWithPrecision: (. int, ~digits: int) => string",
      "docstrings": ["`toExponential(n, ~digits)` return a `string` representing the given value in\nexponential notation. `digits` specifies how many digits should appear after\nthe decimal point. See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)\non MDN.\n\n## Examples\n\n```rescript\nInt.toExponentialWithPrecision(77, ~digits=2) // \"7.70e+1\"\nInt.toExponentialWithPrecision(5678, ~digits=2) // \"5.68e+3\"\n```\n\n## Exceptions\n\n- `RangeError`: If `digits` less than 0 or greater than 10."]
    }, 
    {
      "id": "RescriptCore.Int.toFixed",
      "kind": "value",
      "name": "toFixed",
      "signature": "let toFixed: (. int) => string",
      "docstrings": ["`toFixed(n)` return a `string` representing the given value using fixed-point\nnotation. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)\non MDN.\n\n\n## Examples\n\n```rescript\nInt.toFixed(123456) // \"123456.00\"\nInt.toFixed(10) // \"10.00\"\n```"]
    }, 
    {
      "id": "RescriptCore.Int.toFixedWithPrecision",
      "kind": "value",
      "name": "toFixedWithPrecision",
      "signature": "let toFixedWithPrecision: (. int, ~digits: int) => string",
      "docstrings": ["`toFixedWithPrecision(n, ~digits)` return a `string` representing the given\nvalue using fixed-point notation. `digits` specifies how many digits should\nappear after the decimal point. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)\non MDN.\n\n## Examples\n\n```rescript\nInt.toFixed(300, ~digits=4) // \"300.0000\"\nInt.toFixed(300, ~digits=1) // \"300.0\"\n```\n\n## Exceptions\n\n- `RangeError`: If `digits` is less than 0 or larger than 100."]
    }, 
    {
      "id": "RescriptCore.Int.toPrecision",
      "kind": "value",
      "name": "toPrecision",
      "signature": "let toPrecision: (. int) => string",
      "docstrings": ["`toPrecision(n)` return a `string` representing the giver value with precision.\nThis function omits the argument that controls precision, so it behaves like\n`toString`. See `toPrecisionWithPrecision` to control precision. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.\n\n## Examples\n\n```rescript\nInt.toPrecision(100) // \"100\"\nInt.toPrecision(1) // \"1\"\n```"]
    }, 
    {
      "id": "RescriptCore.Int.toPrecisionWithPrecision",
      "kind": "value",
      "name": "toPrecisionWithPrecision",
      "signature": "let toPrecisionWithPrecision: (. int, ~digits: int) => string",
      "docstrings": ["`toPrecision(n, ~digits)` return a `string` representing the giver value with\nprecision. `digits` specifies the number of significant digits. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.\n\n## Examples\n\n```rescript\nInt.toPrecision(100, ~digits=2) // \"1.0e+2\"\nInt.toPrecision(1) // \"1.0\"\n```\n\n## Exceptions\n\n- `RangeError`: If `digits` is not between 1 and 100 (inclusive).\nImplementations are allowed to support larger and smaller values as well.\nECMA-262 only requires a precision of up to 21 significant digits."]
    }, 
    {
      "id": "RescriptCore.Int.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. int) => string",
      "docstrings": ["`toString(n)` return a `string` representing the given value.\nSee [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)\non MDN.\n\n## Examples\n\n```rescript\nInt.toString(1000) // \"1000\"\nInt.toString(-1000) // \"-1000\"\n```"]
    }, 
    {
      "id": "RescriptCore.Int.toStringWithRadix",
      "kind": "value",
      "name": "toStringWithRadix",
      "signature": "let toStringWithRadix: (. int, ~radix: int) => string",
      "docstrings": ["`toStringWithRadix(n, ~radix)` return a `string` representing the given value.\n`~radix` specifies the radix base to use for the formatted number.\nSee [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)\non MDN.\n\n## Examples\n\n```rescript\nInt.toString(6, ~radix=2) // \"110\"\nInt.toString(3735928559, ~radix=16) // \"deadbeef\"\nInt.toStringWithRadix(123456, ~radix=36) // \"2n9c\"\n```\n\n## Exceptions\n\n`RangeError`: if `radix` is less than 2 or greater than 36."]
    }, 
    {
      "id": "RescriptCore.Int.toLocaleString",
      "kind": "value",
      "name": "toLocaleString",
      "signature": "let toLocaleString: (. int) => string",
      "docstrings": ["`toLocaleString(n)` return a `string` with language-sensitive representing the\ngiven value. See [`Number.toLocaleString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString) on MDN.\n\n## Examples\n\n```rescript\n// If the application uses English as the default language\nInt.toLocaleString(1000) // \"1,000\"\n\n// If the application uses Portuguese Brazil as the default language\nInt.toLocaleString(1000) // \"1.000\"\n```"]
    }, 
    {
      "id": "RescriptCore.Int.toFloat",
      "kind": "value",
      "name": "toFloat",
      "signature": "let toFloat: (. int) => float",
      "docstrings": ["`toFloat(n)` return a `float` representing the given value.\n\n## Examples\n\n```rescript\nInt.toFloat(100) == 100.0\nInt.toFloat(2) == 2.0\n```"]
    }, 
    {
      "id": "RescriptCore.Int.fromFloat",
      "kind": "value",
      "name": "fromFloat",
      "signature": "let fromFloat: (. float) => int",
      "docstrings": ["`fromFloat(n)` return an `int` representing the given value. The conversion is\ndone by truncating the decimal part.\n\n## Examples\n\n```rescript\nInt.fromFloat(2.0) == 2\nInt.fromFloat(1.999) == 1\nInt.fromFloat(1.5) == 1\nInt.fromFloat(0.9999) == 0\n```"]
    }, 
    {
      "id": "RescriptCore.Int.fromString",
      "kind": "value",
      "name": "fromString",
      "signature": "let fromString: (. ~radix: int=?, string) => option<int>",
      "docstrings": ["`fromString(~radix?, str)` return an `option<int>` representing the given value\n`str`. `~radix` specifies the radix base to use for the formatted number.\n\n## Examples\n\n```rescript\nInt.fromString(\"0\") == Some(0)\nInt.fromString(\"NaN\") == None\nInt.fromString(~radix=2, \"6\") == None\n```"]
    }, 
    {
      "id": "RescriptCore.Int.mod",
      "kind": "value",
      "name": "mod",
      "signature": "let mod: (. int, int) => int",
      "docstrings": ["`mod(n1, n2)` calculates the modulo (remainder after division) of two integers.\n\n## Examples\n\n```rescript\nInt.mod(7, 4) == 3\n```"]
    }, 
    {
      "id": "RescriptCore.Int.range",
      "kind": "value",
      "name": "range",
      "signature": "let range: (. int, int) => array<int>",
      "docstrings": ["`range(start, end)` returns an int array of the sequence of integers in the\nrange `[start, end)`. That is, including `start` but excluding `end`.\n\nIf `start < end` the sequence will be increasing in steps of 1.\n\nIf `start > end` the sequence will be decreasing in steps of -1.\n\nThis is equivalent to `rangeWithOptions` with `inclusive` set to `false` and\n`step` set to `1` if `start < end` and `-1` otherwise.\n\n## Examples\n\n```rescript\nInt.range(3, 6) == [3, 4, 5]\nInt.range(-3, -1) == [-3, -2]\nInt.range(3, 1) == [3, 2]\n```"]
    }, 
    {
      "id": "RescriptCore.Int.rangeOptions",
      "kind": "type",
      "name": "rangeOptions",
      "signature": "type rangeOptions = {step?: int, inclusive?: bool}",
      "docstrings": ["The options for `rangeWithOptions`."],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "step",
          "optional": true,
          "docstrings": [],
          "signature": "option<int>"
        }, {
          "name": "inclusive",
          "optional": true,
          "docstrings": [],
          "signature": "option<bool>"
        }]
      }
    }, 
    {
      "id": "RescriptCore.Int.rangeWithOptions",
      "kind": "value",
      "name": "rangeWithOptions",
      "signature": "let rangeWithOptions: (. int, int, rangeOptions) => array<int>",
      "docstrings": ["`rangeWithOptions(start, end, options)` is like `range`, but with `step` and\n`inclusive` options configurable.\n\nIf `step` is set, the sequence will increase or decrease by that amount for each\nstep. If `start < end` and `step` is negative, or vice versa, an empty array is\nreturned since the sequence would otherwise never reach or exceed the end value\nand hence be infinite. If `step` is `0` and `start !=` end, a `RangeError` is\nraised as the sequence would never reach or exceed the end value and hence be\ninfinite.\n\nIf `inclusive` is set to `true`, the sequence will include `end` if `step` is\nset such that the sequence includes it.\n\n## Examples\n\n```rescript\nInt.rangeWithOptions(3, 7, {step: 2}) == [3, 5]\nInt.rangeWithOptions(3, 7, {step: 2, inclusive: true}) == [3, 5, 7]\nInt.rangeWithOptions(3, 6, {step: -2}) // RangeError\n```\n\n## Exceptions\n\n- Raises `RangeError` if `step == 0 && start != end`."]
    }, 
    {
      "id": "RescriptCore.Int.clamp",
      "kind": "value",
      "name": "clamp",
      "signature": "let clamp: (. ~min: int=?, ~max: int=?, int) => int",
      "docstrings": ["`clamp(~min=?, ~max=?, value)` returns `value`, optionally bounded by `min` and `max`.\n\nif `max` < `min` returns `min`.\n\n## Examples\n\n```rescript\nInt.clamp(42) == 42\nInt.clamp(42, ~min=50) == 50\nInt.clamp(42, ~max=40) == 40\nInt.clamp(42, ~min=50, ~max=40) == 50\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.BigInt",
    "kind": "moduleAlias",
    "name": "BigInt",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.BigInt.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Types.bigint_val",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.asIntN",
      "kind": "value",
      "name": "asIntN",
      "signature": "let asIntN: (. ~width: int, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.asUintN",
      "kind": "value",
      "name": "asUintN",
      "signature": "let asUintN: (. ~width: int, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.fromString",
      "kind": "value",
      "name": "fromString",
      "signature": "let fromString: (. string) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.fromInt",
      "kind": "value",
      "name": "fromInt",
      "signature": "let fromInt: (. int) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.fromFloat",
      "kind": "value",
      "name": "fromFloat",
      "signature": "let fromFloat: (. float) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.toStringWithRadix",
      "kind": "value",
      "name": "toStringWithRadix",
      "signature": "let toStringWithRadix: (. t, ~radix: int) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.toLocaleString",
      "kind": "value",
      "name": "toLocaleString",
      "signature": "let toLocaleString: (. t) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.toFloat",
      "kind": "value",
      "name": "toFloat",
      "signature": "let toFloat: (. t) => float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.toInt",
      "kind": "value",
      "name": "toInt",
      "signature": "let toInt: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.+",
      "kind": "value",
      "name": "+",
      "signature": "let +: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.-",
      "kind": "value",
      "name": "-",
      "signature": "let -: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.*",
      "kind": "value",
      "name": "*",
      "signature": "let *: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt./",
      "kind": "value",
      "name": "/",
      "signature": "let /: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.add",
      "kind": "value",
      "name": "add",
      "signature": "let add: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.sub",
      "kind": "value",
      "name": "sub",
      "signature": "let sub: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.mul",
      "kind": "value",
      "name": "mul",
      "signature": "let mul: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.div",
      "kind": "value",
      "name": "div",
      "signature": "let div: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.mod",
      "kind": "value",
      "name": "mod",
      "signature": "let mod: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.land",
      "kind": "value",
      "name": "land",
      "signature": "let land: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.lor",
      "kind": "value",
      "name": "lor",
      "signature": "let lor: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.lxor",
      "kind": "value",
      "name": "lxor",
      "signature": "let lxor: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.lsl",
      "kind": "value",
      "name": "lsl",
      "signature": "let lsl: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.asr",
      "kind": "value",
      "name": "asr",
      "signature": "let asr: (. t, t) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.BigInt.exp",
      "kind": "value",
      "name": "exp",
      "signature": "let exp: (. t, t) => 'a",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.Math",
    "kind": "moduleAlias",
    "name": "Math",
    "docstrings": ["Functions for interacting with JavaScript Math.\nSee: [`Math`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math)."],
    "items": [
    {
      "id": "RescriptCore.Math.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Math.Constants.e",
        "kind": "value",
        "name": "e",
        "signature": "let e: float",
        "docstrings": ["`Math.Constants.e` returns Euler's number, ≈ 2.718281828459045.\n  See [`Math.E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.e\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.ln2",
        "kind": "value",
        "name": "ln2",
        "signature": "let ln2: float",
        "docstrings": ["`Math.Constants.ln2` returns Natural logarithm of 2, ≈ 0.6931471805599453.\n  See [`Math.LN2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN2) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.LN2\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.ln10",
        "kind": "value",
        "name": "ln10",
        "signature": "let ln10: float",
        "docstrings": ["`Math.Constants.ln10` returns Natural logarithm of 10, ≈ 2.302585092994046.\n  See [`Math.LN10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN10) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.ln10\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.log2e",
        "kind": "value",
        "name": "log2e",
        "signature": "let log2e: float",
        "docstrings": ["`Math.Constants.log2e` returns Base 2 logarithm of E, ≈ 1.4426950408889634.\n  See [`Math.LOG2E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG2E) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.log2e\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.log10e",
        "kind": "value",
        "name": "log10e",
        "signature": "let log10e: float",
        "docstrings": ["`Math.Constants.log10e` returns Base 10 logarithm of E, ≈ 0.4342944819032518.\n  See [`Math.LOG10E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG10E) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.log10e\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.pi",
        "kind": "value",
        "name": "pi",
        "signature": "let pi: float",
        "docstrings": ["`Math.Constants.pi` returns Pi - ratio of the circumference to the diameter\n  of a circle, ≈ 3.141592653589793.\n  See [`Math.PI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/PI) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.pi\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.sqrt1_2",
        "kind": "value",
        "name": "sqrt1_2",
        "signature": "let sqrt1_2: float",
        "docstrings": ["`Math.Constants.sqrt1_2` returns Square root of 1/2, ≈ 0.7071067811865476.\n  See [`Math.SQRT1_2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/SQRT1_2) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.sqrt1_2\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Constants.sqrt2",
        "kind": "value",
        "name": "sqrt2",
        "signature": "let sqrt2: float",
        "docstrings": ["`Math.Constants.e` returns Absolute value for integer argument.\n  See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Constants.sqrt2\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.Math.Int",
      "name": "Int",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Math.Int.abs",
        "kind": "value",
        "name": "abs",
        "signature": "let abs: (. int) => int",
        "docstrings": ["`abs(v)` returns absolute value of `v`.\n  See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.abs(-2) // 2\n  Math.Int.abs(3) // 3\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.clz32",
        "kind": "value",
        "name": "clz32",
        "signature": "let clz32: (. int) => int",
        "docstrings": ["`clz32(v)` returns the number of leading zero bits of the argument's 32 bit\n  int representation.\n  See [`Math.clz32`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32) on MDN.\n\n  ## Examples\n\n  ```rescript\n  // 00000000000000000000000000000001\n  Math.Int.clz32(1) // 31\n  // 00000000000000000000000000000100\n  Math.Int.clz32(4) // 29\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.imul",
        "kind": "value",
        "name": "imul",
        "signature": "let imul: (. int, int) => int",
        "docstrings": ["`imul(a, b)` returns 32-bit integer multiplication. Use this only when you\n  need to optimize performance of multiplication of numbers stored as 32-bit\n  integers.\n  See [`Math.imul`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.imul(3, 4) // 12\n  Math.Int.imul(-5, 12) // 60\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.min",
        "kind": "value",
        "name": "min",
        "signature": "let min: (. int, int) => int",
        "docstrings": ["`min(a, b)` returns the minimum of its two integer arguments.\n  See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.min(1, 2) // 1\n  Math.Int.min(-1, -2) // -2\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.minMany",
        "kind": "value",
        "name": "minMany",
        "signature": "let minMany: (. array<int>) => int",
        "docstrings": ["`minMany(arr)` returns the minimum of the integers in the given array `arr`.\n  Returns `Infinity` if `arr` is empty.\n  See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.minMany([1, 2]) // 1\n  Math.Int.minMany([-1, -2]) // -2\n  Math.Int.minMany([])->Float.isFinite // false\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.max",
        "kind": "value",
        "name": "max",
        "signature": "let max: (. int, int) => int",
        "docstrings": ["`max(a, b)` returns the maximum of its two integer arguments.\n  See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.max(1, 2) // 2\n  Math.Int.max(-1, -2) // -1\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.maxMany",
        "kind": "value",
        "name": "maxMany",
        "signature": "let maxMany: (. array<int>) => int",
        "docstrings": ["`maxMany(arr)` returns the maximum of the integers in the given array `arr`.\n  Returns `Infinity` if `arr` is empty.\n  See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.maxMany([1, 2]) // 2\n  Math.Int.maxMany([-1, -2]) // -1\n  Math.Int.maxMany([])->Float.isFinite // false\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.pow",
        "kind": "value",
        "name": "pow",
        "signature": "let pow: (. int, ~exp: int) => int",
        "docstrings": ["`pow(a, ~exp)` raises the given base `a` to the given exponent `exp`.\n  See [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.pow(2, ~exp=4) // 16\n  Math.Int.pow(3, ~exp=4) // 81\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.sign",
        "kind": "value",
        "name": "sign",
        "signature": "let sign: (. int) => int",
        "docstrings": ["`sign(v)` returns the sign of its integer argument: `-1` if negative, `0` if\n  zero, `1` if positive.\n  See [`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign) on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.sign(3) // 1\n  Math.Int.sign(-3) // 1\n  Math.Int.sign(0) // 0\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.floor",
        "kind": "value",
        "name": "floor",
        "signature": "let floor: (. float) => int",
        "docstrings": ["floor(v) returns the largest `int` less than or equal to the argument; \n  the result is pinned to the range of the `int` data type: -2147483648 to 2147483647. \n  See [`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)\n  on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.floor(3.7) == 3\n  Math.Int.floor(3.0) == 3\n  Math.Int.floor(-3.1) == -4\n  Math.Int.floor(-1.0e15) == -2147483648\n  Math.Int.floor(1.0e15) == 2147483647\n  ```"]
      }, 
      {
        "id": "RescriptCore.Math.Int.random",
        "kind": "value",
        "name": "random",
        "signature": "let random: (. int, int) => int",
        "docstrings": ["`random(minVal, maxVal)` returns a random integer number in the half-closed interval [minVal, maxVal).\n   See [`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)\n  on MDN.\n\n  ## Examples\n\n  ```rescript\n  Math.Int.random(2, 5) == 4\n  Math.Int.random(505, 2000) == 1276\n  Math.Int.random(-7, -2) == -4\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.Math.abs",
      "kind": "value",
      "name": "abs",
      "signature": "let abs: (. float) => float",
      "docstrings": ["`abs(v)` returns absolute value of `v`.\nSee [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.\n\n## Examples\n\n```rescript\nMath.abs(-2.0) // 2.0\nMath.abs(3.0) // 3.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.acos",
      "kind": "value",
      "name": "acos",
      "signature": "let acos: (. float) => float",
      "docstrings": ["`acos(v)` returns arccosine (in radians) of argument `v`, returns `NaN` if the\nargument is outside the range [-1.0, 1.0].\nSee [`Math.acos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos) on MDN.\n\n## Examples\n\n```rescript\nMath.acos(-1) // 3.141592653589793\nMath.acos(-3)->Float.isNaN // true\n```"]
    }, 
    {
      "id": "RescriptCore.Math.acosh",
      "kind": "value",
      "name": "acosh",
      "signature": "let acosh: (. float) => float",
      "docstrings": ["`acosh(v)` returns the inverse hyperbolic arccosine (in radians) of argument `v`,\nreturns `NaN` if the argument is less than `1.0`.\nSee [`Math.acosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh) on MDN.\n\n## Examples\n\n```rescript\nMath.acosh(1) // 0.0\nMath.acosh(0.5)->Float.isNaN // true\n```"]
    }, 
    {
      "id": "RescriptCore.Math.asin",
      "kind": "value",
      "name": "asin",
      "signature": "let asin: (. float) => float",
      "docstrings": ["`asin(v)` returns the inverse sine (in radians) of argument `v`, returns `NaN`\nif the argument `v` is outside the range [-1.0, 1.0].\nSee [`Math.asin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asin) on MDN.\n\n## Examples\n\n```rescript\nMath.asin(-1.0) // -1.5707963267948966\nMath.asin(-2.0)->Float.isNaN // true\n```"]
    }, 
    {
      "id": "RescriptCore.Math.asinh",
      "kind": "value",
      "name": "asinh",
      "signature": "let asinh: (. float) => float",
      "docstrings": ["`asinh(v)` returns the inverse hyperbolic sine of argument `v`.\nSee [`Math.asinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh) on MDN.\n\n## Examples\n\n```rescript\nMath.asinh(-1) // -0.881373587019543\nMath.asinh(-0) // -0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.atan",
      "kind": "value",
      "name": "atan",
      "signature": "let atan: (. float) => float",
      "docstrings": ["`atan(v)` returns the inverse tangent (in radians) of argument `v`.\nSee [`Math.atan`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan) on MDN.\n\n## Examples\n\n```rescript\nMath.atan(-0.0) // -0.0\nMath.atan(0.0) // 0.0\nMath.atan(1) // 0.7853981633974483\n```"]
    }, 
    {
      "id": "RescriptCore.Math.atanh",
      "kind": "value",
      "name": "atanh",
      "signature": "let atanh: (. float) => float",
      "docstrings": ["`atanh(v)` returns the invert hyperbolic tangent of argument `v`. Returns `NaN`\nif the argument `v` is is outside the range [-1.0, 1.0] and `Infinity` if `v`\nis `-1.0` or `1.0`.\nSee [`Math.atanh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh) on MDN.\n\n## Examples\n\n```rescript\nMath.atanh(-2.0)->Float.isNaN // true\nMath.atanh(-1.0)->Float.isFinite // false\nMath.atanh(-0.0) // -0.0\nMath.atanh(0.0) // 0.0\nMath.atanh(0.5) // 0.5493061443340548\n```"]
    }, 
    {
      "id": "RescriptCore.Math.atan2",
      "kind": "value",
      "name": "atan2",
      "signature": "let atan2: (. ~y: float, ~x: float) => float",
      "docstrings": ["`atan2(~y, ~x)` returns the angle (in radians) of the quotient `y /. x`. It is\nalso the angle between the *x*-axis and point (*x*, *y*).\nSee [`Math.atan2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan2) on MDN.\n\n## Examples\n\n```rescript\nMath.atan2(~y=0.0, ~x=10.0) == 0.0\nMath.atan2(~x=5.0, ~y=5.0) == Math.Constants.pi /. 4.0\nMath.atan2(~x=90.0, ~y=15.0) // 1.4056476493802699\nMath.atan2(~x=15.0, ~y=90.0) // 0.16514867741462683\n```"]
    }, 
    {
      "id": "RescriptCore.Math.cbrt",
      "kind": "value",
      "name": "cbrt",
      "signature": "let cbrt: (. float) => float",
      "docstrings": ["`cbrt(v)` returns the cube root of argument `v`.\nSee [`Math.cbrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt) on MDN.\n\n## Examples\n\n```rescript\nMath.cbrt(-1.0) // -1.0\nMath.cbrt(-0.0) // -0.0\nMath.cbrt(0.0) // 0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.ceil",
      "kind": "value",
      "name": "ceil",
      "signature": "let ceil: (. float) => float",
      "docstrings": ["`ceil(v)` returns the smallest integral value greater than or equal to the\nargument `v`. The result is a `float` and is not restricted to the `int` data\ntype range.\nSee [`Math.ceil`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil) on MDN.\n\n## Examples\n\n```rescript\nMath.ceil(3.1) == 4.0\nMath.ceil(3.0) == 3.0\nMath.ceil(-3.1) == -3.0\nMath.ceil(2_150_000_000.3) == 2_150_000_001.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.cos",
      "kind": "value",
      "name": "cos",
      "signature": "let cos: (. float) => float",
      "docstrings": ["`cos(v)` returns the cosine of argument `v`, which must be specified in radians.\nSee [`Math.cos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos) on MDN.\n\n## Examples\n\n```rescript\nMath.cos(-0.0) // 1.0\nMath.cos(0.0) // 1.0\nMath.cos(1.0) // 0.5403023058681398\n```"]
    }, 
    {
      "id": "RescriptCore.Math.cosh",
      "kind": "value",
      "name": "cosh",
      "signature": "let cosh: (. float) => float",
      "docstrings": ["`cosh(v)` returns the hyperbolic cosine of argument `v`, which must be specified\nin radians.\nSee [`Math.cosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cosh) on MDN.\n\n## Examples\n\n```rescript\nMath.cosh(-1.0) // 1.5430806348152437\nMath.cosh(-0.0) // 1.0\nMath.cosh(0.0) // 1.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.exp",
      "kind": "value",
      "name": "exp",
      "signature": "let exp: (. float) => float",
      "docstrings": ["`exp(v)` returns natural exponentional, returns *e* (the base of natural logarithms)\nto the power of the given argument `v`.\nSee [`Math.exp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp) on MDN.\n\n## Examples\n\n```rescript\nMath.exp(-1.0) // 0.36787944117144233\nMath.exp(0.0) // 1.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.expm1",
      "kind": "value",
      "name": "expm1",
      "signature": "let expm1: (. float) => float",
      "docstrings": ["`expm1(v)` returns *e* (the base of natural logarithms) to the power of the given\nargument `v` minus 1.\nSee [`Math.expm1`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1) on MDN.\n\n## Examples\n\n```rescript\nMath.expm1(-1.0) // -0.6321205588285577\nMath.expm1(-0.0) // -0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.floor",
      "kind": "value",
      "name": "floor",
      "signature": "let floor: (. float) => float",
      "docstrings": ["`floor(v)` returns the largest integral value less than or equal to the argument\n`v`. The result is a `float` and is not restricted to the `int` data type range.\nSee [`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor) on MDN.\n\n## Examples\n\n```rescript\nMath.floor(-45.95) // -46.0\nMath.floor(-45.05) // -46.0\nMath.floor(-0.0) // -0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.fround",
      "kind": "value",
      "name": "fround",
      "signature": "let fround: (. float) => float",
      "docstrings": ["`fround(v)` returns the nearest single precision float.\nSee [`Math.fround`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround) on MDN.\n\n## Examples\n\n```rescript\nMath.fround(5.5) == 5.5\nMath.fround(5.05) == 5.050000190734863\n```"]
    }, 
    {
      "id": "RescriptCore.Math.hypot",
      "kind": "value",
      "name": "hypot",
      "signature": "let hypot: (. float, float) => float",
      "docstrings": ["`hypot(a, b)` returns the square root of the sum of squares of its two arguments\n(the Pythagorean formula).\nSee [`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot) on MDN.\n\n## Examples\n\n```rescript\nMath.hypot(3.0, 4.0) // 5.0\nMath.hypot(3.0, 5.0) // 5.8309518948453\n```"]
    }, 
    {
      "id": "RescriptCore.Math.hypotMany",
      "kind": "value",
      "name": "hypotMany",
      "signature": "let hypotMany: (. array<float>) => float",
      "docstrings": ["`hypotMany(arr)` returns the square root of the sum of squares of the numbers in\nthe array argument (generalized Pythagorean equation). Using an array allows you\nto have more than two items. If `arr` is an empty array then returns `0.0`.\nSee [`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot) on MDN.\n\n## Examples\n\n```rescript\nMath.hypot([3.0, 4.0, 5.0]) // 7.0710678118654755\nMath.hypot([]) // 0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.log",
      "kind": "value",
      "name": "log",
      "signature": "let log: (. float) => float",
      "docstrings": ["`log(v)` returns the natural logarithm of argument `v`, this is the number *x*\nsuch that `e^x` equals the argument. Returns `NaN` for negative arguments and\n`Infinity` for `0.0` or `-0.0`.\nSee [`Math.log`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log) on MDN.\n\n## Examples\n\n```rescript\nMath.log(-1.0)->Float.isNaN // true\nMath.log(-0.0)->Float.isFinite // false\nMath.log(0.0)->Float.isFinite // false\nMath.log(1.0) // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.log1p",
      "kind": "value",
      "name": "log1p",
      "signature": "let log1p: (. float) => float",
      "docstrings": ["`log1p(v)` returns the natural logarithm of one plus the argument `v`.\nReturns `NaN` for arguments less than `-1` and `Infinity` if `v` is `-1.0`.\nSee [`Math.log1p`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p) on MDN.\n\n## Examples\n\n```rescript\nMath.log1p(-2.0)->Float.isNaN // true\nMath.log1p(-1.0)->Float.isFinite // false\nMath.log1p(-0.0) // -0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.log10",
      "kind": "value",
      "name": "log10",
      "signature": "let log10: (. float) => float",
      "docstrings": ["`log10(v)` returns the base 10 logarithm of argument `v`. Returns `NaN` for\nnegative `v`. If `v` is `-0.0` or `0.0` returns `Infinity`.\nSee [`Math.log10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log10) on MDN.\n\n## Examples\n\n```rescript\nMath.log10(-2.0)->Float.isNaN // true\nMath.log10(-0.0)->Float.isFinite // false\nMath.log10(0.0)->Float.isFinite // false\nMath.log10(1.0) // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.log2",
      "kind": "value",
      "name": "log2",
      "signature": "let log2: (. float) => float",
      "docstrings": ["`log2(v)` returns the base 2 logarithm of argument `v`. Returns `NaN` for\nnegative `v` and `Infinity` if `v` is `-0.0` or `0.0`.\nSee [`Math.log2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log2) on MDN.\n\n## Examples\n\n```rescript\nMath.log2(-2.0)->Float.isNaN // true\nMath.log2(-0.0)->Float.isFinite // false\nMath.log2(0.0)->Float.isFinite // false\nMath.log2(1.0) // 0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.min",
      "kind": "value",
      "name": "min",
      "signature": "let min: (. float, float) => float",
      "docstrings": ["`min(a, b)` returns the minimum of its two float arguments.\nSee [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.\n\n## Examples\n\n```rescript\nMath.min(1.0, 2.0) // 1.0\nMath.min(-1.0, -2.0) // -2.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.minMany",
      "kind": "value",
      "name": "minMany",
      "signature": "let minMany: (. array<float>) => float",
      "docstrings": ["`minMany(arr)` returns the minimum of the float in the given array `arr`.\nReturns `Infinity` if `arr` is empty.\nSee [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.\n\n## Examples\n\n```rescript\nMath.minMany([1.0, 2.0]) // 1.0\nMath.minMany([-1.0, -2.0]) // -2.0\nMath.minMany([])->Float.isFinite // false\n```"]
    }, 
    {
      "id": "RescriptCore.Math.max",
      "kind": "value",
      "name": "max",
      "signature": "let max: (. float, float) => float",
      "docstrings": ["`max(a, b)` returns the maximum of its two float arguments.\nSee [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.\n\n## Examples\n\n```rescript\nMath.max(1.0, 2.0) // 2.0\nMath.max(-1.0, -2.0) // -1.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.maxMany",
      "kind": "value",
      "name": "maxMany",
      "signature": "let maxMany: (. array<float>) => float",
      "docstrings": ["`maxMany(arr)` returns the maximum of the float in the given array `arr`.\nReturns `Infinity` if `arr` is empty.\nSee [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.\n\n## Examples\n\n```rescript\nMath.maxMany([1.0, 2.0]) // 2.0\nMath.maxMany([-1.0, -2.0]) // -1.0\nMath.maxMany([])->Float.isFinite // false\n```"]
    }, 
    {
      "id": "RescriptCore.Math.pow",
      "kind": "value",
      "name": "pow",
      "signature": "let pow: (. float, ~exp: float) => float",
      "docstrings": ["`pow(a, ~exp)` raises the given base `a` to the given exponent `exp`.\nSee [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.\n\n## Examples\n\n```rescript\nMath.pow(2.0, ~exp=4.0) // 16.0\nMath.pow(3.0, ~exp=4.0) // 81.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.random",
      "kind": "value",
      "name": "random",
      "signature": "let random: (. unit) => float",
      "docstrings": ["`random()` returns a random number in the half-closed interval [0,1].\nSee [`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) on MDN.\n\n## Examples\n\n```rescript\nMath.random()\n```"]
    }, 
    {
      "id": "RescriptCore.Math.round",
      "kind": "value",
      "name": "round",
      "signature": "let round: (. float) => float",
      "docstrings": ["`round(v)` returns then value of `v` rounded to nearest integral value\n(expressed as a float). If the fractional portion of the argument `v` is greater\nthan `0.5`, the argument `v` is rounded to the float with the next higher\nabsolute value.\nSee [`Math.round`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round) on MDN.\n\n## Examples\n\n```rescript\nMath.round(-20.5) // -20.0\nMath.round(-0.1) // -0.0\nMath.round(0.0) // 0.0\nMath.round(-0.0) // -0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.sign",
      "kind": "value",
      "name": "sign",
      "signature": "let sign: (. float) => float",
      "docstrings": ["`sign(v)` returns the sign of its foat argument: `-1` if negative, `0` if\nzero, `1` if positive.\nSee [`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign) on MDN.\n\n## Examples\n\n```rescript\nMath.sign(3.0) // 1.0\nMath.sign(-3.0) // 1.0\nMath.sign(0.0) // 0.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.sin",
      "kind": "value",
      "name": "sin",
      "signature": "let sin: (. float) => float",
      "docstrings": ["`sin(v)` returns the sine of argument `v`, which must be specified in radians.\nSee [`Math.sin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin) on MDN.\n\n## Examples\n\n```rescript\nMath.sin(-0.0) // -0.0\nMath.sin(0.0) // 0.0\nMath.sin(1.0) // 0.8414709848078965\n```"]
    }, 
    {
      "id": "RescriptCore.Math.sinh",
      "kind": "value",
      "name": "sinh",
      "signature": "let sinh: (. float) => float",
      "docstrings": ["`sinh(v)` returns then hyperbolic sine of argument `v`, which must be specified\nin radians.\nSee [`Math.sinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh) on MDN.\n\n## Examples\n\n```rescript\nMath.sinh(-0.0) // -0.0\nMath.sinh(0.0) // 0.0\nMath.sinh(1.0) // 1.1752011936438014\n```"]
    }, 
    {
      "id": "RescriptCore.Math.sqrt",
      "kind": "value",
      "name": "sqrt",
      "signature": "let sqrt: (. float) => float",
      "docstrings": ["`sqrt(v)` returns the square root of `v`. If `v` is negative returns `NaN`.\nSee [`Math.sqrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt) on MDN.\n\n## Examples\n\n```rescript\nMath.sqrt(-1.0)->Float.isNaN // true\nMath.sqrt(-0.0) // -0.0\nMath.sqrt(0.0) // 0.0\nMath.sqrt(1.0) // 1.0\nMath.sqrt(9.0) // 3.0\n```"]
    }, 
    {
      "id": "RescriptCore.Math.tan",
      "kind": "value",
      "name": "tan",
      "signature": "let tan: (. float) => float",
      "docstrings": ["`tan(v)` returns the tangent of argument `v`, which must be specified in\nradians. Returns `NaN` if `v` is positive `Infinity` or negative `Infinity`.\nSee [`Math.tan`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tan) on MDN.\n\n## Examples\n\n```rescript\nMath.tan(-0.0) // -0.0\nMath.tan(0.0) // 0.0\nMath.tan(1.0) // 1.5574077246549023\n```"]
    }, 
    {
      "id": "RescriptCore.Math.tanh",
      "kind": "value",
      "name": "tanh",
      "signature": "let tanh: (. float) => float",
      "docstrings": ["`tanh(v)` returns the hyperbolic tangent of argument `v`, which must be\nspecified in radians.\nSee [`Math.tanh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh) on MDN.\n\n## Examples\n\n```rescript\nMath.tanh(-0.0) // -0.0\nMath.tanh(0.0) // 0.0\nMath.tanh(1.0) // 0.7615941559557649\n```"]
    }, 
    {
      "id": "RescriptCore.Math.trunc",
      "kind": "value",
      "name": "trunc",
      "signature": "let trunc: (. float) => float",
      "docstrings": ["`trunc(v)` truncates the argument `v`, i.e., removes fractional digits.\nSee [`Math.trunc`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc) on MDN.\n\n## Examples\n\n```rescript\nMath.trunc(0.123) // 0.0\nMath.trunc(1.999) // 1.0\nMath.trunc(13.37) // 13.0\nMath.trunc(42.84) // 42.0\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Null",
    "kind": "moduleAlias",
    "name": "Null",
    "docstrings": ["Functions for handling values that could be `null`.\n\nIf you also need to cover `undefined`, check out `Nullable` instead."],
    "items": [
    {
      "id": "RescriptCore.Null.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = Js.Null.t<'a>",
      "docstrings": ["A type representing a value that can be either `'a` or `null`."],
      "detail": 
      {
        "kind": "variant",
        "items": [
        {
          "name": "Value",
          "docstrings": [],
          "signature": "Value('a)"
        }, 
        {
          "name": "Null",
          "docstrings": [],
          "signature": "Null"
        }]
      }
    }, 
    {
      "id": "RescriptCore.Null.asNullable",
      "kind": "value",
      "name": "asNullable",
      "signature": "let asNullable: (. t<'a>) => Core__Nullable.t<'a>",
      "docstrings": ["Converts a `Null.t` into a `Nullable.t`.\n\n## Examples\n```rescript\nlet nullValue = Null.make(\"Hello\")\nlet asNullable = nullValue->Null.asNullable // Nullable.t<string>\n```"]
    }, 
    {
      "id": "RescriptCore.Null.null",
      "kind": "value",
      "name": "null",
      "signature": "let null: t<'a>",
      "docstrings": ["The value `null`.\n\nSee [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.\n\n## Examples\n```rescript\nConsole.log(null) // Logs `null` to the console.\n```"]
    }, 
    {
      "id": "RescriptCore.Null.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. 'a) => t<'a>",
      "docstrings": ["Creates a new `Null.t` from the provided value.\nThis means the compiler will enforce null checks for the new value.\n\n## Examples\n```rescript\nlet myStr = \"Hello\"\nlet asNullValue = myStr->Null.make // The compiler now thinks this can be `string` or `null`.\n```"]
    }, 
    {
      "id": "RescriptCore.Null.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Null.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (.\n  t<'a>,\n  t<'b>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Null.toOption",
      "kind": "value",
      "name": "toOption",
      "signature": "let toOption: (. t<'a>) => option<'a>",
      "docstrings": ["Converts a nullable value into an option, so it can be pattern matched on.\nWill convert `null` to `None`, and a present value to `Some(value)`.\n\n## Examples\n```rescript\nlet nullStr = Null.make(\"Hello\")\n\nswitch nullStr->Null.toOption {\n| Some(str) => Console.log2(\"Got string:\", str)\n| None => Console.log(\"Didn't have a value.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Null.fromOption",
      "kind": "value",
      "name": "fromOption",
      "signature": "let fromOption: (. option<'a>) => t<'a>",
      "docstrings": ["Turns an `option` into a `Null.t`. `None` will be converted to `null`.\n\n## Examples\n```rescript\nlet optString: option<string> = None\nlet asNull = optString->Null.fromOption // Null.t<string>\nConsole.log(asNull == null) // Logs `true` to the console.\n```"]
    }, 
    {
      "id": "RescriptCore.Null.getOr",
      "kind": "value",
      "name": "getOr",
      "signature": "let getOr: (. t<'a>, 'a) => 'a",
      "docstrings": ["`getOr(value, default)` returns `value` if not `null`, otherwise return\n`default`.\n\n## Examples\n\n```rescript\nNull.getOr(null, \"Banana\") // Banana\nNull.getOr(Nulalble.make(\"Apple\"), \"Banana\") // Apple\n\nlet greet = (firstName: option<string>) =>\n  \"Greetings \" ++ firstName->Null.getOr(\"Anonymous\")\n\nNull.make(\"Jane\")->greet // \"Greetings Jane\"\nnull->greet // \"Greetings Anonymous\"\n```"]
    }, 
    {
      "id": "RescriptCore.Null.getWithDefault",
      "kind": "value",
      "name": "getWithDefault",
      "deprecated": "Use getOr instead",
      "signature": "let getWithDefault: (. t<'a>, 'a) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Null.getExn",
      "kind": "value",
      "name": "getExn",
      "signature": "let getExn: (. t<'a>) => 'a",
      "docstrings": ["`getExn(value)` raises an exception if `null`, otherwise returns the value.\n\n```rescript\nNull.getExn(Null.make(3)) // 3\nNull.getExn(null) /* Raises an Error */\n```\n\n## Exceptions\n\n- Raises `Invalid_argument` if `value` is `null`,"]
    }, 
    {
      "id": "RescriptCore.Null.getUnsafe",
      "kind": "value",
      "name": "getUnsafe",
      "signature": "let getUnsafe: (. t<'a>) => 'a",
      "docstrings": ["`getUnsafe(value)` returns `value`.\n\n## Examples\n\n```rescript\nNull.getUnsafe(Null.make(3)) == 3\nNull.getUnsafe(null) // Raises an error\n```\n\n## Important\n\n- This is an unsafe operation, it assumes `value` is not `null`."]
    }, 
    {
      "id": "RescriptCore.Null.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'a>, (. 'a) => unit) => unit",
      "docstrings": ["`forEach(value, f)` call `f` on `value`. if `value` is not `null`, then if calls\n`f`, otherwise returns `unit`.\n\n## Examples\n\n```rescript\nNull.forEach(Null.make(\"thing\"), x => Console.log(x)) // logs \"thing\"\nNull.forEach(null, x => Console.log(x)) // returns ()\n```"]
    }, 
    {
      "id": "RescriptCore.Null.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. t<'a>, (. 'a) => 'b) => t<'b>",
      "docstrings": ["`map(value, f)` returns `f(value)` if `value` is not `null`, otherwise returns\n`value` unchanged.\n\n## Examples\n\n```rescript\nNull.map(Null.make(3), x => x * x) // Null.make(9)\nNull.map(null, x => x * x) // null\n```"]
    }, 
    {
      "id": "RescriptCore.Null.mapOr",
      "kind": "value",
      "name": "mapOr",
      "signature": "let mapOr: (. t<'a>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": ["`mapOr(value, default, f)` returns `f(value)` if `value` is not `null`,\notherwise returns `default`.\n\n## Examples\n\n```rescript\nlet someValue = Null.make(3)\nsomeValue->Null.mapOr(0, x => x + 5) // 8\n\nlet noneValue = null\nnoneValue->Null.mapOr(0, x => x + 5) // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Null.mapWithDefault",
      "kind": "value",
      "name": "mapWithDefault",
      "deprecated": "Use mapOr instead",
      "signature": "let mapWithDefault: (. t<'a>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Null.flatMap",
      "kind": "value",
      "name": "flatMap",
      "signature": "let flatMap: (. t<'a>, (. 'a) => t<'b>) => t<'b>",
      "docstrings": ["`flatMap(value, f)` returns `f(value)` if `value` is not `null`, otherwise\nreturns `value` unchanged.\n\n## Examples\n\n```rescript\nlet addIfAboveOne = value =>\n  if (value > 1) {\n    Null.make(value + 1)\n  } else {\n    null\n  }\n\nNull.flatMap(Null.make(2), addIfAboveOne) // Null.make(3)\nNull.flatMap(Null.make(-4), addIfAboveOne) // null\nNull.flatMap(null, addIfAboveOne) // null\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Nullable",
    "kind": "moduleAlias",
    "name": "Nullable",
    "docstrings": ["Functions for handling nullable values.\n\nPrimarily useful when interoping with JavaScript when you don't know whether you'll get a value, `null` or `undefined`."],
    "items": [
    {
      "id": "RescriptCore.Nullable.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = Js.Nullable.t<'a>",
      "docstrings": ["Type representing a nullable value.\nA nullable value can be the value `'a`, `null` or `undefined`."],
      "detail": 
      {
        "kind": "variant",
        "items": [
        {
          "name": "Value",
          "docstrings": [],
          "signature": "Value('a)"
        }, 
        {
          "name": "Null",
          "docstrings": [],
          "signature": "Null"
        }, 
        {
          "name": "Undefined",
          "docstrings": [],
          "signature": "Undefined"
        }]
      }
    }, 
    {
      "id": "RescriptCore.Nullable.null",
      "kind": "value",
      "name": "null",
      "signature": "let null: t<'a>",
      "docstrings": ["The value `null`.\n\nSee [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.\n\n## Examples\n```rescript\nConsole.log(Nullable.null) // Logs `null` to the console.\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.undefined",
      "kind": "value",
      "name": "undefined",
      "signature": "let undefined: t<'a>",
      "docstrings": ["The value `undefined`.\n\nSee [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/undefined) on MDN.\n\n## Examples\n```rescript\nConsole.log(undefined) // Logs `undefined` to the console.\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. 'a) => t<'a>",
      "docstrings": ["Creates a new nullable value from the provided value.\nThis means the compiler will enforce null checks for the new value.\n\n## Examples\n```rescript\nlet myStr = \"Hello\"\nlet asNullable = myStr->Nullable.make\n\n// Can't do the below because we're now forced to check for nullability\n// myStr == asNullable\n\n// Need to do this\nswitch asNullable->Nullable.toOption {\n| Some(value) if value == myStr => Console.log(\"Yay, values matched!\")\n| _ => Console.log(\"Values did not match.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Nullable.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (.\n  t<'a>,\n  t<'b>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Nullable.toOption",
      "kind": "value",
      "name": "toOption",
      "signature": "let toOption: (. t<'a>) => option<'a>",
      "docstrings": ["Converts a nullable value into an option, so it can be pattern matched on.\nWill convert both `null` and `undefined` to `None`, and a present value to `Some(value)`.\n\n## Examples\n```rescript\nlet nullableString = Nullable.make(\"Hello\")\n\nswitch nullableString->Nullable.toOption {\n| Some(str) => Console.log2(\"Got string:\", str)\n| None => Console.log(\"Didn't have a value.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.fromOption",
      "kind": "value",
      "name": "fromOption",
      "signature": "let fromOption: (. option<'a>) => t<'a>",
      "docstrings": ["Turns an `option` into a `Nullable.t`.\n\n## Examples\n```rescript\nlet optString = Some(\"Hello\")\nlet asNullable = optString->Nullable.fromOption // Nullable.t<string>\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.getOr",
      "kind": "value",
      "name": "getOr",
      "signature": "let getOr: (. t<'a>, 'a) => 'a",
      "docstrings": ["`getOr(value, default)` returns `value` if not `null` or `undefined`,\notherwise return `default`.\n\n## Examples\n\n```rescript\nNullable.getOr(Nullable.null, \"Banana\") // Banana\nNullable.getOr(Nulalble.make(\"Apple\"), \"Banana\") // Apple\n\nlet greet = (firstName: option<string>) =>\n  \"Greetings \" ++ firstName->Nullable.getOr(\"Anonymous\")\n\nNullable.make(\"Jane\")->greet // \"Greetings Jane\"\nNullable.null->greet // \"Greetings Anonymous\"\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.getWithDefault",
      "kind": "value",
      "name": "getWithDefault",
      "deprecated": "Use getOr instead",
      "signature": "let getWithDefault: (. t<'a>, 'a) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Nullable.getExn",
      "kind": "value",
      "name": "getExn",
      "signature": "let getExn: (. t<'a>) => 'a",
      "docstrings": ["`getExn(value)` raises an exception if `null` or `undefined`, otherwise returns the value.\n\n```rescript\nNullable.getExn(Nullable.make(3)) // 3\nNullable.getExn(Nullable.null) /* Raises an Error */\n```\n\n## Exceptions\n\n- Raises `Invalid_argument` if `value` is `null` or `undefined`"]
    }, 
    {
      "id": "RescriptCore.Nullable.getUnsafe",
      "kind": "value",
      "name": "getUnsafe",
      "signature": "let getUnsafe: (. t<'a>) => 'a",
      "docstrings": ["`getUnsafe(value)` returns `value`.\n\n## Examples\n\n```rescript\nNullable.getUnsafe(Nullable.make(3)) == 3\nNullable.getUnsafe(Nullable.null) // Raises an error\n```\n\n## Important\n\n- This is an unsafe operation, it assumes `value` is not `null` or `undefined`."]
    }, 
    {
      "id": "RescriptCore.Nullable.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'a>, (. 'a) => unit) => unit",
      "docstrings": ["`forEach(value, f)` call `f` on `value`. if `value` is not `null` or `undefined`, \nthen if calls `f`, otherwise returns `unit`.\n\n## Examples\n\n```rescript\nNullable.forEach(Nullable.make(\"thing\"), x => Console.log(x)) // logs \"thing\"\nNullable.forEach(Nullable.null, x => Console.log(x)) // returns ()\nNullable.forEach(undefined, x => Console.log(x)) // returns ()\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. t<'a>, (. 'a) => 'b) => t<'b>",
      "docstrings": ["`map(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,\notherwise returns `value` unchanged.\n\n## Examples\n\n```rescript\nNullable.map(Nullable.make(3), x => x * x) // Nullable.make(9)\nNullable.map(undefined, x => x * x) // undefined\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.mapOr",
      "kind": "value",
      "name": "mapOr",
      "signature": "let mapOr: (. t<'a>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": ["`mapOr(value, default, f)` returns `f(value)` if `value` is not `null`\nor `undefined`, otherwise returns `default`.\n\n## Examples\n\n```rescript\nlet someValue = Nullable.make(3)\nsomeValue->Nullable.mapOr(0, x => x + 5) // 8\n\nlet noneValue = Nullable.null\nnoneValue->Nullable.mapOr(0, x => x + 5) // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Nullable.mapWithDefault",
      "kind": "value",
      "name": "mapWithDefault",
      "deprecated": "Use mapOr instead",
      "signature": "let mapWithDefault: (. t<'a>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Nullable.flatMap",
      "kind": "value",
      "name": "flatMap",
      "signature": "let flatMap: (. t<'a>, (. 'a) => t<'b>) => t<'b>",
      "docstrings": ["`flatMap(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,\notherwise returns `value` unchanged.\n\n## Examples\n\n```rescript\nlet addIfAboveOne = value =>\n  if (value > 1) {\n    Nullable.make(value + 1)\n  } else {\n    Nullable.null\n  }\n\nNullable.flatMap(Nullable.make(2), addIfAboveOne) // Nullable.make(3)\nNullable.flatMap(Nullable.make(-4), addIfAboveOne) // undefined\nNullable.flatMap(Nullable.null, addIfAboveOne) // undefined\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Object",
    "kind": "moduleAlias",
    "name": "Object",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Object.empty",
      "kind": "value",
      "name": "empty",
      "signature": "let empty: (. unit) => {..}",
      "docstrings": ["`empty` create a new object that inherits the properties and methods from the standard built-in Object, such as `toString`. See [Object on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object)\n\n## Examples\n\n```rescript\nlet x = Object.empty()\nx->Object.keysToArray->Array.length // 0\nx->Object.get(\"toString\")->Option.isSome // true\n```"]
    }, 
    {
      "id": "RescriptCore.Object.is",
      "kind": "value",
      "name": "is",
      "signature": "let is: (. 'a, 'a) => bool",
      "docstrings": ["`is` determines if two objects are identical in all contexts. Objects, arrays, records, and other non-primitives are only identical if they reference the **exact** same object in memory. Primitives like ints, floats, and strings are identical if they have the same value. `+0` and `-0` are distinct. NaN is equal to itself. See [Object.is on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is)\n\nIn most scenarios use `==` or `===` or the custom `equals` function (if provided) for the type.\n\n## Examples\n\n```rescript\nObject.is(25, 13) // false\nObject.is(\"abc\", \"abc\") // true\nObject.is(undefined, undefined) // true\nObject.is(undefined, null) // false\nObject.is(-0.0, 0.0) // false\nObject.is(list{1, 2}, list{1, 2}) // false\n\nObject.is([1, 2, 3], [1, 2, 3]) // false\n[1, 2, 3] == [1, 2, 3] // true\n[1, 2, 3] === [1, 2, 3] // false\n\nlet fruit = {\"name\": \"Apple\" }\nObject.is(fruit, fruit) // true\nObject.is(fruit, {\"name\": \"Apple\" }) // false\nfruit == {\"name\": \"Apple\" } // true\nfruit === {\"name\": \"Apple\" } // false\n```"]
    }, 
    {
      "id": "RescriptCore.Object.create",
      "kind": "value",
      "name": "create",
      "signature": "let create: (. {..}) => {..}",
      "docstrings": ["`create` creates a new object, using an existing object as the prototype of the new object. See [Object.create on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)\n\n**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object) and [records](https://rescript-lang.org/docs/manual/latest/record). This is often safer and more convenient than using `create` and other functions in this module.\n\n## Examples\n\n```rescript\nlet x = {\"fruit\": \"banana\"}\nlet y = Object.create(x)\ny->Object.get(\"fruit\") // Some(\"banana\")\n```"]
    }, 
    {
      "id": "RescriptCore.Object.createWithProperties",
      "kind": "value",
      "name": "createWithProperties",
      "signature": "let createWithProperties: (. {..}, {..}) => {..}",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Object.createWithNull",
      "kind": "value",
      "name": "createWithNull",
      "signature": "let createWithNull: (. unit) => {..}",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Object.createWithNullAndProperties",
      "kind": "value",
      "name": "createWithNullAndProperties",
      "signature": "let createWithNullAndProperties: (. {..}) => {..}",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Object.assign",
      "kind": "value",
      "name": "assign",
      "signature": "let assign: (. {..}, {..}) => {..}",
      "docstrings": ["`assign(target, source)` copies enumerable own properties from the source to the target, overwriting properties with the same name. It returns the modified target object. A deep clone is not created; properties are copied by reference.\n\n**Warning:** ReScript provides compile-time support for type-safe access to JavaScript objects. This eliminates common errors such as accessing properties that do not exist, or using a property of type x as if it were a y. Using `assign` can bypass these safety checks and lead to run-time errors (if you are not careful). ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object) and [records](https://rescript-lang.org/docs/manual/latest/record). This is often safer and more convenient than using `assign` and other functions in this module.\n\nSee [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign).\n\n## Examples\n\n```rescript\nObject.assign({\"a\": 1}, {\"a\": 2}) // {\"a\": 2}\nObject.assign({\"a\": 1, \"b\": 2}, {\"a\": 0}) // {\"a\": 0, \"b\": 2}\nObject.assign({\"a\": 1}, {\"a\": null}) // {\"a\": null}\n```"]
    }, 
    {
      "id": "RescriptCore.Object.assignMany",
      "kind": "value",
      "name": "assignMany",
      "signature": "let assignMany: (. {..}, array<{..}>) => {..}",
      "docstrings": ["`assignMany(target, sources)` copies enumerable own properties from each source to the target, overwriting properties with the same name. Later sources' properties overwrite earlier ones. It returns the modified target object. A deep clone is not created; properties are copied by reference.\n\n**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object), including spreading one object into another. This is often more convenient than using `assign` or `assignMany`.  \n\nSee [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign)."]
    }, 
    {
      "id": "RescriptCore.Object.copy",
      "kind": "value",
      "name": "copy",
      "signature": "let copy: (. ({..} as 'a)) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Object.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. {..}, string) => option<'a>",
      "docstrings": ["`get` gets the value of a property by name. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.\n\n## Examples\n\n```rescript\n{\"a\": 1}->Object.get(\"a\") // Some(1)\n{\"a\": 1}->Object.get(\"b\") // None\n{\"a\": undefined}->Object.get(\"a\") // None\n{\"a\": null}->Object.get(\"a\") // Some(null)\n{\"a\": 1}->Object.get(\"toString\")->Option.isSome // true\n```"]
    }, 
    {
      "id": "RescriptCore.Object.getSymbol",
      "kind": "value",
      "name": "getSymbol",
      "signature": "let getSymbol: (. {..}, Core__Symbol.t) => option<'a>",
      "docstrings": ["`getSymbol` gets the value of a property by symbol. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.\n\n## Examples\n\n```rescript\nlet fruit = Symbol.make(\"fruit\")\nlet x = Object.empty()\nx->Object.setSymbol(fruit, \"banana\")\nx->Object.getSymbol(fruit) // Some(\"banana\")\n```"]
    }, 
    {
      "id": "RescriptCore.Object.getSymbolUnsafe",
      "kind": "value",
      "name": "getSymbolUnsafe",
      "signature": "let getSymbolUnsafe: (. {..}, Core__Symbol.t) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Object.set",
      "kind": "value",
      "name": "set",
      "signature": "let set: (. {..}, string, 'a) => unit",
      "docstrings": ["`set(name, value)` assigns a value to the named object property, overwriting the previous value if any. See [Working with Objects on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects#objects_and_properties)\n\n## Examples\n\n```rescript\n{\"a\": 1}->Object.set(\"a\", 2) // {\"a\": 2}\n{\"a\": 1}->Object.set(\"a\", None) // {\"a\": None}\n{\"a\": 1}->Object.set(\"b\", 2) // {\"a\": 1, \"b\": 2}\n```"]
    }, 
    {
      "id": "RescriptCore.Object.setSymbol",
      "kind": "value",
      "name": "setSymbol",
      "signature": "let setSymbol: (. {..}, Core__Symbol.t, 'a) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Object.keysToArray",
      "kind": "value",
      "name": "keysToArray",
      "signature": "let keysToArray: (. {..}) => array<string>",
      "docstrings": ["`keysToArray` returns an array of an object's own enumerable string-keyed property names. See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.keys) \nor [Object.keys on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys).\n\n## Examples\n\n```rescript\n{\"a\": 1, \"b\": 2}->Object.keysToArray // [\"a\", \"b\"]\n{\"a\": None}->Object.keysToArray // [\"a\"]\nObject.empty()->Object.keysToArray // []\n```"]
    }, 
    {
      "id": "RescriptCore.Object.hasOwnProperty",
      "kind": "value",
      "name": "hasOwnProperty",
      "signature": "let hasOwnProperty: (. {..}, string) => bool",
      "docstrings": ["`hasOwnProperty` determines whether the object has the specified property as its **own** property, as opposed to inheriting it. See [hasOwnProperty on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty)\n\n## Examples\n\n```rescript\nlet point = {\"x\": 1, \"y\": 2}\n{\"a\": 1}->hasOwnProperty(\"a\") // true\n{\"a\": 1}->hasOwnProperty(\"b\") // false\n{\"a\": 1}->hasOwnProperty(\"toString\") // false\n```"]
    }, 
    {
      "id": "RescriptCore.Object.seal",
      "kind": "value",
      "name": "seal",
      "signature": "let seal: (. ({..} as 'a)) => 'a",
      "docstrings": ["`seal` seals an object. Sealing an object prevents extensions and makes existing properties non-configurable. A sealed object has a fixed set of properties. Unlike `freeze`, values of existing properties can still be changed as long as they are writable. \n\n**Note:** `seal` returns the same object that was passed in; it does not create a copy. Any attempt to delete or add properties to a sealed object will fail, either silently or by throwing an error. \n\nSee [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.seal) and [Object.seal on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/seal)\n\n## Examples\n\n```rescript\nlet point = {\"x\": 1, \"y\": 2}\npoint->Object.set(\"x\", -7) // succeeds\npoint->Object.seal->ignore\npoint->Object.set(\"z\", 9) // fails\npoint->Object.set(\"x\", 13) // succeeds\n```"]
    }, 
    {
      "id": "RescriptCore.Object.preventExtensions",
      "kind": "value",
      "name": "preventExtensions",
      "signature": "let preventExtensions: (. ({..} as 'a)) => 'a",
      "docstrings": ["`preventExtensions` prevents new properties from being added to the object. It modifies the object (rather than creating a copy) and returns it.\n\nSee [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.preventextensions) and [Object.preventExtensions on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions)\n\n## Examples\n\n```rescript\nlet obj = {\"a\": 1}\nobj->Object.set(\"b\", 2) // succeeds\nobj->Object.preventExtensions->ignore\nobj->Object.set(\"c\", 3) // fails\n```"]
    }, 
    {
      "id": "RescriptCore.Object.freeze",
      "kind": "value",
      "name": "freeze",
      "signature": "let freeze: (. ({..} as 'a)) => 'a",
      "docstrings": ["`freeze` freezes an object. Freezing an object makes existing properties non-writable and prevents extensions. Once an object is frozen, new properties cannot be be added, existing properties cannot be removed, and their values cannot be changed.\n\n**Note:** `freeze` returns the same object that was passed in; it does not create a frozen copy. Any attempt to change a frozen object will fail, either silently or by throwing an exception.\n\nSee [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).\n\n## Examples\n\n ```rescript\nlet obj = {\"a\": 1}\nobj->Object.set(\"a\", 2) // succeeds\nobj->Object.freeze->ignore\nobj->Object.set(\"a\", 3) // fails\n```"]
    }, 
    {
      "id": "RescriptCore.Object.isSealed",
      "kind": "value",
      "name": "isSealed",
      "signature": "let isSealed: (. 'a) => bool",
      "docstrings": ["`isSealed` determines if an object is sealed. A sealed object has a fixed set of properties.\n\nSee [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.issealed) and [Object.isSealed on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isSealed)\n\n## Examples\n\n```rescript\nlet point = {\"x\": 1, \"y\": 3}->Object.seal\nlet pointIsSealed = point->Object.isSealed // true\nlet fruit = {\"name\": \"Apple\" }\nlet fruitIsSealed = fruit->Object.isSealed // false\n ```"]
    }, 
    {
      "id": "RescriptCore.Object.isFrozen",
      "kind": "value",
      "name": "isFrozen",
      "signature": "let isFrozen: (. 'a) => bool",
      "docstrings": ["`isFrozen` determines if an object is frozen. An object is frozen if an only if it is not extensible, all its properties are non-configurable, and all its data properties are non-writable.\n\nSee [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).\n\n## Examples\n\n```rescript\nlet point = {\"x\": 1, \"y\": 3}->Object.freeze\nlet pointIsFrozen = point->Object.isFrozen // true\nlet fruit = {\"name\": \"Apple\" }\nlet fruitIsFrozen = fruit->Object.isFrozen // false\n ```"]
    }, 
    {
      "id": "RescriptCore.Object.isExtensible",
      "kind": "value",
      "name": "isExtensible",
      "signature": "let isExtensible: (. 'a) => bool",
      "docstrings": ["`isExtensible` determines if an object is extensible (whether it can have new properties added to it).\n\nSee [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isextensible) and [Object.isExtensible on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible)\n\n## Examples\n\n```rescript\nlet obj = {\"a\": 1}\nobj->Object.isExtensible // true\nobj->Object.preventExtensions->ignore\nobj->Object.isExtensible // false\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Ordering",
    "kind": "moduleAlias",
    "name": "Ordering",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Ordering.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.less",
      "kind": "value",
      "name": "less",
      "signature": "let less: float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.greater",
      "kind": "value",
      "name": "greater",
      "signature": "let greater: float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.isLess",
      "kind": "value",
      "name": "isLess",
      "signature": "let isLess: (. float) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.isEqual",
      "kind": "value",
      "name": "isEqual",
      "signature": "let isEqual: (. float) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.isGreater",
      "kind": "value",
      "name": "isGreater",
      "signature": "let isGreater: (. float) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.invert",
      "kind": "value",
      "name": "invert",
      "signature": "let invert: (. float) => float",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Ordering.fromInt",
      "kind": "value",
      "name": "fromInt",
      "signature": "let fromInt: (. int) => float",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.Promise",
    "kind": "moduleAlias",
    "name": "Promise",
    "docstrings": ["Functions for interacting with JavaScript Promise.\nSee: [`Promise`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)."],
    "items": [
    {
      "id": "RescriptCore.Promise.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = promise<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Promise.resolve",
      "kind": "value",
      "name": "resolve",
      "signature": "let resolve: (. 'a) => t<'a>",
      "docstrings": ["`resolve(value)` creates a resolved Promise with a given `value`.\nSee [`Promise.resolve`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve) on MDN.\n\n## Examples\n\n```rescript\nlet p = Promise.resolve(5) // promise<int>\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.reject",
      "kind": "value",
      "name": "reject",
      "signature": "let reject: (. exn) => t<'a>",
      "docstrings": ["`reject(exn)` reject a Promise.\nSee [`Promise.reject`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/reject) on MDN.\n\n## Examples\n\n```rescript\nexception TestError(string)\n\nlet p = Promise.reject(TestError(\"some rejected value\"))\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. (. (. 'a) => unit, (. 'e) => unit) => unit) => t<'a>",
      "docstrings": ["`make(callback)` creates a new Promise based on a `callback` that receives two\nuncurried functions `resolve` and `reject` for defining the Promise's result.\n\n## Examples\n\n```rescript\nopen Promise\n\nlet n = 4\nPromise.make((resolve, reject) => {\n  if(n < 5) {\n    resolve(. \"success\")\n  }\n  else {\n    reject(. \"failed\")\n  }\n})\n->then(str => {\n  Console.log(str)->resolve\n})\n->catch(e => {\n  Console.log(\"Error occurred\")\n  resolve()\n})\n->ignore\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.catch",
      "kind": "value",
      "name": "catch",
      "signature": "let catch: (. t<'a>, (. exn) => t<'a>) => t<'a>",
      "docstrings": ["`catch(promise, errorCallback)` registers an exception handler in a promise chain.\nThe `errorCallback` receives an `exn` value that can later be refined into a JS\nerror or ReScript error. The `errorCallback` needs to return a promise with the\nsame type as the consumed promise. See [`Promise.catch`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch) on MDN.\n\n## Examples\n\n```rescript\nopen Promise\n\nexception SomeError(string)\n\nreject(SomeError(\"this is an error\"))\n->then(_ => {\n  Ok(\"This result will never be returned\")->resolve\n})\n->catch(e => {\n  let msg = switch(e) {\n    | SomeError(msg) => \"ReScript error occurred: \" ++ msg\n    | Exn.Error(obj) =>\n      switch Exn.message(obj) {\n        | Some(msg) => \"JS exception occurred: \" ++ msg\n        | None => \"Some other JS value has been thrown\"\n      }\n    | _ => \"Unexpected error occurred\"\n  }\n\n  Error(msg)->resolve\n})\n->then(result => {\n  switch result {\n  | Ok(r) => Console.log2(\"Operation successful: \", r)\n  | Error(msg) => Console.log2(\"Operation failed: \", msg)\n  }->resolve\n})\n->ignore // Ignore needed for side-effects\n```\n\nIn case you want to return another promise in your `callback`, consider using\n`then` instead."]
    }, 
    {
      "id": "RescriptCore.Promise.then",
      "kind": "value",
      "name": "then",
      "signature": "let then: (. t<'a>, (. 'a) => t<'b>) => t<'b>",
      "docstrings": ["`then(promise, callback)` returns a new promise based on the result of `promise`'s \nvalue. The `callback` needs to explicitly return a new promise via `resolve`.\nIt is **not allowed** to resolve a nested promise (like `resolve(resolve(1))`).\nSee [`Promise.then`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then) on MDN.\n## Examples\n\n```rescript\nPromise.resolve(5)\n->then(num => {\n  resolve(num + 5)\n})\n->then(num => {\n  Console.log2(\"Your lucky number is: \", num)\n  resolve()\n})\n->ignore\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.thenResolve",
      "kind": "value",
      "name": "thenResolve",
      "signature": "let thenResolve: (. t<'a>, (. 'a) => 'b) => t<'b>",
      "docstrings": ["`thenResolve(promise, callback)` converts an encapsulated value of a promise\ninto another promise wrapped value. It is **not allowed** to return a promise\nwithin the provided callback (e.g. `thenResolve(value => resolve(value))`).\n\n## Examples\n\n```rescript\nresolve(\"Anna\")\n->thenResolve(str => {\n  \"Hello \" ++ str\n})\n->thenResolve(str => {\n  Console.log(str)\n})\n->ignore // Ignore needed for side-effects\n```\n\nIn case you want to return another promise in your `callback`, consider using\n`then` instead."]
    }, 
    {
      "id": "RescriptCore.Promise.finally",
      "kind": "value",
      "name": "finally",
      "signature": "let finally: (. t<'a>, (. unit) => unit) => t<'a>",
      "docstrings": ["`finally(promise, callback)` is used to execute a function that is called no\nmatter if a promise was resolved or rejected. It will return the same `promise`\nit originally received. See [`Promise.finally`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally) on MDN.\n\n## Examples\n\n```rescript\nexception SomeError(string)\nlet isDone = ref(false)\n\nresolve(5)\n->then(_ => {\n  reject(TestError(\"test\"))\n})\n->then(v => {\n  Console.log2(\"final result\", v)\n  resolve()\n})\n->catch(_ => {\n  Console.log(\"Error handled\")\n  resolve()\n})\n->finally(() => {\n  Console.log(\"finally\")\n  isDone := true\n})\n->then(() => {\n  Console.log2(\"isDone:\", isDone.contents)\n  resolve()\n})\n->ignore\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.race",
      "kind": "value",
      "name": "race",
      "signature": "let race: (. array<t<'a>>) => t<'a>",
      "docstrings": ["`race(arr)` combining `array` of promises. See [`Promise.race`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/race) on MDN.\n\n## Examples\n\n```rescript\nopen Promise\nlet racer = (ms, name) => {\n  Promise.make((resolve, _) => {\n    Global.setTimeout(() => {\n      resolve(. name)\n    }, ms)->ignore\n  })\n}\n\nlet promises = [racer(1000, \"Turtle\"), racer(500, \"Hare\"), racer(100, \"Eagle\")]\n\nrace(promises)->then(winner => {\n  Console.log(\"The winner is \" ++ winner)\n  resolve()\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.all",
      "kind": "value",
      "name": "all",
      "signature": "let all: (. array<t<'a>>) => t<array<'a>>",
      "docstrings": ["`all(promises)` runs all promises in parallel and returns a new promise resolving\nall gathered results in a unified array. See [`Promise.all`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) on MDN.\n\n```rescript\nopen Promise\nlet promises = [resolve(1), resolve(2), resolve(3)]\n\nall(promises)\n->then((results) => {\n  results->Array.forEach(num => {\n    Console.log2(\"Number: \", num)\n  })\n\n  resolve()\n})\n->ignore\n```"]
    }, 
    {
      "id": "RescriptCore.Promise.all2",
      "kind": "value",
      "name": "all2",
      "signature": "let all2: (. (t<'a>, t<'b>)) => t<('a, 'b)>",
      "docstrings": ["`all2((p1, p2))`. Like `all()`, but with a fixed size tuple of 2"]
    }, 
    {
      "id": "RescriptCore.Promise.all3",
      "kind": "value",
      "name": "all3",
      "signature": "let all3: (. (t<'a>, t<'b>, t<'c>)) => t<('a, 'b, 'c)>",
      "docstrings": ["`all3((p1, p2, p3))`. Like `all()`, but with a fixed size tuple of 3"]
    }, 
    {
      "id": "RescriptCore.Promise.all4",
      "kind": "value",
      "name": "all4",
      "signature": "let all4: (. (t<'a>, t<'b>, t<'c>, t<'d>)) => t<('a, 'b, 'c, 'd)>",
      "docstrings": ["`all4((p1, p2, p3, p4))`. Like `all()`, but with a fixed size tuple of 4"]
    }, 
    {
      "id": "RescriptCore.Promise.all5",
      "kind": "value",
      "name": "all5",
      "signature": "let all5: (.\n  (t<'a>, t<'b>, t<'c>, t<'d>, t<'e>),\n) => t<('a, 'b, 'c, 'd, 'e)>",
      "docstrings": ["`all5((p1, p2, p3, p4, p5))`. Like `all()`, but with a fixed size tuple of 5"]
    }, 
    {
      "id": "RescriptCore.Promise.all6",
      "kind": "value",
      "name": "all6",
      "signature": "let all6: (.\n  (t<'a>, t<'b>, t<'c>, t<'d>, t<'e>, t<'f>),\n) => t<('a, 'b, 'c, 'd, 'e, 'f)>",
      "docstrings": ["`all6((p1, p2, p4, p5, p6))`. Like `all()`, but with a fixed size tuple of 6\n\")"]
    }, 
    {
      "id": "RescriptCore.Promise.done",
      "kind": "value",
      "name": "done",
      "signature": "let done: (. promise<'a>) => unit",
      "docstrings": ["`done(p)` is a safe way to ignore a promise. If a value is anything else than a\npromise, it will raise a type error."]
    }]
  }, 
  {
    "id": "RescriptCore.RegExp",
    "kind": "moduleAlias",
    "name": "RegExp",
    "docstrings": ["Functions for handling RegExp's in ReScript.\n\nSee [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp) on MDN."],
    "items": [
    {
      "id": "RescriptCore.RegExp.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Re.t",
      "docstrings": ["Type representing an instantiated `RegExp`."]
    }, 
    {
      "id": "RescriptCore.RegExp.Result",
      "name": "Result",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.RegExp.Result.t",
        "kind": "type",
        "name": "t",
        "signature": "type t = array<string>",
        "docstrings": ["Type representing the result of a `RegExp` execution."]
      }, 
      {
        "id": "RescriptCore.RegExp.Result.fullMatch",
        "kind": "value",
        "name": "fullMatch",
        "signature": "let fullMatch: (. t) => string",
        "docstrings": ["`fullMatch(regExpResult)` returns the full string that matched in this result.\n\n  ## Examples\n  ```rescript\n  // Match the first two words separated by a space\n  let regexp = RegExp.fromString(\"(\\\\w+) (\\\\w+)\")\n\n  switch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n  | None => Console.log(\"Nope, no match...\")\n  | Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints the full string that matched, \"ReScript is\"\n  }\n  ```"]
      }, 
      {
        "id": "RescriptCore.RegExp.Result.matches",
        "kind": "value",
        "name": "matches",
        "signature": "let matches: (. t) => array<string>",
        "docstrings": ["`matches(regExpResult)` returns all matches for `regExpResult`.\n\n  ## Examples\n  ```rescript\n  // Match the first two words separated by a space\n  let regexp = RegExp.fromString(\"(\\\\w+) (\\\\w+)\")\n\n  // This below will log \"ReScript\" and \"is\" to the console.\n  switch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n  | None => Console.log(\"Nope, no match...\")\n  | Some(result) => switch result->RegExp.Result.matches {\n    | [firstWord, secondWord] => Console.log2(firstWord, secondWord)\n    | _ => Console.log(\"Didn't find exactly two words...\")\n    }\n  }\n  ```"]
      }, 
      {
        "id": "RescriptCore.RegExp.Result.index",
        "kind": "value",
        "name": "index",
        "signature": "let index: (. t) => int",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.RegExp.Result.input",
        "kind": "value",
        "name": "input",
        "signature": "let input: (. t) => string",
        "docstrings": ["`input(regExpResult)` returns the full input string that was passed to what produced the `RegExp.Result.t`.\n\n  ## Examples\n  ```rescript\n  // Match the first two words separated by a space\n  let regexp = RegExp.fromString(\"(\\\\w+) (\\\\w+)\")\n\n  // This below will log the full input string \"ReScript is pretty cool, right?\" to the console.\n  switch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n  | None => Console.log(\"Nope, no match...\")\n  | Some(result) => Console.log(result->RegExp.Result.input)\n  }\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.RegExp.fromString",
      "kind": "value",
      "name": "fromString",
      "signature": "let fromString: (. string) => t",
      "docstrings": ["`fromString(string)` creates a `RegExp.t` from the provided string. This can then be used to match on strings using `RegExp.exec`.\n\nSee [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\n\nswitch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n| None => Console.log(\"Nope, no match...\")\n| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints \"ReScript\"\n}\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.fromStringWithFlags",
      "kind": "value",
      "name": "fromStringWithFlags",
      "signature": "let fromStringWithFlags: (. string, ~flags: string) => t",
      "docstrings": ["`fromStringWithFlags(string)` creates a `RegExp.t` from the provided string, using the provided `flags`. This can then be used to match on strings using `RegExp.exec`.\n\nSee [`RegExp parameters`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp#parameters) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\n\nswitch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n| None => Console.log(\"Nope, no match...\")\n| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints \"ReScript\"\n}\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.test",
      "kind": "value",
      "name": "test",
      "signature": "let test: (. t, string) => bool",
      "docstrings": ["`test(regexp, string)` tests whether the provided `regexp` matches on the provided string.\n\nSee [`RegExp.test`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\n\nif regexp->RegExp.test(\"ReScript is cool!\") {\n  Console.log(\"Yay, there's a word in there.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.exec",
      "kind": "value",
      "name": "exec",
      "signature": "let exec: (. t, string) => option<Result.t>",
      "docstrings": ["`exec(regexp, string)` executes the provided regexp on the provided string, optionally returning a `RegExp.Result.t` if the regexp matches on the string.\n\nSee [`RegExp.exec`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\n\nswitch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n| None => Console.log(\"Nope, no match...\")\n| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints \"ReScript\"\n}\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.lastIndex",
      "kind": "value",
      "name": "lastIndex",
      "signature": "let lastIndex: (. t) => int",
      "docstrings": ["`lastIndex(regexp)` returns the index the next match will start from.\n\nSee [`RegExp.lastIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\nlet someStr = \"Many words here.\"\n\nConsole.log(regexp->RegExp.lastIndex) // Logs `0` to the console\n\nregexp->RegExp.exec(someStr)->ignore\n\nConsole.log(regexp->RegExp.lastIndex) // Logs `4` to the console\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.ignoreCase",
      "kind": "value",
      "name": "ignoreCase",
      "signature": "let ignoreCase: (. t) => bool",
      "docstrings": ["`ignoreCase(regexp)` returns whether the ignore case (`i`) flag is set on this `RegExp`.\n\nSee [`RegExp.ignoreCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.ignoreCase) // Logs `false`, since `i` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"i\")\nConsole.log(regexp2->RegExp.ignoreCase) // Logs `true`, since `i` is set\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.global",
      "kind": "value",
      "name": "global",
      "signature": "let global: (. t) => bool",
      "docstrings": ["`global(regexp)` returns whether the global (`g`) flag is set on this `RegExp`.\n\nSee [`RegExp.global`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.global) // Logs `true`, since `g` is set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"i\")\nConsole.log(regexp2->RegExp.global) // Logs `false`, since `g` is not set\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.multiline",
      "kind": "value",
      "name": "multiline",
      "signature": "let multiline: (. t) => bool",
      "docstrings": ["`multiline(regexp)` returns whether the multiline (`m`) flag is set on this `RegExp`.\n\nSee [`RegExp.multiline`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.multiline) // Logs `false`, since `m` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"mi\")\nConsole.log(regexp2->RegExp.multiline) // Logs `true`, since `m` is set\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.source",
      "kind": "value",
      "name": "source",
      "signature": "let source: (. t) => string",
      "docstrings": ["`source(regexp)` returns the source text for this `RegExp`, without the two forward slashes (if present), and without any set flags.\n\nSee [`RegExp.source`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) on MDN.\n\n## Examples\n```rescript\nlet regexp = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp->RegExp.source) // Logs `\\w+`, the source text of the `RegExp`\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.sticky",
      "kind": "value",
      "name": "sticky",
      "signature": "let sticky: (. t) => bool",
      "docstrings": ["`sticky(regexp)` returns whether the sticky (`y`) flag is set on this `RegExp`.\n\nSee [`RegExp.sticky`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.unicode) // Logs `false`, since `y` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"my\")\nConsole.log(regexp2->RegExp.unicode) // Logs `true`, since `y` is set\n```"]
    }, 
    {
      "id": "RescriptCore.RegExp.unicode",
      "kind": "value",
      "name": "unicode",
      "signature": "let unicode: (. t) => bool",
      "docstrings": ["`unicode(regexp)` returns whether the unicode (`y`) flag is set on this `RegExp`.\n\nSee [`RegExp.unicode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.unicode) // Logs `false`, since `u` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"mu\")\nConsole.log(regexp2->RegExp.unicode) // Logs `true`, since `u` is set\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.String",
    "kind": "moduleAlias",
    "name": "String",
    "docstrings": ["Functions for interacting with JavaScript strings.\nSee: [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)."],
    "items": [
    {
      "id": "RescriptCore.String.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. 'a) => string",
      "docstrings": ["`make(value)` converts the given value to a `string`.\n\n## Examples\n\n```rescript\nString.make(3.5) == \"3.5\"\nString.make([1, 2, 3]) == \"1,2,3\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.fromCharCode",
      "kind": "value",
      "name": "fromCharCode",
      "signature": "let fromCharCode: (. int) => string",
      "docstrings": ["`fromCharCode(n)` creates a `string` containing the character corresponding to\nthat number, `n` ranges from 0 to 65535. If out of range, the lower 16 bits of\nthe value are used. Thus, `fromCharCode(0x1F63A)` gives the same result as\n`fromCharCode(0xF63A)`.\nSee [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode) on MDN.\n\n## Examples\n\n```rescript\nString.fromCharCode(65) == \"A\"\nString.fromCharCode(0x3c8) == `ψ`\nString.fromCharCode(0xd55c) == `한`\nString.fromCharCode(-64568) == `ψ`\n```"]
    }, 
    {
      "id": "RescriptCore.String.fromCharCodeMany",
      "kind": "value",
      "name": "fromCharCodeMany",
      "signature": "let fromCharCodeMany: (. array<int>) => string",
      "docstrings": ["`fromCharCodeMany([n1, n2, n3])` creates a `string` from the characters\ncorresponding to the given numbers, using the same rules as `fromCharCode`.\nSee [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode) on MDN.\n\n## Examples\n\n```rescript\nString.fromCharCodeMany([189, 43, 190, 61]) == \"½+¾=\"\nString.fromCharCode([65, 66, 67]) == \"ABC\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.fromCodePoint",
      "kind": "value",
      "name": "fromCodePoint",
      "signature": "let fromCodePoint: (. int) => string",
      "docstrings": ["`fromCodePoint(n)` creates a `string` containing the character corresponding to\nthat numeric code point.\nSee [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint) on MDN.\n\n## Examples\n\n```rescript\nString.fromCodePoint(65) == \"A\"\nString.fromCodePoint(0x3c8) == `ψ`\nString.fromCodePoint(0xd55c) == `한`\nString.fromCodePoint(0x1f63a) == `😺`\n```\n\n## Exceptions\n\n- `RangeError`: If the number is not a valid code point, like `fromCharCode(-5)`."]
    }, 
    {
      "id": "RescriptCore.String.fromCodePointMany",
      "kind": "value",
      "name": "fromCodePointMany",
      "signature": "let fromCodePointMany: (. array<int>) => string",
      "docstrings": ["`fromCodePointMany([n1, n2, n3])` creates a `string` from the characters\ncorresponding to the given code point numbers, using the same rules as\n`fromCodePoint`.\nSee [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint) on MDN.\n\n## Examples\n\n```rescript\nString.fromCodePointMany([0xd55c, 0xae00, 0x1f63a]) == `한글😺`\n```\n\n## Exceptions\n\n- `RangeError`: If one of the number is not a valid code point, like\n`fromCharCode([1, -5])`."]
    }, 
    {
      "id": "RescriptCore.String.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. string, string) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.String.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (. string, string) => Core__Ordering.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.String.length",
      "kind": "value",
      "name": "length",
      "signature": "let length: (. string) => int",
      "docstrings": ["`length(str)` returns the length of the given `string`.\nSee [`String.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) on MDN.\n\n## Examples\n\n```rescript\nString.length(\"abcd\") == 4\n```"]
    }, 
    {
      "id": "RescriptCore.String.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. string, int) => option<string>",
      "docstrings": ["`get(str, index)` returns an `option<string>` at the given `index` number. If\n`index` is out of range, this function returns `None`.\n\n## Examples\n\n```rescript\nString.get(\"ReScript\", 0) == Some(\"R\")\nString.get(\"Hello\", 4) == Some(\"o\")\nString.get(`JS`, 4) == None\n```"]
    }, 
    {
      "id": "RescriptCore.String.charAt",
      "kind": "value",
      "name": "charAt",
      "signature": "let charAt: (. string, int) => string",
      "docstrings": ["`charAt(str, index)` gets the character at `index` within string `str`. If\n`index` is negative or greater than the length of `str`, it returns the empty\nstring. If the string contains characters outside the range \\u0000-\\uffff, it\nwill return the first 16-bit value at that position in the string.\nSee [`String.charAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charAt) on MDN.\n\n## Examples\n\n```rescript\nString.charAt(\"ReScript\", 0) == \"R\"\nString.charAt(\"Hello\", 12) == \"\"\nString.charAt(`JS`, 5) == \"\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.charCodeAt",
      "kind": "value",
      "name": "charCodeAt",
      "signature": "let charCodeAt: (. string, int) => float",
      "docstrings": ["`charCodeAt(str, index)` returns the character code at position `index` in\nstring `str` the result is in the range 0-65535, unlike `codePointAt`, so it\nwill not work correctly for characters with code points greater than or equal\nto 0x10000. The return type is `float` because this function returns NaN if\n`index` is less than zero or greater than the length of the string.\nSee [`String.charCodeAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charCodeAt) on MDN.\n\n## Examples\n\n```rescript\nString.charCodeAt(`😺`, 0) == 0xd83d->Int.toFloat\nString.codePointAt(`😺`, 0) == Some(0x1f63a)\n```"]
    }, 
    {
      "id": "RescriptCore.String.codePointAt",
      "kind": "value",
      "name": "codePointAt",
      "signature": "let codePointAt: (. string, int) => option<int>",
      "docstrings": ["`codePointAt(str, index)` returns the code point at position `index` within\nstring `str` as a `Some(value)`. The return value handles code points greater\nthan or equal to 0x10000. If there is no code point at the given position, the\nfunction returns `None`.\nSee [`String.codePointAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt) on MDN.\n\n## Examples\n\n```rescript\nString.codePointAt(`¿😺?`, 1) == Some(0x1f63a)\nString.codePointAt(\"abc\", 5) == None\n```"]
    }, 
    {
      "id": "RescriptCore.String.concat",
      "kind": "value",
      "name": "concat",
      "signature": "let concat: (. string, string) => string",
      "docstrings": ["`concat(original, append)` returns a new `string` with `append` added after\n`original`.\nSee [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat) on MDN.\n\n## Examples\n\n```rescript\nString.concat(\"cow\", \"bell\") == \"cowbell\"\nString.concat(\"Re\", \"Script\") == \"ReScript\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.concatMany",
      "kind": "value",
      "name": "concatMany",
      "signature": "let concatMany: (. string, array<string>) => string",
      "docstrings": ["`concatMany(original, arr)` returns a new `string` consisting of each item of an\narray of strings added to the `original` string.\nSee [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat) on MDN.\n\n## Examples\n\n```rescript\nString.concatMany(\"1st\", [\"2nd\", \"3rd\", \"4th\"]) == \"1st2nd3rd4th\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.endsWith",
      "kind": "value",
      "name": "endsWith",
      "signature": "let endsWith: (. string, string) => bool",
      "docstrings": ["`endsWith(str, substr)` returns `true` if the `str` ends with `substr`, `false`\notherwise.\nSee [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith) on MDN.\n\n## Examples\n\n```rescript\nString.endsWith(\"BuckleScript\", \"Script\") == true\nString.endsWith(\"BuckleShoes\", \"Script\") == false\n```"]
    }, 
    {
      "id": "RescriptCore.String.endsWithFrom",
      "kind": "value",
      "name": "endsWithFrom",
      "signature": "let endsWithFrom: (. string, string, int) => bool",
      "docstrings": ["`endsWithFrom(str, ending, len)` returns `true` if the first len characters of\n`str` end with `ending`, `false` otherwise. If `len` is greater than or equal\nto the length of `str`, then it works like `endsWith`.\nSee [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith) on MDN.\n\n## Examples\n\n```rescript\nString.endsWithFrom(\"abcd\", \"cd\", 4) == true\nString.endsWithFrom(\"abcde\", \"cd\", 3) == false\nString.endsWithFrom(\"abcde\", \"cde\", 99) == true\nString.endsWithFrom(\"example.dat\", \"ple\", 7) == true\n```"]
    }, 
    {
      "id": "RescriptCore.String.includes",
      "kind": "value",
      "name": "includes",
      "signature": "let includes: (. string, string) => bool",
      "docstrings": ["`includes(str, searchValue)` returns `true` if `searchValue` is found anywhere\nwithin `str`, `false` otherwise.\nSee [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes) on MDN.\n\n## Examples\n\n```rescript\nString.includes(\"programmer\", \"gram\") == true\nString.includes(\"programmer\", \"er\") == true\nString.includes(\"programmer\", \"pro\") == true\nString.includes(\"programmer.dat\", \"xyz\") == false\n```"]
    }, 
    {
      "id": "RescriptCore.String.includesFrom",
      "kind": "value",
      "name": "includesFrom",
      "signature": "let includesFrom: (. string, string, int) => bool",
      "docstrings": ["`includesFrom(str, searchValue, start)` returns `true` if `searchValue` is found\nanywhere within `str` starting at character number `start` (where 0 is the\nfirst character), `false` otherwise.\nSee [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes) on MDN.\n\n## Examples\n\n```rescript\nString.includesFrom(\"programmer\", \"gram\", 1) == true\nString.includesFrom(\"programmer\", \"gram\", 4) == false\nString.includesFrom(`대한민국`, `한`, 1) == true\n```"]
    }, 
    {
      "id": "RescriptCore.String.indexOf",
      "kind": "value",
      "name": "indexOf",
      "signature": "let indexOf: (. string, string) => int",
      "docstrings": ["`indexOf(str, searchValue)` returns the position at which `searchValue` was\nfirst found within `str`, or `-1` if `searchValue` is not in `str`.\nSee [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf) on MDN.\n\n## Examples\n\n```rescript\nString.indexOf(\"bookseller\", \"ok\") == 2\nString.indexOf(\"bookseller\", \"sell\") == 4\nString.indexOf(\"beekeeper\", \"ee\") == 1\nString.indexOf(\"bookseller\", \"xyz\") == -1\n```"]
    }, 
    {
      "id": "RescriptCore.String.indexOfOpt",
      "kind": "value",
      "name": "indexOfOpt",
      "signature": "let indexOfOpt: (. string, string) => option<int>",
      "docstrings": ["`indexOfOpt(str, searchValue)`. Like `indexOf`, but return an `option<int>`.\n\n## Examples\n\n```rescript\nString.indexOf(\"bookseller\", \"ok\") == Some(2)\nString.indexOf(\"bookseller\", \"xyz\") == None\n```"]
    }, 
    {
      "id": "RescriptCore.String.indexOfFrom",
      "kind": "value",
      "name": "indexOfFrom",
      "signature": "let indexOfFrom: (. string, string, int) => int",
      "docstrings": ["`indexOfFrom(str, searchValue, start)` returns the position at which\n`searchValue` was found within `str` starting at character position `start`, or\n`-1` if `searchValue` is not found in that portion of `str`. The return value is\nrelative to the beginning of the string, no matter where the search started\nfrom.\nSee [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf) on MDN.\n\n## Examples\n\n```rescript\nString.indexOfFrom(\"bookseller\", \"ok\", 1) == 2\nString.indexOfFrom(\"bookseller\", \"sell\", 2) == 4\nString.indexOfFrom(\"bookseller\", \"sell\", 5) == -1\n```"]
    }, 
    {
      "id": "RescriptCore.String.lastIndexOf",
      "kind": "value",
      "name": "lastIndexOf",
      "signature": "let lastIndexOf: (. string, string) => int",
      "docstrings": ["`lastIndexOf(str, searchValue)` returns the position of the last occurrence of\n`searchValue` within `str`, searching backwards from the end of the string.\nReturns `-1` if `searchValue` is not in `str`. The return value is always\nrelative to the beginning of the string.\nSee [`String.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf) on MDN.\n\n## Examples\n\n```rescript\nString.lastIndexOf(\"bookseller\", \"ok\") == 2\nString.lastIndexOf(\"beekeeper\", \"ee\") == 4\nString.lastIndexOf(\"abcdefg\", \"xyz\") == -1\n```"]
    }, 
    {
      "id": "RescriptCore.String.lastIndexOfOpt",
      "kind": "value",
      "name": "lastIndexOfOpt",
      "signature": "let lastIndexOfOpt: (. string, string) => option<int>",
      "docstrings": ["`lastIndexOfOpt(str, searchValue)`. Like `lastIndexOfOpt`, but return an\n`option<int>`.\n\n## Examples\n\n```rescript\nString.lastIndexOf(\"bookseller\", \"ok\") == Some(2)\nString.lastIndexOf(\"beekeeper\", \"ee\") == Some(4)\nString.lastIndexOf(\"abcdefg\", \"xyz\") == None\n```"]
    }, 
    {
      "id": "RescriptCore.String.lastIndexOfFrom",
      "kind": "value",
      "name": "lastIndexOfFrom",
      "signature": "let lastIndexOfFrom: (. string, string, int) => int",
      "docstrings": ["`lastIndexOfFrom(str, searchValue, start)` returns the position of the last\noccurrence of `searchValue` within `str`, searching backwards from the given\nstart position. Returns `-1` if `searchValue` is not in `str`. The return value\nis always relative to the beginning of the string.\nSee [`String.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf) on MDN.\n\n## Examples\n\n```rescript\nString.lastIndexOfFrom(\"bookseller\", \"ok\", 6) == 2\nString.lastIndexOfFrom(\"beekeeper\", \"ee\", 8) == 4\nString.lastIndexOfFrom(\"beekeeper\", \"ee\", 3) == 1\nString.lastIndexOfFrom(\"abcdefg\", \"xyz\", 4) == -1\n```"]
    }, 
    {
      "id": "RescriptCore.String.match",
      "kind": "value",
      "name": "match",
      "signature": "let match: (. string, Core__RegExp.t) => option<Core__RegExp.Result.t>",
      "docstrings": ["`match(str, regexp)` matches a `string` against the given `regexp`. If there is\nno match, it returns `None`. For regular expressions without the g modifier, if\nthere is a match, the return value is `Some(array)` where the array contains:\n- The entire matched string\n- Any capture groups if the regexp had parentheses\nFor regular expressions with the g modifier, a matched expression returns\n`Some(array)` with all the matched substrings and no capture groups.\nSee [`String.match`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) on MDN.\n\n## Examples\n\n```rescript\nString.match(\"The better bats\", %re(\"/b[aeiou]t/\")) == Some([\"bet\"])\nString.match(\"The better bats\", %re(\"/b[aeiou]t/g\")) == Some([\"bet\", \"bat\"])\nString.match(\"Today is 2018-04-05.\", %re(\"/(\\d+)-(\\d+)-(\\d+)/\")) ==\n  Some([\"2018-04-05\", \"2018\", \"04\", \"05\"])\nString.match(\"The large container.\", %re(\"/b[aeiou]g/\")) == None\n```"]
    }, 
    {
      "id": "RescriptCore.String.normalize",
      "kind": "value",
      "name": "normalize",
      "signature": "let normalize: (. string) => string",
      "docstrings": ["`normalize(str)` returns the normalized Unicode string using Normalization Form\nCanonical (NFC) Composition. Consider the character ã, which can be represented\nas the single codepoint \\u00e3 or the combination of a lower case letter A\n\\u0061 and a combining tilde \\u0303. Normalization ensures that both can be\nstored in an equivalent binary representation.\nSee [`String.normalize`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize) on MDN.\nSee also [Unicode technical report #15](https://unicode.org/reports/tr15/) for details.\n\n## Examples\n\n```rescript\nlet string1 = \"\\uFB00\"\nlet string2 = \"\\u0066\\u0066\"\nConsole.log(string1 === string2) // false\n\nlet normalizeString1 = String.normalize(string1, \"NFKD\")\nlet normalizeString2 = String.normalize(string2, \"NFKD\")\nassert(normalizeString1 === normalizeString2)\n```"]
    }, 
    {
      "id": "RescriptCore.String.normalizeForm",
      "kind": "type",
      "name": "normalizeForm",
      "signature": "type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]",
      "docstrings": ["`normalizeByForm(str, form)` returns the normalized Unicode string using the\nspecified form of normalization, which may be one of:\n- \"NFC\" — Normalization Form Canonical Composition.\n- \"NFD\" — Normalization Form Canonical Decomposition.\n- \"NFKC\" — Normalization Form Compatibility Composition.\n- \"NFKD\" — Normalization Form Compatibility Decomposition.\nSee [`String.normalize`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize) on MDN.\nSee also [Unicode technical report #15](https://unicode.org/reports/tr15/) for\ndetails.\n\n## Examples\n\n```rescript\nlet string1 = \"\\uFB00\"\nlet string2 = \"\\u0066\\u0066\"\nConsole.log(string1 == string2) // false\n\nlet normalizeString1 = String.normalizeByForm(string1, #NFKD)\nlet normalizeString2 = String.normalizeByForm(string2, #NFKD)\nConsole.log(normalizeString1 == normalizeString2) // true\n```"]
    }, 
    {
      "id": "RescriptCore.String.normalizeByForm",
      "kind": "value",
      "name": "normalizeByForm",
      "signature": "let normalizeByForm: (. string, normalizeForm) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.String.repeat",
      "kind": "value",
      "name": "repeat",
      "signature": "let repeat: (. string, int) => string",
      "docstrings": ["`repeat(str, n)` returns a `string` that consists of `n` repetitions of `str`.\nSee [`String.repeat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat) on MDN.\n\n## Examples\n\n```rescript\nString.repeat(\"ha\", 3) == \"hahaha\"\nString.repeat(\"empty\", 0) == \"\"\n```\n\n## Exceptions\n\n- `RangeError`: if `n` is negative."]
    }, 
    {
      "id": "RescriptCore.String.replace",
      "kind": "value",
      "name": "replace",
      "signature": "let replace: (. string, string, string) => string",
      "docstrings": ["`replace(str, substr, newSubstr)` returns a new `string` which is\nidentical to `str` except with the first matching instance of `substr` replaced\nby `newSubstr`. `substr` is treated as a verbatim string to match, not a\nregular expression.\nSee [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.\n\n## Examples\n\n```rescript\nString.replace(\"old string\", \"old\", \"new\") == \"new string\"\nString.replace(\"the cat and the dog\", \"the\", \"this\") == \"this cat and the dog\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.replaceRegExp",
      "kind": "value",
      "name": "replaceRegExp",
      "signature": "let replaceRegExp: (. string, Core__RegExp.t, string) => string",
      "docstrings": ["`replaceRegExp(str, regex, replacement)` returns a new `string` where\noccurrences matching regex have been replaced by `replacement`.\nSee [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.\n\n## Examples\n\n```rescript\nString.replaceRegExp(\"vowels be gone\", %re(\"/[aeiou]/g\"), \"x\") == \"vxwxls bx gxnx\"\nString.replaceRegExp(\"Juan Fulano\", %re(\"/(\\w+) (\\w+)/\"), \"$2, $1\") == \"Fulano, Juan\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.replaceAll",
      "kind": "value",
      "name": "replaceAll",
      "signature": "let replaceAll: (. string, string, string) => string",
      "docstrings": ["`replaceAll(str, substr, newSubstr)` returns a new `string` which is\nidentical to `str` except with all matching instances of `substr` replaced\nby `newSubstr`. `substr` is treated as a verbatim string to match, not a\nregular expression.\nSee [`String.replaceAll`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) on MDN.\n\n## Examples\n\n```rescript\nString.replaceAll(\"old old string\", \"old\", \"new\") == \"new new string\"\nString.replaceAll(\"the cat and the dog\", \"the\", \"this\") == \"this cat and this dog\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.replaceAllRegExp",
      "kind": "value",
      "name": "replaceAllRegExp",
      "signature": "let replaceAllRegExp: (. string, Core__RegExp.t, string) => string",
      "docstrings": ["`replaceAllRegExp(str, regex, replacement)` returns a new `string` where\nall occurrences matching regex have been replaced by `replacement`.\nThe pattern must include the global (`g`) flag or a runtime TypeError will be thrown.\nSee [`String.replaceAll`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) on MDN.\n\n## Examples\n\n```rescript\nString.replaceAllRegExp(\"vowels be gone\", %re(\"/[aeiou]/g\"), \"x\") == \"vxwxls bx gxnx\"\nString.replaceAllRegExp(\"aabbcc\", %re(\"/b/g\"), \".\") == \"aa..cc\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.unsafeReplaceRegExpBy0",
      "kind": "value",
      "name": "unsafeReplaceRegExpBy0",
      "signature": "let unsafeReplaceRegExpBy0: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string",
      "docstrings": ["`unsafeReplaceRegExpBy0(str, regex, f)` returns a new `string` with some or all\nmatches of a pattern with no capturing parentheses replaced by the value\nreturned from the given function. The function receives as its parameters the\nmatched string, the offset at which the match begins, and the whole string being\nmatched.\nSee [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.\n\n## Examples\n\n```rescript\nlet str = \"beautiful vowels\"\nlet re = %re(\"/[aeiou]/g\")\nlet matchFn = (matchPart, _offset, _wholeString) => String.toUpperCase(matchPart)\nString.unsafeReplaceRegExpBy0(str, re, matchFn) == \"bEAUtIfUl vOwEls\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.unsafeReplaceRegExpBy1",
      "kind": "value",
      "name": "unsafeReplaceRegExpBy1",
      "signature": "let unsafeReplaceRegExpBy1: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~group1: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string",
      "docstrings": ["`unsafeReplaceRegExpBy1(str, regexp, f)`. Like `unsafeReplaceRegExpBy0`, but `f`\nhas `group1` parameter.\nSee [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.\n\n## Examples\n\n```rescript\nlet str = \"Jony is 40\"\nlet re = %re(\"/(Jony is )\\d+/g\")\nlet matchFn = (_match, part1, _offset, _wholeString) => {\n  part1 ++ \"41\"\n}\nString.unsafeReplaceRegExpBy1(str, re, matchFn) == \"Jony is 41\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.unsafeReplaceRegExpBy2",
      "kind": "value",
      "name": "unsafeReplaceRegExpBy2",
      "signature": "let unsafeReplaceRegExpBy2: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~group1: string,\n    ~group2: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string",
      "docstrings": ["`unsafeReplaceRegExpBy2(str, regexp, f)`. Like `unsafeReplaceRegExpBy1`, but `f`\nhas two group parameters.\nSee [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.\n\n## Examples\n\n```rescript\nlet str = \"7 times 6\"\nlet re = %re(\"/(\\d+) times (\\d+)/\")\nlet matchFn = (_match, p1, p2, _offset, _wholeString) => {\n  switch (Int.fromString(p1), Int.fromString(p2)) {\n  | (Some(x), Some(y)) => Int.toString(x * y)\n  | _ => \"???\"\n  }\n}\nString.unsafeReplaceRegExpBy2(str, re, matchFn) == \"42\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.unsafeReplaceRegExpBy3",
      "kind": "value",
      "name": "unsafeReplaceRegExpBy3",
      "signature": "let unsafeReplaceRegExpBy3: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~group1: string,\n    ~group2: string,\n    ~group3: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string",
      "docstrings": ["`unsafeReplaceRegExpBy3(str, regexp, f)`. Like `unsafeReplaceRegExpBy1`, but `f`\nhas three group parameters.\nSee [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN."]
    }, 
    {
      "id": "RescriptCore.String.search",
      "kind": "value",
      "name": "search",
      "signature": "let search: (. string, Core__RegExp.t) => int",
      "docstrings": ["`search(str, regexp)` returns the starting position of the first match of\n`regexp` in the given `str`, or -1 if there is no match.\nSee [`String.search`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search) on MDN.\n\n## Examples\n\n```rescript\nString.search(\"testing 1 2 3\", %re(\"/\\d+/\")) == 8\nString.search(\"no numbers\", %re(\"/\\d+/\")) == -1\n```"]
    }, 
    {
      "id": "RescriptCore.String.searchOpt",
      "kind": "value",
      "name": "searchOpt",
      "signature": "let searchOpt: (. string, Core__RegExp.t) => option<int>",
      "docstrings": ["`searchOpt(str, regexp)`. Like `search`, but return an `option<int>`.\n\n## Examples\n\n```rescript\nString.search(\"testing 1 2 3\", %re(\"/\\d+/\")) == Some(8)\nString.search(\"no numbers\", %re(\"/\\d+/\")) == None\n```"]
    }, 
    {
      "id": "RescriptCore.String.slice",
      "kind": "value",
      "name": "slice",
      "signature": "let slice: (. string, ~start: int, ~end: int) => string",
      "docstrings": ["`slice(str, ~start, ~end)` returns the substring of `str` starting at\ncharacter `start` up to but not including `end`.\n- If either `start` or `end` is negative, then it is evaluated as\n`length(str - start)` or `length(str - end)`.\n- If `end` is greater than the length of `str`, then it is treated as\n`length(str)`.\n- If `start` is greater than `end`, slice returns the empty string.\nSee [`String.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice) on MDN.\n\n## Examples\n\n```rescript\nString.slice(\"abcdefg\", ~start=2, ~end=5) == \"cde\"\nString.slice(\"abcdefg\", ~start=2, ~end=9) == \"cdefg\"\nString.slice(\"abcdefg\", ~start=-4, ~end=-2) == \"de\"\nString.slice(\"abcdefg\", ~start=5, ~end=1) == \"\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.sliceToEnd",
      "kind": "value",
      "name": "sliceToEnd",
      "signature": "let sliceToEnd: (. string, ~start: int) => string",
      "docstrings": ["`sliceToEnd(str, ~start)` returns the substring of `str` starting at character\n`start` to the end of the string.\n- If `start` is negative, then it is evaluated as `length(str - start)`.\n- If `start` is greater than the length of `str`, then sliceToEnd returns the empty string.\nSee [`String.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice) on MDN.\n\n## Examples\n\n```rescript\nString.sliceToEnd(\"abcdefg\", ~start=4) == \"efg\"\nString.sliceToEnd(\"abcdefg\", ~start=-2) == \"fg\"\nString.sliceToEnd(\"abcdefg\", ~start=7) == \"\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.split",
      "kind": "value",
      "name": "split",
      "signature": "let split: (. string, string) => array<string>",
      "docstrings": ["`split(str, delimiter)` splits the given `str` at every occurrence of\n`delimiter` and returns an array of the resulting substrings.\nSee [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.\n\n## Examples\n\n```rescript\nString.split(\"2018-01-02\", \"-\") == [\"2018\", \"01\", \"02\"]\nString.split(\"a,b,,c\", \",\") == [\"a\", \"b\", \"\", \"c\"]\nString.split(\"good::bad as great::awful\", \"::\") == [\"good\", \"bad as great\", \"awful\"]\nString.split(\"has-no-delimiter\", \";\") == [\"has-no-delimiter\"]\n```"]
    }, 
    {
      "id": "RescriptCore.String.splitAtMost",
      "kind": "value",
      "name": "splitAtMost",
      "signature": "let splitAtMost: (. string, string, ~limit: int) => array<string>",
      "docstrings": ["`splitAtMost(str, delimiter, ~limit)` splits the given `str` at every\noccurrence of `delimiter` and returns an array of the first `limit` resulting\nsubstrings. If `limit` is negative or greater than the number of substrings,\nthe array will contain all the substrings.\n\n## Examples\n\n```rescript\nString.splitAtMost(\"ant/bee/cat/dog/elk\", \"/\", ~limit=3) = [\"ant\", \"bee\", \"cat\"]\nString.splitAtMost(\"ant/bee/cat/dog/elk\", \"/\", ~limit=0) = []\nString.splitAtMost(\"ant/bee/cat/dog/elk\", \"/\", ~limit=9) = [\"ant\", \"bee\", \"cat\", \"dog\", \"elk\"]\n```"]
    }, 
    {
      "id": "RescriptCore.String.splitByRegExp",
      "kind": "value",
      "name": "splitByRegExp",
      "signature": "let splitByRegExp: (. string, Core__RegExp.t) => array<option<string>>",
      "docstrings": ["`splitByRegExp(str, regexp)` splits the given `str` at every occurrence of\n`regexp` and returns an array of the resulting substrings.\nSee [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.\n\n## Examples\n\n```rescript\nString.splitByRegExp(\"Jan,Feb,Mar\", %re(\"/,/\")) == [Some(\"Jan\"), Some(\"Feb\"), Some(\"Mar\")]\n```"]
    }, 
    {
      "id": "RescriptCore.String.splitByRegExpAtMost",
      "kind": "value",
      "name": "splitByRegExpAtMost",
      "signature": "let splitByRegExpAtMost: (.\n  string,\n  Core__RegExp.t,\n  ~limit: int,\n) => array<option<string>>",
      "docstrings": ["`splitByRegExpAtMost(str, regexp, ~limit)` splits the given `str` at every\noccurrence of `regexp` and returns an array of the first `limit` resulting\nsubstrings. If `limit` is negative or greater than the number of substrings, the\narray will contain all the substrings.\nSee [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.\n\n## Examples\n\n```rescript\nString.splitByRegExpAtMost(\"Hello World. How are you doing?\", %re(\"/ /\"), ~limit=3) == [\n  Some(\"Hello\"),\n  Some(\"World.\"),\n  Some(\"How\"),\n]\n```"]
    }, 
    {
      "id": "RescriptCore.String.startsWith",
      "kind": "value",
      "name": "startsWith",
      "signature": "let startsWith: (. string, string) => bool",
      "docstrings": ["`startsWith(str, substr)` returns `true` if the `str` starts with `substr`,\n`false` otherwise.\nSee [`String.startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith) on MDN.\n\n## Examples\n\n```rescript\nString.startsWith(\"BuckleScript\", \"Buckle\") == true\nString.startsWith(\"BuckleScript\", \"\") == true\nString.startsWith(\"JavaScript\", \"Buckle\") == false\n```"]
    }, 
    {
      "id": "RescriptCore.String.startsWithFrom",
      "kind": "value",
      "name": "startsWithFrom",
      "signature": "let startsWithFrom: (. string, string, int) => bool",
      "docstrings": ["`startsWithFrom(str, substr, n)` returns `true` if the `str` starts\nwith `substr` starting at position `n`, `false` otherwise. If `n` is negative,\nthe search starts at the beginning of `str`.\nSee [`String.startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith) on MDN.\n\n## Examples\n\n```rescript\nString.startsWithFrom(\"BuckleScript\", \"kle\", 3) == true\nString.startsWithFrom(\"BuckleScript\", \"\", 3) == true\nString.startsWithFrom(\"JavaScript\", \"Buckle\", 2) == false\n```"]
    }, 
    {
      "id": "RescriptCore.String.substring",
      "kind": "value",
      "name": "substring",
      "signature": "let substring: (. string, ~start: int, ~end: int) => string",
      "docstrings": ["`substring(str, ~start, ~end)` returns characters `start` up to but not\nincluding end from `str`.\n- If `start` is less than zero, it is treated as zero.\n- If `end` is zero or negative, the empty string is returned.\n- If `start` is greater than `end`, the `start` and `end` points are swapped.\nSee [`String.substring`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring) on MDN.\n\n## Examples\n\n```rescript\nString.substring(\"playground\", ~start=3, ~end=6) == \"ygr\"\nString.substring(\"playground\", ~start=6, ~end=3) == \"ygr\"\nString.substring(\"playground\", ~start=4, ~end=12) == \"ground\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.substringToEnd",
      "kind": "value",
      "name": "substringToEnd",
      "signature": "let substringToEnd: (. string, ~start: int) => string",
      "docstrings": ["`substringToEnd(str, ~start)` returns the substring of `str` from position\n`start` to the end.\n- If `start` is less than or equal to zero, the entire string is returned.\n- If `start` is greater than or equal to the length of `str`, the empty string\nis returned.\nSee [`String.substring`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring) on MDN.\n\n## Examples\n\n```rescript\nString.substringToEnd(\"playground\", ~start=4) == \"ground\"\nString.substringToEnd(\"playground\", ~start=-3) == \"playground\"\nString.substringToEnd(\"playground\", ~start=12) == \"\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.toLowerCase",
      "kind": "value",
      "name": "toLowerCase",
      "signature": "let toLowerCase: (. string) => string",
      "docstrings": ["`toLowerCase(str)` converts `str` to lower case using the locale-insensitive\ncase mappings in the Unicode Character Database. Notice that the conversion can\ngive different results depending upon context, for example with the Greek\nletter sigma, which has two different lower case forms, one when it is the last\ncharacter in a string and another when it is not.\nSee [`String.toLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) on MDN.\n\n## Examples\n\n```rescript\nString.toLowerCase(\"ABC\") == \"abc\"\nString.toLowerCase(`ΣΠ`) == `σπ`\nString.toLowerCase(`ΠΣ`) == `πς`\n```"]
    }, 
    {
      "id": "RescriptCore.String.toLocaleLowerCase",
      "kind": "value",
      "name": "toLocaleLowerCase",
      "signature": "let toLocaleLowerCase: (. string) => string",
      "docstrings": ["`toLocaleLowerCase(str)` converts `str` to lower case using the current locale.\nSee [`String.toLocaleLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleLowerCase) on MDN."]
    }, 
    {
      "id": "RescriptCore.String.toUpperCase",
      "kind": "value",
      "name": "toUpperCase",
      "signature": "let toUpperCase: (. string) => string",
      "docstrings": ["`toUpperCase(str)` converts `str` to upper case using the locale-insensitive\ncase mappings in the Unicode Character Database. Notice that the conversion can\nexpand the number of letters in the result, for example the German ß\ncapitalizes to two Ses in a row.\nSee [`String.toUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) on MDN.\n\n## Examples\n\n```rescript\nString.toUpperCase(\"abc\") == \"ABC\"\nString.toUpperCase(`Straße`) == `STRASSE`\nString.toUpperCase(`πς`) == `ΠΣ`\n```"]
    }, 
    {
      "id": "RescriptCore.String.toLocaleUpperCase",
      "kind": "value",
      "name": "toLocaleUpperCase",
      "signature": "let toLocaleUpperCase: (. string) => string",
      "docstrings": ["`toLocaleUpperCase(str)` converts `str` to upper case using the current locale.\nSee [`String.toLocaleUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleUpperCase) on MDN."]
    }, 
    {
      "id": "RescriptCore.String.trim",
      "kind": "value",
      "name": "trim",
      "signature": "let trim: (. string) => string",
      "docstrings": ["`trim(str)` returns a string that is `str` with whitespace stripped from both\nends. Internal whitespace is not removed.\nSee [`String.trim`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim) on MDN.\n\n## Examples\n\n```rescript\nString.trim(\"   abc def   \") == \"abc def\"\nString.trim(\"\\n\\r\\t abc def \\n\\n\\t\\r \") == \"abc def\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.trimStart",
      "kind": "value",
      "name": "trimStart",
      "signature": "let trimStart: (. string) => string",
      "docstrings": ["`trimStart(str)` returns a string that is `str` with whitespace stripped from\nthe beginning of a string. Internal whitespace is not removed.\nSee [`String.trimStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart) on MDN.\n\n## Examples\n\n```rescript\nString.trimStart(\"   Hello world!   \") == \"Hello world!   \"\nString.trimStart(\"   Hello   world!   \") == \"Hello   world!   \"\n```"]
    }, 
    {
      "id": "RescriptCore.String.trimEnd",
      "kind": "value",
      "name": "trimEnd",
      "signature": "let trimEnd: (. string) => string",
      "docstrings": ["`trinEnd(str)` returns a string that is `str` with whitespace stripped from the\nend of a string. Internal whitespace is not removed.\nSee [`String.trimEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd) on MDN.\n\n## Examples\n\n```rescript\nString.trimEnd(\"   Hello world!   \") == \"   Hello world!\"\nString.trimEnd(\"   Hello   world!   \") == \"   Hello   world!\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.padStart",
      "kind": "value",
      "name": "padStart",
      "signature": "let padStart: (. string, int, string) => string",
      "docstrings": ["`padStart(str, n, padStr)` returns a string that has been padded with `padStr`\n(multiple times, if needed) until the resulting string reaches the given `n`\nlength. The padding is applied from the start of the current string.\nSee [`String.padStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart) on MDN.\n\n## Examples\n\n```rescript\nString.padStart(\"abc\", 5, \" \") == \"  abc\"\nString.padStart(\"abc\", 6, \"123465\") == \"123abc\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.padEnd",
      "kind": "value",
      "name": "padEnd",
      "signature": "let padEnd: (. string, int, string) => string",
      "docstrings": ["`padEnd(str, n, padStr)` returns a string that has been padded with `padStr`\n(multiple times, if needed) until the resulting string reaches the given `n`\nlength. The padding is applied from the end of the current string.\nSee [`String.padEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd) on MDN.\n\n## Examples\n\n```rescript\nString.padEnd(\"Hello\", 10, \".\") == \"Hello.....\"\nString.padEnd(\"abc\", 1, \"\") == \"abc\"\n```"]
    }, 
    {
      "id": "RescriptCore.String.getSymbol",
      "kind": "value",
      "name": "getSymbol",
      "signature": "let getSymbol: (. string, Core__Symbol.t) => option<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.String.getSymbolUnsafe",
      "kind": "value",
      "name": "getSymbolUnsafe",
      "signature": "let getSymbolUnsafe: (. string, Core__Symbol.t) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.String.setSymbol",
      "kind": "value",
      "name": "setSymbol",
      "signature": "let setSymbol: (. string, Core__Symbol.t, 'a) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.String.localeCompare",
      "kind": "value",
      "name": "localeCompare",
      "signature": "let localeCompare: (. string, string) => float",
      "docstrings": ["`localeCompare(referenceStr, compareStr)` returns a float than indicatings\nwhether a reference string comes before or after, or is the same as the given\nstring in sort order. If `referenceStr` occurs before `compareStr` positive if\nthe `referenceStr` occurs after `compareStr`, `0` if they are equivalent.\nDo not rely on exact return values of `-1` or `1`\nSee [`String.localeCompare`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare) on MDN.\n\n## Examples\n\n```rescript\nString.localeCompare(\"a\", \"c\") < 0.0 == true\nString.localeCompare(\"a\", \"a\") == 0.0\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Symbol",
    "kind": "moduleAlias",
    "name": "Symbol",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Symbol.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Types.symbol",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. string) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.getFor",
      "kind": "value",
      "name": "getFor",
      "signature": "let getFor: (. string) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.keyFor",
      "kind": "value",
      "name": "keyFor",
      "signature": "let keyFor: (. t) => option<string>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.asyncIterator",
      "kind": "value",
      "name": "asyncIterator",
      "signature": "let asyncIterator: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.hasInstance",
      "kind": "value",
      "name": "hasInstance",
      "signature": "let hasInstance: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.isConcatSpreadable",
      "kind": "value",
      "name": "isConcatSpreadable",
      "signature": "let isConcatSpreadable: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.iterator",
      "kind": "value",
      "name": "iterator",
      "signature": "let iterator: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.match",
      "kind": "value",
      "name": "match",
      "signature": "let match: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.matchAll",
      "kind": "value",
      "name": "matchAll",
      "signature": "let matchAll: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.replace",
      "kind": "value",
      "name": "replace",
      "signature": "let replace: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.search",
      "kind": "value",
      "name": "search",
      "signature": "let search: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.species",
      "kind": "value",
      "name": "species",
      "signature": "let species: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.split",
      "kind": "value",
      "name": "split",
      "signature": "let split: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.toPrimitive",
      "kind": "value",
      "name": "toPrimitive",
      "signature": "let toPrimitive: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.toStringTag",
      "kind": "value",
      "name": "toStringTag",
      "signature": "let toStringTag: t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Symbol.unscopables",
      "kind": "value",
      "name": "unscopables",
      "signature": "let unscopables: t",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.Type",
    "kind": "moduleAlias",
    "name": "Type",
    "docstrings": ["Utilities for classifying the type of JavaScript values at runtime."],
    "items": [
    {
      "id": "RescriptCore.Type.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = [\n  | #bigint\n  | #boolean\n  | #function\n  | #number\n  | #object\n  | #string\n  | #symbol\n  | #undefined\n]",
      "docstrings": ["The possible types of JavaScript values."]
    }, 
    {
      "id": "RescriptCore.Type.typeof",
      "kind": "value",
      "name": "typeof",
      "signature": "let typeof: (. 'a) => t",
      "docstrings": ["`typeof(someValue)`\n\nReturns the underlying JavaScript type of any runtime value.\n\nSee [`typeof`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof) on MDN.\n\n## Examples\n```rescript\nConsole.log(Type.typeof(\"Hello\")) // Logs \"string\" to the console.\n\nlet someVariable = true\n\nswitch someVariable->Type.typeof {\n| #boolean => Console.log(\"This is a bool, yay!\")\n| _ => Console.log(\"Oh, not a bool sadly...\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Type.Classify",
      "name": "Classify",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Type.Classify.function",
        "kind": "type",
        "name": "function",
        "signature": "type function",
        "docstrings": ["An abstract type representing a JavaScript function.\n\n  See [`function`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) on MDN."]
      }, 
      {
        "id": "RescriptCore.Type.Classify.object",
        "kind": "type",
        "name": "object",
        "signature": "type object",
        "docstrings": ["An abstract type representing a JavaScript object.\n\n  See [`object`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) on MDN."]
      }, 
      {
        "id": "RescriptCore.Type.Classify.t",
        "kind": "type",
        "name": "t",
        "signature": "type t =\n  | Bool(bool)\n  | Null\n  | Undefined\n  | String(string)\n  | Number(float)\n  | Object(object)\n  | Function(function)\n  | Symbol(Core__Symbol.t)\n  | BigInt(Core__BigInt.t)",
        "docstrings": ["The type representing a classified JavaScript value."],
        "detail": 
        {
          "kind": "variant",
          "items": [
          {
            "name": "Bool",
            "docstrings": [],
            "signature": "Bool(bool)"
          }, 
          {
            "name": "Null",
            "docstrings": [],
            "signature": "Null"
          }, 
          {
            "name": "Undefined",
            "docstrings": [],
            "signature": "Undefined"
          }, 
          {
            "name": "String",
            "docstrings": [],
            "signature": "String(string)"
          }, 
          {
            "name": "Number",
            "docstrings": [],
            "signature": "Number(float)"
          }, 
          {
            "name": "Object",
            "docstrings": [],
            "signature": "Object(object)"
          }, 
          {
            "name": "Function",
            "docstrings": [],
            "signature": "Function(function)"
          }, 
          {
            "name": "Symbol",
            "docstrings": [],
            "signature": "Symbol(Core__Symbol.t)"
          }, 
          {
            "name": "BigInt",
            "docstrings": [],
            "signature": "BigInt(Core__BigInt.t)"
          }]
        }
      }, 
      {
        "id": "RescriptCore.Type.Classify.classify",
        "kind": "value",
        "name": "classify",
        "signature": "let classify: (. 'a) => t",
        "docstrings": ["`classify(anyValue)`\nClassifies a JavaScript value.\n\n## Examples\n```rescript\nswitch %raw(`null`)->Type.Classify.classify {\n| Null => Console.log(\"Yup, that's null.\")\n| _ => Console.log(\"This doesn't actually appear to be null...\")\n}\n```"]
      }]
    }]
  }, 
  {
    "id": "RescriptCore.JSON",
    "kind": "moduleAlias",
    "name": "JSON",
    "docstrings": ["Functions for interacting with JSON."],
    "items": [
    {
      "id": "RescriptCore.JSON.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Json.t",
      "docstrings": ["A type representing a JSON object."],
      "detail": 
      {
        "kind": "variant",
        "items": [
        {
          "name": "Boolean",
          "docstrings": [],
          "signature": "Boolean(bool)"
        }, 
        {
          "name": "Null",
          "docstrings": [],
          "signature": "Null"
        }, 
        {
          "name": "String",
          "docstrings": [],
          "signature": "String(string)"
        }, 
        {
          "name": "Number",
          "docstrings": [],
          "signature": "Number(float)"
        }, 
        {
          "name": "Object",
          "docstrings": [],
          "signature": "Object(Js.Dict.t<t>)"
        }, 
        {
          "name": "Array",
          "docstrings": [],
          "signature": "Array(array<t>)"
        }]
      }
    }, 
    {
      "id": "RescriptCore.JSON.parseExn",
      "kind": "value",
      "name": "parseExn",
      "signature": "let parseExn: (. string) => t",
      "docstrings": ["`parseExn(string)` \n\nParses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.\nIt returns a JSON type.\n\n## Examples\n```rescript\ntry {\n  let _ = JSON.parseExn(`{\"foo\":\"bar\",\"hello\":\"world\"}`)\n  // { foo: 'bar', hello: 'world' }\n\n  let _ = JSON.parseExn(\"\")\n  // error\n} catch {\n| Exn.Error(obj) => Console.log(\"error\")\n}\n```\n\n## Exceptions \n\n- Raises a SyntaxError (Exn.t) if the string isn't valid JSON."]
    }, 
    {
      "id": "RescriptCore.JSON.parseExnWithReviver",
      "kind": "value",
      "name": "parseExnWithReviver",
      "signature": "let parseExnWithReviver: (. string, (. string, t) => t) => t",
      "docstrings": ["`parseExnWithReviver(string, reviver)` \n\nParses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.\nThe reviver describes how the value should be transformed. It is a function which receives a key and a value.\nIt returns a JSON type.\n\n## Examples\n```rescript\nlet reviver = (key, value) => {\n  let valueType = JSON.Classify.classify(value)\n\n  switch valueType {\n  | String(string) => string->String.toUpperCase->JSON.Encode.string\n  | Number(number) => (number *. 2.0)->JSON.Encode.float\n  | _ => value\n  }\n}\n\nlet jsonString = `{\"hello\":\"world\",\"someNumber\":21}`\n\ntry {\n  JSON.parseExnWithReviver(jsonString, reviver)->Console.log\n  // { hello: 'WORLD', someNumber: 42 }\n\n  JSON.parseExnWithReviver(\"\", reviver)->Console.log\n  // error\n} catch {\n| Exn.Error(_) => Console.log(\"error\")\n}\n```\n\n## Exceptions \n\n- Raises a SyntaxError if the string isn't valid JSON."]
    }, 
    {
      "id": "RescriptCore.JSON.stringify",
      "kind": "value",
      "name": "stringify",
      "signature": "let stringify: (. t) => string",
      "docstrings": ["`stringify(json)` \n\nConverts a JSON object to a JSON string.\nIf you want to stringify any type, use `JSON.stringifyAny` instead.\n\n## Examples\n```rescript\nlet json =\n  Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n    (\"someNumber\", JSON.Encode.int(42)),\n  ])->JSON.Encode.object\n\nJSON.stringify(json)\n// {\"foo\":\"bar\",\"hello\":\"world\",\"someNumber\":42}\n```"]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyWithIndent",
      "kind": "value",
      "name": "stringifyWithIndent",
      "signature": "let stringifyWithIndent: (. t, int) => string",
      "docstrings": ["`stringifyWithIndent(json, indentation)` \n\nConverts a JSON object to a JSON string. The output will be indented.\nIf you want to stringify any type, use `JSON.stringifyAnyWithIndent` instead.\n\n## Examples\n```rescript\nlet json =\n  Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n    (\"someNumber\", JSON.Encode.int(42)),\n  ])->JSON.Encode.object\n\nJSON.stringifyWithIndent(json, 2)\n// {\n//   \"foo\": \"bar\",\n//   \"hello\": \"world\",\n//   \"someNumber\": 42\n// }\n```"]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyWithReplacer",
      "kind": "value",
      "name": "stringifyWithReplacer",
      "signature": "let stringifyWithReplacer: (. t, (. string, t) => t) => string",
      "docstrings": ["`stringifyWithReplacer(json, replacer)` \n\nConverts a JSON object to a JSON string.\nThe replacer describes how the value should be transformed. It is a function which receives a key and a value.\nIf you want to stringify any type, use `JSON.stringifyAnyWithReplacer` instead.\n\n## Examples\n```rescript\nlet json =\n  Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n    (\"someNumber\", JSON.Encode.int(42)),\n  ])->JSON.Encode.object\n\nlet replacer = (key, value) => {\n  let decodedValue = value->JSON.Decode.string\n\n  switch decodedValue {\n  | Some(string) => string->String.toUpperCase->JSON.Encode.string\n  | None => value\n  }\n}\n\nJSON.stringifyWithReplacer(json, replacer)\n// {\"foo\":\"BAR\",\"hello\":\"WORLD\",\"someNumber\":42}\n```"]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyWithReplacerAndIndent",
      "kind": "value",
      "name": "stringifyWithReplacerAndIndent",
      "signature": "let stringifyWithReplacerAndIndent: (. t, (. string, t) => t, int) => string",
      "docstrings": ["`stringifyWithReplacerAndIndent(json, replacer, indentation)` \n\nConverts a JSON object to a JSON string. The output will be indented.\nThe replacer describes how the value should be transformed. It is a function which receives a key and a value.\nIf you want to stringify any type, use `JSON.stringifyAnyWithReplacerAndIndent` instead.\n\n## Examples\n```rescript\nlet json =\n  Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n    (\"someNumber\", JSON.Encode.int(42)),\n  ])->JSON.Encode.object\n\nlet replacer = (key, value) => {\n  let decodedValue = value->JSON.Decode.string\n\n  switch decodedValue {\n  | Some(string) => string->String.toUpperCase->JSON.Encode.string\n  | None => value\n  }\n}\n\nJSON.stringifyWithReplacerAndIndent(json, replacer, 2)\n// {\n  \"foo\": \"BAR\",\n  \"hello\": \"WORLD\",\n  \"someNumber\": 42\n}\n```"]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyWithFilter",
      "kind": "value",
      "name": "stringifyWithFilter",
      "signature": "let stringifyWithFilter: (. t, array<string>) => string",
      "docstrings": ["`stringifyWithFilter(json, filter)` \n\nConverts a JSON object to a JSON string.\nThe filter is an array of keys, which should be included in the output.\nIf you want to stringify any type, use `JSON.stringifyAnyWithFilter` instead.\n\n## Examples\n```rescript\nlet json =\n  Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n    (\"someNumber\", JSON.Encode.int(42)),\n  ])->JSON.Encode.object\n\nJSON.stringifyWithFilter(json, [\"foo\", \"someNumber\"])\n// {\"foo\":\"bar\",\"someNumber\":42}\n```"]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyWithFilterAndIndent",
      "kind": "value",
      "name": "stringifyWithFilterAndIndent",
      "signature": "let stringifyWithFilterAndIndent: (. t, array<string>, int) => string",
      "docstrings": ["`stringifyWithFilterAndIndent(json, filter, indentation)` \n\nConverts a JSON object to a JSON string. The output will be indented.\nThe filter is an array of keys, which should be included in the output.\nIf you want to stringify any type, use `JSON.stringifyAnyWithFilterAndIndent` instead.\n\n## Examples\n```rescript\nlet json =\n  Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n    (\"someNumber\", JSON.Encode.int(42)),\n  ])->JSON.Encode.object\n\nJSON.stringifyWithFilterAndIndent(json, [\"foo\", \"someNumber\"], 2)\n// {\n//   \"foo\": \"bar\",\n//   \"someNumber\": 42\n// }\n```"]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyAny",
      "kind": "value",
      "name": "stringifyAny",
      "signature": "let stringifyAny: (. 'a) => option<string>",
      "docstrings": ["`stringifyAny(any)` \n\nConverts any type to a JSON string.\nStringifying a function or `undefined` will return `None`.\nIf the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).\nIf you want to stringify a JSON object, use `JSON.stringify` instead.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([\n  (\"foo\", JSON.Encode.string(\"bar\")),\n  (\"hello\", JSON.Encode.string(\"world\")),\n  (\"someNumber\", JSON.Encode.int(42)),\n])\n\nJSON.stringifyAny(dict)\n// {\"foo\":\"bar\",\"hello\":\"world\",\"someNumber\":42}\n\nJSON.stringifyAny(() => \"hello world\")\n// None\n\nBigInt.fromInt(0)->JSON.stringifyAny\n// exception\n```\n\n## Exceptions \n\n- Raises a TypeError if the value contains circular references.\n- Raises a TypeError if the value contains `BigInt`s."]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyAnyWithIndent",
      "kind": "value",
      "name": "stringifyAnyWithIndent",
      "signature": "let stringifyAnyWithIndent: (. 'a, int) => option<string>",
      "docstrings": ["`stringifyAnyWithIndent(any, indentation)` \n\nConverts any type to a JSON string. The output will be indented.\nStringifying a function or `undefined` will return `None`.\nIf the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).\nIf you want to stringify a JSON object, use `JSON.stringifyWithIndent` instead.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([\n  (\"foo\", JSON.Encode.string(\"bar\")),\n  (\"hello\", JSON.Encode.string(\"world\")),\n  (\"someNumber\", JSON.Encode.int(42)),\n])\n\nJSON.stringifyAnyWithIndent(dict, 2)\n// {\n//   \"foo\": \"bar\",\n//   \"hello\": \"world\",\n//   \"someNumber\": 42\n// }\n\nJSON.stringifyAny(() => \"hello world\")\n// None\n\nBigInt.fromInt(0)->JSON.stringifyAny\n// exception\n```\n\n## Exceptions \n\n- Raises a TypeError if the value contains circular references.\n- Raises a TypeError if the value contains `BigInt`s."]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyAnyWithReplacer",
      "kind": "value",
      "name": "stringifyAnyWithReplacer",
      "signature": "let stringifyAnyWithReplacer: (. 'a, (. string, t) => t) => option<string>",
      "docstrings": ["`stringifyAnyWithReplacer(json, replacer)` \n\nConverts any type to a JSON string.\nThe replacer describes how the value should be transformed. It is a function which receives a key and a value.\nStringifying a function or `undefined` will return `None`.\nIf the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).\nIf you want to stringify a JSON object, use `JSON.stringifyWithReplacer` instead.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([\n  (\"foo\", JSON.Encode.string(\"bar\")),\n  (\"hello\", JSON.Encode.string(\"world\")),\n  (\"someNumber\", JSON.Encode.int(42)),\n])\n\nlet replacer = (key, value) => {\n  let decodedValue = value->JSON.Decode.string\n\n  switch decodedValue {\n  | Some(string) => string->String.toUpperCase->JSON.Encode.string\n  | None => value\n  }\n}\n\nJSON.stringifyAnyWithReplacer(dict, replacer)\n// {\"foo\":\"BAR\",\"hello\":\"WORLD\",\"someNumber\":42}\n\nJSON.stringifyAny(() => \"hello world\")\n// None\n\nBigInt.fromInt(0)->JSON.stringifyAny\n// exception\n```\n\n## Exceptions \n\n- Raises a TypeError if the value contains circular references.\n- Raises a TypeError if the value contains `BigInt`s."]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyAnyWithReplacerAndIndent",
      "kind": "value",
      "name": "stringifyAnyWithReplacerAndIndent",
      "signature": "let stringifyAnyWithReplacerAndIndent: (. 'a, (. string, t) => t, int) => option<string>",
      "docstrings": ["`stringifyAnyWithReplacerAndIndent(json, replacer, indentation)` \n\nConverts any type to a JSON string. The output will be indented.\nThe replacer describes how the value should be transformed. It is a function which receives a key and a value.\nStringifying a function or `undefined` will return `None`.\nIf the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).\nIf you want to stringify a JSON object, use `JSON.stringifyWithReplacerAndIndent` instead.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([\n  (\"foo\", JSON.Encode.string(\"bar\")),\n  (\"hello\", JSON.Encode.string(\"world\")),\n  (\"someNumber\", JSON.Encode.int(42)),\n])\n\nlet replacer = (key, value) => {\n  let decodedValue = value->JSON.Decode.string\n\n  switch decodedValue {\n  | Some(string) => string->String.toUpperCase->JSON.Encode.string\n  | None => value\n  }\n}\n\nJSON.stringifyAnyWithReplacerAndIndent(dict, replacer, 2)\n// {\n//   \"foo\": \"BAR\",\n//   \"hello\": \"WORLD\",\n//   \"someNumber\": 42\n// }\n\nJSON.stringifyAny(() => \"hello world\")\n// None\n\nBigInt.fromInt(0)->JSON.stringifyAny\n// exception\n```\n\n## Exceptions \n\n- Raises a TypeError if the value contains circular references.\n- Raises a TypeError if the value contains `BigInt`s."]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyAnyWithFilter",
      "kind": "value",
      "name": "stringifyAnyWithFilter",
      "signature": "let stringifyAnyWithFilter: (. 'a, array<string>) => string",
      "docstrings": ["`stringifyAnyWithFilter(json, filter)` \n\nConverts any type to a JSON string.\nThe filter is an array of keys, which should be included in the output.\nStringifying a function or `undefined` will return `None`.\nIf the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).\nIf you want to stringify a JSON object, use `JSON.stringifyWithFilter` instead.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([\n  (\"foo\", JSON.Encode.string(\"bar\")),\n  (\"hello\", JSON.Encode.string(\"world\")),\n  (\"someNumber\", JSON.Encode.int(42)),\n])\n\nJSON.stringifyAnyWithFilter(dict, [\"foo\", \"someNumber\"])\n// {\"foo\": \"bar\",\"someNumber\": 42}\n\nJSON.stringifyAny(() => \"hello world\")\n// None\n\nBigInt.fromInt(0)->JSON.stringifyAny\n// exception\n```\n\n## Exceptions \n\n- Raises a TypeError if the value contains circular references.\n- Raises a TypeError if the value contains `BigInt`s."]
    }, 
    {
      "id": "RescriptCore.JSON.stringifyAnyWithFilterAndIndent",
      "kind": "value",
      "name": "stringifyAnyWithFilterAndIndent",
      "signature": "let stringifyAnyWithFilterAndIndent: (. 'a, array<string>, int) => string",
      "docstrings": ["`stringifyAnyWithFilterAndIndent(json, filter, indentation)` \n\nConverts any type to a JSON string. The output will be indented.\nThe filter is an array of keys, which should be included in the output.\nStringifying a function or `undefined` will return `None`.\nIf the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).\nIf you want to stringify a JSON object, use `JSON.stringifyWithFilterAndIndent` instead.\n\n## Examples\n```rescript\nlet dict = Dict.fromArray([\n  (\"foo\", JSON.Encode.string(\"bar\")),\n  (\"hello\", JSON.Encode.string(\"world\")),\n  (\"someNumber\", JSON.Encode.int(42)),\n])\n\nJSON.stringifyAnyWithFilterAndIndent(dict, [\"foo\", \"someNumber\"], 2)\n// {\n//   \"foo\": \"bar\",\n//   \"someNumber\": 42\n// }\n\nJSON.stringifyAny(() => \"hello world\")\n// None\n\nBigInt.fromInt(0)->JSON.stringifyAny\n// exception\n```\n\n## Exceptions \n\n- Raises a TypeError if the value contains circular references.\n- Raises a TypeError if the value contains `BigInt`s."]
    }, 
    {
      "id": "RescriptCore.JSON.Classify",
      "name": "Classify",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.JSON.Classify.t",
        "kind": "type",
        "name": "t",
        "signature": "type t =\n  | Bool(bool)\n  | Null\n  | String(string)\n  | Number(float)\n  | Object(Core__Dict.t<t>)\n  | Array(array<t>)",
        "docstrings": ["A type representing a JavaScript type."],
        "detail": 
        {
          "kind": "variant",
          "items": [
          {
            "name": "Bool",
            "docstrings": [],
            "signature": "Bool(bool)"
          }, 
          {
            "name": "Null",
            "docstrings": [],
            "signature": "Null"
          }, 
          {
            "name": "String",
            "docstrings": [],
            "signature": "String(string)"
          }, 
          {
            "name": "Number",
            "docstrings": [],
            "signature": "Number(float)"
          }, 
          {
            "name": "Object",
            "docstrings": [],
            "signature": "Object(Core__Dict.t<t>)"
          }, 
          {
            "name": "Array",
            "docstrings": [],
            "signature": "Array(array<t>)"
          }]
        }
      }, 
      {
        "id": "RescriptCore.JSON.Classify.classify",
        "kind": "value",
        "name": "classify",
        "signature": "let classify: (. 'a) => t",
        "docstrings": ["Returns the JSON type of any value.\n\n  ## Examples\n  ```rescript\n  JSON.Classify.classify(\"hello world\")\n  // String(\"hello world\")\n\n  JSON.Classify.classify(42)\n  // Number(42)\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.JSON.Encode",
      "name": "Encode",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.JSON.Encode.bool",
        "kind": "value",
        "name": "bool",
        "signature": "let bool: (. bool) => t",
        "docstrings": ["Returns a boolean as a JSON object.\n\n  ## Examples\n  ```rescript\n  JSON.Encode.bool(true)\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Encode.null",
        "kind": "value",
        "name": "null",
        "signature": "let null: t",
        "docstrings": ["Returns null as a JSON object.\n\n  ## Examples\n  ```rescript\n  JSON.Encode.null\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Encode.string",
        "kind": "value",
        "name": "string",
        "signature": "let string: (. string) => t",
        "docstrings": ["Returns a string as a JSON object.\n\n  ## Examples\n  ```rescript\n  JSON.Encode.string(\"hello world\")\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Encode.int",
        "kind": "value",
        "name": "int",
        "signature": "let int: (. int) => t",
        "docstrings": ["Returns an int as a JSON object.\n\n  ## Examples\n  ```rescript\n  JSON.Encode.int(42)\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Encode.float",
        "kind": "value",
        "name": "float",
        "signature": "let float: (. float) => t",
        "docstrings": ["Returns a float as a JSON object.\n\n  ## Examples\n  ```rescript\n  JSON.Encode.float(42.0)\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Encode.object",
        "kind": "value",
        "name": "object",
        "signature": "let object: (. Core__Dict.t<t>) => t",
        "docstrings": ["Returns a dict as a JSON object.\n\n  ## Examples\n  ```rescript\n  let dict = Dict.fromArray([\n    (\"foo\", JSON.Encode.string(\"bar\")),\n    (\"hello\", JSON.Encode.string(\"world\")),\n  ])\n\n  JSON.Encode.object(dict)\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Encode.array",
        "kind": "value",
        "name": "array",
        "signature": "let array: (. array<t>) => t",
        "docstrings": ["Returns an array as a JSON object.\n\n  ## Examples\n  ```rescript\n  let array = [JSON.Encode.string(\"hello world\"), JSON.Encode.int(42)]\n\n  JSON.Encode.array(array)\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.JSON.Decode",
      "name": "Decode",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.JSON.Decode.bool",
        "kind": "value",
        "name": "bool",
        "signature": "let bool: (. t) => option<bool>",
        "docstrings": ["Decodes a single JSON value. If the value is a bool, it will return `Some(bool)` - otherwise it will return `None`.\n\n  ## Examples\n  ```rescript\n  JSON.parseExn(`true`)->JSON.Decode.bool\n  // Some(true)\n\n  JSON.parseExn(`\"hello world\"`)->JSON.Decode.bool\n  // None\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Decode.null",
        "kind": "value",
        "name": "null",
        "signature": "let null: (. t) => option<Core__Null.t<'a>>",
        "docstrings": ["Decodes a single JSON value. If the value is null, it will return `Some(Null.t)` - otherwise it will return `None`.\n\n  ## Examples\n  ```rescript\n  JSON.parseExn(`null`)->JSON.Decode.null\n  // Some(null)\n\n  JSON.parseExn(`\"hello world\"`)->JSON.Decode.null\n  // None\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Decode.string",
        "kind": "value",
        "name": "string",
        "signature": "let string: (. t) => option<string>",
        "docstrings": ["Decodes a single JSON value. If the value is a string, it will return `Some(string)` - otherwise it will return `None`.\n\n  ## Examples\n  ```rescript\n  JSON.parseExn(`\"hello world\"`)->JSON.Decode.string\n  // Some(\"hello world\")\n\n  JSON.parseExn(`42`)->JSON.Decode.string\n  // None \n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Decode.float",
        "kind": "value",
        "name": "float",
        "signature": "let float: (. t) => option<float>",
        "docstrings": ["Decodes a single JSON value. If the value is a float, it will return `Some(float)` - otherwise it will return `None`.\n\n  ## Examples\n  ```rescript\n  JSON.parseExn(`42.0`)->JSON.Decode.float\n  // Some(42.0)\n\n  JSON.parseExn(`\"hello world\"`)->JSON.Decode.float\n  // None\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Decode.object",
        "kind": "value",
        "name": "object",
        "signature": "let object: (. t) => option<Core__Dict.t<t>>",
        "docstrings": ["Decodes a single JSON value. If the value is an object, it will return `Some(Dict.t)` - otherwise it will return `None`.\n\n  ## Examples\n  ```rescript\n  JSON.parseExn(`{\"foo\":\"bar\"}`)->JSON.Decode.object\n  // Some({ foo: 'bar' })\n\n  JSON.parseExn(`\"hello world\"`)->JSON.Decode.object\n  // None\n  ```"]
      }, 
      {
        "id": "RescriptCore.JSON.Decode.array",
        "kind": "value",
        "name": "array",
        "signature": "let array: (. t) => option<array<t>>",
        "docstrings": ["Decodes a single JSON value. If the value is an array, it will return `Some(array)` - otherwise it will return `None`.\n\n  ## Examples\n  ```rescript\n  JSON.parseExn(`[\"foo\", \"bar\"]`)->JSON.Decode.array\n  // Some([ 'foo', 'bar' ])\n\n  JSON.parseExn(`\"hello world\"`)->JSON.Decode.array\n  // None\n  ```"]
      }]
    }]
  }, 
  {
    "id": "RescriptCore.Iterator",
    "kind": "moduleAlias",
    "name": "Iterator",
    "docstrings": ["Bindings to JavaScript iterators.\n\nSee [`iterator protocols`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN."],
    "items": [
    {
      "id": "RescriptCore.Iterator.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a>",
      "docstrings": ["The type representing an iterator."]
    }, 
    {
      "id": "RescriptCore.Iterator.value",
      "kind": "type",
      "name": "value",
      "signature": "type value<'a> = {done: bool, value: option<'a>}",
      "docstrings": ["The current value of an iterator."],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "done",
          "optional": false,
          "docstrings": ["Whether there are more values to iterate on before the iterator is done."],
          "signature": "bool"
        }, {
          "name": "value",
          "optional": false,
          "docstrings": ["The value of this iteration, if any."],
          "signature": "option<'a>"
        }]
      }
    }, 
    {
      "id": "RescriptCore.Iterator.next",
      "kind": "value",
      "name": "next",
      "signature": "let next: (. t<'a>) => value<'a>",
      "docstrings": ["Returns the next value of the iterator, if any.\n\nSee [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.\n\n## Examples\n```rescript\n// Pulls out the next value of the iterator\nlet {done, value} = someIterator->Iterator.next\n```"]
    }, 
    {
      "id": "RescriptCore.Iterator.toArray",
      "kind": "value",
      "name": "toArray",
      "signature": "let toArray: (. t<'a>) => array<'a>",
      "docstrings": ["Turns an iterator into an array of the remaining values.\nRemember that each invocation of `next` of an iterator consumes a value. `Iterator.toArray` will consume all remaining values of the iterator and return them in an array to you.\n\nSee [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"someKey2\", \"someValue2\")\n\n// `Map.keys` returns all keys of the map as an iterator.\nlet mapKeysAsArray = map->Map.keys->Iterator.toArray\n\nConsole.log(mapKeysAsArray) // Logs [\"someKey\", \"someKey2\"] to the console.\n```"]
    }, 
    {
      "id": "RescriptCore.Iterator.toArrayWithMapper",
      "kind": "value",
      "name": "toArrayWithMapper",
      "signature": "let toArrayWithMapper: (. t<'a>, (. 'a) => 'b) => array<'b>",
      "docstrings": ["`toArray(iterator)` turns `iterator` into an array of its remaining values, applying the provided mapper function on each item.\nRemember that each invocation of `next` of an iterator consumes a value. `Iterator.toArrayWithMapper` will consume all remaining values of the iterator and return them in an array to you.\n\nSee [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"someKey2\", \"someValue2\")\n\n// `Map.keys` returns all keys of the map as an iterator.\nlet mapKeysAsArray = map\n  ->Map.keys\n  ->Iterator.toArrayWithMapper(key => key->String.length)\n\nConsole.log(mapKeysAsArray) // Logs [7, 8] to the console.\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.AsyncIterator",
    "kind": "moduleAlias",
    "name": "AsyncIterator",
    "docstrings": ["Bindings to async iterators, a way to do async iteration in JavaScript.\n\nSee [async iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) on MDN."],
    "items": [
    {
      "id": "RescriptCore.AsyncIterator.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a>",
      "docstrings": ["The type representing an async iterator."]
    }, 
    {
      "id": "RescriptCore.AsyncIterator.value",
      "kind": "type",
      "name": "value",
      "signature": "type value<'a> = {done: bool, value: option<'a>}",
      "docstrings": [],
      "detail": 
      {
        "kind": "record",
        "items": [{
          "name": "done",
          "optional": false,
          "docstrings": ["Whether there are more values to iterate on before the iterator is done."],
          "signature": "bool"
        }, {
          "name": "value",
          "optional": false,
          "docstrings": ["The value of this iteration, if any."],
          "signature": "option<'a>"
        }]
      }
    }, 
    {
      "id": "RescriptCore.AsyncIterator.next",
      "kind": "value",
      "name": "next",
      "signature": "let next: (. t<'a>) => promise<value<'a>>",
      "docstrings": ["`next(asyncIterator)`\n\nReturns the next value of the iterator, if any.\n\nSee [async iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) on MDN.\n\n## Examples\n- A simple example, getting the next value:\n```rescript\nlet {done, value} = await someAsyncIterator->AsyncIterator.next\n```\n\n- Complete example, including looping over all values:\n```rescript\n// Let's pretend we get an async iterator returning ints from somewhere.\n@val external asyncIterator: AsyncIterator.t<int> = \"someAsyncIterator\"\n\n\nlet processMyAsyncIterator = async () => {\n  // ReScript doesn't have `for ... of` loops, but it's easy to mimic using a while loop.\n  let break = ref(false)\n\n  while !break.contents {\n    // Await the next iterator value\n    let {value, done} = await asyncIterator->AsyncIterator.next\n\n    // Exit the while loop if the iterator says it's done\n    break := done\n\n    // This will log the (int) value of the current async iteration, if a value was returned.\n    Console.log(value)\n  }\n}\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Map",
    "kind": "moduleAlias",
    "name": "Map",
    "docstrings": ["Bindings to the mutable JavaScript `Map`.\n\nSee [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) on MDN."],
    "items": [
    {
      "id": "RescriptCore.Map.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'k, 'v> = Js.Map.t<'k, 'v>",
      "docstrings": ["Type representing an instance of `Map`."]
    }, 
    {
      "id": "RescriptCore.Map.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. unit) => t<'k, 'v>",
      "docstrings": ["Creates a new, mutable JavaScript `Map`. A `Map` can have any values as both keys and values.\n\nSee [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) on MDN.\n\n\n\n## Examples\n```rescript\n`make()`\n// You can annotate the type of your map if you want to\nlet myMap: Map.t<string, int> = Map.make()\n\n// Or you can let ReScript infer what's in your map\nlet map = Map.make()\nmap->Map.set(\"lang\", \"ReScript\") // Inferred as Map.t<string, string>\n```\n\n## Alternatives\nA JavaScript `Map` is mutable. If you're looking for an immutable alternative, check out`Belt.Map`."]
    }, 
    {
      "id": "RescriptCore.Map.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<('k, 'v)>) => t<'k, 'v>",
      "docstrings": ["Turns an array of key/value pairs into a Map.\n\n## Examples\n```rescript\ntype languages = ReScript | JavaScript | TypeScript\nlet languageRank = [(ReScript, 1), (JavaScript, 2), (TypeScript, 3)]\n\nlet map = Map.fromArray(languageRank) // Map.t<languages, int>\n\nswitch map->Map.get(ReScript) {\n| Some(1) => Console.log(\"Yay, ReScript is #1!\")\n| _ => Console.log(\"Uh-oh, something is _terribly_ wrong with this program... abort.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Map.fromIterator",
      "kind": "value",
      "name": "fromIterator",
      "signature": "let fromIterator: (. Core__Iterator.t<('k, 'v)>) => t<'k, 'v>",
      "docstrings": ["Turns an iterator in the shape of `('key, 'value)` into a `Map`.\n\n## Examples\n```rescript\n// Let's pretend we have an interator in the correct shape\n@val external someIterator: Iterator.t<(string, int)> = \"someIterator\"\n\nlet map = Map.fromIterator(someIterator) // Map.t<string, int>\n```"]
    }, 
    {
      "id": "RescriptCore.Map.size",
      "kind": "value",
      "name": "size",
      "signature": "let size: (. t<'k, 'v>) => int",
      "docstrings": ["Returns the size, the number of key/value pairs, of the map.\n\n## Examples\n```rescript\nlet map = Map.make()\n\nmap->Map.set(\"someKey\", \"someValue\")\n\nlet size = map->Map.size // 1\n```"]
    }, 
    {
      "id": "RescriptCore.Map.clear",
      "kind": "value",
      "name": "clear",
      "signature": "let clear: (. t<'k, 'v>) => unit",
      "docstrings": ["Clears all entries in the map.\n\n## Examples\n```rescript\nlet map = Map.make()\n\nmap->Map.set(\"someKey\", \"someValue\")\nlet size = map->Map.size // 1\n\nmap->Map.clear\nlet size = map->Map.size // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Map.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'k, 'v>, (. 'v) => unit) => unit",
      "docstrings": ["Iterates through all values of the map.\n\n> Please note that this is *without the keys*, just the values. If you need the key as well, use `Map.forEachWithKey`.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"someKey2\", \"someValue2\")\n\nmap->Map.forEach(value => {\n  Console.log(value)\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Map.forEachWithKey",
      "kind": "value",
      "name": "forEachWithKey",
      "signature": "let forEachWithKey: (. t<'k, 'v>, (. 'v, 'k) => unit) => unit",
      "docstrings": ["Iterates through all values of the map, including the key for each value.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"someKey2\", \"someValue2\")\n\nmap->Map.forEachWithKey((value, key) => {\n  Console.log2(value, key)\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Map.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. t<'k, 'v>, 'k) => option<'v>",
      "docstrings": ["Returns the value for a key, if a value exists at that key.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\n\nswitch map->Map.get(\"someKey\") {\n| None => Console.log(\"Nope, didn't have it.\")\n| Some(value) => Console.log2(\"Yay, had the value, and it's:\", value)\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Map.has",
      "kind": "value",
      "name": "has",
      "signature": "let has: (. t<'k, 'v>, 'k) => bool",
      "docstrings": ["Checks whether the map has a specific key.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\n\nswitch map->Map.has(\"someKey\") {\n| false => Console.log(\"Nope, didn't have it.\")\n| true => Console.log(\"Yay, we have the value!\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Map.set",
      "kind": "value",
      "name": "set",
      "signature": "let set: (. t<'k, 'v>, 'k, 'v) => unit",
      "docstrings": ["Sets the provided `value` to the provided `key`.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\n```"]
    }, 
    {
      "id": "RescriptCore.Map.delete",
      "kind": "value",
      "name": "delete",
      "signature": "let delete: (. t<'k, 'v>, 'k) => bool",
      "docstrings": ["Deletes the provided `key` and its value from the map. Returns a `bool` for whether the key existed, and was deleted.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nlet didDeleteKey = map->Map.delete(\"someKey\")\nConsole.log(didDeleteKey) // Logs `true` to the console, becuase the map had the key, so it was successfully deleted\n\nlet didDeleteKey = map->Map.delete(\"someNonExistantKey\")\nConsole.log(didDeleteKey) // Logs `false` to the console, becuase the key did not exist\n```"]
    }, 
    {
      "id": "RescriptCore.Map.keys",
      "kind": "value",
      "name": "keys",
      "signature": "let keys: (. t<'k, 'v>) => Core__Iterator.t<'k>",
      "docstrings": ["Returns an iterator that holds all keys of the map.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"anotherKey\", \"anotherValue\")\n\nlet keys = map->Map.keys\n\n// Logs the first key\nConsole.log(Iterator.next(keys).value)\n\n// You can also turn the iterator into an array.\n// Remember that an iterator consumes values. We'll need a fresh keys iterator to get an array of all keys, since we consumed a value via `next` above already.\nConsole.log(map->Map.keys->Iterator.toArray)\n```"]
    }, 
    {
      "id": "RescriptCore.Map.values",
      "kind": "value",
      "name": "values",
      "signature": "let values: (. t<'k, 'v>) => Core__Iterator.t<'v>",
      "docstrings": ["Returns an iterator that holds all values of the map.\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"anotherKey\", \"anotherValue\")\n\nlet values = map->Map.values\n\n// Logs the first value\nConsole.log(Iterator.next(values).value)\n\n// You can also turn the iterator into an array.\n// Remember that an iterator consumes values. We'll need a fresh values iterator to get an array of all values, since we consumed a value via `next` above already.\nConsole.log(map->Map.values->Iterator.toArray)\n```"]
    }, 
    {
      "id": "RescriptCore.Map.entries",
      "kind": "value",
      "name": "entries",
      "signature": "let entries: (. t<'k, 'v>) => Core__Iterator.t<('k, 'v)>",
      "docstrings": ["Returns an iterator that holds all entries of the map.\nAn entry is represented as a tuple of `('key, 'value)`,\n\n## Examples\n```rescript\nlet map = Map.make()\nmap->Map.set(\"someKey\", \"someValue\")\nmap->Map.set(\"anotherKey\", \"anotherValue\")\n\nlet entries = map->Map.entries\n\n// Logs the first value\nConsole.log(Iterator.next(entries).value)\n\n// You can also turn the iterator into an array.\n// Remember that an iterator consumes entries. We'll need a fresh entries iterator to get an array of all entries, since we consumed a value via `next` above already.\nConsole.log(map->Map.entries->Iterator.toArray)\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.WeakMap",
    "kind": "moduleAlias",
    "name": "WeakMap",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.WeakMap.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'k, 'v> = Js.WeakMap.t<'k, 'v>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakMap.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. unit) => t<'k, 'v>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakMap.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. t<'k, 'v>, 'k) => option<'v>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakMap.has",
      "kind": "value",
      "name": "has",
      "signature": "let has: (. t<'k, 'v>, 'k) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakMap.set",
      "kind": "value",
      "name": "set",
      "signature": "let set: (. t<'k, 'v>, 'k, 'v) => t<'k, 'v>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakMap.delete",
      "kind": "value",
      "name": "delete",
      "signature": "let delete: (. t<'k, 'v>, 'k) => bool",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.Set",
    "kind": "moduleAlias",
    "name": "Set",
    "docstrings": ["Bindings to the mutable JavaScript `Set`.\n\nSee [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) on MDN."],
    "items": [
    {
      "id": "RescriptCore.Set.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = Js.Set.t<'a>",
      "docstrings": ["Type representing an instance of `Set`."]
    }, 
    {
      "id": "RescriptCore.Set.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. unit) => t<'a>",
      "docstrings": ["Creates a new, mutable JavaScript `Set`. A `Set` is a collection of unique values.\n\nSee [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) on MDN.\n\n\n\n## Examples\n```rescript\n// You can annotate the type of your set if you want to\nlet mySet: Set.t<string> = Set.make()\n\n// Or you can let ReScript infer what's in your Set\nlet set = Set.make()\nset->Set.add(\"Fine name\") // Inferred as Set.t<string>\n```\n\n## Alternatives\nA JavaScript `Set` is mutable. If you're looking for an immutable alternative, check out `Belt.Set`."]
    }, 
    {
      "id": "RescriptCore.Set.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<'a>) => t<'a>",
      "docstrings": ["Turns an array of values into a Set. Meaning only unique values are preserved.\n\n## Examples\n```rescript\ntype languages = ReScript | JavaScript | TypeScript\nlet languageRank = [ReScript, JavaScript, TypeScript]\n\nlet set = Set.fromArray(languageRank) // Set.t<languages>\n\nswitch set->Set.has(ReScript) {\n| true => Console.log(\"Yay, ReScript is in there!\")\n| false => Console.log(\"Uh-oh, something is _terribly_ wrong with this program... abort.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Set.fromIterator",
      "kind": "value",
      "name": "fromIterator",
      "signature": "let fromIterator: (. Core__Iterator.t<'a>) => t<'a>",
      "docstrings": ["Turns an iterator into a `Set`.\n\n## Examples\n```rescript\n// Let's pretend we have an interator\n@val external someIterator: Iterator.t<int> = \"someIterator\"\n\nlet set = Set.fromIterator(someIterator) // Set.t<int>\n```"]
    }, 
    {
      "id": "RescriptCore.Set.size",
      "kind": "value",
      "name": "size",
      "signature": "let size: (. t<'a>) => int",
      "docstrings": ["Returns the size, the number of unique values, of the set.\n\n## Examples\n```rescript\nlet set = Set.make()\n\nset->Set.add(\"someValue\")\nset->Set.add(\"someValue\")\nset->Set.add(\"someValue2\")\n\nlet size = set->Set.size // 2\n```"]
    }, 
    {
      "id": "RescriptCore.Set.clear",
      "kind": "value",
      "name": "clear",
      "signature": "let clear: (. t<'a>) => unit",
      "docstrings": ["Clears all entries in the set.\n\n## Examples\n```rescript\nlet set = Set.make()\n\nset->Set.add(\"someKey\")\nlet size = set->Set.size // 1\n\nset->Set.clear\nlet size = set->Set.size // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Set.add",
      "kind": "value",
      "name": "add",
      "signature": "let add: (. t<'a>, 'a) => unit",
      "docstrings": ["Adds a new value to the set.\n\n## Examples\n```rescript\nlet set = Set.make()\nset->Set.add(\"someValue\")\n```"]
    }, 
    {
      "id": "RescriptCore.Set.delete",
      "kind": "value",
      "name": "delete",
      "signature": "let delete: (. t<'a>, 'a) => bool",
      "docstrings": ["Deletes the provided `value` from the set. Returns a `bool` for whether the value existed, and was deleted.\n\n## Examples\n```rescript\nlet set = Set.make()\nset->Set.add(\"someValue\")\nlet didDeleteValue = set->Set.delete(\"someValue\")\nConsole.log(didDeleteValue) // Logs `true` to the console, becuase the set had the value, so it was successfully deleted\n\nlet didDeleteValue = set->Set.delete(\"someNonExistantKey\")\nConsole.log(didDeleteValue) // Logs `false` to the console, becuase the value did not exist in the set\n```"]
    }, 
    {
      "id": "RescriptCore.Set.has",
      "kind": "value",
      "name": "has",
      "signature": "let has: (. t<'a>, 'a) => bool",
      "docstrings": ["Checks whether the set has a specific value.\n\n## Examples\n```rescript\nlet set = Set.make()\nset->Set.add(\"someValue\")\n\nswitch set->Set.has(\"someValue\") {\n| false => Console.log(\"Nope, didn't have it.\")\n| true => Console.log(\"Yay, we have the value!\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Set.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'a>, (. 'a) => unit) => unit",
      "docstrings": ["Iterates through all values of the set.\n\n## Examples\n```rescript\nlet set = Set.make()\nset->Set.add(\"someValue\")\nset->Set.add(\"someValue2\")\n\nset->Set.forEach(value => {\n  Console.log(value)\n})\n```"]
    }, 
    {
      "id": "RescriptCore.Set.values",
      "kind": "value",
      "name": "values",
      "signature": "let values: (. t<'a>) => Core__Iterator.t<'a>",
      "docstrings": ["Returns an iterator that holds all values of the set.\n\n## Examples\n```rescript\nlet set = Set.make()\nset->Set.add(\"someValue\")\nset->Set.add(\"anotherValue\")\n\nlet values = set->Set.values\n\n// Logs the first value\nConsole.log(Iterator.next(values).value)\n\n// You can also turn the iterator into an array.\n// Remember that an iterator consumes values. We'll need a fresh values iterator to get an array of all values, since we consumed a value via `next` above already.\nConsole.log(set->Set.values->Iterator.toArray)\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.WeakSet",
    "kind": "moduleAlias",
    "name": "WeakSet",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.WeakSet.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = Js.WeakSet.t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakSet.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. unit) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakSet.add",
      "kind": "value",
      "name": "add",
      "signature": "let add: (. t<'a>, 'a) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakSet.delete",
      "kind": "value",
      "name": "delete",
      "signature": "let delete: (. t<'a>, 'a) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.WeakSet.has",
      "kind": "value",
      "name": "has",
      "signature": "let has: (. t<'a>, 'a) => bool",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.ArrayBuffer",
    "kind": "moduleAlias",
    "name": "ArrayBuffer",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.ArrayBuffer.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.TypedArray2.ArrayBuffer.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.ArrayBuffer.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. int) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.ArrayBuffer.byteLength",
      "kind": "value",
      "name": "byteLength",
      "signature": "let byteLength: (. t) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.ArrayBuffer.slice",
      "kind": "value",
      "name": "slice",
      "signature": "let slice: (. t, ~start: int, ~end: int) => t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.ArrayBuffer.sliceToEnd",
      "kind": "value",
      "name": "sliceToEnd",
      "signature": "let sliceToEnd: (. t, ~start: int) => t",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.TypedArray",
    "kind": "moduleAlias",
    "name": "TypedArray",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.TypedArray.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. t<'a>, int) => option<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.set",
      "kind": "value",
      "name": "set",
      "signature": "let set: (. t<'a>, int, 'a) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.buffer",
      "kind": "value",
      "name": "buffer",
      "signature": "let buffer: (. t<'a>) => Core__ArrayBuffer.t",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.byteLength",
      "kind": "value",
      "name": "byteLength",
      "signature": "let byteLength: (. t<'a>) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.byteOffset",
      "kind": "value",
      "name": "byteOffset",
      "signature": "let byteOffset: (. t<'a>) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.setArray",
      "kind": "value",
      "name": "setArray",
      "signature": "let setArray: (. t<'a>, array<'a>) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.setArrayFrom",
      "kind": "value",
      "name": "setArrayFrom",
      "signature": "let setArrayFrom: (. t<'a>, array<'a>, int) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.length",
      "kind": "value",
      "name": "length",
      "signature": "let length: (. t<'a>) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.copyAllWithin",
      "kind": "value",
      "name": "copyAllWithin",
      "signature": "let copyAllWithin: (. t<'a>, ~target: int) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.copyWithinToEnd",
      "kind": "value",
      "name": "copyWithinToEnd",
      "signature": "let copyWithinToEnd: (. t<'a>, ~target: int, ~start: int) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.copyWithin",
      "kind": "value",
      "name": "copyWithin",
      "signature": "let copyWithin: (. t<'a>, ~target: int, ~start: int, ~end: int) => array<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.fillAll",
      "kind": "value",
      "name": "fillAll",
      "signature": "let fillAll: (. t<'a>, 'a) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.fillToEnd",
      "kind": "value",
      "name": "fillToEnd",
      "signature": "let fillToEnd: (. t<'a>, 'a, ~start: int) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.fill",
      "kind": "value",
      "name": "fill",
      "signature": "let fill: (. t<'a>, 'a, ~start: int, ~end: int) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.reverse",
      "kind": "value",
      "name": "reverse",
      "signature": "let reverse: (. t<'a>) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.toReversed",
      "kind": "value",
      "name": "toReversed",
      "signature": "let toReversed: (. t<'a>) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.sort",
      "kind": "value",
      "name": "sort",
      "signature": "let sort: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.toSorted",
      "kind": "value",
      "name": "toSorted",
      "signature": "let toSorted: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.with",
      "kind": "value",
      "name": "with",
      "signature": "let with: (. t<'a>, int, 'a) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.includes",
      "kind": "value",
      "name": "includes",
      "signature": "let includes: (. t<'a>, 'a) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.indexOf",
      "kind": "value",
      "name": "indexOf",
      "signature": "let indexOf: (. t<'a>, 'a) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.indexOfFrom",
      "kind": "value",
      "name": "indexOfFrom",
      "signature": "let indexOfFrom: (. t<'a>, 'a, int) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.joinWith",
      "kind": "value",
      "name": "joinWith",
      "signature": "let joinWith: (. t<'a>, string) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.lastIndexOf",
      "kind": "value",
      "name": "lastIndexOf",
      "signature": "let lastIndexOf: (. t<'a>, 'a) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.lastIndexOfFrom",
      "kind": "value",
      "name": "lastIndexOfFrom",
      "signature": "let lastIndexOfFrom: (. t<'a>, 'a, int) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.slice",
      "kind": "value",
      "name": "slice",
      "signature": "let slice: (. t<'a>, ~start: int, ~end: int) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.sliceToEnd",
      "kind": "value",
      "name": "sliceToEnd",
      "signature": "let sliceToEnd: (. t<'a>, ~start: int) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.copy",
      "kind": "value",
      "name": "copy",
      "signature": "let copy: (. t<'a>) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.subarray",
      "kind": "value",
      "name": "subarray",
      "signature": "let subarray: (. t<'a>, ~start: int, ~end: int) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.subarrayToEnd",
      "kind": "value",
      "name": "subarrayToEnd",
      "signature": "let subarrayToEnd: (. t<'a>, ~start: int) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.toString",
      "kind": "value",
      "name": "toString",
      "signature": "let toString: (. t<'a>) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.toLocaleString",
      "kind": "value",
      "name": "toLocaleString",
      "signature": "let toLocaleString: (. t<'a>) => string",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.every",
      "kind": "value",
      "name": "every",
      "signature": "let every: (. t<'a>, (. 'a) => bool) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.everyWithIndex",
      "kind": "value",
      "name": "everyWithIndex",
      "signature": "let everyWithIndex: (. t<'a>, (. 'a, int) => bool) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.filter",
      "kind": "value",
      "name": "filter",
      "signature": "let filter: (. t<'a>, (. 'a) => bool) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.filterWithIndex",
      "kind": "value",
      "name": "filterWithIndex",
      "signature": "let filterWithIndex: (. t<'a>, (. 'a, int) => bool) => t<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.find",
      "kind": "value",
      "name": "find",
      "signature": "let find: (. t<'a>, (. 'a) => bool) => option<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.findWithIndex",
      "kind": "value",
      "name": "findWithIndex",
      "signature": "let findWithIndex: (. t<'a>, (. 'a, int) => bool) => option<'a>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.findIndex",
      "kind": "value",
      "name": "findIndex",
      "signature": "let findIndex: (. t<'a>, (. 'a) => bool) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.findIndexWithIndex",
      "kind": "value",
      "name": "findIndexWithIndex",
      "signature": "let findIndexWithIndex: (. t<'a>, (. 'a, int) => bool) => int",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'a>, (. 'a) => unit) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.forEachWithIndex",
      "kind": "value",
      "name": "forEachWithIndex",
      "signature": "let forEachWithIndex: (. t<'a>, (. 'a, int) => unit) => unit",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. t<'a>, (. 'a) => 'b) => t<'b>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.mapWithIndex",
      "kind": "value",
      "name": "mapWithIndex",
      "signature": "let mapWithIndex: (. t<'a>, (. 'a, int) => 'b) => t<'b>",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.reduce",
      "kind": "value",
      "name": "reduce",
      "signature": "let reduce: (. t<'a>, (. 'b, 'a) => 'b, 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.reduceWithIndex",
      "kind": "value",
      "name": "reduceWithIndex",
      "signature": "let reduceWithIndex: (. t<'a>, (. 'b, 'a, int) => 'b, 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.reduceRight",
      "kind": "value",
      "name": "reduceRight",
      "signature": "let reduceRight: (. t<'a>, (. 'b, 'a) => 'b, 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.reduceRightWithIndex",
      "kind": "value",
      "name": "reduceRightWithIndex",
      "signature": "let reduceRightWithIndex: (. t<'a>, (. 'b, 'a, int) => 'b, 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.some",
      "kind": "value",
      "name": "some",
      "signature": "let some: (. t<'a>, (. 'a) => bool) => bool",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.TypedArray.someWithIndex",
      "kind": "value",
      "name": "someWithIndex",
      "signature": "let someWithIndex: (. t<'a>, (. 'a, int) => bool) => bool",
      "docstrings": []
    }]
  }, 
  {
    "id": "RescriptCore.Float32Array",
    "kind": "moduleAlias",
    "name": "Float32Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Float32Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<float>",
      "docstrings": ["The `Float32Array` typed array represents an array of 32-bit floating point numbers in platform byte order. See [Float32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array)"]
    }, 
    {
      "id": "RescriptCore.Float32Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Float32Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<float>) => t",
      "docstrings": ["`fromArray` creates a `Float32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)"]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Float32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Float32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Float32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Float32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Float32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Float32Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => float) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Float32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Float64Array",
    "kind": "moduleAlias",
    "name": "Float64Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Float64Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<float>",
      "docstrings": ["The `Float64Array` typed array represents an array of 64-bit floating point numbers in platform byte order. See [Float64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array)"]
    }, 
    {
      "id": "RescriptCore.Float64Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Float64Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<float>) => t",
      "docstrings": ["`fromArray` creates a `Float64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)"]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Float64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Float64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Float64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Float64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Float64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Float64Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => float) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Float64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Int8Array",
    "kind": "moduleAlias",
    "name": "Int8Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Int8Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Int8Array` typed array represents an array of twos-complement 8-bit signed integers. See [Int8Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array)"]
    }, 
    {
      "id": "RescriptCore.Int8Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Int8Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Int8Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)"]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Int8Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Int8Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Int8Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Int8Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Int8Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Int8Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Int8Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Int16Array",
    "kind": "moduleAlias",
    "name": "Int16Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Int16Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Int16Array` typed array represents an array of twos-complement 16-bit signed integers in platform byte order. See [Int16Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array)"]
    }, 
    {
      "id": "RescriptCore.Int16Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Int16Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Int16Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)"]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Int16Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Int16Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Int16Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Int16Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Int16Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Int16Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Int16Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Int32Array",
    "kind": "moduleAlias",
    "name": "Int32Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Int32Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Int32Array` typed array represents an array of twos-complemenet 32-bit signed integers in platform byte order. See [Int32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array)"]
    }, 
    {
      "id": "RescriptCore.Int32Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Int32Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Int32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)"]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Int32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Int32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Int32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Int32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Int32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Int32Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Int32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Uint8Array",
    "kind": "moduleAlias",
    "name": "Uint8Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Uint8Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Uint8Array` typed array represents an array of 8-bit unsigned integers. See [Uint8Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)"]
    }, 
    {
      "id": "RescriptCore.Uint8Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Uint8Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Uint8Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)"]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Uint8Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Uint8Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Uint8Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Uint8Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Uint8Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Uint8Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Uint8Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Uint16Array",
    "kind": "moduleAlias",
    "name": "Uint16Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Uint16Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Uint16Array` typed array represents an array of 16-bit unsigned integers in platform byte order. See [Uint16Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array)"]
    }, 
    {
      "id": "RescriptCore.Uint16Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Uint16Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Uint16Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)"]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Uint16Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Uint16Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Uint16Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Uint16Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Uint16Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Uint16Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Uint16Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Uint32Array",
    "kind": "moduleAlias",
    "name": "Uint32Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Uint32Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Uint32Array` typed array represents an array of 32-bit unsigned integers in platform byte order. See [Uint32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array)"]
    }, 
    {
      "id": "RescriptCore.Uint32Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Uint32Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Uint32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)"]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Uint32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Uint32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Uint32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Uint32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Uint32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Uint32Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Uint32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Uint8ClampedArray",
    "kind": "moduleAlias",
    "name": "Uint8ClampedArray",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Uint8ClampedArray.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<int>",
      "docstrings": ["The `Uint8ClampedArray` typed array represents an array of 8-bit unsigned integers clamped to 0-255. See [Uint8ClampedArray on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray)"]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Uint8ClampedArray.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<int>) => t",
      "docstrings": ["`fromArray` creates a `Uint8ClampedArray` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)"]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `Uint8ClampedArray` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `Uint8ClampedArray` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.Uint8ClampedArray.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `Uint8ClampedArray` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.BigInt64Array",
    "kind": "moduleAlias",
    "name": "BigInt64Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.BigInt64Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<Core__BigInt.t>",
      "docstrings": ["The `BigInt64Array` typed array represents an array of 64-bit signed integers in platform byte order. See [BigInt64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array)"]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.BigInt64Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<Core__BigInt.t>) => t",
      "docstrings": ["`fromArray` creates a `BigInt64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)"]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `BigInt64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `BigInt64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `BigInt64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `BigInt64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `BigInt64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.BigInt64Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => Core__BigInt.t) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `BigInt64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.BigUint64Array",
    "kind": "moduleAlias",
    "name": "BigUint64Array",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.BigUint64Array.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Core__TypedArray.t<Core__BigInt.t>",
      "docstrings": ["The `BigUint64Array` typed array represents an array of 64-bit unsigned integers in platform byte order. See [BigUint64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array)"]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.Constants",
      "name": "Constants",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.BigUint64Array.Constants.bytesPerElement",
        "kind": "value",
        "name": "bytesPerElement",
        "signature": "let bytesPerElement: int",
        "docstrings": ["`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)"]
      }]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<Core__BigInt.t>) => t",
      "docstrings": ["`fromArray` creates a `BigUint64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)"]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromBuffer",
      "kind": "value",
      "name": "fromBuffer",
      "signature": "let fromBuffer: (. Core__ArrayBuffer.t) => t",
      "docstrings": ["`fromBuffer` creates a `BigUint64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromBufferToEnd",
      "kind": "value",
      "name": "fromBufferToEnd",
      "signature": "let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t",
      "docstrings": ["`fromBufferToEnd` creates a `BigUint64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromBufferWithRange",
      "kind": "value",
      "name": "fromBufferWithRange",
      "signature": "let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t",
      "docstrings": ["`fromBufferWithRange` creates a `BigUint64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromLength",
      "kind": "value",
      "name": "fromLength",
      "signature": "let fromLength: (. int) => t",
      "docstrings": ["`fromLength` creates a zero-initialized `BigUint64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)\n\n**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds."]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromArrayLikeOrIterable",
      "kind": "value",
      "name": "fromArrayLikeOrIterable",
      "signature": "let fromArrayLikeOrIterable: (. 'a) => t",
      "docstrings": ["`fromArrayLikeOrIterable` creates a `BigUint64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }, 
    {
      "id": "RescriptCore.BigUint64Array.fromArrayLikeOrIterableWithMap",
      "kind": "value",
      "name": "fromArrayLikeOrIterableWithMap",
      "signature": "let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => Core__BigInt.t) => t",
      "docstrings": ["`fromArrayLikeOrIterableWithMap` creates a `BigUint64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)"]
    }]
  }, 
  {
    "id": "RescriptCore.Intl",
    "kind": "moduleAlias",
    "name": "Intl",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Intl.Collator",
      "kind": "moduleAlias",
      "name": "Collator",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Intl.Collator.t",
        "kind": "type",
        "name": "t",
        "signature": "type t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. unit) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.makeWithLocale",
        "kind": "value",
        "name": "makeWithLocale",
        "signature": "let makeWithLocale: (. string) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.makeWithLocales",
        "kind": "value",
        "name": "makeWithLocales",
        "signature": "let makeWithLocales: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.makeWithLocaleAndOptions",
        "kind": "value",
        "name": "makeWithLocaleAndOptions",
        "signature": "let makeWithLocaleAndOptions: (. string, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.makeWithLocalesAndOptions",
        "kind": "value",
        "name": "makeWithLocalesAndOptions",
        "signature": "let makeWithLocalesAndOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.makeWithOptions",
        "kind": "value",
        "name": "makeWithOptions",
        "signature": "let makeWithOptions: (. {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.supportedLocalesOf",
        "kind": "value",
        "name": "supportedLocalesOf",
        "signature": "let supportedLocalesOf: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.supportedLocalesOfWithOptions",
        "kind": "value",
        "name": "supportedLocalesOfWithOptions",
        "signature": "let supportedLocalesOfWithOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.resolvedOptions",
        "kind": "value",
        "name": "resolvedOptions",
        "signature": "let resolvedOptions: (. t) => {..}",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Collator.compare",
        "kind": "value",
        "name": "compare",
        "signature": "let compare: (. t, string, string) => int",
        "docstrings": []
      }]
    }, 
    {
      "id": "RescriptCore.Intl.DateTimeFormat",
      "kind": "moduleAlias",
      "name": "DateTimeFormat",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Intl.DateTimeFormat.t",
        "kind": "type",
        "name": "t",
        "signature": "type t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. unit) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.makeWithLocale",
        "kind": "value",
        "name": "makeWithLocale",
        "signature": "let makeWithLocale: (. string) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.makeWithLocales",
        "kind": "value",
        "name": "makeWithLocales",
        "signature": "let makeWithLocales: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.makeWithLocaleAndOptions",
        "kind": "value",
        "name": "makeWithLocaleAndOptions",
        "signature": "let makeWithLocaleAndOptions: (. string, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.makeWithLocalesAndOptions",
        "kind": "value",
        "name": "makeWithLocalesAndOptions",
        "signature": "let makeWithLocalesAndOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.makeWithOptions",
        "kind": "value",
        "name": "makeWithOptions",
        "signature": "let makeWithOptions: (. {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.supportedLocalesOf",
        "kind": "value",
        "name": "supportedLocalesOf",
        "signature": "let supportedLocalesOf: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.supportedLocalesOfWithOptions",
        "kind": "value",
        "name": "supportedLocalesOfWithOptions",
        "signature": "let supportedLocalesOfWithOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.resolvedOptions",
        "kind": "value",
        "name": "resolvedOptions",
        "signature": "let resolvedOptions: (. t) => {..}",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.format",
        "kind": "value",
        "name": "format",
        "signature": "let format: (. t, Core__Date.t) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.formatToParts",
        "kind": "value",
        "name": "formatToParts",
        "signature": "let formatToParts: (.\n  t,\n  Core__Date.t,\n) => array<{\"type\": string, \"value\": string}>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.formatRange",
        "kind": "value",
        "name": "formatRange",
        "signature": "let formatRange: (.\n  t,\n  ~startDate: Core__Date.t,\n  ~endDate: Core__Date.t,\n) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.DateTimeFormat.formatRangeToParts",
        "kind": "value",
        "name": "formatRangeToParts",
        "signature": "let formatRangeToParts: (.\n  t,\n  ~startDate: Core__Date.t,\n  ~endDate: Core__Date.t,\n) => array<\n  {\"source\": string, \"type\": string, \"value\": string},\n>",
        "docstrings": []
      }]
    }, 
    {
      "id": "RescriptCore.Intl.Locale",
      "kind": "moduleAlias",
      "name": "Locale",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Intl.Locale.t",
        "kind": "type",
        "name": "t",
        "signature": "type t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. string) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.makeWithOptions",
        "kind": "value",
        "name": "makeWithOptions",
        "signature": "let makeWithOptions: (. string, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.baseName",
        "kind": "value",
        "name": "baseName",
        "signature": "let baseName: (. t) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.calendar",
        "kind": "value",
        "name": "calendar",
        "signature": "let calendar: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.caseFirst",
        "kind": "value",
        "name": "caseFirst",
        "signature": "let caseFirst: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.collation",
        "kind": "value",
        "name": "collation",
        "signature": "let collation: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.hourCycle",
        "kind": "value",
        "name": "hourCycle",
        "signature": "let hourCycle: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.language",
        "kind": "value",
        "name": "language",
        "signature": "let language: (. t) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.numberingSystem",
        "kind": "value",
        "name": "numberingSystem",
        "signature": "let numberingSystem: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.numeric",
        "kind": "value",
        "name": "numeric",
        "signature": "let numeric: (. t) => bool",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.region",
        "kind": "value",
        "name": "region",
        "signature": "let region: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.script",
        "kind": "value",
        "name": "script",
        "signature": "let script: (. t) => option<string>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.maximize",
        "kind": "value",
        "name": "maximize",
        "signature": "let maximize: (. t) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.Locale.minimize",
        "kind": "value",
        "name": "minimize",
        "signature": "let minimize: (. t) => t",
        "docstrings": []
      }]
    }, 
    {
      "id": "RescriptCore.Intl.NumberFormat",
      "kind": "moduleAlias",
      "name": "NumberFormat",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Intl.NumberFormat.t",
        "kind": "type",
        "name": "t",
        "signature": "type t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. unit) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.makeWithLocale",
        "kind": "value",
        "name": "makeWithLocale",
        "signature": "let makeWithLocale: (. string) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.makeWithLocales",
        "kind": "value",
        "name": "makeWithLocales",
        "signature": "let makeWithLocales: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.makeWithLocaleAndOptions",
        "kind": "value",
        "name": "makeWithLocaleAndOptions",
        "signature": "let makeWithLocaleAndOptions: (. string, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.makeWithLocalesAndOptions",
        "kind": "value",
        "name": "makeWithLocalesAndOptions",
        "signature": "let makeWithLocalesAndOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.makeWithOptions",
        "kind": "value",
        "name": "makeWithOptions",
        "signature": "let makeWithOptions: (. {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.supportedLocalesOf",
        "kind": "value",
        "name": "supportedLocalesOf",
        "signature": "let supportedLocalesOf: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.supportedLocalesOfWithOptions",
        "kind": "value",
        "name": "supportedLocalesOfWithOptions",
        "signature": "let supportedLocalesOfWithOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.resolvedOptions",
        "kind": "value",
        "name": "resolvedOptions",
        "signature": "let resolvedOptions: (. t) => {..}",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.format",
        "kind": "value",
        "name": "format",
        "signature": "let format: (. t, float) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.formatToParts",
        "kind": "value",
        "name": "formatToParts",
        "signature": "let formatToParts: (. t, float) => array<{\"type\": string, \"value\": string}>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.formatInt",
        "kind": "value",
        "name": "formatInt",
        "signature": "let formatInt: (. t, int) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.formatIntToParts",
        "kind": "value",
        "name": "formatIntToParts",
        "signature": "let formatIntToParts: (. t, int) => array<{\"type\": string, \"value\": string}>",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.formatBigInt",
        "kind": "value",
        "name": "formatBigInt",
        "signature": "let formatBigInt: (. t, Core__BigInt.t) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.NumberFormat.formatBigIntToParts",
        "kind": "value",
        "name": "formatBigIntToParts",
        "signature": "let formatBigIntToParts: (.\n  t,\n  Core__BigInt.t,\n) => array<{\"type\": string, \"value\": string}>",
        "docstrings": []
      }]
    }, 
    {
      "id": "RescriptCore.Intl.PluralRules",
      "kind": "moduleAlias",
      "name": "PluralRules",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Intl.PluralRules.t",
        "kind": "type",
        "name": "t",
        "signature": "type t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. unit) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.makeWithLocale",
        "kind": "value",
        "name": "makeWithLocale",
        "signature": "let makeWithLocale: (. string) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.makeWithLocales",
        "kind": "value",
        "name": "makeWithLocales",
        "signature": "let makeWithLocales: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.makeWithLocaleAndOptions",
        "kind": "value",
        "name": "makeWithLocaleAndOptions",
        "signature": "let makeWithLocaleAndOptions: (. string, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.makeWithLocalesAndOptions",
        "kind": "value",
        "name": "makeWithLocalesAndOptions",
        "signature": "let makeWithLocalesAndOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.makeWithOptions",
        "kind": "value",
        "name": "makeWithOptions",
        "signature": "let makeWithOptions: (. {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.supportedLocalesOf",
        "kind": "value",
        "name": "supportedLocalesOf",
        "signature": "let supportedLocalesOf: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.supportedLocalesOfWithOptions",
        "kind": "value",
        "name": "supportedLocalesOfWithOptions",
        "signature": "let supportedLocalesOfWithOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.resolvedOptions",
        "kind": "value",
        "name": "resolvedOptions",
        "signature": "let resolvedOptions: (. t) => {..}",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.rule",
        "kind": "type",
        "name": "rule",
        "signature": "type rule = [#few | #many | #one | #other | #two | #zero]",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.select",
        "kind": "value",
        "name": "select",
        "signature": "let select: (. t, float) => rule",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.selectInt",
        "kind": "value",
        "name": "selectInt",
        "signature": "let selectInt: (. t, int) => rule",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.PluralRules.selectBigInt",
        "kind": "value",
        "name": "selectBigInt",
        "signature": "let selectBigInt: (. t, Core__BigInt.t) => rule",
        "docstrings": []
      }]
    }, 
    {
      "id": "RescriptCore.Intl.RelativeTimeFormat",
      "kind": "moduleAlias",
      "name": "RelativeTimeFormat",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.t",
        "kind": "type",
        "name": "t",
        "signature": "type t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.make",
        "kind": "value",
        "name": "make",
        "signature": "let make: (. unit) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.makeWithLocale",
        "kind": "value",
        "name": "makeWithLocale",
        "signature": "let makeWithLocale: (. string) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.makeWithLocales",
        "kind": "value",
        "name": "makeWithLocales",
        "signature": "let makeWithLocales: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.makeWithLocaleAndOptions",
        "kind": "value",
        "name": "makeWithLocaleAndOptions",
        "signature": "let makeWithLocaleAndOptions: (. string, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.makeWithLocalesAndOptions",
        "kind": "value",
        "name": "makeWithLocalesAndOptions",
        "signature": "let makeWithLocalesAndOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.makeWithOptions",
        "kind": "value",
        "name": "makeWithOptions",
        "signature": "let makeWithOptions: (. {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.supportedLocalesOf",
        "kind": "value",
        "name": "supportedLocalesOf",
        "signature": "let supportedLocalesOf: (. array<string>) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.supportedLocalesOfWithOptions",
        "kind": "value",
        "name": "supportedLocalesOfWithOptions",
        "signature": "let supportedLocalesOfWithOptions: (. array<string>, {..}) => t",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.resolvedOptions",
        "kind": "value",
        "name": "resolvedOptions",
        "signature": "let resolvedOptions: (. t) => {..}",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.timeUnit",
        "kind": "type",
        "name": "timeUnit",
        "signature": "type timeUnit = [\n  | #day\n  | #hour\n  | #minute\n  | #month\n  | #quarter\n  | #second\n  | #week\n  | #year\n]",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.format",
        "kind": "value",
        "name": "format",
        "signature": "let format: (. t, int, timeUnit) => string",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Intl.RelativeTimeFormat.formatToParts",
        "kind": "value",
        "name": "formatToParts",
        "signature": "let formatToParts: (.\n  t,\n  int,\n  timeUnit,\n) => array<\n  {\"type\": string, \"unit\": option<string>, \"value\": string},\n>",
        "docstrings": []
      }]
    }]
  }, 
  {
    "id": "RescriptCore.window",
    "kind": "value",
    "name": "window",
    "signature": "let window: Dom.window",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.document",
    "kind": "value",
    "name": "document",
    "signature": "let document: Dom.document",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.globalThis",
    "kind": "value",
    "name": "globalThis",
    "signature": "let globalThis: {..}",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.null",
    "kind": "value",
    "name": "null",
    "signature": "let null: Core__Nullable.t<'a>",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.undefined",
    "kind": "value",
    "name": "undefined",
    "signature": "let undefined: Core__Nullable.t<'a>",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.typeof",
    "kind": "value",
    "name": "typeof",
    "signature": "let typeof: (. 'a) => Core__Type.t",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.t",
    "kind": "type",
    "name": "t",
    "signature": "type t<'a> = Js.t<'a>\n  constraint 'a = {..}",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.MapperRt",
    "kind": "moduleAlias",
    "name": "MapperRt",
    "docstrings": [],
    "items": []
  }, 
  {
    "id": "RescriptCore.Internal",
    "kind": "moduleAlias",
    "name": "Internal",
    "docstrings": [],
    "items": []
  }, 
  {
    "id": "RescriptCore.Re",
    "kind": "moduleAlias",
    "name": "Re",
    "docstrings": ["Functions for handling RegExp's in ReScript.\n\nSee [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp) on MDN."],
    "items": [
    {
      "id": "RescriptCore.Re.t",
      "kind": "type",
      "name": "t",
      "signature": "type t = Js.Re.t",
      "docstrings": ["Type representing an instantiated `RegExp`."]
    }, 
    {
      "id": "RescriptCore.Re.Result",
      "name": "Result",
      "kind": "module",
      "docstrings": [],
      "items": [
      {
        "id": "RescriptCore.Re.Result.t",
        "kind": "type",
        "name": "t",
        "signature": "type t = array<string>",
        "docstrings": ["Type representing the result of a `RegExp` execution."]
      }, 
      {
        "id": "RescriptCore.Re.Result.fullMatch",
        "kind": "value",
        "name": "fullMatch",
        "signature": "let fullMatch: (. t) => string",
        "docstrings": ["`fullMatch(regExpResult)` returns the full string that matched in this result.\n\n  ## Examples\n  ```rescript\n  // Match the first two words separated by a space\n  let regexp = RegExp.fromString(\"(\\\\w+) (\\\\w+)\")\n\n  switch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n  | None => Console.log(\"Nope, no match...\")\n  | Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints the full string that matched, \"ReScript is\"\n  }\n  ```"]
      }, 
      {
        "id": "RescriptCore.Re.Result.matches",
        "kind": "value",
        "name": "matches",
        "signature": "let matches: (. t) => array<string>",
        "docstrings": ["`matches(regExpResult)` returns all matches for `regExpResult`.\n\n  ## Examples\n  ```rescript\n  // Match the first two words separated by a space\n  let regexp = RegExp.fromString(\"(\\\\w+) (\\\\w+)\")\n\n  // This below will log \"ReScript\" and \"is\" to the console.\n  switch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n  | None => Console.log(\"Nope, no match...\")\n  | Some(result) => switch result->RegExp.Result.matches {\n    | [firstWord, secondWord] => Console.log2(firstWord, secondWord)\n    | _ => Console.log(\"Didn't find exactly two words...\")\n    }\n  }\n  ```"]
      }, 
      {
        "id": "RescriptCore.Re.Result.index",
        "kind": "value",
        "name": "index",
        "signature": "let index: (. t) => int",
        "docstrings": []
      }, 
      {
        "id": "RescriptCore.Re.Result.input",
        "kind": "value",
        "name": "input",
        "signature": "let input: (. t) => string",
        "docstrings": ["`input(regExpResult)` returns the full input string that was passed to what produced the `RegExp.Result.t`.\n\n  ## Examples\n  ```rescript\n  // Match the first two words separated by a space\n  let regexp = RegExp.fromString(\"(\\\\w+) (\\\\w+)\")\n\n  // This below will log the full input string \"ReScript is pretty cool, right?\" to the console.\n  switch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n  | None => Console.log(\"Nope, no match...\")\n  | Some(result) => Console.log(result->RegExp.Result.input)\n  }\n  ```"]
      }]
    }, 
    {
      "id": "RescriptCore.Re.fromString",
      "kind": "value",
      "name": "fromString",
      "signature": "let fromString: (. string) => t",
      "docstrings": ["`fromString(string)` creates a `RegExp.t` from the provided string. This can then be used to match on strings using `RegExp.exec`.\n\nSee [`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\n\nswitch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n| None => Console.log(\"Nope, no match...\")\n| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints \"ReScript\"\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Re.fromStringWithFlags",
      "kind": "value",
      "name": "fromStringWithFlags",
      "signature": "let fromStringWithFlags: (. string, ~flags: string) => t",
      "docstrings": ["`fromStringWithFlags(string)` creates a `RegExp.t` from the provided string, using the provided `flags`. This can then be used to match on strings using `RegExp.exec`.\n\nSee [`RegExp parameters`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp#parameters) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\n\nswitch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n| None => Console.log(\"Nope, no match...\")\n| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints \"ReScript\"\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Re.test",
      "kind": "value",
      "name": "test",
      "signature": "let test: (. t, string) => bool",
      "docstrings": ["`test(regexp, string)` tests whether the provided `regexp` matches on the provided string.\n\nSee [`RegExp.test`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\n\nif regexp->RegExp.test(\"ReScript is cool!\") {\n  Console.log(\"Yay, there's a word in there.\")\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Re.exec",
      "kind": "value",
      "name": "exec",
      "signature": "let exec: (. t, string) => option<Result.t>",
      "docstrings": ["`exec(regexp, string)` executes the provided regexp on the provided string, optionally returning a `RegExp.Result.t` if the regexp matches on the string.\n\nSee [`RegExp.exec`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\n\nswitch regexp->RegExp.exec(\"ReScript is pretty cool, right?\") {\n| None => Console.log(\"Nope, no match...\")\n| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints \"ReScript\"\n}\n```"]
    }, 
    {
      "id": "RescriptCore.Re.lastIndex",
      "kind": "value",
      "name": "lastIndex",
      "signature": "let lastIndex: (. t) => int",
      "docstrings": ["`lastIndex(regexp)` returns the index the next match will start from.\n\nSee [`RegExp.lastIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) on MDN.\n\n## Examples\n```rescript\n// Match the first word in a sentence\nlet regexp = RegExp.fromString(\"\\\\w+\")\nlet someStr = \"Many words here.\"\n\nConsole.log(regexp->RegExp.lastIndex) // Logs `0` to the console\n\nregexp->RegExp.exec(someStr)->ignore\n\nConsole.log(regexp->RegExp.lastIndex) // Logs `4` to the console\n```"]
    }, 
    {
      "id": "RescriptCore.Re.ignoreCase",
      "kind": "value",
      "name": "ignoreCase",
      "signature": "let ignoreCase: (. t) => bool",
      "docstrings": ["`ignoreCase(regexp)` returns whether the ignore case (`i`) flag is set on this `RegExp`.\n\nSee [`RegExp.ignoreCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.ignoreCase) // Logs `false`, since `i` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"i\")\nConsole.log(regexp2->RegExp.ignoreCase) // Logs `true`, since `i` is set\n```"]
    }, 
    {
      "id": "RescriptCore.Re.global",
      "kind": "value",
      "name": "global",
      "signature": "let global: (. t) => bool",
      "docstrings": ["`global(regexp)` returns whether the global (`g`) flag is set on this `RegExp`.\n\nSee [`RegExp.global`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.global) // Logs `true`, since `g` is set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"i\")\nConsole.log(regexp2->RegExp.global) // Logs `false`, since `g` is not set\n```"]
    }, 
    {
      "id": "RescriptCore.Re.multiline",
      "kind": "value",
      "name": "multiline",
      "signature": "let multiline: (. t) => bool",
      "docstrings": ["`multiline(regexp)` returns whether the multiline (`m`) flag is set on this `RegExp`.\n\nSee [`RegExp.multiline`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.multiline) // Logs `false`, since `m` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"mi\")\nConsole.log(regexp2->RegExp.multiline) // Logs `true`, since `m` is set\n```"]
    }, 
    {
      "id": "RescriptCore.Re.source",
      "kind": "value",
      "name": "source",
      "signature": "let source: (. t) => string",
      "docstrings": ["`source(regexp)` returns the source text for this `RegExp`, without the two forward slashes (if present), and without any set flags.\n\nSee [`RegExp.source`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) on MDN.\n\n## Examples\n```rescript\nlet regexp = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp->RegExp.source) // Logs `\\w+`, the source text of the `RegExp`\n```"]
    }, 
    {
      "id": "RescriptCore.Re.sticky",
      "kind": "value",
      "name": "sticky",
      "signature": "let sticky: (. t) => bool",
      "docstrings": ["`sticky(regexp)` returns whether the sticky (`y`) flag is set on this `RegExp`.\n\nSee [`RegExp.sticky`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.unicode) // Logs `false`, since `y` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"my\")\nConsole.log(regexp2->RegExp.unicode) // Logs `true`, since `y` is set\n```"]
    }, 
    {
      "id": "RescriptCore.Re.unicode",
      "kind": "value",
      "name": "unicode",
      "signature": "let unicode: (. t) => bool",
      "docstrings": ["`unicode(regexp)` returns whether the unicode (`y`) flag is set on this `RegExp`.\n\nSee [`RegExp.unicode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) on MDN.\n\n## Examples\n```rescript\nlet regexp1 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"g\")\nConsole.log(regexp1->RegExp.unicode) // Logs `false`, since `u` is not set\n\nlet regexp2 = RegExp.fromStringWithFlags(\"\\\\w+\", ~flags=\"mu\")\nConsole.log(regexp2->RegExp.unicode) // Logs `true`, since `u` is set\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Exn",
    "kind": "moduleAlias",
    "name": "Exn",
    "docstrings": [],
    "items": []
  }, 
  {
    "id": "RescriptCore.Option",
    "kind": "moduleAlias",
    "name": "Option",
    "docstrings": ["We represent the existence and nonexistence of a value by wrapping it with\nthe `option` type. In order to make it a bit more convenient to work with\noption-types, we provide utility-functions for it.\n\nThe `option` type is a part of the ReScript standard library which is defined\nlike this:\n\n```rescript\ntype option<'a> = None | Some('a)\n```\n\n```rescript\nlet someString: option<string> = Some(\"hello\")\n```"],
    "items": [
    {
      "id": "RescriptCore.Option.filter",
      "kind": "value",
      "name": "filter",
      "signature": "let filter: (. option<'a>, (. 'a) => bool) => option<'a>",
      "docstrings": ["`filter(opt, f)` applies `f` to `opt`, if `f` returns `true`, then it returns `Some(value)`, otherwise returns `None`.\n\n## Examples\n\n```rescript\nOption.filter(Some(10), x => x > 5) // Some(10)\nOption.filter(Some(4), x => x > 5) // None\nOption.filter(None, x => x > 5) // None\n```"]
    }, 
    {
      "id": "RescriptCore.Option.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. option<'a>, (. 'a) => unit) => unit",
      "docstrings": ["`forEach(opt, f)` call `f` on `opt`. if `opt` is `Some(value)`, then if calls\n`f`, otherwise returns `unit`.\n\n## Examples\n\n```rescript\nOption.forEach(Some(\"thing\"), x => Console.log(x)) // logs \"thing\"\nOption.forEach(None, x => Console.log(x)) // returns ()\n```"]
    }, 
    {
      "id": "RescriptCore.Option.getExn",
      "kind": "value",
      "name": "getExn",
      "signature": "let getExn: (. option<'a>) => 'a",
      "docstrings": ["`getExn(opt)` returns `value` if `opt` is `Some(value)`, otherwise raises an exception.\n\n```rescript\nOption.getExn(Some(3)) // 3\nOption.getExn(None) /* Raises an Error */\n```\n\n## Exceptions\n\n- Raises an error if `opt` is `None`"]
    }, 
    {
      "id": "RescriptCore.Option.getUnsafe",
      "kind": "value",
      "name": "getUnsafe",
      "signature": "let getUnsafe: (. option<'a>) => 'a",
      "docstrings": ["`getUnsafe(opt)` returns `value` if `opt` is `Some(value)`, otherwise `undefined`.\n\n## Examples\n\n```rescript\nOption.getUnsafe(Some(3)) == 3\nOption.getUnsafe(None: option<int>) // Returns `undefined`, which is not a valid `int`\n```\n\n## Notes\n\n- This is an unsafe operation. It assumes `value` is not `None`, and may cause undefined behaviour if it is."]
    }, 
    {
      "id": "RescriptCore.Option.mapOr",
      "kind": "value",
      "name": "mapOr",
      "signature": "let mapOr: (. option<'a>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": ["`mapOr(opt, default, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `default`.\n\n## Examples\n\n```rescript\nlet someValue = Some(3)\nsomeValue->Option.mapOr(0, x => x + 5) // 8\n\nlet noneValue = None\nnoneValue->Option.mapOr(0, x => x + 5) // 0\n```"]
    }, 
    {
      "id": "RescriptCore.Option.mapWithDefault",
      "kind": "value",
      "name": "mapWithDefault",
      "deprecated": "Use mapOr instead",
      "signature": "let mapWithDefault: (. option<'a>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Option.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. option<'a>, (. 'a) => 'b) => option<'b>",
      "docstrings": ["`map(opt, f)` returns `Some(f(value))` if `opt` is `Some(value)`, otherwise `None`.\n\n## Examples\n\n```rescript\nOption.map(Some(3), x => x * x) // Some(9)\nOption.map(None, x => x * x) // None\n```"]
    }, 
    {
      "id": "RescriptCore.Option.flatMap",
      "kind": "value",
      "name": "flatMap",
      "signature": "let flatMap: (. option<'a>, (. 'a) => option<'b>) => option<'b>",
      "docstrings": ["`flatMap(opt, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `None`.\n\n## Examples\n\n```rescript\nlet addIfAboveOne = value =>\n  if (value > 1) {\n    Some(value + 1)\n  } else {\n    None\n  }\n\nOption.flatMap(Some(2), addIfAboveOne) // Some(3)\nOption.flatMap(Some(-4), addIfAboveOne) // None\nOption.flatMap(None, addIfAboveOne) // None\n```"]
    }, 
    {
      "id": "RescriptCore.Option.getOr",
      "kind": "value",
      "name": "getOr",
      "signature": "let getOr: (. option<'a>, 'a) => 'a",
      "docstrings": ["`getOr(opt, default)` returns `value` if `opt` is `Some(value)`, otherwise `default`.\n\n## Examples\n\n```rescript\nOption.getOr(None, \"Banana\") // Banana\nOption.getOr(Some(\"Apple\"), \"Banana\") // Apple\n\nlet greet = (firstName: option<string>) =>\n  \"Greetings \" ++ firstName->Option.getOr(\"Anonymous\")\n\nSome(\"Jane\")->greet // \"Greetings Jane\"\nNone->greet // \"Greetings Anonymous\"\n```"]
    }, 
    {
      "id": "RescriptCore.Option.getWithDefault",
      "kind": "value",
      "name": "getWithDefault",
      "deprecated": "Use getOr instead",
      "signature": "let getWithDefault: (. option<'a>, 'a) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Option.orElse",
      "kind": "value",
      "name": "orElse",
      "signature": "let orElse: (. option<'a>, option<'a>) => option<'a>",
      "docstrings": ["`orElse(opt1, opt2)` returns `opt2` if `opt1` is `None`, otherwise `opt1`.\n\n## Examples\n\n```rescript\nOption.orElse(Some(1812), Some(1066)) == Some(1812)\nOption.orElse(None, Some(1066) == Some(1066)\nOption.orElse(None, None) == None\n```"]
    }, 
    {
      "id": "RescriptCore.Option.isSome",
      "kind": "value",
      "name": "isSome",
      "signature": "let isSome: (. option<'a>) => bool",
      "docstrings": ["`isSome(opt)` returns `true` if `opt` is `Some(value)`, otherwise returns `false`.\n\n## Examples\n\n```rescript\nOption.isSome(None) // false\nOption.isSome(Some(1)) // true\n```"]
    }, 
    {
      "id": "RescriptCore.Option.isNone",
      "kind": "value",
      "name": "isNone",
      "signature": "let isNone: (. option<'a>) => bool",
      "docstrings": ["`isNone(opt)` returns `true` if `opt` is `None`, false otherwise.\n\n## Examples\n\n```rescript\nOption.isNone(None) // true\nOption.isNone(Some(1)) // false\n```"]
    }, 
    {
      "id": "RescriptCore.Option.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. option<'a>, option<'b>, (. 'a, 'b) => bool) => bool",
      "docstrings": ["`equal(opt1, opt2, f)` evaluates two optional values for equality with respect to a predicate function `f`. If both `opt1` and `opt2` are `None`, returns `true`.\nIf one of the arguments is `Some(value)` and the other is `None`, returns\n`false`.\nIf arguments are `Some(value1)` and `Some(value2)`, returns the result of\n`f(value1, value2)`, the predicate function `f` must return a bool.\n\n## Examples\n\n```rescript\nlet clockEqual = (a, b) => mod(a, 12) == mod(b, 12)\n\nopen Option\n\nequal(Some(3), Some(15), clockEqual) // true\nequal(Some(3), None, clockEqual) // false\nequal(None, Some(3), clockEqual) // false\nequal(None, None, clockEqual) // true\n```"]
    }, 
    {
      "id": "RescriptCore.Option.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (.\n  option<'a>,\n  option<'b>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t",
      "docstrings": ["`compare(opt1, opt2, f)` compares two optional values with respect to given `f`.\n\nIf both `opt1` and `opt2` are `None`, it returns `0.`. If the first argument is `Some(value1)` and the second is `None`, returns `1.` (something is greater than nothing).\n\nIf the first argument is `None` and the second is `Some(value2)`, returns `-1.`\n(nothing is less than something).\n\nIf the arguments are `Some(value1)` and `Some(value2)`, returns the result of\n`f(value1, value2)`, `f` takes two arguments and returns `-1.` if the first\nargument is less than the second, `0.` if the arguments are equal, and `1.` if\nthe first argument is greater than the second.\n\n## Examples\n\n```rescript\nlet clockCompare = (a, b) => compare(mod(a, 12), mod(b, 12))\n\nopen Option\n\ncompare(Some(3), Some(15), clockCompare) // 0.\ncompare(Some(3), Some(14), clockCompare) // 1.\ncompare(Some(2), Some(15), clockCompare) // (-1.)\ncompare(None, Some(15), clockCompare) // (-1.)\ncompare(Some(14), None, clockCompare) // 1.\ncompare(None, None, clockCompare) // 0.\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.List",
    "kind": "moduleAlias",
    "name": "List",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.List.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a> = list<'a>",
      "docstrings": ["Collection functions for manipulating the `list` data structures, a singly-linked list.\n\n**Prefer Array** if you need any of the following:\n\n- Random access of element\n- Better interop with JavaScript\n- Better memory usage & performance."]
    }, 
    {
      "id": "RescriptCore.List.length",
      "kind": "value",
      "name": "length",
      "signature": "let length: (. t<'a>) => int",
      "docstrings": ["`length(list)` returns the length of `list`.\n\n## Examples\n\n```rescript\nList.length(list{1, 2, 3}) // 3\n```"]
    }, 
    {
      "id": "RescriptCore.List.size",
      "kind": "value",
      "name": "size",
      "signature": "let size: (. t<'a>) => int",
      "docstrings": ["`size(list)`. See [`length`](#length)\n\n## Examples\n\n```rescript\nList.size(list{1, 2, 3}) // 3\n```"]
    }, 
    {
      "id": "RescriptCore.List.head",
      "kind": "value",
      "name": "head",
      "signature": "let head: (. t<'a>) => option<'a>",
      "docstrings": ["`head(list)` returns `Some(value)` where `value` is the first element in the\nlist, or `None` if `list` is an empty list.\n\n## Examples\n\n```rescript\nList.head(list{}) // None\nList.head(list{1, 2, 3}) // Some(1)\n```"]
    }, 
    {
      "id": "RescriptCore.List.headExn",
      "kind": "value",
      "name": "headExn",
      "signature": "let headExn: (. t<'a>) => 'a",
      "docstrings": ["`headExn(list)` same as [`head`](#head).\n\n## Examples\n\n```rescript\nList.headExn(list{1, 2, 3}) // 1\n\nList.headExn(list{}) // Raises an Error\n```\n\n## Exceptions\n\n- Raises an Error if list is empty."]
    }, 
    {
      "id": "RescriptCore.List.tail",
      "kind": "value",
      "name": "tail",
      "signature": "let tail: (. t<'a>) => option<t<'a>>",
      "docstrings": ["`tail(list)` returns `None` if `list` is empty, otherwise it returns `Some(tail)`\nwhere `tail` is everything except the first element of `list`.\n\n## Examples\n\n```rescript\nList.tail(list{1, 2, 3}) // Some(list{2, 3})\n\nList.tail(list{}) // None\n```"]
    }, 
    {
      "id": "RescriptCore.List.tailExn",
      "kind": "value",
      "name": "tailExn",
      "signature": "let tailExn: (. t<'a>) => t<'a>",
      "docstrings": ["`tailExn(list)` same as [`tail`](#tail).\n\n## Examples\n\n```rescript\nList.tailExn(list{1, 2, 3}) // list{2, 3}\n\nList.tailExn(list{}) // Raises an Error\n```\n\n## Exceptions\n\n- Raises an Error if list is empty."]
    }, 
    {
      "id": "RescriptCore.List.add",
      "kind": "value",
      "name": "add",
      "signature": "let add: (. t<'a>, 'a) => t<'a>",
      "docstrings": ["`add(list, value)` adds a `value` to the beginning of list `list`.\n\n## Examples\n\n```rescript\nList.add(list{2, 3}, 1) // list{1, 2, 3}\n\nList.add(list{\"World\", \"!\"}, \"Hello\") // list{\"Hello\", \"World\", \"!\"}\n```"]
    }, 
    {
      "id": "RescriptCore.List.get",
      "kind": "value",
      "name": "get",
      "signature": "let get: (. t<'a>, int) => option<'a>",
      "docstrings": ["`get(list, index)` return the `index` element in `list`, or `None` if `index`\nis larger than the length of list `list`.\n\n## Examples\n\n```rescript\nlet abc = list{\"A\", \"B\", \"C\"}\n\nabc->List.get(1) // Some(\"B\")\n\nabc->List.get(4) // None\n```"]
    }, 
    {
      "id": "RescriptCore.List.getExn",
      "kind": "value",
      "name": "getExn",
      "signature": "let getExn: (. t<'a>, int) => 'a",
      "docstrings": ["`getExn(list, index)` same as [`get`](#get).\n\n## Examples\n\n```rescript\nlet abc = list{\"A\", \"B\", \"C\"}\n\nabc->List.getExn(1) // \"B\"\n\nabc->List.getExn(4) // Raises an Error\n```\n\n## Exceptions\n\n- Raises an Error if `index` is larger than the length of list."]
    }, 
    {
      "id": "RescriptCore.List.make",
      "kind": "value",
      "name": "make",
      "signature": "let make: (. int, 'a) => t<'a>",
      "docstrings": ["`make(length, value)` returns a list of length `length` with each element filled\nwith `value`. Returns an empty list if `value` is negative.\n\n## Examples\n\n```rescript\nList.make(3, 1) // list{1, 1, 1}\n```"]
    }, 
    {
      "id": "RescriptCore.List.makeBy",
      "kind": "value",
      "name": "makeBy",
      "signature": "let makeBy: (. int, (. int) => 'a) => t<'a>",
      "docstrings": ["`makeBy(length, f)` return a list of length `length` with element initialized\nwith `f`. Returns an empty list if `length` is negative.\n\n## Examples\n\n```rescript\nList.makeBy(5, i => i) // list{0, 1, 2, 3, 4}\n\nList.makeBy(5, i => i * i) // list{0, 1, 4, 9, 16}\n```"]
    }, 
    {
      "id": "RescriptCore.List.toShuffled",
      "kind": "value",
      "name": "toShuffled",
      "signature": "let toShuffled: (. t<'a>) => t<'a>",
      "docstrings": ["`toShuffled(list)` returns a new list in random order.\n\n## Examples\n\n```rescript\nList.toShuffled(list{1, 2, 3}) // list{2, 1, 3}\n```"]
    }, 
    {
      "id": "RescriptCore.List.drop",
      "kind": "value",
      "name": "drop",
      "signature": "let drop: (. t<'a>, int) => option<t<'a>>",
      "docstrings": ["`drop(list, value)` return a new list, dropping the first `value` element.\nReturns `None` if `list` has fewer than `value` elements.\n\n## Examples\n\n```rescript\nlist{1, 2, 3}->List.drop(2) // Some(list{3})\n\nlist{1, 2, 3}->List.drop(3) // Some(list{})\n\nlist{1, 2, 3}->List.drop(4) // None\n```"]
    }, 
    {
      "id": "RescriptCore.List.take",
      "kind": "value",
      "name": "take",
      "signature": "let take: (. t<'a>, int) => option<t<'a>>",
      "docstrings": ["`take(list, value)` returns a list with the first `value` elements from `list`,\nor `None` if `list` has fewer than `value` elements.\n\n## Examples\n\n```rescript\nlist{1, 2, 3}->List.take(1) // Some(list{1})\n\nlist{1, 2, 3}->List.take(2) // Some(list{1, 2})\n\nlist{1, 2, 3}->List.take(4) // None\n```"]
    }, 
    {
      "id": "RescriptCore.List.splitAt",
      "kind": "value",
      "name": "splitAt",
      "signature": "let splitAt: (. t<'a>, int) => option<(list<'a>, list<'a>)>",
      "docstrings": ["`splitAt(list, n)` split the list `list` at `n`. Returns `None` when the length\nof `list` is less than `n`.\n\n## Examples\n\n```rescript\nlist{\"Hello\", \"World\"}->List.splitAt(1) // Some((list{\"Hello\"}, list{\"World\"}))\n\nlist{0, 1, 2, 3, 4}->List.splitAt(2) // Some((list{0, 1}, list{2, 3, 4}))\n```"]
    }, 
    {
      "id": "RescriptCore.List.concat",
      "kind": "value",
      "name": "concat",
      "signature": "let concat: (. t<'a>, t<'a>) => t<'a>",
      "docstrings": ["`concat(list1, list2)` returns the list obtained by adding `list1` after `list2`.\n\n## Examples\n\n```rescript\nList.concat(list{1, 2, 3}, list{4, 5}) // list{1, 2, 3, 4, 5}\n```"]
    }, 
    {
      "id": "RescriptCore.List.concatMany",
      "kind": "value",
      "name": "concatMany",
      "signature": "let concatMany: (. array<t<'a>>) => t<'a>",
      "docstrings": ["`concatMany(arr)` returns the list obtained by concatenating all the lists in\narray `arr`, in order.\n\n## Examples\n\n```rescript\nList.concatMany([list{1, 2, 3}, list{}, list{3}]) // list{1, 2, 3, 3}\n```"]
    }, 
    {
      "id": "RescriptCore.List.reverseConcat",
      "kind": "value",
      "name": "reverseConcat",
      "signature": "let reverseConcat: (. t<'a>, t<'a>) => t<'a>",
      "docstrings": ["`reverseConcat(list1, list2)` is equivalent to writing: `concat(reverse(list1, list2)`\n\n## Examples\n\n```rescript\nList.reverseConcat(list{1, 2}, list{3, 4}) // list{2, 1, 3, 4}\n```"]
    }, 
    {
      "id": "RescriptCore.List.flatten",
      "kind": "value",
      "name": "flatten",
      "signature": "let flatten: (. t<t<'a>>) => t<'a>",
      "docstrings": ["`flatten(list)` return the list obtained by concatenating all the lists in\n`list`, in order.\n\n## Examples\n\n```rescript\nList.flatten(list{list{1, 2, 3}, list{}, list{3}}) // list{1, 2, 3, 3}\n```"]
    }, 
    {
      "id": "RescriptCore.List.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. t<'a>, (. 'a) => 'b) => t<'b>",
      "docstrings": ["`map(list, f)` returns a new list with `f` applied to each element of `list`.\n\n## Examples\n\n```rescript\nlist{1, 2}->List.map(x => x + 1) // list{3, 4}\n```"]
    }, 
    {
      "id": "RescriptCore.List.zip",
      "kind": "value",
      "name": "zip",
      "signature": "let zip: (. t<'a>, t<'b>) => t<('a, 'b)>",
      "docstrings": ["`zip(list1, list2)` returns a list of pairs from the two lists with the length\nof the shorter list.\n\n## Examples\n\n```rescript\nList.zip(list{1, 2}, list{3, 4, 5}) // list{(1, 3), (2, 4)}\n```"]
    }, 
    {
      "id": "RescriptCore.List.zipBy",
      "kind": "value",
      "name": "zipBy",
      "signature": "let zipBy: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => t<'c>",
      "docstrings": ["`zipBy(list1, list2, f)`. See [`zip`](#zip)\n\n## Examples\n\n```rescript\nList.zipBy(list{1, 2, 3}, list{4, 5}, (a, b) => 2 * a + b) // list{6, 9}\n```"]
    }, 
    {
      "id": "RescriptCore.List.mapWithIndex",
      "kind": "value",
      "name": "mapWithIndex",
      "signature": "let mapWithIndex: (. t<'a>, (. int, 'a) => 'b) => t<'b>",
      "docstrings": ["`mapWithIndex(list, f)` applies `f` to each element of `list`. Function `f`\ntakes two arguments: the index starting from 0 and the element from `list`, in\nthat order.\n\n## Examples\n\n```rescript\nlist{1, 2, 3}->List.mapWithIndex((index, x) => index + x) // list{1, 3, 5}\n```"]
    }, 
    {
      "id": "RescriptCore.List.fromArray",
      "kind": "value",
      "name": "fromArray",
      "signature": "let fromArray: (. array<'a>) => t<'a>",
      "docstrings": ["`fromArray(arr)` converts the given array `arr` to a list.\n\n## Examples\n\n```rescript\nList.fromArray([1, 2, 3]) // list{1, 2, 3}\n```"]
    }, 
    {
      "id": "RescriptCore.List.toArray",
      "kind": "value",
      "name": "toArray",
      "signature": "let toArray: (. t<'a>) => array<'a>",
      "docstrings": ["`toArray(list)` converts the given list `list` to an array.\n\n## Examples\n\n```rescript\nList.toArray(list{1, 2, 3}) // [1, 2, 3]\n```"]
    }, 
    {
      "id": "RescriptCore.List.reverse",
      "kind": "value",
      "name": "reverse",
      "signature": "let reverse: (. t<'a>) => t<'a>",
      "docstrings": ["`reverse(list)` returns a new list whose elements are those of `list` in\nreversed order.\n\n## Examples\n\n```rescript\nList.reverse(list{1, 2, 3}) // list{3, 2, 1}\n```"]
    }, 
    {
      "id": "RescriptCore.List.mapReverse",
      "kind": "value",
      "name": "mapReverse",
      "signature": "let mapReverse: (. t<'a>, (. 'a) => 'b) => t<'b>",
      "docstrings": ["`mapReverse(list, f)` is equivalent to `map` function.\n\n## Examples\n\n```rescript\nlet f = x => x * x\nlet l = list{3, 4, 5}\n\nlet withMap = List.map(l, f)->List.reverse\nlet withMapReverse = l->List.mapReverse(f)\n\nConsole.log(withMap == withMapReverse) // true\n```"]
    }, 
    {
      "id": "RescriptCore.List.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'a>, (. 'a) => 'b) => unit",
      "docstrings": ["`forEach(list, f)` call `f` on each element of `list` from the beginning to end.\n`f` returns `unit`, so no new array is created. Use `forEach` when you are primarily\nconcerned with repetitively creating side effects.\n\n## Examples\n\n```rescript\nList.forEach(list{\"a\", \"b\", \"c\"}, x => Console.log(\"Item: \" ++ x))\n/*\n  prints:\n  Item: a\n  Item: b\n  Item: c\n*/\n```"]
    }, 
    {
      "id": "RescriptCore.List.forEachWithIndex",
      "kind": "value",
      "name": "forEachWithIndex",
      "signature": "let forEachWithIndex: (. t<'a>, (. int, 'a) => 'b) => unit",
      "docstrings": ["`forEachWithIndex(list, f, index)` call `f` on each element of `list` from beginning\nto end. Function `f` takes two arguments: the `index` starting from 0 and the\nelement from `list`. `f` returns `unit`.\n\n## Examples\n\n```rescript\nList.forEachWithIndex(list{\"a\", \"b\", \"c\"}, (index, x) => {\n  Console.log(\"Item \" ++ Int.toString(index) ++ \" is \" ++ x)\n})\n/*\n  prints:\n  Item 0 is a\n  Item 1 is b\n  Item 2 is cc\n*/\n```"]
    }, 
    {
      "id": "RescriptCore.List.reduce",
      "kind": "value",
      "name": "reduce",
      "signature": "let reduce: (. t<'a>, 'b, (. 'b, 'a) => 'b) => 'b",
      "docstrings": ["`reduce(list, initialValue, f)` applies `f` to each element of `list` from\nbeginning to end. Function `f` has two parameters: the item from the list and\nan \"accumulator\", which starts with a value of `initialValue`. `reduce` returns\nthe final value of the accumulator.\n\n## Examples\n\n```rescript\nlist{1, 2, 3, 4}->List.reduce(0, (a, b) => a + b) // 10\n\n// same as\n\nlist{1, 2, 3, 4}->List.reduce(0, (acc, item) => acc + item) // 10\n```"]
    }, 
    {
      "id": "RescriptCore.List.reduceWithIndex",
      "kind": "value",
      "name": "reduceWithIndex",
      "signature": "let reduceWithIndex: (. t<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b",
      "docstrings": ["`reduceWithIndex(list, initialValue, f)` applies `f` to each element of `list`\nfrom beginning to end. Function `f` has three parameters: the item from the list\nand an \"accumulator\", which starts with a value of `initialValue` and the index\nof each element. `reduceWithIndex` returns the final value of the accumulator.\n\n## Examples\n\n```rescript\nlist{1, 2, 3, 4}->List.reduceWithIndex(0, (acc, item, index) => acc + item + index) // 16\n```"]
    }, 
    {
      "id": "RescriptCore.List.reduceReverse",
      "kind": "value",
      "name": "reduceReverse",
      "signature": "let reduceReverse: (. t<'a>, 'b, (. 'b, 'a) => 'b) => 'b",
      "docstrings": ["`reduceReverse(list, initialValue, f)` works like `reduce`, except that\nfunction `f` is applied to each item of `list` from the last back to the first.\n\n## Examples\n\n```rescript\nlist{1, 2, 3, 4}->List.reduceReverse(0, (a, b) => a + b) // 10\n\nlist{1, 2, 3, 4}->List.reduceReverse(10, (a, b) => a - b) // 0\n\nlist{1, 2, 3, 4}->List.reduceReverse(list{}, List.add) // list{1, 2, 3, 4}\n```"]
    }, 
    {
      "id": "RescriptCore.List.mapReverse2",
      "kind": "value",
      "name": "mapReverse2",
      "signature": "let mapReverse2: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => t<'c>",
      "docstrings": ["`mapReverse2(list1, list2, f)` is equivalent to `List.zipBy(list1, list2, f)->List.reverse`.\n\n## Examples\n\n```rescript\nList.mapReverse2(list{1, 2, 3}, list{1, 2}, (a, b) => a + b) // list{4, 2}\n```"]
    }, 
    {
      "id": "RescriptCore.List.forEach2",
      "kind": "value",
      "name": "forEach2",
      "signature": "let forEach2: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => unit",
      "docstrings": ["`forEach2(list1, list2, f)` is similar to `forEach`, but accepts two lists and\nstops at the length of the shorter list.\n\n## Examples\n\n```rescript\nList.forEach2(list{\"Z\", \"Y\"}, list{\"A\", \"B\", \"C\"}, (x, y) => Console.log2(x, y))\n\n/*\n  prints:\n  \"Z\" \"A\"\n  \"Y\" \"B\"\n*/\n```"]
    }, 
    {
      "id": "RescriptCore.List.reduce2",
      "kind": "value",
      "name": "reduce2",
      "signature": "let reduce2: (. t<'b>, t<'c>, 'a, (. 'a, 'b, 'c) => 'a) => 'a",
      "docstrings": ["`reduce2(list1, list2, initialValue, f)` applies `f` to each element of `list1`\nand `list2` from beginning to end. Stops with the shorter list. Function `f` has\nthree parameters: an accumulator which starts with a value of `initialValue`, an\nitem from `l1`, and an item from `l2`. `reduce2` returns the final value of the\naccumulator.\n\n## Examples\n\n```rescript\nList.reduce2(list{1, 2, 3}, list{4, 5}, 0, (acc, x, y) => acc + x * x + y) // 0 + (1 * 1 + 4) + (2 * 2 + 5)\n```"]
    }, 
    {
      "id": "RescriptCore.List.reduceReverse2",
      "kind": "value",
      "name": "reduceReverse2",
      "signature": "let reduceReverse2: (. t<'a>, t<'b>, 'c, (. 'c, 'a, 'b) => 'c) => 'c",
      "docstrings": ["`reduceReverse2(list1, list2, initialValue, f)` applies `f` to each element of\n`list1` and `list2`from end to beginning. Stops with the shorter list. Function\n`f` has three parameters: an accumulator which starts with a value of\n`initialValue`, an item from `l1`, and an item from `l2`. `reduce2` returns the\nfinal value of the accumulator.\n\n## Examples\n\n```rescript\nList.reduceReverse2(list{1, 2, 3}, list{4, 5}, 0, (acc, x, y) => acc + x * x + y) //  + (1 * 1 + 4) + (2 * 2 + 5)\n```"]
    }, 
    {
      "id": "RescriptCore.List.every",
      "kind": "value",
      "name": "every",
      "signature": "let every: (. t<'a>, (. 'a) => bool) => bool",
      "docstrings": ["`every(list, f)` returns `true` if all elements in `list` satisfy `f`, where `f`\nis a predicate: a function taking an element and returning a bool.\n\n## Examples\n\n```rescript\nlet isBelow10 = value => value < 10\n\nlist{1, 9, 8, 2}->List.every(isBelow10) // true\n\nlist{1, 99, 8, 2}->List.every(isBelow10) // false\n```"]
    }, 
    {
      "id": "RescriptCore.List.some",
      "kind": "value",
      "name": "some",
      "signature": "let some: (. t<'a>, (. 'a) => bool) => bool",
      "docstrings": ["`some(list, f)` returns `true` if at least _one_ of the elements in `list`\nsatisfies `f`, where `f` is a predicate: a function taking an element and\nreturning a bool.\n\n## Examples\n\n```rescript\nlet isAbove100 = value => value > 100\n\nlist{101, 1, 2, 3}->List.some(isAbove100) // true\n\nlist{1, 2, 3, 4}->List.some(isAbove100) // false\n```"]
    }, 
    {
      "id": "RescriptCore.List.every2",
      "kind": "value",
      "name": "every2",
      "signature": "let every2: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool",
      "docstrings": ["`every2(list1, list2, f)` returns `true` if predicate `f` is `true` for all\npairs of elements up to the shorter length (i.e. `min(length(list1), length(list2))`)\n\n## Examples\n\n```rescript\nList.every2(list{1, 2, 3}, list{0, 1}, (a, b) => a > b) // true\n\nList.every2(list{}, list{1}, (a, b) => a > b) // true\n\nList.every2(list{2, 3}, list{1}, (a, b) => a > b) // true\n\nList.every2(list{0, 1}, list{5, 0}, (a, b) => a > b) // false\n```"]
    }, 
    {
      "id": "RescriptCore.List.some2",
      "kind": "value",
      "name": "some2",
      "signature": "let some2: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool",
      "docstrings": ["`some2(list1, list2, f)` returns `true` if predicate `f` is `true` for any pair\nof elements up to the shorter length (i.e. `min(length(list1), length(list2))`)\n\n## Examples\n\n```rescript\nList.some2(list{1, 2, 3}, list{0, 1}, (a, b) => a > b) // true\n\nList.some2(list{}, list{1}, (a, b) => a > b) // false\n\nList.some2(list{2, 3}, list{1}, (a, b) => a > b) // true\n\nList.some2(list{0, 1}, list{5, 0}, (a, b) => a > b) // true\n```"]
    }, 
    {
      "id": "RescriptCore.List.compareLength",
      "kind": "value",
      "name": "compareLength",
      "signature": "let compareLength: (. t<'a>, t<'a>) => Core__Ordering.t",
      "docstrings": ["`compareLength(list1, list2)` compare two lists solely by length. Returns `-1.` if\n`length(list1)` is less than `length(list2)`, `0.` if `length(list1)` equals\n`length(list2)`, and `1.` if `length(list1)` is greater than `length(list2)`.\n\n## Examples\n\n```rescript\nList.compareLength(list{1, 2}, list{3, 4, 5, 6}) // -1.\n\nList.compareLength(list{1, 2, 3}, list{4, 5, 6}) // 0.\n\nList.compareLength(list{1, 2, 3, 4}, list{5, 6}) // 1.\n```"]
    }, 
    {
      "id": "RescriptCore.List.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (.\n  t<'a>,\n  t<'a>,\n  (. 'a, 'a) => Core__Ordering.t,\n) => Core__Ordering.t",
      "docstrings": ["`compare(list1, list2, f)` compare elements one by one `f`. `f` returns a negative\nnumber if `list1` is \"less than\" `list2`, zero if `list1` is \"equal to\" `list2`,\na positive number if `list1` is \"greater than\" `list2`.\n\nThe comparison returns the first non-zero result of `f`, or zero if `f` returns\nzero for all `list1` and `list2`.\n\n- If all items have compared equal, but `list1` is exhausted first, return `-1.`. (`list1` is shorter).\n- If all items have compared equal, but `list2` is exhausted first, return `1.` (`list1` is longer).\n\n## Examples\n\n```rescript\nList.compare(list{3}, list{3, 7}, (a, b) => compare(a, b)) /* (-1.) */\n\nList.compare(list{5, 3}, list{5}, (a, b) => compare(a, b)) /* 1. */\n\nList.compare(list{1, 3, 5}, list{1, 4, 2}, (a, b) => compare(a, b)) /* (-1.) */\n\nList.compare(list{1, 3, 5}, list{1, 2, 3}, (a, b) => compare(a, b)) /* 1. */\n\nList.compare(list{1, 3, 5}, list{1, 3, 5}, (a, b) => compare(a, b)) /* 0. */\n```\n\n**Please note:** The total ordering of List is different from Array,\nfor Array, we compare the length first and, only if the lengths are equal, elements one by one.\nFor lists, we just compare elements one by one."]
    }, 
    {
      "id": "RescriptCore.List.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. t<'a>, t<'a>, (. 'a, 'a) => bool) => bool",
      "docstrings": ["`equal(list1, list2, f)` check equality of `list2` and `list2` using `f` for\nequality on elements, where `f` is a function that returns `true` if items `x` and\n`y` meet some criterion for equality, `false` otherwise. equal `false` if length\nof `list1` and `list2` are not the same.\n\n## Examples\n\n```rescript\nList.equal(list{1, 2, 3}, list{1, 2}, (a, b) => a == b) // false\n\nList.equal(list{1, 2}, list{1, 2}, (a, b) => a == b) // true\n\nList.equal(list{1, 2, 3}, list{(-1), (-2), (-3)}, (a, b) => abs(a) == abs(b)) // true\n```"]
    }, 
    {
      "id": "RescriptCore.List.has",
      "kind": "value",
      "name": "has",
      "signature": "let has: (. t<'a>, 'b, (. 'a, 'b) => bool) => bool",
      "docstrings": ["`has(list, element, f)` returns `true` if the list contains at least one\n`element` for which `f` returns `true'.\n\n## Examples\n\n```rescript\nlist{1, 2, 3}->List.has(2, (a, b) => a == b) // true\n\nlist{1, 2, 3}->List.has(4, (a, b) => a == b) // false\n\nlist{(-1), (-2), (-3)}->List.has(2, (a, b) => abs(a) == abs(b)) // true\n```"]
    }, 
    {
      "id": "RescriptCore.List.getBy",
      "kind": "value",
      "name": "getBy",
      "signature": "let getBy: (. t<'a>, (. 'a) => bool) => option<'a>",
      "docstrings": ["`getBy(list, f)` returns `Some(value)` for the first value in `list` that\nsatisfies the predicate function `f`. Returns `None` if no element satisfies\nthe function.\n\n## Examples\n\n```rescript\nList.getBy(list{1, 4, 3, 2}, x => x > 3) // Some(4)\n\nList.getBy(list{1, 4, 3, 2}, x => x > 4) // None\n```"]
    }, 
    {
      "id": "RescriptCore.List.filter",
      "kind": "value",
      "name": "filter",
      "signature": "let filter: (. t<'a>, (. 'a) => bool) => t<'a>",
      "docstrings": ["`filter(list, f)` returns a list of all elements in `list` which satisfy the\npredicate function `f`.\n\n## Examples\n\n```rescript\nlet isEven = x => mod(x, 2) == 0\n\nList.filter(list{1, 2, 3, 4}, isEven) // list{2, 4}\n\nList.filter(list{None, Some(2), Some(3), None}, Option.isSome) // list{Some(2), Some(3)}\n```"]
    }, 
    {
      "id": "RescriptCore.List.filterWithIndex",
      "kind": "value",
      "name": "filterWithIndex",
      "signature": "let filterWithIndex: (. t<'a>, (. 'a, int) => bool) => t<'a>",
      "docstrings": ["`filterWithIndex(list, f)` returns a list of all elements in `list` which\nsatisfy the predicate function `f`.\n\n## Examples\n\n```rescript\nlet isEven = x => mod(x, 2) == 0\n\nList.filterWithIndex(list{1, 2, 3, 4}, (_x, index) => isEven(index)) // list{1, 3}\n```"]
    }, 
    {
      "id": "RescriptCore.List.filterMap",
      "kind": "value",
      "name": "filterMap",
      "signature": "let filterMap: (. t<'a>, (. 'a) => option<'b>) => t<'b>",
      "docstrings": ["`filterMap(list, f)` applies `f` to each element of `list`. If `f` returns\n`Some(value)`, then `value` is _kept_ in the resulting list. If `f` returns\n`None`, the element is _not_ retained in the result.\n\n## Examples\n\n```rescript\nlet isEven = x => mod(x, 2) == 0\n\nlist{1, 2, 3, 4}\n->List.filterMap(x =>\n    if (isEven(x)) {\n      Some(x)\n    } else {\n      None\n    }\n  ) // list{2, 4}\n\nlist{Some(1), Some(2), None}->List.filterMap(x => x) // list{1, 2}\n```"]
    }, 
    {
      "id": "RescriptCore.List.partition",
      "kind": "value",
      "name": "partition",
      "signature": "let partition: (. t<'a>, (. 'a) => bool) => (t<'a>, t<'a>)",
      "docstrings": ["`partition(list, f)` creates a pair of lists; the first list consists of all\nelements of `list` that satisfy the predicate function `f`, the second list\nconsists of all elements of `list` that _do not_ satisfy `f`.\n\n## Examples\n\n```rescript\n// (elementsThatSatisfies, elementsThatDoesNotSatisfy)\n\nList.partition(list{1, 2, 3, 4}, x => x > 2) // (list{3, 4}, list{1, 2})\n```"]
    }, 
    {
      "id": "RescriptCore.List.unzip",
      "kind": "value",
      "name": "unzip",
      "signature": "let unzip: (. t<('a, 'b)>) => (t<'a>, t<'b>)",
      "docstrings": ["`unzip(list)` takes a list of pairs and creates a pair of lists. The first list\ncontains all the first items of the pairs, the second list contains all the\nsecond items.\n\n## Examples\n\n```rescript\nList.unzip(list{(1, 2), (3, 4)}) // (list{1, 3}, list{2, 4})\n\nList.unzip(list{(\"H\", \"W\"), (\"e\", \"o\"), (\"l\", \"r\"), (\"l\", \"l\"), (\"o\", \"d\"), (\" \", \"!\")})\n// (list{\"H\", \"e\", \"l\", \"l\", \"o\", \" \"}, list{\"W\", \"o\", \"r\", \"l\", \"d\", \"!\"})\n```"]
    }, 
    {
      "id": "RescriptCore.List.getAssoc",
      "kind": "value",
      "name": "getAssoc",
      "signature": "let getAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => option<'c>",
      "docstrings": ["`getAssoc(list, k, f)` return the second element of a pair in `list` where\nthe first element equals `k` as per the predicate function `f`, or `None` if\nnot found.\n\n## Examples\n\n```rescript\nlist{(1, \"a\"), (2, \"b\"), (3, \"c\")}->List.getAssoc(3, (a, b) => a == b) // Some(\"c\")\n\nlist{(9, \"morning\"), (15, \"afternoon\"), (22, \"night\")}\n->List.getAssoc(15, (k, item) => k /* 15 */ == item /* 9, 5, 22 */)\n// Some(\"afternoon\")\n```"]
    }, 
    {
      "id": "RescriptCore.List.hasAssoc",
      "kind": "value",
      "name": "hasAssoc",
      "signature": "let hasAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => bool",
      "docstrings": ["`hasAssoc(list, k, f)` returns `true` if there is a pair in `list` where the\nfirst element equals `k` as per the predicate function `f`.\n\n## Examples\n\n```rescript\nlist{(1, \"a\"), (2, \"b\"), (3, \"c\")}->List.hasAssoc(1, (a, b) => a == b) // true\n\nlist{(9, \"morning\"), (15, \"afternoon\"), (22, \"night\")}\n->List.hasAssoc(25, (k, item) => k /* 25 */ == item /* 9, 5, 22 */) // false\n```"]
    }, 
    {
      "id": "RescriptCore.List.removeAssoc",
      "kind": "value",
      "name": "removeAssoc",
      "signature": "let removeAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => t<('a, 'c)>",
      "docstrings": ["`removeAssoc(list, k, f)` return a list after removing the first pair whose\nfirst value is `k` per the equality predicate `f`, if not found, return a new\nlist identical to `list`.\n\n## Examples\n\n```rescript\nlist{(1, \"a\"), (2, \"b\"), (3, \"c\")}->List.removeAssoc(1, (a, b) => a == b) // list{(2, \"b\"), (3, \"c\")}\n\nlist{(9, \"morning\"), (15, \"afternoon\"), (22, \"night\")}\n->List.removeAssoc(9, (k, item) => k /* 9 */ == item /* 9, 5, 22 */)\n// list{(15, \"afternoon\"), (22, \"night\")}\n```"]
    }, 
    {
      "id": "RescriptCore.List.setAssoc",
      "kind": "value",
      "name": "setAssoc",
      "signature": "let setAssoc: (. t<('a, 'c)>, 'a, 'c, (. 'a, 'a) => bool) => t<('a, 'c)>",
      "docstrings": ["`setAssoc(list, k, v, f)`. If `k` exists in `list` by satisfying the `f`\npredicate, return a new list with the key and value replaced by the new `k` and\n`v`, otherwise, return a new list with the pair `k`, `v` added to the head of\n`list`.\n\n## Examples\n\n```rescript\nlist{(1, \"a\"), (2, \"b\"), (3, \"c\")}->List.setAssoc(2, \"x\", (a, b) => a == b) // list{(1, \"a\"), (2, \"x\"), (3, \"c\")}\n\nlist{(1, \"a\"), (3, \"c\")}->List.setAssoc(2, \"b\", (a, b) => a == b) // list{(2, \"b\"), (1, \"a\"), (3, \"c\")}\n\nlist{(9, \"morning\"), (3, \"morning?!\"), (22, \"night\")}\n->List.setAssoc(15, \"afternoon\", (a, b) => mod(a, 12) == mod(b, 12))\n// list{(9, \"morning\"), (15, \"afternoon\"), (22, \"night\")}\n```\n\n**Please note**: In the last example, since: `15 mod 12` equals `3 mod 12`. Both\nthe key _and_ the value are replaced in the list."]
    }, 
    {
      "id": "RescriptCore.List.sort",
      "kind": "value",
      "name": "sort",
      "signature": "let sort: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => t<'a>",
      "docstrings": ["`sort(list, f)` returns a sorted list.\n\n## Examples\n\n```rescript\nList.sort(list{5, 4, 9, 3, 7}, Int.compare) // list{3, 4, 5, 7, 9}\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.Result",
    "kind": "moduleAlias",
    "name": "Result",
    "docstrings": [],
    "items": [
    {
      "id": "RescriptCore.Result.t",
      "kind": "type",
      "name": "t",
      "signature": "type t<'a, 'b> = result<'a, 'b> = Ok('a) | Error('b)",
      "docstrings": ["Result types are really useful to describe the result of a certain operation\n  without relying on exceptions or `option` types.\n\n  This module gives you useful utilities to create and combine `Result` data."],
      "detail": 
      {
        "kind": "variant",
        "items": [
        {
          "name": "Ok",
          "docstrings": [],
          "signature": "Ok('a)"
        }, 
        {
          "name": "Error",
          "docstrings": [],
          "signature": "Error('b)"
        }]
      }
    }, 
    {
      "id": "RescriptCore.Result.getExn",
      "kind": "value",
      "name": "getExn",
      "signature": "let getExn: (. t<'a, 'b>) => 'a",
      "docstrings": ["`getExn(res)`: when `res` is `Ok(n)`, returns `n` when `res` is `Error(m)`, raise an exception\n\n  ```res example\n  Result.getExn(Result.Ok(42)) == 42\n\n  Result.getExn(Result.Error(\"Invalid data\")) /* raises exception */\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.mapOr",
      "kind": "value",
      "name": "mapOr",
      "signature": "let mapOr: (. t<'a, 'c>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": ["`mapOr(res, default, f)`: When res is `Ok(n)`, returns `f(n)`,\n  otherwise `default`.\n\n  ```res example\n  let ok = Result.Ok(42)\n  Result.mapOr(ok, 0, (x) => x / 2) == 21\n\n  let error = Result.Error(\"Invalid data\")\n  Result.mapOr(error, 0, (x) => x / 2) == 0\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.mapWithDefault",
      "kind": "value",
      "name": "mapWithDefault",
      "deprecated": "Use mapOr instead",
      "signature": "let mapWithDefault: (. t<'a, 'c>, 'b, (. 'a) => 'b) => 'b",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Result.map",
      "kind": "value",
      "name": "map",
      "signature": "let map: (. t<'a, 'c>, (. 'a) => 'b) => t<'b, 'c>",
      "docstrings": ["`map(res, f)`: When res is `Ok(n)`, returns `Ok(f(n))`. Otherwise returns res\n  unchanged. Function `f` takes a value of the same type as `n` and returns an\n  ordinary value.\n\n  ```res example\n  let f = (x) => sqrt(Int.toFloat(x))\n\n  Result.map(Ok(64), f) == Ok(8.0)\n\n  Result.map(Error(\"Invalid data\"), f) == Error(\"Invalid data\")\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.flatMap",
      "kind": "value",
      "name": "flatMap",
      "signature": "let flatMap: (. t<'a, 'c>, (. 'a) => t<'b, 'c>) => t<'b, 'c>",
      "docstrings": ["`flatMap(res, f)`: When res is `Ok(n)`, returns `f(n)`. Otherwise, returns res\n  unchanged. Function `f` takes a value of the same type as `n` and returns a\n  `Result`.\n\n  ```res example\n  let recip = (x) =>\n    if (x !== 0.0) {\n      Result.Ok(1.0 /. x)\n    } else {\n      Result.Error(\"Divide by zero\")\n    }\n\n  Result.flatMap(Ok(2.0), recip) == Ok(0.5)\n\n  Result.flatMap(Ok(0.0), recip) == Error(\"Divide by zero\")\n\n  Result.flatMap(Error(\"Already bad\"), recip) == Error(\"Already bad\")\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.getOr",
      "kind": "value",
      "name": "getOr",
      "signature": "let getOr: (. t<'a, 'b>, 'a) => 'a",
      "docstrings": ["`getOr(res, defaultValue)`: If `res` is `Ok(n)`, returns `n`,\n  otherwise `default`\n\n  ```res example\n  Result.getOr(Ok(42), 0) == 42\n\n  Result.getOr(Error(\"Invalid Data\"), 0) == 0\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.getWithDefault",
      "kind": "value",
      "name": "getWithDefault",
      "deprecated": "Use getOr instead",
      "signature": "let getWithDefault: (. t<'a, 'b>, 'a) => 'a",
      "docstrings": []
    }, 
    {
      "id": "RescriptCore.Result.isOk",
      "kind": "value",
      "name": "isOk",
      "signature": "let isOk: (. t<'a, 'b>) => bool",
      "docstrings": ["`isOk(res)`: Returns `true` if `res` is of the form `Ok(n)`, `false` if it is\n  the `Error(e)` variant."]
    }, 
    {
      "id": "RescriptCore.Result.isError",
      "kind": "value",
      "name": "isError",
      "signature": "let isError: (. t<'a, 'b>) => bool",
      "docstrings": ["`isError(res)`: Returns `true` if `res` is of the form `Error(e)`, `false` if\n  it is the `Ok(n)` variant."]
    }, 
    {
      "id": "RescriptCore.Result.equal",
      "kind": "value",
      "name": "equal",
      "signature": "let equal: (. t<'a, 'c>, t<'b, 'd>, (. 'a, 'b) => bool) => bool",
      "docstrings": ["`equal(res1, res2, f)`: Determine if two `Result` variables are equal with\n  respect to an equality function. If `res1` and `res2` are of the form `Ok(n)`\n  and `Ok(m)`, return the result of `f(n, m)`. If one of `res1` and `res2` are of\n  the form `Error(e)`, return false If both `res1` and `res2` are of the form\n  `Error(e)`, return true\n\n  ```res example\n  let good1 = Result.Ok(42)\n\n  let good2 = Result.Ok(32)\n\n  let bad1 = Result.Error(\"invalid\")\n\n  let bad2 = Result.Error(\"really invalid\")\n\n  let mod10equal = (a, b) => mod(a, 10) === mod(b, 10)\n\n  Result.equal(good1, good2, mod10equal) == true\n\n  Result.equal(good1, bad1, mod10equal) == false\n\n  Result.equal(bad2, good2, mod10equal) == false\n\n  Result.equal(bad1, bad2, mod10equal) == true\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.compare",
      "kind": "value",
      "name": "compare",
      "signature": "let compare: (.\n  t<'a, 'c>,\n  t<'b, 'd>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t",
      "docstrings": ["`compare(res1, res2, f)`: Compare two `Result` variables with respect to a\n  comparison function. The comparison function returns -1. if the first variable\n  is \"less than\" the second, 0. if the two variables are equal, and 1. if the first\n  is \"greater than\" the second.\n\n  If `res1` and `res2` are of the form `Ok(n)` and `Ok(m)`, return the result of\n  `f(n, m)`. If `res1` is of the form `Error(e)` and `res2` of the form `Ok(n)`,\n  return -1. (nothing is less than something) If `res1` is of the form `Ok(n)` and\n  `res2` of the form `Error(e)`, return 1. (something is greater than nothing) If\n  both `res1` and `res2` are of the form `Error(e)`, return 0. (equal)\n\n  ```res example\n  let good1 = Result.Ok(59)\n\n  let good2 = Result.Ok(37)\n\n  let bad1 = Result.Error(\"invalid\")\n\n  let bad2 = Result.Error(\"really invalid\")\n\n  let mod10cmp = (a, b) => Pervasives.compare(mod(a, 10), mod(b, 10))\n\n  Result.compare(Ok(39), Ok(57), mod10cmp) == 1.\n\n  Result.compare(Ok(57), Ok(39), mod10cmp) == (-1.)\n\n  Result.compare(Ok(39), Error(\"y\"), mod10cmp) == 1.\n\n  Result.compare(Error(\"x\"), Ok(57), mod10cmp) == (-1.)\n\n  Result.compare(Error(\"x\"), Error(\"y\"), mod10cmp) == 0.\n  ```"]
    }, 
    {
      "id": "RescriptCore.Result.forEach",
      "kind": "value",
      "name": "forEach",
      "signature": "let forEach: (. t<'a, 'b>, (. 'a) => unit) => unit",
      "docstrings": ["`forEach(res, f)` runs the provided function `f` on the `Ok` value. If `res` is `Error`, nothing happens.\n\n## Examples\n\n```rescript\nResult.forEach(Ok(3), Console.log) // Logs \"3\", returns ()\nResult.forEach(Error(\"x\"), Console.log) // Does nothing, returns ()\n```"]
    }, 
    {
      "id": "RescriptCore.Result.mapError",
      "kind": "value",
      "name": "mapError",
      "signature": "let mapError: (. result<'a, 'b>, (. 'b) => 'c) => result<'a, 'c>",
      "docstrings": ["`mapError(r, f)` generates a new `result` by applying the function `f` to the `Error` value. If the source is `Ok`, return it as-is.\n\n## Examples\n\n```rescript\nlet format = n => `Error code: ${n->Int.toString}`\nmapError(Error(14), format) // Error(\"Error code: 14\")\nmapError(Ok(\"abc\"), format) // Ok(\"abc\")\n```"]
    }]
  }, 
  {
    "id": "RescriptCore.null",
    "kind": "type",
    "name": "null",
    "signature": "type null<'a> = Js.null<'a>",
    "docstrings": [],
    "detail": 
    {
      "kind": "variant",
      "items": [
      {
        "name": "Value",
        "docstrings": [],
        "signature": "Value('a)"
      }, 
      {
        "name": "Null",
        "docstrings": [],
        "signature": "Null"
      }]
    }
  }, 
  {
    "id": "RescriptCore.undefined",
    "kind": "type",
    "name": "undefined",
    "signature": "type undefined<'a> = Js.undefined<'a>",
    "docstrings": []
  }, 
  {
    "id": "RescriptCore.nullable",
    "kind": "type",
    "name": "nullable",
    "signature": "type nullable<'a> = Js.nullable<'a>",
    "docstrings": [],
    "detail": 
    {
      "kind": "variant",
      "items": [
      {
        "name": "Value",
        "docstrings": [],
        "signature": "Value('a)"
      }, 
      {
        "name": "Null",
        "docstrings": [],
        "signature": "Null"
      }, 
      {
        "name": "Undefined",
        "docstrings": [],
        "signature": "Undefined"
      }]
    }
  }, 
  {
    "id": "RescriptCore.panic",
    "kind": "value",
    "name": "panic",
    "signature": "let panic: (. string) => 'a",
    "docstrings": []
  }]
}

```

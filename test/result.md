
> rescript-tools-doc-md@0.0.0 test
> node ./test/Test.res.js

# RescriptCore

### type RescriptCore.timeoutId

> type timeoutId = Js.Global.timeoutId

An `id` representing a timeout started via `setTimeout`.

See [`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout) on MDN.

### let RescriptCore.setTimeout

> let setTimeout: (. (. unit) => unit, int) => timeoutId

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

> let setTimeoutFloat: (. (. unit) => unit, float) => timeoutId

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

> let clearTimeout: (. timeoutId) => unit

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

> type intervalId = Js.Global.intervalId

An `id` representing an interval started via `setInterval`.

See [`setInterval`](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.

### let RescriptCore.setInterval

> let setInterval: (. (. unit) => unit, int) => intervalId

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

> let setIntervalFloat: (. (. unit) => unit, float) => intervalId

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

> let clearInterval: (. intervalId) => unit

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

> let encodeURI: (. string) => string

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

> let decodeURI: (. string) => string

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

> let encodeURIComponent: (. string) => string

Encodes a string so it can be used as part of a URI.

See [`encodeURIComponent`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) on MDN.

#### Examples
```rescript
Console.log(encodeURIComponent("array=[someValue]"))
// Logs "array%3D%5BsomeValue%5D" to the console.
```

### let RescriptCore.decodeURIComponent

> let decodeURIComponent: (. string) => string

Decodes a previously URI encoded string back to its original form.

See [`decodeURIComponent`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURIComponent) on MDN.

#### Examples
```rescript
Console.log(decodeURIComponent("array%3D%5BsomeValue%5D"))
// Logs "array=[someValue]" to the console.
```

## module RescriptCore.Array `alias`

### let RescriptCore.Array.fromArrayLike

> let fromArrayLike: (. Js.Array2.array_like<'a>) => array<'a>

### let RescriptCore.Array.fromArrayLikeWithMap

> let fromArrayLikeWithMap: (. Js.Array2.array_like<'a>, (. 'a) => 'b) => array<'b>

### let RescriptCore.Array.make

> let make: (. ~length: int, 'a) => array<'a>

`make(~length, init)`

Creates an array of length `length` initialized with the value of `init`.

```res example
Array.make(~length=3, #apple) == [#apple, #apple, #apple]
```

### let RescriptCore.Array.fromInitializer

> let fromInitializer: (. ~length: int, (. int) => 'a) => array<'a>

`fromInitializer(~length, f)`

Creates an array of length `length` initialized with the value returned from `f ` for each index.

```res example
Array.make(~length=3, i => i + 3) == [3, 4, 5]
```

### let RescriptCore.Array.equal

> let equal: (. array<'a>, array<'a>, (. 'a, 'a) => bool) => bool

### let RescriptCore.Array.compare

> let compare: (.\n  array<'a>,\n  array<'a>,\n  (. 'a, 'a) => Core__Ordering.t,\n) => Core__Ordering.t

### let RescriptCore.Array.isArray

> let isArray: (. 'a) => bool

### let RescriptCore.Array.length

> let length: (. array<'a>) => int

`length(array)` returns the length of (i.e. number of items in) the array.

See [`Array.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) on MDN.

#### Examples
```rescript
let someArray = ["hi", "hello"]

Console.log(someArray->Array.length) // 2
```

### let RescriptCore.Array.copyAllWithin

> let copyAllWithin: (. array<'a>, ~target: int) => array<'a>

### let RescriptCore.Array.copyWithinToEnd

> let copyWithinToEnd: (. array<'a>, ~target: int, ~start: int) => array<'a>

### let RescriptCore.Array.copyWithin

> let copyWithin: (.\n  array<'a>,\n  ~target: int,\n  ~start: int,\n  ~end: int,\n) => array<'a>

### let RescriptCore.Array.fillAll

> let fillAll: (. array<'a>, 'a) => unit

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

> let fillToEnd: (. array<'a>, 'a, ~start: int) => unit

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

> let fill: (. array<'a>, 'a, ~start: int, ~end: int) => unit

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

> let pop: (. array<'a>) => option<'a>

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

> let push: (. array<'a>, 'a) => unit

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

> let pushMany: (. array<'a>, array<'a>) => unit

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

> let reverse: (. array<'a>) => unit

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

> let shift: (. array<'a>) => option<'a>

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

> let toSorted: (. array<'a>, (. 'a, 'a) => Core__Ordering.t) => array<'a>

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

> let sort: (. array<'a>, (. 'a, 'a) => Core__Ordering.t) => unit

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

> let splice: (.\n  array<'a>,\n  ~start: int,\n  ~remove: int,\n  ~insert: array<'a>,\n) => unit

### let RescriptCore.Array.toSpliced

> let toSpliced: (.\n  array<'a>,\n  ~start: int,\n  ~remove: int,\n  ~insert: array<'a>,\n) => array<'a>

### let RescriptCore.Array.with

> let with: (. array<'a>, int, 'a) => array<'a>

### let RescriptCore.Array.unshift

> let unshift: (. array<'a>, 'a) => unit

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

> let unshiftMany: (. array<'a>, array<'a>) => unit

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

> let concat: (. array<'a>, array<'a>) => array<'a>

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

> let concatMany: (. array<'a>, array<array<'a>>) => array<'a>

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

> let flat: (. array<array<'a>>) => array<'a>

`flat(arrays)` concatenates an array of arrays into a single array.

See [`Array.flat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) on MDN.

#### Examples
```rescript
Console.log([[1], [2], [3, 4]]->Array.flat) // [1, 2, 3, 4]
```

### let RescriptCore.Array.includes

> let includes: (. array<'a>, 'a) => bool

`includes(array, item)` checks whether `array` includes `item`, by doing a [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).

See [`Array.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) on MDN.

#### Examples
```rescript
Console.log([1, 2]->Array.includes(1)) // true
Console.log([1, 2]->Array.includes(3)) // false
Console.log([{"language": "ReScript"}]->Array.includes({"language": "ReScript"})) // false, because of strict equality
```

### let RescriptCore.Array.indexOf

> let indexOf: (. array<'a>, 'a) => int

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

> let indexOfOpt: (. array<'a>, 'a) => option<int>

`indexOfOpt(array, item)` returns an option of the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

#### Examples
```rescript
Console.log([1, 2]->Array.indexOfOpt(2)) // Some(1)
Console.log([1, 2]->Array.indexOfOpt(3)) // None
Console.log([{"language": "ReScript"}]->Array.indexOfOpt({"language": "ReScript"})) // None, because of strict equality
```

### let RescriptCore.Array.indexOfFrom

> let indexOfFrom: (. array<'a>, 'a, int) => int

### let RescriptCore.Array.joinWith

> let joinWith: (. array<string>, string) => string

`joinWith(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Array items must be strings, to join number or other arrays, use `joinWithUnsafe`. Under the hood this will run JavaScript's `toString` on all the array items.

#### Examples
```rescript
let array = ["One", "Two", "Three"]

Console.log(array->Array.joinWith(" -- ")) // One -- Two -- Three
```

### let RescriptCore.Array.joinWithUnsafe

> let joinWithUnsafe: (. array<'a>, string) => string

`joinWithUnsafe(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Under the hood this will run JavaScript's `toString` on all the array items.

#### Examples
```rescript
let array = [1, 2, 3]

Console.log(array->Array.joinWithUnsafe(" -- ")) // 1 -- 2 -- 3
```

### let RescriptCore.Array.lastIndexOf

> let lastIndexOf: (. array<'a>, 'a) => int

### let RescriptCore.Array.lastIndexOfOpt

> let lastIndexOfOpt: (. array<'a>, 'a) => option<int>

### let RescriptCore.Array.lastIndexOfFrom

> let lastIndexOfFrom: (. array<'a>, 'a, int) => int

### let RescriptCore.Array.slice

> let slice: (. array<'a>, ~start: int, ~end: int) => array<'a>

`slice(array, ~start, ~end)` creates a new array of items copied from `array` from `start` until (but not including) `end`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.slice(~start=1, ~end=3)) // [2, 3]
```

### let RescriptCore.Array.sliceToEnd

> let sliceToEnd: (. array<'a>, ~start: int) => array<'a>

`sliceToEnd(array, start)` creates a new array from `array`, with all items from `array` starting from `start`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

#### Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.sliceToEnd(~start=1)) // [2, 3, 4]
```

### let RescriptCore.Array.copy

> let copy: (. array<'a>) => array<'a>

`copy(array)` makes a copy of the array with the items in it, but does not make copies of the items themselves.

#### Examples
```rescript
let myArray = [1, 2, 3]
let copyOfMyArray = myArray->Array.copy

Console.log(copyOfMyArray) // [1, 2, 3]
Console.log(myArray === copyOfMyArray) // false
```

### let RescriptCore.Array.toString

> let toString: (. array<'a>) => string

`toString(array)` stringifies `array` by running `toString` on all of the array elements and joining them with ",".

See [`Array.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.toString) // "1,2,3,4"
```

### let RescriptCore.Array.toLocaleString

> let toLocaleString: (. array<'a>) => string

### let RescriptCore.Array.every

> let every: (. array<'a>, (. 'a) => bool) => bool

`every(array, predicate)` returns true if `predicate` returns true for all items in `array`.

See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.every(num => num > 4)) // true
Console.log(array->Array.every(num => num === 1)) // false
```

### let RescriptCore.Array.everyWithIndex

> let everyWithIndex: (. array<'a>, (. 'a, int) => bool) => bool

`everyWithIndex(array, checker)` returns true if all items in `array` returns true when running the provided `checker` function.

See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.everyWithIndex((num, index) => index < 2 && num <= 2)) // true
Console.log(array->Array.everyWithIndex((num, index) => index < 2 && num >= 2)) // false
```

### let RescriptCore.Array.filter

> let filter: (. array<'a>, (. 'a) => bool) => array<'a>

`filter(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.

See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.filter(num => num > 2)) // [3, 4]
```

### let RescriptCore.Array.filterWithIndex

> let filterWithIndex: (. array<'a>, (. 'a, int) => bool) => array<'a>

`filterWithIndex(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.

See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

#### Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.filterWithIndex((num, index) => index === 0 || num === 2)) // [1, 2]
```

### let RescriptCore.Array.find

> let find: (. array<'a>, (. 'a) => bool) => option<'a>

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

> let findWithIndex: (. array<'a>, (. 'a, int) => bool) => option<'a>

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

> let findIndex: (. array<'a>, (. 'a) => bool) => int

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

> let findIndexWithIndex: (. array<'a>, (. 'a, int) => bool) => int

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

> let forEach: (. array<'a>, (. 'a) => unit) => unit

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

> let forEachWithIndex: (. array<'a>, (. 'a, int) => unit) => unit

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

> let map: (. array<'a>, (. 'a) => 'b) => array<'b>

`map(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.

See [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let mappedArray = array->Array.map(greeting => greeting ++ " to you")

Console.log(mappedArray) // ["Hello to you", "Hi to you", "Good bye to you"]
```

### let RescriptCore.Array.mapWithIndex

> let mapWithIndex: (. array<'a>, (. 'a, int) => 'b) => array<'b>

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

> let reduce: (. array<'a>, 'b, (. 'b, 'a) => 'b) => 'b

`reduce(xs, f, init)`

Applies `f` to each element of `xs` from beginning to end. Function `f` has two parameters: the item from the list and an “accumulator”; which starts with a value of `init`. `reduce` returns the final value of the accumulator.

```res example
Array.reduce([2, 3, 4], (a, b) => a + b, 1) == 10

Array.reduce(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "abcd"
```

### let RescriptCore.Array.reduceWithIndex

> let reduceWithIndex: (. array<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b

`reduceWithIndex(xs, f, init)`

Applies `f` to each element of `xs` from beginning to end. Function `f` has three parameters: the item from the array and an “accumulator”, which starts with a value of `init` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.

```res example
Array.reduceWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16
```

### let RescriptCore.Array.reduceRight

> let reduceRight: (. array<'a>, 'b, (. 'b, 'a) => 'b) => 'b

`reduceRight(xs, f, init)`

Works like `Array.reduce`; except that function `f` is applied to each item of `xs` from the last back to the first.

```res example
Array.reduceRight(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "dcba"
```

### let RescriptCore.Array.reduceRightWithIndex

> let reduceRightWithIndex: (. array<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b

`reduceRightWithIndex(xs, f, init)`

Like `reduceRight`, but with an additional index argument on the callback function.

```res example
Array.reduceRightWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16
```

### let RescriptCore.Array.some

> let some: (. array<'a>, (. 'a) => bool) => bool

`some(array, predicate)` returns true if `predicate` returns true for any element in `array`.

See [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.some(greeting => greeting === "Hello")) // true
```

### let RescriptCore.Array.someWithIndex

> let someWithIndex: (. array<'a>, (. 'a, int) => bool) => bool

`someWithIndex(array, checker)` returns true if running the provided `checker` function on any element in `array` returns true.

See [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.someWithIndex((greeting, index) => greeting === "Hello" && index === 0)) // true
```

### let RescriptCore.Array.get

> let get: (. array<'a>, int) => option<'a>

`get(array, index)` returns the element at `index` of `array`.

Returns `None` if the index does not exist in the array. Equivalent to doing `array[index]` in JavaScript.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.get(0) == Some("Hello") // true
```

### let RescriptCore.Array.set

> let set: (. array<'a>, int, 'a) => unit

`set(array, index, item)` sets the provided `item` at `index` of `array`.

Beware this will *mutate* the array.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
array->Array.set(1, "Hello")

Console.log(array[1]) // "Hello"
```

### let RescriptCore.Array.getSymbol

> let getSymbol: (. array<'a>, Core__Symbol.t) => option<'b>

### let RescriptCore.Array.getSymbolUnsafe

> let getSymbolUnsafe: (. array<'a>, Core__Symbol.t) => 'b

### let RescriptCore.Array.setSymbol

> let setSymbol: (. array<'a>, Core__Symbol.t, 'b) => unit

### let RescriptCore.Array.getUnsafe

> let getUnsafe: (. array<'a>, int) => 'a

`getUnsafe(array, index)` returns the element at `index` of `array`.

This is _unsafe_, meaning it will fail with an exception if `index` does not exist in `array`.

#### Exceptions

- `Not_found`: If the provided `index` does not exist in `array`.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.getUnsafe(0)) // "Hello"
Console.log(array->Array.getUnsafe(3)) // Fails and raises exception
```

### let RescriptCore.Array.setUnsafe

> let setUnsafe: (. array<'a>, int, 'a) => unit

`setUnsafe(array, index, item)` sets the provided `item` at `index` of `array`.

Beware this will *mutate* the array, and is *unsafe*.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
array->Array.setUnsafe(1, "Hello")

Console.log(array[1]) // "Hello"
```

### let RescriptCore.Array.findIndexOpt

> let findIndexOpt: (. array<'a>, (. 'a) => bool) => option<int>

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

> let toReversed: (. array<'a>) => array<'a>

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

> let filterMap: (. array<'a>, (. 'a) => option<'b>) => array<'b>

`get(array, index)` returns the element at `index` of `array`.

Returns `None` if the index does not exist in the array. Equivalent to doing `array[index]` in JavaScript.

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
)
// [5]
```

### let RescriptCore.Array.keepSome

> let keepSome: (. array<option<'a>>) => array<'a>

`keepSome(arr)`

Returns a new array containing `value` for all elements that are `Some(value)`
and ignoring every value that is `None`

```res example
Array.keepSome([Some(1), None, Some(3)]) == [1, 3]
```

### let RescriptCore.Array.toShuffled

> let toShuffled: (. array<'a>) => array<'a>

`toShuffled(array)` returns a new array with all items in `array` in a random order.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let shuffledArray = array->Array.toShuffled

Console.log(shuffledArray)
```

### let RescriptCore.Array.shuffle

> let shuffle: (. array<'a>) => unit

`shuffle(array)` randomizes the position of all items in `array`.

Beware this will *mutate* the array.

#### Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
array->Array.shuffle

Console.log(array)
```

### let RescriptCore.Array.flatMap

> let flatMap: (. array<'a>, (. 'a) => array<'b>) => array<'b>

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

> let findMap: (. array<'a>, (. 'a) => option<'b>) => option<'b>

`findMap(arr, f)`

Calls `f` for each element and returns the first value from `f` that is `Some(_)`.
Otherwise returns `None`

```res example
Array.findMap([1, 2, 3], n => mod(n, 2) ? Some(n - 2) : None) == 0
```

### let RescriptCore.Array.at

> let at: (. array<'a>, int) => option<'a>

`at(array, index)`

Get an element by its index. Negative indices count backwards from the last item.

#### Examples
```rescript
["a", "b", "c"]->Array.at(0) // Some("a")
["a", "b", "c"]->Array.at(2) // Some("c")
["a", "b", "c"]->Array.at(3) // None
["a", "b", "c"]->Array.at(-1) // Some("c")
["a", "b", "c"]->Array.at(-3) // Some("a")
["a", "b", "c"]->Array.at(-4) // None
```

## module RescriptCore.Console `alias`

### let RescriptCore.Console.assert_

> let assert_: (. bool, 'a) => unit

`assert_(assertion, value)` print a message to console if `assertion` evaluates `false`. Does nothing if it's `true`.

See [`console.assert`](https://developer.mozilla.org/en-US/docs/Web/API/console/assert)
on MDN.

#### Examples

```rescript
Console.assert_(false, "Hello World!")
Console.assert_(n == 42, "The answer")
```

### let RescriptCore.Console.assert2

> let assert2: (. bool, 'a, 'b) => unit

`assert2(v1, v2)`. Like `assert_`, but with two arguments.

#### Examples

```rescript
Console.assert2(false, "Hello", "World")
Console.assert2(n == 42, [1, 2, 3], '4')
```

### let RescriptCore.Console.assert3

> let assert3: (. bool, 'a, 'b, 'c) => unit

`assert3(v1, v2, v3)`. Like `assert_`, but with three arguments.

#### Examples

```rescript
Console.assert3(false, "Hello", "World", "ReScript")
Console.assert3(n == 42, "One", 2, #3)
```

### let RescriptCore.Console.assert4

> let assert4: (. bool, 'a, 'b, 'c, 'd) => unit

`assert4(v1, v2, v3, v4)`. Like `assert_`, but with four arguments.

#### Examples

```rescript
Console.assert4(false, "Hello", "World", "ReScript", "!!!")
Console.assert4(m == 42, [1, 2], (3, 4), [#5, #6], #"polyvar")
```

### let RescriptCore.Console.assert5

> let assert5: (. bool, 'a, 'b, 'c, 'd, 'e) => unit

`assert5(v1, v2, v3, v4, v5)`. Like `assert_`, but with five arguments.

#### Examples

```rescript
Console.assert5(false, "Hello", "World", "JS", '!', '!')
Console.assert5(n == 42, [1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.assert6

> let assert6: (. bool, 'a, 'b, 'c, 'd, 'e, 'f) => unit

`assert6(v1, v2)`. Like `assert_`, but with six arguments.

#### Examples

```rescript
Console.assert6(false, "Hello", "World", "JS", '!', '!', '?')
Console.assert6(n == 42, [1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.assertMany

> let assertMany: (. bool, array<'a>) => unit

`assertMany(assertion, arr)`. Like `assert_`, but variadic.

#### Examples

```rescript
Console.assertMany(false, ["Hello", "World"])
Console.assertMany(n == 42, [1, 2, 3])
```

### let RescriptCore.Console.clear

> let clear: (. unit) => unit

`clear()` clears the console, if allowed.

See [`console.clear`](https://developer.mozilla.org/en-US/docs/Web/API/console/clear)
on MDN.

#### Examples

```rescript
Console.clear()
```

### let RescriptCore.Console.count

> let count: (. string) => unit

`count(label)` prints to the console the number of times it's been called with the given label.

See [`console.count`](https://developer.mozilla.org/en-US/docs/Web/API/console/count)
on MDN.

#### Examples

```rescript
Console.count("rescript")
```

### let RescriptCore.Console.countReset

> let countReset: (. string) => unit

`countReset(label)` resets the count for the given label to 0.

See [`console.countReset`](https://developer.mozilla.org/en-US/docs/Web/API/console/countReset)
on MDN.

#### Examples

```rescript
Console.countReset("rescript")
```

### let RescriptCore.Console.debug

> let debug: (. 'a) => unit

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

> let debug2: (. 'a, 'b) => unit

`debug2(v1, v2)`. Like `debug`, but with two arguments.

#### Examples

```rescript
Console.debug2("Hello", "World")
Console.debug2([1, 2, 3], '4')
```

### let RescriptCore.Console.debug3

> let debug3: (. 'a, 'b, 'c) => unit

`debug3(v1, v2, v3)`. Like `debug`, but with three arguments.

#### Examples

```rescript
Console.debug3("Hello", "World", "ReScript")
Console.debug3("One", 2, #3)
```

### let RescriptCore.Console.debug4

> let debug4: (. 'a, 'b, 'c, 'd) => unit

`debug4(v1, v2, v3, v4)`. Like `debug`, but with four arguments.

#### Examples

```rescript
Console.debug4("Hello", "World", "ReScript", "!!!")
Console.debug4([1, 2], (3, 4), [#5, #6], #"polyvar")
```

### let RescriptCore.Console.debug5

> let debug5: (. 'a, 'b, 'c, 'd, 'e) => unit

`debug5(v1, v2, v3, v4, v5)`. Like `debug`, but with five arguments.

#### Examples

```rescript
Console.debug5("Hello", "World", "JS", '!', '!')
Console.debug5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.debug6

> let debug6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit

`debug6(v1, v2, v3, v4, v5, v6)`. Like `debug`, but with six arguments.

#### Examples

```rescript
Console.debug6("Hello", "World", "JS", '!', '!', '?')
Console.debug6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.debugMany

> let debugMany: (. array<'a>) => unit

`debugMany(arr)`. Like `debug`, but variadic.

#### Examples

```rescript
Console.debugMany(["Hello", "World"])
Console.debugMany([1, 2, 3])
```

### let RescriptCore.Console.dir

> let dir: (. 'a) => unit

`dir(object)` displays an interactive view of the object in the console.

See [`console.dir`](https://developer.mozilla.org/en-US/docs/Web/API/console/dir)
on MDN.

#### Examples

```rescript
Console.dir({"language": "rescript", "version": 10.1.2})
```

### let RescriptCore.Console.dirxml

> let dirxml: (. 'a) => unit

`dirxml(object)` displays an interactive tree view of an XML/HTML element in the console.

See [`console.dirxml`](https://developer.mozilla.org/en-US/docs/Web/API/console/dirxml)
on MDN.

### let RescriptCore.Console.error

> let error: (. 'a) => unit

`error(value)` prints an error message to console.

See [`console.error`](https://developer.mozilla.org/en-US/docs/Web/API/console/error)
on MDN.

#### Examples

```rescript
Console.error("error message")
Console.error(("error", "invalid value"))
```

### let RescriptCore.Console.error2

> let error2: (. 'a, 'b) => unit

`error(v1, v2)`. Like `error`, but two arguments.

#### Examples

```rescript
Console.error2("Error", "here")
Console.error2(("log", "error"), "message")
```

### let RescriptCore.Console.error3

> let error3: (. 'a, 'b, 'c) => unit

`error3(v1, v2, v3)`. Like `error`, but three arguments.

#### Examples

```rescript
Console.error3("Hello", "World", "!!!")
Console.error3(#first, #second, #third)
```

### let RescriptCore.Console.error4

> let error4: (. 'a, 'b, 'c, 'd) => unit

`error4(v1, v2, v3, v4)`. Like `error`, but with four arguments.

#### Examples

```rescript
Console.error4("Hello", "World", "ReScript", '!')
Console.error4(#first, #second, #third, ("fourth"))
```

### let RescriptCore.Console.error5

> let error5: (. 'a, 'b, 'c, 'd, 'e) => unit

`error5(v1, v2, v3, v4, v5)`. Like `error`, but with five arguments.

#### Examples

```rescript
Console.error5('e', 'r, 'r', 'o', 'r')
Console.error5(1, #second, #third, ("fourth"), 'c')
```

### let RescriptCore.Console.error6

> let error6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit

`error6(v1, v2, v3, v4, v5, v6)`. Like `error`, but with six arguments.

#### Examples

```rescript
Console.error6("Hello", "World", "from", "JS", "!!!", '!')
Console.error6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.group

> let group: (. string) => unit

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

> let groupCollapsed: (. string) => unit

`groupCollapsed(label)`. Like `group` but collapses the group initially.

See [`console.groupCollapsed`](https://developer.mozilla.org/en-US/docs/Web/API/console/groupCollapsed)
on MDN.

### let RescriptCore.Console.groupEnd

> let groupEnd: (. unit) => unit

`groupEnd()` ends the current group.

See [`console.groupEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/groupEnd)
on MDN.

### let RescriptCore.Console.errorMany

> let errorMany: (. array<'a>) => unit

`errorMany(arr)`. Like `error`, but variadic.

#### Examples

```rescript
Console.errorMany(["Hello", "World"])
Console.errorMany([1, 2, 3])
```

### let RescriptCore.Console.info

> let info: (. 'a) => unit

`info(value)` print an informational message to console.

See [`console.info`](https://developer.mozilla.org/en-US/docs/Web/API/console/info)
on MDN.

#### Examples

```rescript
Console.info("Information")
Console.info(("Hello", "JS"))
```

### let RescriptCore.Console.info2

> let info2: (. 'a, 'b) => unit

`info2(v1, v2)`. Like `info`, but with two arguments.

#### Examples

```rescript
Console.info2("Info", "failed to download")
Console.info2(#info, {"name": "ReScript"})
```

### let RescriptCore.Console.info3

> let info3: (. 'a, 'b, 'c) => unit

`info3(v1, v2, v3)`. Like `info`, but with three arguments.

#### Examples

```rescript
Console.info3("Hello", "World", "ReScript")
Console.info3([1, 2, 3], #4, #5)
```

### let RescriptCore.Console.info4

> let info4: (. 'a, 'b, 'c, 'd) => unit

`info4(v1, v2, v3, v4)`. Like `info`, but with four arguments.

#### Examples

```rescript
Console.info4("Hello", "World", "ReScript", '!')
Console.info4([1, 2, 3], #4, #5, #lastinfo)
```

### let RescriptCore.Console.info5

> let info5: (. 'a, 'b, 'c, 'd, 'e) => unit

`info5(v1, v2, v3, v4, v5)`. Like `info`, but with five arguments.

#### Examples

```rescript
Console.info5("Hello", "World", "from", "JS", "!!!")
Console.info5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.info6

> let info6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit

`info6(v1, v2, v3, v4, v5, v6)`. Like `info`, but with six arguments.

#### Examples

```rescript
Console.info6("Hello", "World", "from", "JS", "!!!", '!')
Console.info6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.infoMany

> let infoMany: (. array<'a>) => unit

`infoMany(arr)`. Like `info`, but variadic.

#### Examples

```rescript
Console.infoMany(["Hello", "World"])
Console.infoMany([1, 2, 3])
```

### let RescriptCore.Console.log

> let log: (. 'a) => unit

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

> let log2: (. 'a, 'b) => unit

`log2(v1, v2)`. Like `log`, but with two arguments.

#### Examples

```rescript
Console.log2("Hello", "World")
Console.log2([1, 2, 3], '4')
```

### let RescriptCore.Console.log3

> let log3: (. 'a, 'b, 'c) => unit

`log3(v1, v2, v3)`. Like `log`, but with three arguments.

#### Examples

```rescript
Console.log3("Hello", "World", "ReScript")
Console.log3("One", 2, #3)
```

### let RescriptCore.Console.log4

> let log4: (. 'a, 'b, 'c, 'd) => unit

`log4(v1, v2, v3, v4)`. Like `log`, but with four arguments.

#### Examples

```rescript
Console.log4("Hello", "World", "ReScript", "!!!")
Console.log4([1, 2], (3, 4), [#5, #6], #"polyvar")
```

### let RescriptCore.Console.log5

> let log5: (. 'a, 'b, 'c, 'd, 'e) => unit

`log5(v1, v2, v3, v4, v5)`. Like `log`, but with five arguments.

#### Examples

```rescript
Console.log5("Hello", "World", "JS", '!', '!')
Console.log5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.log6

> let log6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit

`log6(v1, v2, v3, v4, v5, v6)`. Like `log`, but with six arguments.

#### Examples

```rescript
Console.log6("Hello", "World", "JS", '!', '!', '?')
Console.log6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.logMany

> let logMany: (. array<'a>) => unit

`logMany(arr)`. Like `log`, but variadic.

#### Examples

```rescript
Console.logMany(["Hello", "World"])
Console.logMany([1, 2, 3])
```

### let RescriptCore.Console.table

> let table: (. 'a) => unit

`table(object)` displays an tabular view of the object in the console.

See [`console.table`](https://developer.mozilla.org/en-US/docs/Web/API/console/table)
on MDN.

#### Examples

```rescript
Console.table({"language": "rescript", "version": 10.1.2})
```

### let RescriptCore.Console.time

> let time: (. string) => unit

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

> let timeEnd: (. string) => unit

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

> let timeLog: (. string) => unit

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

> let trace: (. unit) => unit

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

> let warn: (. 'a) => unit

`warn(value)` print a warning message to console.

See [`console.warn`](https://developer.mozilla.org/en-US/docs/Web/API/console/warn)
on MDN.

#### Examples

```rescript
Console.warn("Warning")
Console.warn(("Warning", "invalid number"))
```

### let RescriptCore.Console.warn2

> let warn2: (. 'a, 'b) => unit

`warn2(v1, v2)`. Like `warn`, but two arguments.

#### Examples

```rescript
Console.warn2("Hello", "World")
Console.warn2([1, 2, 3], 4)
```

### let RescriptCore.Console.warn3

> let warn3: (. 'a, 'b, 'c) => unit

`warn3(v1, v2, v3)`. Like `warn`, but three arguments.

#### Examples

```rescript
Console.warn3("Hello", "World", "ReScript")
Console.warn3([1, 2, 3], #4, #5)
```

### let RescriptCore.Console.warn4

> let warn4: (. 'a, 'b, 'c, 'd) => unit

`warn4(v1, v2, v3, v4)`. Like `warn`, but with four arguments.

#### Examples

```rescript
Console.warn4("Hello", "World", "ReScript", "!!!")
Console.warn4(#first, #second, #third, ("fourth"))
```

### let RescriptCore.Console.warn5

> let warn5: (. 'a, 'b, 'c, 'd, 'e) => unit

`warn5(v1, v2, v3, v4, v5)`. Like `warn`, but with five arguments.

#### Examples

```rescript
Console.warn5("Hello", "World", "from", "JS", "!!!")
Console.warn5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```

### let RescriptCore.Console.warn6

> let warn6: (. 'a, 'b, 'c, 'd, 'e, 'f) => unit

`warn6(v1, v2, v3, v4, v5, v6)`. Like `warn`, but with six arguments.

#### Examples

```rescript
Console.warn6("Hello", "World", "from", "JS", "!!!", '!')
Console.warn6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```

### let RescriptCore.Console.warnMany

> let warnMany: (. array<'a>) => unit

`warnMany(arr)`. Like `warn`, but variadic.

#### Examples

```rescript
Console.warnMany(["Hello", "World"])
Console.warnMany([1, 2, 3])
```

## module RescriptCore.DataView `alias`

### type RescriptCore.DataView.t

> type t

### let RescriptCore.DataView.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

### let RescriptCore.DataView.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

### let RescriptCore.DataView.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

### let RescriptCore.DataView.buffer

> let buffer: (. t) => Core__ArrayBuffer.t

### let RescriptCore.DataView.byteLength

> let byteLength: (. t) => int

### let RescriptCore.DataView.byteOffset

> let byteOffset: (. t) => int

### let RescriptCore.DataView.getInt8

> let getInt8: (. t) => int

### let RescriptCore.DataView.getUint8

> let getUint8: (. t) => int

### let RescriptCore.DataView.getInt16

> let getInt16: (. t) => int

### let RescriptCore.DataView.getUint16

> let getUint16: (. t) => int

### let RescriptCore.DataView.getInt32

> let getInt32: (. t) => int

### let RescriptCore.DataView.getUint32

> let getUint32: (. t) => int

### let RescriptCore.DataView.getFloat32

> let getFloat32: (. t) => float

### let RescriptCore.DataView.getFloat64

> let getFloat64: (. t) => float

### let RescriptCore.DataView.getBigInt64

> let getBigInt64: (. t) => Core__BigInt.t

### let RescriptCore.DataView.getBigUint64

> let getBigUint64: (. t) => Core__BigInt.t

### let RescriptCore.DataView.setInt8

> let setInt8: (. t, int) => unit

### let RescriptCore.DataView.setUint8

> let setUint8: (. t, int) => unit

### let RescriptCore.DataView.setInt16

> let setInt16: (. t, int) => unit

### let RescriptCore.DataView.setUint16

> let setUint16: (. t, int) => unit

### let RescriptCore.DataView.setInt32

> let setInt32: (. t, int) => unit

### let RescriptCore.DataView.setUint32

> let setUint32: (. t, int) => unit

### let RescriptCore.DataView.setFloat32

> let setFloat32: (. t, float) => unit

### let RescriptCore.DataView.setFloat64

> let setFloat64: (. t, float) => unit

### let RescriptCore.DataView.setBigInt64

> let setBigInt64: (. t, Core__BigInt.t) => unit

### let RescriptCore.DataView.setBigUint64

> let setBigUint64: (. t, Core__BigInt.t) => unit

## module RescriptCore.Date `alias`

### type RescriptCore.Date.t

> type t = Js.Date.t

A type representing a JavaScript date.

### type RescriptCore.Date.msSinceEpoch

> type msSinceEpoch = float

Time, in milliseconds, since / until the UNIX epoch (January 1, 1970 00:00:00 UTC).
Positive numbers represent dates after, negative numbers dates before epoch.

### type RescriptCore.Date.localeOptions

> type localeOptions = {\n  dateStyle?: [#full | #long | #medium | #short],\n  timeStyle?: [#full | #long | #medium | #short],\n  weekday?: [#long | #narrow | #short],\n  era?: [#long | #narrow | #short],\n  year?: [#\"2-digit\" | #numeric],\n  month?: [\n    | #\"2-digit\"\n    | #long\n    | #narrow\n    | #numeric\n    | #short\n  ],\n  day?: [#\"2-digit\" | #numeric],\n  hour?: [#\"2-digit\" | #numeric],\n  minute?: [#\"2-digit\" | #numeric],\n  second?: [#\"2-digit\" | #numeric],\n  timeZoneName?: [#long | #short],\n}

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

### let RescriptCore.Date.make

> let make: (. unit) => t

`make()`

Creates a date object with the current date time as value.

#### Examples
```rescript
Date.make()
```

### let RescriptCore.Date.fromString

> let fromString: (. string) => t

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

> let fromTime: (. msSinceEpoch) => t

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

> let makeWithYM: (. ~year: int, ~month: int) => t

Creates a date object with the given year and month.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
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

> let makeWithYMD: (. ~year: int, ~month: int, ~date: int) => t

Creates a date object with the given year, month and date (day of month).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
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

> let makeWithYMDH: (. ~year: int, ~month: int, ~date: int, ~hours: int) => t

Creates a date object with the given year, month, date (day of month) and hours.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
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

> let makeWithYMDHM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n) => t

Creates a date object with the given year, month, date (day of month), hours and minutes.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
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

> let makeWithYMDHMS: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n) => t

Creates a date object with the given year, month, date (day of month), hours, minutes and seconds.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
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

> let makeWithYMDHMSM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => t

Creates a date object with the given year, month, date (day of month), hours, minutes, seconds and milliseconds.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
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

> let makeWithYM: (. ~year: int, ~month: int) => msSinceEpoch

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
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

> let makeWithYMD: (. ~year: int, ~month: int, ~date: int) => msSinceEpoch

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=20)
// 1676851200000

Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=-1)
// 1675036800000

Date.UTC.makeWithYMD(~year=2023, ~month=1, ~date=29)
// 1677628800000
```

### let RescriptCore.Date.UTC.makeWithYMDH

> let makeWithYMDH: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n) => msSinceEpoch

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=16)
// 1676908800000

Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=24)
// 1676937600000

Date.UTC.makeWithYMDH(~year=2023, ~month=1, ~date=20, ~hours=-1)
// 1676847600000
```

### let RescriptCore.Date.UTC.makeWithYMDHM

> let makeWithYMDHM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n) => msSinceEpoch

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40)
// 1676911200000

Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=60)
// 1676912400000

Date.UTC.makeWithYMDHM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=-1)
// 1676908740000
```

### let RescriptCore.Date.UTC.makeWithYMDHMS

> let makeWithYMDHMS: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n) => msSinceEpoch

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0)
// 1676911200000

Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=60)
// 1676911260000

Date.UTC.makeWithYMDHMS(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=-1)
// 1676911199000
```

### let RescriptCore.Date.UTC.makeWithYMDHMSM

> let makeWithYMDHMSM: (.\n  ~year: int,\n  ~month: int,\n  ~date: int,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => msSinceEpoch

Returns the time, in milliseconds, since UNIX epoch (January 1, 1970 00:00:00 UTC).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
Values, which are out of range, will be carried over to the next bigger unit (s. example).

#### Examples
```rescript
```
Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=0)->Console.log
// 1676911200000

Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=1000)->Console.log
// 1676911201000

Date.UTC.makeWithYMDHMSM(~year=2023, ~month=1, ~date=20, ~hours=16, ~minutes=40, ~seconds=0, ~milliseconds=-1)->Console.log
// 1676911199999

### let RescriptCore.Date.now

> let now: (. unit) => msSinceEpoch

`now()`

Returns the time, in milliseconds, between UNIX epoch (January 1, 1970 00:00:00 UTC) and the current date time.

### let RescriptCore.Date.equal

> let equal: (. t, t) => bool

### let RescriptCore.Date.compare

> let compare: (. t, t) => Core__Ordering.t

### let RescriptCore.Date.getTime

> let getTime: (. t) => msSinceEpoch

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

> let getTimezoneOffset: (. t) => int

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

> let getFullYear: (. t) => int

`getFullYear(date)`

Returns the year of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20")->Date.getFullYear
// 2023
```

### let RescriptCore.Date.getMonth

> let getMonth: (. t) => int

`getMonth(date)`

Returns the month (0-indexed) of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-01-01")->Date.getMonth
// 0
```

### let RescriptCore.Date.getDate

> let getDate: (. t) => int

`getDate(date)`

Returns the date (day of month) of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getDate
// 20
```

### let RescriptCore.Date.getHours

> let getHours: (. t) => int

`getHours(date)`

Returns the hours of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getHours
// 16
```

### let RescriptCore.Date.getMinutes

> let getMinutes: (. t) => int

`getMinutes(date)`

Returns the minutes of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getMinutes
// 40
```

### let RescriptCore.Date.getSeconds

> let getSeconds: (. t) => int

`getSeconds(date)`

Returns the seconds of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getSeconds
// 0
```

### let RescriptCore.Date.getMilliseconds

> let getMilliseconds: (. t) => int

`getMilliseconds(date)`

Returns the milliseconds of a given date (according to local time).

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getMilliseconds
// 0
```

### let RescriptCore.Date.getDay

> let getDay: (. t) => int

`getDay(date)`

Returns the day of week of a given date (according to local time).
0 = Sunday, 1 = Monday, ... 6 = Saturday

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.getDay
// 1
```

### let RescriptCore.Date.setFullYear

> let setFullYear: (. t, int) => unit

`setFullYear(date, year)`

Sets the year of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setFullYear(2024)
```

### let RescriptCore.Date.setFullYearM

> let setFullYearM: (. t, ~year: int, ~month: int) => unit

`setFullYearM(date, ~year, ~month)`

Sets the year and month of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setFullYearM(~year=2024, ~month=0)
```

### let RescriptCore.Date.setFullYearMD

> let setFullYearMD: (. t, ~year: int, ~month: int, ~date: int) => unit

`setFullYearMD(date, ~year, ~month, ~date)`

Sets the year, month and date (day of month) of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setFullYearMD(~year=2024, ~month=0, ~date=1)
```

### let RescriptCore.Date.setMonth

> let setMonth: (. t, int) => unit

`setMonth(date, month)`

Sets the month of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMonth(0)
```

### let RescriptCore.Date.setDate

> let setDate: (. t, int) => unit

`setDate(date, day)`

Sets the date (day of month) of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setDate(1)
```

### let RescriptCore.Date.setHours

> let setHours: (. t, int) => unit

`setHours(date, hours)`

Sets the hours of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHours(0)
```

### let RescriptCore.Date.setHoursM

> let setHoursM: (. t, ~hours: int, ~minutes: int) => unit

`setHoursM(date, ~hours, ~minutes)`

Sets the hours and minutes of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHoursM(~hours=0, ~minutes=0)
```

### let RescriptCore.Date.setHoursMS

> let setHoursMS: (. t, ~hours: int, ~minutes: int, ~seconds: int) => unit

`setHoursMS(date, ~hours, ~minutes, ~seconds)`

Sets the hours, minutes and seconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHoursMS(~hours=0, ~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setHoursMSMs

> let setHoursMSMs: (.\n  t,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit

`setHoursMSMs(date, ~hours, ~minutes, ~seconds, ~milliseconds)`

Sets the hours, minutes, seconds and milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setMinutes

> let setMinutes: (. t, int) => unit

`setMinutes(date, minutes)`

Sets the minutes of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMinutes(0)
```

### let RescriptCore.Date.setMinutesS

> let setMinutesS: (. t, ~minutes: int, ~seconds: int) => unit

`setMinutesS(date, ~minutes, ~seconds)`

Sets the minutes and seconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMinutesS(~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setMinutesSMs

> let setMinutesSMs: (.\n  t,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit

`setMinutesSMs(date, ~minutes, ~seconds, ~milliseconds)`

Sets the minutes, seconds and milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMinutesSMs(~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setSeconds

> let setSeconds: (. t, int) => unit

`setSeconds(date, seconds)`

Sets the seconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setSeconds(0)
```

### let RescriptCore.Date.setSecondsMs

> let setSecondsMs: (. t, ~seconds: int, ~milliseconds: int) => unit

`setSecondsMs(date, ~seconds, ~milliseconds)`

Sets the seconds and milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setSecondsMs(~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setMilliseconds

> let setMilliseconds: (. t, int) => unit

`setMilliseconds(date, milliseconds)`

Sets the milliseconds of a date (according to local time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setMilliseconds(0)
```

### let RescriptCore.Date.getUTCFullYear

> let getUTCFullYear: (. t) => int

`getUTCFullYear(date)`

Returns the year of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCFullYear
// 2022
```

### let RescriptCore.Date.getUTCMonth

> let getUTCMonth: (. t) => int

`getUTCMonth(date)`

Returns the month of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCMonth
// 11
```

### let RescriptCore.Date.getUTCDate

> let getUTCDate: (. t) => int

`getUTCDate(date)`

Returns the date (day of month) of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCDate
// 31
```

### let RescriptCore.Date.getUTCHours

> let getUTCHours: (. t) => int

`getUTCHours(date)`

Returns the hours of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCHours
// 23
```

### let RescriptCore.Date.getUTCMinutes

> let getUTCMinutes: (. t) => int

`getUTCMinutes(date)`

Returns the minutes of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCMinutes
// 0
```

### let RescriptCore.Date.getUTCSeconds

> let getUTCSeconds: (. t) => int

`getUTCSeconds(date)`

Returns the seconds of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCSeconds
// 0
```

### let RescriptCore.Date.getUTCMilliseconds

> let getUTCMilliseconds: (. t) => int

`getUTCMilliseconds(date)`

Returns the milliseconds of a given date (according to UTC time).

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCMilliseconds
// 0
```

### let RescriptCore.Date.getUTCDay

> let getUTCDay: (. t) => int

`getUTCDay(date)`

Returns the day (day of week) of a given date (according to UTC time).
0 = Sunday, 1 = Monday, ... 6 = Saturday

#### Examples
```rescript
Date.fromString("2023-01-01T00:00:00.00+01:00").getUTCDay
// 6
```

### let RescriptCore.Date.setUTCFullYear

> let setUTCFullYear: (. t, int) => unit

`setUTCFullYear(date, year)`

Sets the year of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCFullYear(2024)
```

### let RescriptCore.Date.setUTCFullYearM

> let setUTCFullYearM: (. t, ~year: int, ~month: int) => unit

`setUTCFullYearM(date, ~year, ~month)`

Sets the year and month of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCFullYearM(~year=2024, ~month=0)
```

### let RescriptCore.Date.setUTCFullYearMD

> let setUTCFullYearMD: (. t, ~year: int, ~month: int, ~date: int) => unit

`setUTCFullYearMD(date, ~year, ~month, ~date)`

Sets the year, month and date (day of month) of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCFullYearMD(~year=2024, ~month=0, ~date=1)
```

### let RescriptCore.Date.setUTCMonth

> let setUTCMonth: (. t, int) => unit

`setUTCMonth(date, month)`

Sets the month of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMonth(0)
```

### let RescriptCore.Date.setUTCDate

> let setUTCDate: (. t, int) => unit

`setDate(date, day)`

Sets the date (day of month) of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCDate(1)
```

### let RescriptCore.Date.setUTCHours

> let setUTCHours: (. t, int) => unit

`setUTCHours(date, hours)`

Sets the hours of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHours(0)
```

### let RescriptCore.Date.setUTCHoursM

> let setUTCHoursM: (. t, ~hours: int, ~minutes: int) => unit

`setHoursM(date, ~hours, ~minutes)`

Sets the hours and minutes of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHoursM(~hours=0, ~minutes=0)
```

### let RescriptCore.Date.setUTCHoursMS

> let setUTCHoursMS: (. t, ~hours: int, ~minutes: int, ~seconds: int) => unit

`setUTCHoursMS(date, ~hours, ~minutes, ~seconds)`

Sets the hours, minutes and seconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHoursMS(~hours=0, ~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setUTCHoursMSMs

> let setUTCHoursMSMs: (.\n  t,\n  ~hours: int,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit

`setUTCHoursMSMs(date, ~hours, ~minutes, ~seconds, ~milliseconds)`

Sets the hours, minutes, seconds and milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setUTCMinutes

> let setUTCMinutes: (. t, int) => unit

`setUTCMinutes(date, minutes)`

Sets the minutes of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMinutes(0)
```

### let RescriptCore.Date.setUTCMinutesS

> let setUTCMinutesS: (. t, ~minutes: int, ~seconds: int) => unit

`setUTCMinutesS(date, ~minutes, ~seconds)`

Sets the minutes and seconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMinutesS(~minutes=0, ~seconds=0)
```

### let RescriptCore.Date.setUTCMinutesSMs

> let setUTCMinutesSMs: (.\n  t,\n  ~minutes: int,\n  ~seconds: int,\n  ~milliseconds: int,\n) => unit

`setUTCMinutesSMs(date, ~minutes, ~seconds, ~milliseconds)`

Sets the minutes, seconds and milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMinutesSMs(~minutes=0, ~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setUTCSeconds

> let setUTCSeconds: (. t, int) => unit

`setUTCSeconds(date, seconds)`

Sets the seconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCSeconds(0)
```

### let RescriptCore.Date.setUTCSecondsMs

> let setUTCSecondsMs: (. t, ~seconds: int, ~milliseconds: int) => unit

`setUTCSecondsMs(date, ~seconds, ~milliseconds)`

Sets the seconds and milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCSecondsMs(~seconds=0, ~milliseconds=0)
```

### let RescriptCore.Date.setUTCMilliseconds

> let setUTCMilliseconds: (. t, int) => unit

`setUTCMilliseconds(date, milliseconds)`

Sets the milliseconds of a date (according to UTC time).
Beware this will *mutate* the date.

#### Examples
```rescript
Date.fromString("2023-02-20T16:40:00.00")->Date.setUTCMilliseconds(0)
```

### let RescriptCore.Date.toDateString

> let toDateString: (. t) => string

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

> let toString: (. t) => string

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

> let toTimeString: (. t) => string

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

> let toLocaleDateString: (. t) => string

`toLocaleDateString(date)`

Converts a JavaScript date to a localized date string. It will use the current locale.

#### Examples
```rescript
Date.make()->Date.toLocaleDateString->Console.log
// 2/19/2023
```

### let RescriptCore.Date.toLocaleDateStringWithLocale

> let toLocaleDateStringWithLocale: (. t, string) => string

`toLocaleDateStringWithLocale(date, locale)`

Converts a JavaScript date to a localized date string. It will use the specified locale.

#### Examples
```rescript
Date.make()->Date.toLocaleDateStringWithLocale("en-US")->Console.log
// 2/19/2023
```

### let RescriptCore.Date.toLocaleDateStringWithLocaleAndOptions

> let toLocaleDateStringWithLocaleAndOptions: (. t, string, localeOptions) => string

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

> let toLocaleString: (. t) => string

`toLocaleString(date)`

Converts a JavaScript date to a localized date-time string. It will use the current locale.

#### Examples
```rescript
Date.make()->Date.toLocaleString->Console.log
// 2/19/2023, 3:40:00 PM
```

### let RescriptCore.Date.toLocaleStringWithLocale

> let toLocaleStringWithLocale: (. t, string) => string

`toLocaleStringWithLocale(date, locale)`

Converts a JavaScript date to a localized date-time string. It will use the specified locale.

#### Examples
```rescript
Date.make()->Date.toLocaleStringWithLocale("en-US")->Console.log
// 2/19/2023, 3:40:00 PM
```

### let RescriptCore.Date.toLocaleStringWithLocaleAndOptions

> let toLocaleStringWithLocaleAndOptions: (. t, string, localeOptions) => string

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

> let toLocaleTimeString: (. t) => string

`toLocaleTimeString(date)`

Converts a JavaScript date to a localized time string. It will use the current locale.

#### Examples
```rescript
Date.make()->Date.toLocaleTimeString->Console.log
// 3:40:00 PM
```

### let RescriptCore.Date.toLocaleTimeStringWithLocale

> let toLocaleTimeStringWithLocale: (. t, string) => string

`toLocaleTimeStringWithLocale(date, locale)`

Converts a JavaScript date to a localized time string. It will use the specified locale.

#### Examples
```rescript
Date.make()->Date.toLocaleTimeStringWithLocale("en-US")->Console.log
// 3:40:00 PM
```

### let RescriptCore.Date.toLocaleTimeStringWithLocaleAndOptions

> let toLocaleTimeStringWithLocaleAndOptions: (. t, string, localeOptions) => string

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

> let toISOString: (. t) => string

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

> let toUTCString: (. t) => string

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

> let toJSON: (. t) => option<string>

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

### type RescriptCore.Dict.t

> type t<'a> = Js.Dict.t<'a>

Type representing a dictionary of value `'a`.

### let RescriptCore.Dict.get

> let get: (. t<'a>, string) => option<'a>

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

> let set: (. t<'a>, string, 'a) => unit

`set(dictionary, key, value)` sets the value at the provided key to the provided value.

#### Examples
```rescript
let dict = Dict.make()

dict->Dict.set("someKey", "someValue")
```

### let RescriptCore.Dict.delete

> let delete: (. t<'a>, string) => unit

`delete(dictionary, key)` deletes the value at `key`, if it exists.

#### Examples
```rescript
let dict = Dict.fromArray([("someKey", "someValue")])

dict->Dict.delete("someKey")
```

### let RescriptCore.Dict.make

> let make: (. unit) => t<'a>

`make()` creates a new, empty dictionary.

#### Examples
```rescript
let dict1: Dict.t<int> = Dict.make() // You can annotate the type of the values of your dict yourself if you want

let dict2 = Dict.make() // Or you can let ReScript infer it via usage.
dict2->Dict.set("someKey", 12)
```

### let RescriptCore.Dict.fromArray

> let fromArray: (. array<(string, 'a)>) => t<'a>

`fromArray(entries)` creates a new dictionary from the provided array of key/value pairs.

#### Examples
```rescript
let dict = Dict.fromArray([("key1", "value1"), ("key2", "value2")])
```

### let RescriptCore.Dict.fromIterator

> let fromIterator: (. Core__Iterator.t<(string, 'a)>) => t<'a>

`fromIterator(entries)` creates a new dictionary from the provided iterator of key/value pairs.

#### Examples
```rescript
// Pretend we have an iterator of the correct shape
@val external someIterator: Iterator.t<(string, int)> = "someIterator"

let dict = Dict.fromIterator(someIterator) // Dict.t<int>
```

### let RescriptCore.Dict.toArray

> let toArray: (. t<'a>) => array<(string, 'a)>

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

> let keysToArray: (. t<'a>) => array<string>

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

> let valuesToArray: (. t<'a>) => array<'a>

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

> let assign: (. t<'a>, t<'a>) => t<'a>

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

> let copy: (. t<'a>) => t<'a>

`copy(dictionary)` [shallowly copies](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) the provided dictionary to a new dictionary.

#### Examples
```rescript
let dict = Dict.fromArray([("key1", "value1"), ("key2", "value2")])
let dict2 = dict->Dict.copy

// Both log `["key1", "key2"]` here.
Console.log2(dict->Dict.keysToArray, dict2->Dict.keysToArray)
```

## module RescriptCore.Error `alias`

### type RescriptCore.Error.t

> type t = Js.Exn.t

Represents a JavaScript exception.

### let RescriptCore.Error.fromException

> let fromException: (. exn) => option<t>

### let RescriptCore.Error.toException

> let toException: (. t) => exn

Turns an `Error.t` into an `exn`.

#### Examples
```rescript
let error = Error.make("Something went wrong.")

let asExn = error->Error.toException // `asExn` is now type `exn`
```

### let RescriptCore.Error.stack

> let stack: (. t) => option<string>

`stack(error)` retrieves the `stack` property of the error, if it exists. The stack is a list of what functions were called, and what files they are defined in, prior to the error happening.

See [`Error.prototype.stack`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Stack) on MDN.

#### Example
```rescript
Console.log(someError->Error.stack) // Logs `stack` if it exists on `someError`
```

### let RescriptCore.Error.message

> let message: (. t) => option<string>

`message(error)` retrieves the `message` property of the error, if it exists.

See [`Error.prototype.message`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message) on MDN.

#### Example
```rescript
let error = Error.SyntaxError.make("Some message here")
Console.log(error->Error.message) // Logs "Some message here" to the console
```

### let RescriptCore.Error.name

> let name: (. t) => option<string>

`name(error)` retrieves the `name` property of the error, if it exists.

See [`Error.prototype.name`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name) on MDN.

#### Example
```rescript
let error = Error.SyntaxError.make("Some message here")
Console.log(error->Error.name) // Logs "SyntaxError" to the console
```

### let RescriptCore.Error.fileName

> let fileName: (. t) => option<string>

`fileName(error)` retrieves the `fileName` property of the error, if it exists.

See [`Error.prototype.fileName`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/fileName) on MDN.

### let RescriptCore.Error.make

> let make: (. string) => t

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

> let make: (. string) => t

Creates a new `EvalError` with the provided `message`.

See [`EvalError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/EvalError) on MDN.

## module RescriptCore.Error.RangeError

### let RescriptCore.Error.RangeError.make

> let make: (. string) => t

Creates a new `RangeError` with the provided `message`.

See [`RangeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RangeError) on MDN.

## module RescriptCore.Error.ReferenceError

### let RescriptCore.Error.ReferenceError.make

> let make: (. string) => t

Creates a new `ReferenceError` with the provided `message`.

See [`ReferenceError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError) on MDN.

## module RescriptCore.Error.SyntaxError

### let RescriptCore.Error.SyntaxError.make

> let make: (. string) => t

Creates a new `SyntaxError` with the provided `message`.

See [`SyntaxError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError) on MDN.

## module RescriptCore.Error.TypeError

### let RescriptCore.Error.TypeError.make

> let make: (. string) => t

Creates a new `TypeError` with the provided `message`.

See [`TypeError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) on MDN.

## module RescriptCore.Error.URIError

### let RescriptCore.Error.URIError.make

> let make: (. string) => t

Creates a new `URIError` with the provided `message`.

See [`URIError`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/URIError) on MDN.

### let RescriptCore.Error.raise

> let raise: (. t) => 'a

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

> let panic: (. string) => 'a

Raises a panic exception with the given message.

A panic exception is a native JavaScript exception that is not intended to be caught and
handled. Compared to a ReScript exception this will give a better stack trace and
debugging experience.

#### Examples
```rescript
Error.panic("Uh oh. This was unexpected!")
```

## module RescriptCore.Float `alias`

## module RescriptCore.Float.Constants

### let RescriptCore.Float.Constants.nan

> let nan: float

The special value "Not a Number"
See [`NaN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) on MDN.

#### Examples

```rescript
Float.Constants.nan
```

### let RescriptCore.Float.Constants.epsilon

> let epsilon: float

Represents the difference between 1 and the smallest floating point number greater than 1.
See [`Number.EPSILON`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/EPSILON) on MDN.

#### Examples

```rescript
Float.Constants.epsilon
```

### let RescriptCore.Float.Constants.positiveInfinity

> let positiveInfinity: float

The positive Infinity value
See [`Number.POSITIVE_INFINITY`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) on MDN.

#### Examples

```rescript
Float.Constants.positiveInfinity
```

### let RescriptCore.Float.Constants.negativeInfinity

> let negativeInfinity: float

The negative Infinity value
See [`Number.NEGATIVE_INFINITY`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY) on MDN.

#### Examples

```rescript
Float.Constants.negativeInfinity
```

### let RescriptCore.Float.Constants.minValue

> let minValue: float

The smallest positive numeric value representable in JavaScript.
See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) on MDN.

#### Examples

```rescript
Float.Constants.minValue
```

### let RescriptCore.Float.Constants.maxValue

> let maxValue: float

The maximum positive numeric value representable in JavaScript.
See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) on MDN.

#### Examples

```rescript
Float.Constants.minValue
```

### let RescriptCore.Float.equal

> let equal: (. float, float) => bool

### let RescriptCore.Float.compare

> let compare: (. float, float) => Core__Ordering.t

### let RescriptCore.Float.isNaN

> let isNaN: (. float) => bool

`isNaN(v)` tests if the given `v` is `NaN`.
See [`NaN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) on MDN.

#### Examples

```rescript
Float.isNaN(3.0) // false
Float.isNaN(Float.Constants.nan) // true
```

### let RescriptCore.Float.isFinite

> let isFinite: (. float) => bool

`isFinite(v)` tests if the given `v` is finite.
See [`isFinite`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/isFinite) on MDN.

#### Examples

```rescript
Float.isFinite(1.0) // true
Float.isFinite(Float.Constants.nan) // false
Float.isFinite(Float.Constants.positiveInfinity) // false
```

### let RescriptCore.Float.parseFloat

> let parseFloat: (. string) => float

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

> let parseInt: (. 'a) => float

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

> let parseIntWithRadix: (. 'a, ~radix: int) => float

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

> let toExponential: (. float) => string

`toExponential(v)` return a `string` representing the given value in exponential
notation.
See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential) on MDN.

#### Examples

```rescript
Float.toExponential(1000.0) // "1e+3"
Float.toExponential(-1000.0) // "-1e+3"
```

### let RescriptCore.Float.toExponentialWithPrecision

> let toExponentialWithPrecision: (. float, ~digits: int) => string

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

> let toFixed: (. float) => string

`toFixed(v)` return a `string` representing the given value using fixed-point
notation.
See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed) on MDN.

#### Examples

```rescript
Float.toFixed(123456.0) // "123456.00"
Float.toFixed(10.0) // "10.00"
```

### let RescriptCore.Float.toFixedWithPrecision

> let toFixedWithPrecision: (. float, ~digits: int) => string

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

> let toPrecision: (. float) => string

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

> let toPrecisionWithPrecision: (. float, ~digits: int) => string

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

> let toString: (. float) => string

`toString(v)` return a `string` representing the given value.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) on MDN.

#### Examples

```rescript
Float.toString(1000.0) // "1000"
Float.toString(-1000.0) // "-1000"
```

### let RescriptCore.Float.toStringWithRadix

> let toStringWithRadix: (. float, ~radix: int) => string

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

> let toLocaleString: (. float) => string

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

> let fromString: (. string) => option<float>

`fromString(str)` return an `option<int>` representing the given value `str`.

#### Examples

```rescript
Float.fromString("0") == Some(0.0)
Float.fromString("NaN") == None
Float.fromString("6") == Some(6.0)
```

### let RescriptCore.Float.toInt

> let toInt: (. float) => int

`toInt(v)` returns an int to given float `v`.

#### Examples

```rescript
Float.toInt(2.0) == 2
Float.toInt(1.0) == 1
Float.toInt(1.1) == 1
Float.toInt(1.6) == 1
```

### let RescriptCore.Float.fromInt

> let fromInt: (. int) => float

`fromInt(v)` returns a float to given int `v`.

#### Examples

```rescript
Float.fromInt(2) == 2.0
Float.fromInt(1) == 1.0
```

### let RescriptCore.Float.mod

> let mod: (. float, float) => float

`mod(n1, n2)` calculates the modulo (remainder after division) of two floats.

#### Examples

```rescript
Int.mod(7.0, 4.0) == 3
```

### let RescriptCore.Float.clamp

> let clamp: (. ~min: float=?, ~max: float=?, float) => float

`clamp(~min=?, ~max=?, value)` returns `value`, optionally bounded by `min` and `max`.

if `max` < `min` returns `min`.

#### Examples

```rescript
Int.clamp(4.2) == 4.2
Int.clamp(4.2, ~min=4.3) == 4.3
Int.clamp(4.2, ~max=4.1) == 4.1
Int.clamp(4.2, ~min=4.3, ~max=4.1) == 4.3
```

## module RescriptCore.Int `alias`

## module RescriptCore.Int.Constants

### let RescriptCore.Int.Constants.minValue

> let minValue: int

The smallest positive number represented in JavaScript.
See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE)
on MDN.

#### Examples

```rescript
Console.log(Int.Constants.minValue)
```

### let RescriptCore.Int.Constants.maxValue

> let maxValue: int

The largest positive number represented in JavaScript.
See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE)
on MDN.

#### Examples

```rescript
Console.log(Int.Constants.maxValue)
```

### let RescriptCore.Int.equal

> let equal: (. int, int) => bool

### let RescriptCore.Int.compare

> let compare: (. int, int) => Core__Ordering.t

### let RescriptCore.Int.toExponential

> let toExponential: (. int) => string

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

> let toExponentialWithPrecision: (. int, ~digits: int) => string

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

> let toFixed: (. int) => string

`toFixed(n)` return a `string` representing the given value using fixed-point
notation. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)
on MDN.


#### Examples

```rescript
Int.toFixed(123456) // "123456.00"
Int.toFixed(10) // "10.00"
```

### let RescriptCore.Int.toFixedWithPrecision

> let toFixedWithPrecision: (. int, ~digits: int) => string

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

> let toPrecision: (. int) => string

`toPrecision(n)` return a `string` representing the giver value with precision.
This function omits the argument that controls precision, so it behaves like
`toString`. See `toPrecisionWithPrecision` to control precision. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

#### Examples

```rescript
Int.toPrecision(100) // "100"
Int.toPrecision(1) // "1"
```

### let RescriptCore.Int.toPrecisionWithPrecision

> let toPrecisionWithPrecision: (. int, ~digits: int) => string

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

> let toString: (. int) => string

`toString(n)` return a `string` representing the given value.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)
on MDN.

#### Examples

```rescript
Int.toString(1000) // "1000"
Int.toString(-1000) // "-1000"
```

### let RescriptCore.Int.toStringWithRadix

> let toStringWithRadix: (. int, ~radix: int) => string

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

> let toLocaleString: (. int) => string

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

> let toFloat: (. int) => float

`toFloat(n)` return a `float` representing the given value.

#### Examples

```rescript
Int.toFloat(100) == 100.0
Int.toFloat(2) == 2.0
```

### let RescriptCore.Int.fromFloat

> let fromFloat: (. float) => int

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

> let fromString: (. ~radix: int=?, string) => option<int>

`fromString(~radix?, str)` return an `option<int>` representing the given value
`str`. `~radix` specifies the radix base to use for the formatted number.

#### Examples

```rescript
Int.fromString("0") == Some(0)
Int.fromString("NaN") == None
Int.fromString(~radix=2, "6") == None
```

### let RescriptCore.Int.mod

> let mod: (. int, int) => int

`mod(n1, n2)` calculates the modulo (remainder after division) of two integers.

#### Examples

```rescript
Int.mod(7, 4) == 3
```

### let RescriptCore.Int.range

> let range: (. int, int) => array<int>

`range(start, end)` returns an int array of the sequence of integers in the
range `[start, end)`. That is, including `start` but excluding `end`.

If `start < end` the sequence will be increasing in steps of 1.

If `start > end` the sequence will be decreasing in steps of -1.

This is equivalent to `rangeWithOptions` with `inclusive` set to `false` and
`step` set to `1` if `start < end` and `-1` otherwise.

#### Examples

```rescript
Int.range(3, 6) == [3, 4, 5]
Int.range(-3, -1) == [-3, -2]
Int.range(3, 1) == [3, 2]
```

### type RescriptCore.Int.rangeOptions

> type rangeOptions = {step?: int, inclusive?: bool}

The options for `rangeWithOptions`.

### let RescriptCore.Int.rangeWithOptions

> let rangeWithOptions: (. int, int, rangeOptions) => array<int>

`rangeWithOptions(start, end, options)` is like `range`, but with `step` and
`inclusive` options configurable.

If `step` is set, the sequence will increase or decrease by that amount for each
step. If `start < end` and `step` is negative, or vice versa, an empty array is
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

> let clamp: (. ~min: int=?, ~max: int=?, int) => int

`clamp(~min=?, ~max=?, value)` returns `value`, optionally bounded by `min` and `max`.

if `max` < `min` returns `min`.

#### Examples

```rescript
Int.clamp(42) == 42
Int.clamp(42, ~min=50) == 50
Int.clamp(42, ~max=40) == 40
Int.clamp(42, ~min=50, ~max=40) == 50
```

## module RescriptCore.BigInt `alias`

### type RescriptCore.BigInt.t

> type t = Js.Types.bigint_val

### let RescriptCore.BigInt.asIntN

> let asIntN: (. ~width: int, t) => t

### let RescriptCore.BigInt.asUintN

> let asUintN: (. ~width: int, t) => t

### let RescriptCore.BigInt.fromString

> let fromString: (. string) => t

### let RescriptCore.BigInt.fromInt

> let fromInt: (. int) => t

### let RescriptCore.BigInt.fromFloat

> let fromFloat: (. float) => t

### let RescriptCore.BigInt.toString

> let toString: (. t) => string

### let RescriptCore.BigInt.toStringWithRadix

> let toStringWithRadix: (. t, ~radix: int) => string

### let RescriptCore.BigInt.toLocaleString

> let toLocaleString: (. t) => string

### let RescriptCore.BigInt.toFloat

> let toFloat: (. t) => float

### let RescriptCore.BigInt.toInt

> let toInt: (. t) => int

### let RescriptCore.BigInt.+

> let +: (. t, t) => t

### let RescriptCore.BigInt.-

> let -: (. t, t) => t

### let RescriptCore.BigInt.*

> let *: (. t, t) => t

### let RescriptCore.BigInt./

> let /: (. t, t) => t

### let RescriptCore.BigInt.add

> let add: (. t, t) => t

### let RescriptCore.BigInt.sub

> let sub: (. t, t) => t

### let RescriptCore.BigInt.mul

> let mul: (. t, t) => t

### let RescriptCore.BigInt.div

> let div: (. t, t) => t

### let RescriptCore.BigInt.mod

> let mod: (. t, t) => t

### let RescriptCore.BigInt.land

> let land: (. t, t) => t

### let RescriptCore.BigInt.lor

> let lor: (. t, t) => t

### let RescriptCore.BigInt.lxor

> let lxor: (. t, t) => t

### let RescriptCore.BigInt.lsl

> let lsl: (. t, t) => t

### let RescriptCore.BigInt.asr

> let asr: (. t, t) => t

### let RescriptCore.BigInt.exp

> let exp: (. t, t) => 'a

## module RescriptCore.Math `alias`

## module RescriptCore.Math.Constants

### let RescriptCore.Math.Constants.e

> let e: float

`Math.Constants.e` returns Euler's number, ≈ 2.718281828459045.
See [`Math.E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E) on MDN.

#### Examples

```rescript
Math.Constants.e
```

### let RescriptCore.Math.Constants.ln2

> let ln2: float

`Math.Constants.ln2` returns Natural logarithm of 2, ≈ 0.6931471805599453.
See [`Math.LN2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN2) on MDN.

#### Examples

```rescript
Math.Constants.LN2
```

### let RescriptCore.Math.Constants.ln10

> let ln10: float

`Math.Constants.ln10` returns Natural logarithm of 10, ≈ 2.302585092994046.
See [`Math.LN10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN10) on MDN.

#### Examples

```rescript
Math.Constants.ln10
```

### let RescriptCore.Math.Constants.log2e

> let log2e: float

`Math.Constants.log2e` returns Base 2 logarithm of E, ≈ 1.4426950408889634.
See [`Math.LOG2E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG2E) on MDN.

#### Examples

```rescript
Math.Constants.log2e
```

### let RescriptCore.Math.Constants.log10e

> let log10e: float

`Math.Constants.log10e` returns Base 10 logarithm of E, ≈ 0.4342944819032518.
See [`Math.LOG10E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG10E) on MDN.

#### Examples

```rescript
Math.Constants.log10e
```

### let RescriptCore.Math.Constants.pi

> let pi: float

`Math.Constants.pi` returns Pi - ratio of the circumference to the diameter
of a circle, ≈ 3.141592653589793.
See [`Math.PI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/PI) on MDN.

#### Examples

```rescript
Math.Constants.pi
```

### let RescriptCore.Math.Constants.sqrt1_2

> let sqrt1_2: float

`Math.Constants.sqrt1_2` returns Square root of 1/2, ≈ 0.7071067811865476.
See [`Math.SQRT1_2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/SQRT1_2) on MDN.

#### Examples

```rescript
Math.Constants.sqrt1_2
```

### let RescriptCore.Math.Constants.sqrt2

> let sqrt2: float

`Math.Constants.e` returns Absolute value for integer argument.
See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

#### Examples

```rescript
Math.Constants.sqrt2
```

## module RescriptCore.Math.Int

### let RescriptCore.Math.Int.abs

> let abs: (. int) => int

`abs(v)` returns absolute value of `v`.
See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

#### Examples

```rescript
Math.Int.abs(-2) // 2
Math.Int.abs(3) // 3
```

### let RescriptCore.Math.Int.clz32

> let clz32: (. int) => int

`clz32(v)` returns the number of leading zero bits of the argument's 32 bit
int representation.
See [`Math.clz32`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32) on MDN.

#### Examples

```rescript
// 00000000000000000000000000000001
Math.Int.clz32(1) // 31
// 00000000000000000000000000000100
Math.Int.clz32(4) // 29
```

### let RescriptCore.Math.Int.imul

> let imul: (. int, int) => int

`imul(a, b)` returns 32-bit integer multiplication. Use this only when you
need to optimize performance of multiplication of numbers stored as 32-bit
integers.
See [`Math.imul`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul) on MDN.

#### Examples

```rescript
Math.Int.imul(3, 4) // 12
Math.Int.imul(-5, 12) // 60
```

### let RescriptCore.Math.Int.min

> let min: (. int, int) => int

`min(a, b)` returns the minimum of its two integer arguments.
See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

#### Examples

```rescript
Math.Int.min(1, 2) // 1
Math.Int.min(-1, -2) // -2
```

### let RescriptCore.Math.Int.minMany

> let minMany: (. array<int>) => int

`minMany(arr)` returns the minimum of the integers in the given array `arr`.
Returns `Infinity` if `arr` is empty.
See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

#### Examples

```rescript
Math.Int.minMany([1, 2]) // 1
Math.Int.minMany([-1, -2]) // -2
Math.Int.minMany([])->Float.isFinite // false
```

### let RescriptCore.Math.Int.max

> let max: (. int, int) => int

`max(a, b)` returns the maximum of its two integer arguments.
See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

#### Examples

```rescript
Math.Int.max(1, 2) // 2
Math.Int.max(-1, -2) // -1
```

### let RescriptCore.Math.Int.maxMany

> let maxMany: (. array<int>) => int

`maxMany(arr)` returns the maximum of the integers in the given array `arr`.
Returns `Infinity` if `arr` is empty.
See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

#### Examples

```rescript
Math.Int.maxMany([1, 2]) // 2
Math.Int.maxMany([-1, -2]) // -1
Math.Int.maxMany([])->Float.isFinite // false
```

### let RescriptCore.Math.Int.pow

> let pow: (. int, ~exp: int) => int

`pow(a, ~exp)` raises the given base `a` to the given exponent `exp`.
See [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.

#### Examples

```rescript
Math.Int.pow(2, ~exp=4) // 16
Math.Int.pow(3, ~exp=4) // 81
```

### let RescriptCore.Math.Int.sign

> let sign: (. int) => int

`sign(v)` returns the sign of its integer argument: `-1` if negative, `0` if
zero, `1` if positive.
See [`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign) on MDN.

#### Examples

```rescript
Math.Int.sign(3) // 1
Math.Int.sign(-3) // 1
Math.Int.sign(0) // 0
```

### let RescriptCore.Math.Int.floor

> let floor: (. float) => int

floor(v) returns the largest `int` less than or equal to the argument; 
the result is pinned to the range of the `int` data type: -2147483648 to 2147483647. 
See [`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)
on MDN.

#### Examples

```rescript
Math.Int.floor(3.7) == 3
Math.Int.floor(3.0) == 3
Math.Int.floor(-3.1) == -4
Math.Int.floor(-1.0e15) == -2147483648
Math.Int.floor(1.0e15) == 2147483647
```

### let RescriptCore.Math.Int.random

> let random: (. int, int) => int

`random(minVal, maxVal)` returns a random integer number in the half-closed interval [minVal, maxVal).
See [`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)
on MDN.

#### Examples

```rescript
Math.Int.random(2, 5) == 4
Math.Int.random(505, 2000) == 1276
Math.Int.random(-7, -2) == -4
```

### let RescriptCore.Math.abs

> let abs: (. float) => float

`abs(v)` returns absolute value of `v`.
See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

#### Examples

```rescript
Math.abs(-2.0) // 2.0
Math.abs(3.0) // 3.0
```

### let RescriptCore.Math.acos

> let acos: (. float) => float

`acos(v)` returns arccosine (in radians) of argument `v`, returns `NaN` if the
argument is outside the range [-1.0, 1.0].
See [`Math.acos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos) on MDN.

#### Examples

```rescript
Math.acos(-1) // 3.141592653589793
Math.acos(-3)->Float.isNaN // true
```

### let RescriptCore.Math.acosh

> let acosh: (. float) => float

`acosh(v)` returns the inverse hyperbolic arccosine (in radians) of argument `v`,
returns `NaN` if the argument is less than `1.0`.
See [`Math.acosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh) on MDN.

#### Examples

```rescript
Math.acosh(1) // 0.0
Math.acosh(0.5)->Float.isNaN // true
```

### let RescriptCore.Math.asin

> let asin: (. float) => float

`asin(v)` returns the inverse sine (in radians) of argument `v`, returns `NaN`
if the argument `v` is outside the range [-1.0, 1.0].
See [`Math.asin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asin) on MDN.

#### Examples

```rescript
Math.asin(-1.0) // -1.5707963267948966
Math.asin(-2.0)->Float.isNaN // true
```

### let RescriptCore.Math.asinh

> let asinh: (. float) => float

`asinh(v)` returns the inverse hyperbolic sine of argument `v`.
See [`Math.asinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh) on MDN.

#### Examples

```rescript
Math.asinh(-1) // -0.881373587019543
Math.asinh(-0) // -0.0
```

### let RescriptCore.Math.atan

> let atan: (. float) => float

`atan(v)` returns the inverse tangent (in radians) of argument `v`.
See [`Math.atan`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan) on MDN.

#### Examples

```rescript
Math.atan(-0.0) // -0.0
Math.atan(0.0) // 0.0
Math.atan(1) // 0.7853981633974483
```

### let RescriptCore.Math.atanh

> let atanh: (. float) => float

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

> let atan2: (. ~y: float, ~x: float) => float

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

> let cbrt: (. float) => float

`cbrt(v)` returns the cube root of argument `v`.
See [`Math.cbrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt) on MDN.

#### Examples

```rescript
Math.cbrt(-1.0) // -1.0
Math.cbrt(-0.0) // -0.0
Math.cbrt(0.0) // 0.0
```

### let RescriptCore.Math.ceil

> let ceil: (. float) => float

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

> let cos: (. float) => float

`cos(v)` returns the cosine of argument `v`, which must be specified in radians.
See [`Math.cos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos) on MDN.

#### Examples

```rescript
Math.cos(-0.0) // 1.0
Math.cos(0.0) // 1.0
Math.cos(1.0) // 0.5403023058681398
```

### let RescriptCore.Math.cosh

> let cosh: (. float) => float

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

> let exp: (. float) => float

`exp(v)` returns natural exponentional, returns *e* (the base of natural logarithms)
to the power of the given argument `v`.
See [`Math.exp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp) on MDN.

#### Examples

```rescript
Math.exp(-1.0) // 0.36787944117144233
Math.exp(0.0) // 1.0
```

### let RescriptCore.Math.expm1

> let expm1: (. float) => float

`expm1(v)` returns *e* (the base of natural logarithms) to the power of the given
argument `v` minus 1.
See [`Math.expm1`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1) on MDN.

#### Examples

```rescript
Math.expm1(-1.0) // -0.6321205588285577
Math.expm1(-0.0) // -0
```

### let RescriptCore.Math.floor

> let floor: (. float) => float

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

> let fround: (. float) => float

`fround(v)` returns the nearest single precision float.
See [`Math.fround`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround) on MDN.

#### Examples

```rescript
Math.fround(5.5) == 5.5
Math.fround(5.05) == 5.050000190734863
```

### let RescriptCore.Math.hypot

> let hypot: (. float, float) => float

`hypot(a, b)` returns the square root of the sum of squares of its two arguments
(the Pythagorean formula).
See [`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot) on MDN.

#### Examples

```rescript
Math.hypot(3.0, 4.0) // 5.0
Math.hypot(3.0, 5.0) // 5.8309518948453
```

### let RescriptCore.Math.hypotMany

> let hypotMany: (. array<float>) => float

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

> let log: (. float) => float

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

> let log1p: (. float) => float

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

> let log10: (. float) => float

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

> let log2: (. float) => float

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

> let min: (. float, float) => float

`min(a, b)` returns the minimum of its two float arguments.
See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

#### Examples

```rescript
Math.min(1.0, 2.0) // 1.0
Math.min(-1.0, -2.0) // -2.0
```

### let RescriptCore.Math.minMany

> let minMany: (. array<float>) => float

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

> let max: (. float, float) => float

`max(a, b)` returns the maximum of its two float arguments.
See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

#### Examples

```rescript
Math.max(1.0, 2.0) // 2.0
Math.max(-1.0, -2.0) // -1.0
```

### let RescriptCore.Math.maxMany

> let maxMany: (. array<float>) => float

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

> let pow: (. float, ~exp: float) => float

`pow(a, ~exp)` raises the given base `a` to the given exponent `exp`.
See [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.

#### Examples

```rescript
Math.pow(2.0, ~exp=4.0) // 16.0
Math.pow(3.0, ~exp=4.0) // 81.0
```

### let RescriptCore.Math.random

> let random: (. unit) => float

`random()` returns a random number in the half-closed interval [0,1].
See [`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) on MDN.

#### Examples

```rescript
Math.random()
```

### let RescriptCore.Math.round

> let round: (. float) => float

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

> let sign: (. float) => float

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

> let sin: (. float) => float

`sin(v)` returns the sine of argument `v`, which must be specified in radians.
See [`Math.sin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin) on MDN.

#### Examples

```rescript
Math.sin(-0.0) // -0.0
Math.sin(0.0) // 0.0
Math.sin(1.0) // 0.8414709848078965
```

### let RescriptCore.Math.sinh

> let sinh: (. float) => float

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

> let sqrt: (. float) => float

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

> let tan: (. float) => float

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

> let tanh: (. float) => float

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

> let trunc: (. float) => float

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

### type RescriptCore.Null.t

> type t<'a> = Js.Null.t<'a>

A type representing a value that can be either `'a` or `null`.

### let RescriptCore.Null.asNullable

> let asNullable: (. t<'a>) => Core__Nullable.t<'a>

Converts a `Null.t` into a `Nullable.t`.

#### Examples
```rescript
let nullValue = Null.make("Hello")
let asNullable = nullValue->Null.asNullable // Nullable.t<string>
```

### let RescriptCore.Null.null

> let null: t<'a>

The value `null`.

See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.

#### Examples
```rescript
Console.log(null) // Logs `null` to the console.
```

### let RescriptCore.Null.make

> let make: (. 'a) => t<'a>

Creates a new `Null.t` from the provided value.
This means the compiler will enforce null checks for the new value.

#### Examples
```rescript
let myStr = "Hello"
let asNullValue = myStr->Null.make // The compiler now thinks this can be `string` or `null`.
```

### let RescriptCore.Null.equal

> let equal: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool

### let RescriptCore.Null.compare

> let compare: (.\n  t<'a>,\n  t<'b>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t

### let RescriptCore.Null.toOption

> let toOption: (. t<'a>) => option<'a>

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

> let fromOption: (. option<'a>) => t<'a>

Turns an `option` into a `Null.t`. `None` will be converted to `null`.

#### Examples
```rescript
let optString: option<string> = None
let asNull = optString->Null.fromOption // Null.t<string>
Console.log(asNull == null) // Logs `true` to the console.
```

### let RescriptCore.Null.getOr

> let getOr: (. t<'a>, 'a) => 'a

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

**DEPRECATED: Use getOr instead**

> let getWithDefault: (. t<'a>, 'a) => 'a

### let RescriptCore.Null.getExn

> let getExn: (. t<'a>) => 'a

`getExn(value)` raises an exception if `null`, otherwise returns the value.

```rescript
Null.getExn(Null.make(3)) // 3
Null.getExn(null) /* Raises an Error */
```

#### Exceptions

- Raises `Invalid_argument` if `value` is `null`,

### let RescriptCore.Null.getUnsafe

> let getUnsafe: (. t<'a>) => 'a

`getUnsafe(value)` returns `value`.

#### Examples

```rescript
Null.getUnsafe(Null.make(3)) == 3
Null.getUnsafe(null) // Raises an error
```

#### Important

- This is an unsafe operation, it assumes `value` is not `null`.

### let RescriptCore.Null.forEach

> let forEach: (. t<'a>, (. 'a) => unit) => unit

`forEach(value, f)` call `f` on `value`. if `value` is not `null`, then if calls
`f`, otherwise returns `unit`.

#### Examples

```rescript
Null.forEach(Null.make("thing"), x => Console.log(x)) // logs "thing"
Null.forEach(null, x => Console.log(x)) // returns ()
```

### let RescriptCore.Null.map

> let map: (. t<'a>, (. 'a) => 'b) => t<'b>

`map(value, f)` returns `f(value)` if `value` is not `null`, otherwise returns
`value` unchanged.

#### Examples

```rescript
Null.map(Null.make(3), x => x * x) // Null.make(9)
Null.map(null, x => x * x) // null
```

### let RescriptCore.Null.mapOr

> let mapOr: (. t<'a>, 'b, (. 'a) => 'b) => 'b

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

**DEPRECATED: Use mapOr instead**

> let mapWithDefault: (. t<'a>, 'b, (. 'a) => 'b) => 'b

### let RescriptCore.Null.flatMap

> let flatMap: (. t<'a>, (. 'a) => t<'b>) => t<'b>

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

### type RescriptCore.Nullable.t

> type t<'a> = Js.Nullable.t<'a>

Type representing a nullable value.
A nullable value can be the value `'a`, `null` or `undefined`.

### let RescriptCore.Nullable.null

> let null: t<'a>

The value `null`.

See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.

#### Examples
```rescript
Console.log(Nullable.null) // Logs `null` to the console.
```

### let RescriptCore.Nullable.undefined

> let undefined: t<'a>

The value `undefined`.

See [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/undefined) on MDN.

#### Examples
```rescript
Console.log(undefined) // Logs `undefined` to the console.
```

### let RescriptCore.Nullable.make

> let make: (. 'a) => t<'a>

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

> let equal: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool

### let RescriptCore.Nullable.compare

> let compare: (.\n  t<'a>,\n  t<'b>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t

### let RescriptCore.Nullable.toOption

> let toOption: (. t<'a>) => option<'a>

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

> let fromOption: (. option<'a>) => t<'a>

Turns an `option` into a `Nullable.t`.

#### Examples
```rescript
let optString = Some("Hello")
let asNullable = optString->Nullable.fromOption // Nullable.t<string>
```

### let RescriptCore.Nullable.getOr

> let getOr: (. t<'a>, 'a) => 'a

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

**DEPRECATED: Use getOr instead**

> let getWithDefault: (. t<'a>, 'a) => 'a

### let RescriptCore.Nullable.getExn

> let getExn: (. t<'a>) => 'a

`getExn(value)` raises an exception if `null` or `undefined`, otherwise returns the value.

```rescript
Nullable.getExn(Nullable.make(3)) // 3
Nullable.getExn(Nullable.null) /* Raises an Error */
```

#### Exceptions

- Raises `Invalid_argument` if `value` is `null` or `undefined`

### let RescriptCore.Nullable.getUnsafe

> let getUnsafe: (. t<'a>) => 'a

`getUnsafe(value)` returns `value`.

#### Examples

```rescript
Nullable.getUnsafe(Nullable.make(3)) == 3
Nullable.getUnsafe(Nullable.null) // Raises an error
```

#### Important

- This is an unsafe operation, it assumes `value` is not `null` or `undefined`.

### let RescriptCore.Nullable.forEach

> let forEach: (. t<'a>, (. 'a) => unit) => unit

`forEach(value, f)` call `f` on `value`. if `value` is not `null` or `undefined`, 
then if calls `f`, otherwise returns `unit`.

#### Examples

```rescript
Nullable.forEach(Nullable.make("thing"), x => Console.log(x)) // logs "thing"
Nullable.forEach(Nullable.null, x => Console.log(x)) // returns ()
Nullable.forEach(undefined, x => Console.log(x)) // returns ()
```

### let RescriptCore.Nullable.map

> let map: (. t<'a>, (. 'a) => 'b) => t<'b>

`map(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,
otherwise returns `value` unchanged.

#### Examples

```rescript
Nullable.map(Nullable.make(3), x => x * x) // Nullable.make(9)
Nullable.map(undefined, x => x * x) // undefined
```

### let RescriptCore.Nullable.mapOr

> let mapOr: (. t<'a>, 'b, (. 'a) => 'b) => 'b

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

**DEPRECATED: Use mapOr instead**

> let mapWithDefault: (. t<'a>, 'b, (. 'a) => 'b) => 'b

### let RescriptCore.Nullable.flatMap

> let flatMap: (. t<'a>, (. 'a) => t<'b>) => t<'b>

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

> let empty: (. unit) => {..}

`empty` create a new object that inherits the properties and methods from the standard built-in Object, such as `toString`. See [Object on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object)

#### Examples

```rescript
let x = Object.empty()
x->Object.keysToArray->Array.length // 0
x->Object.get("toString")->Option.isSome // true
```

### let RescriptCore.Object.is

> let is: (. 'a, 'a) => bool

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

> let create: (. {..}) => {..}

`create` creates a new object, using an existing object as the prototype of the new object. See [Object.create on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)

**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object) and [records](https://rescript-lang.org/docs/manual/latest/record). This is often safer and more convenient than using `create` and other functions in this module.

#### Examples

```rescript
let x = {"fruit": "banana"}
let y = Object.create(x)
y->Object.get("fruit") // Some("banana")
```

### let RescriptCore.Object.createWithProperties

> let createWithProperties: (. {..}, {..}) => {..}

### let RescriptCore.Object.createWithNull

> let createWithNull: (. unit) => {..}

### let RescriptCore.Object.createWithNullAndProperties

> let createWithNullAndProperties: (. {..}) => {..}

### let RescriptCore.Object.assign

> let assign: (. {..}, {..}) => {..}

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

> let assignMany: (. {..}, array<{..}>) => {..}

`assignMany(target, sources)` copies enumerable own properties from each source to the target, overwriting properties with the same name. Later sources' properties overwrite earlier ones. It returns the modified target object. A deep clone is not created; properties are copied by reference.

**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object), including spreading one object into another. This is often more convenient than using `assign` or `assignMany`.  

See [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign).

### let RescriptCore.Object.copy

> let copy: (. ({..} as 'a)) => 'a

### let RescriptCore.Object.get

> let get: (. {..}, string) => option<'a>

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

> let getSymbol: (. {..}, Core__Symbol.t) => option<'a>

`getSymbol` gets the value of a property by symbol. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.

#### Examples

```rescript
let fruit = Symbol.make("fruit")
let x = Object.empty()
x->Object.setSymbol(fruit, "banana")
x->Object.getSymbol(fruit) // Some("banana")
```

### let RescriptCore.Object.getSymbolUnsafe

> let getSymbolUnsafe: (. {..}, Core__Symbol.t) => 'a

### let RescriptCore.Object.set

> let set: (. {..}, string, 'a) => unit

`set(name, value)` assigns a value to the named object property, overwriting the previous value if any. See [Working with Objects on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects#objects_and_properties)

#### Examples

```rescript
{"a": 1}->Object.set("a", 2) // {"a": 2}
{"a": 1}->Object.set("a", None) // {"a": None}
{"a": 1}->Object.set("b", 2) // {"a": 1, "b": 2}
```

### let RescriptCore.Object.setSymbol

> let setSymbol: (. {..}, Core__Symbol.t, 'a) => unit

### let RescriptCore.Object.keysToArray

> let keysToArray: (. {..}) => array<string>

`keysToArray` returns an array of an object's own enumerable string-keyed property names. See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.keys) 
or [Object.keys on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys).

#### Examples

```rescript
{"a": 1, "b": 2}->Object.keysToArray // ["a", "b"]
{"a": None}->Object.keysToArray // ["a"]
Object.empty()->Object.keysToArray // []
```

### let RescriptCore.Object.hasOwnProperty

> let hasOwnProperty: (. {..}, string) => bool

`hasOwnProperty` determines whether the object has the specified property as its **own** property, as opposed to inheriting it. See [hasOwnProperty on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty)

#### Examples

```rescript
let point = {"x": 1, "y": 2}
{"a": 1}->hasOwnProperty("a") // true
{"a": 1}->hasOwnProperty("b") // false
{"a": 1}->hasOwnProperty("toString") // false
```

### let RescriptCore.Object.seal

> let seal: (. ({..} as 'a)) => 'a

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

> let preventExtensions: (. ({..} as 'a)) => 'a

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

> let freeze: (. ({..} as 'a)) => 'a

`freeze` freezes an object. Freezing an object makes existing properties non-writable and prevents extensions. Once an object is frozen, new properties cannot be be added, existing properties cannot be removed, and their values cannot be changed.

**Note:** `freeze` returns the same object that was passed in; it does not create a frozen copy. Any attempt to change a frozen object will fail, either silently or by throwing an exception.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).

#### Examples

```rescript
let obj = {"a": 1}
obj->Object.set("a", 2) // succeeds
obj->Object.freeze->ignore
obj->Object.set("a", 3) // fails
```

### let RescriptCore.Object.isSealed

> let isSealed: (. 'a) => bool

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

> let isFrozen: (. 'a) => bool

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

> let isExtensible: (. 'a) => bool

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

> type t = float

### let RescriptCore.Ordering.less

> let less: float

### let RescriptCore.Ordering.equal

> let equal: float

### let RescriptCore.Ordering.greater

> let greater: float

### let RescriptCore.Ordering.isLess

> let isLess: (. float) => bool

### let RescriptCore.Ordering.isEqual

> let isEqual: (. float) => bool

### let RescriptCore.Ordering.isGreater

> let isGreater: (. float) => bool

### let RescriptCore.Ordering.invert

> let invert: (. float) => float

### let RescriptCore.Ordering.fromInt

> let fromInt: (. int) => float

## module RescriptCore.Promise `alias`

### type RescriptCore.Promise.t

> type t<'a> = promise<'a>

### let RescriptCore.Promise.resolve

> let resolve: (. 'a) => t<'a>

`resolve(value)` creates a resolved Promise with a given `value`.
See [`Promise.resolve`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve) on MDN.

#### Examples

```rescript
let p = Promise.resolve(5) // promise<int>
```

### let RescriptCore.Promise.reject

> let reject: (. exn) => t<'a>

`reject(exn)` reject a Promise.
See [`Promise.reject`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/reject) on MDN.

#### Examples

```rescript
exception TestError(string)

let p = Promise.reject(TestError("some rejected value"))
```

### let RescriptCore.Promise.make

> let make: (. (. (. 'a) => unit, (. 'e) => unit) => unit) => t<'a>

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

> let catch: (. t<'a>, (. exn) => t<'a>) => t<'a>

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

> let then: (. t<'a>, (. 'a) => t<'b>) => t<'b>

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

> let thenResolve: (. t<'a>, (. 'a) => 'b) => t<'b>

`thenResolve(promise, callback)` converts an encapsulated value of a promise
into another promise wrapped value. It is **not allowed** to return a promise
within the provided callback (e.g. `thenResolve(value => resolve(value))`).

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

> let finally: (. t<'a>, (. unit) => unit) => t<'a>

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

> let race: (. array<t<'a>>) => t<'a>

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

> let all: (. array<t<'a>>) => t<array<'a>>

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

> let all2: (. (t<'a>, t<'b>)) => t<('a, 'b)>

`all2((p1, p2))`. Like `all()`, but with a fixed size tuple of 2

### let RescriptCore.Promise.all3

> let all3: (. (t<'a>, t<'b>, t<'c>)) => t<('a, 'b, 'c)>

`all3((p1, p2, p3))`. Like `all()`, but with a fixed size tuple of 3

### let RescriptCore.Promise.all4

> let all4: (. (t<'a>, t<'b>, t<'c>, t<'d>)) => t<('a, 'b, 'c, 'd)>

`all4((p1, p2, p3, p4))`. Like `all()`, but with a fixed size tuple of 4

### let RescriptCore.Promise.all5

> let all5: (.\n  (t<'a>, t<'b>, t<'c>, t<'d>, t<'e>),\n) => t<('a, 'b, 'c, 'd, 'e)>

`all5((p1, p2, p3, p4, p5))`. Like `all()`, but with a fixed size tuple of 5

### let RescriptCore.Promise.all6

> let all6: (.\n  (t<'a>, t<'b>, t<'c>, t<'d>, t<'e>, t<'f>),\n) => t<('a, 'b, 'c, 'd, 'e, 'f)>

`all6((p1, p2, p4, p5, p6))`. Like `all()`, but with a fixed size tuple of 6
")

### let RescriptCore.Promise.done

> let done: (. promise<'a>) => unit

`done(p)` is a safe way to ignore a promise. If a value is anything else than a
promise, it will raise a type error.

## module RescriptCore.RegExp `alias`

### type RescriptCore.RegExp.t

> type t = Js.Re.t

Type representing an instantiated `RegExp`.

## module RescriptCore.RegExp.Result

### type RescriptCore.RegExp.Result.t

> type t = array<string>

Type representing the result of a `RegExp` execution.

### let RescriptCore.RegExp.Result.fullMatch

> let fullMatch: (. t) => string

`fullMatch(regExpResult)` returns the full string that matched in this result.

#### Examples
```rescript
// Match the first two words separated by a space
let regexp = RegExp.fromString("(\\w+) (\\w+)")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints the full string that matched, "ReScript is"
}
```

### let RescriptCore.RegExp.Result.matches

> let matches: (. t) => array<string>

`matches(regExpResult)` returns all matches for `regExpResult`.

#### Examples
```rescript
// Match the first two words separated by a space
let regexp = RegExp.fromString("(\\w+) (\\w+)")

// This below will log "ReScript" and "is" to the console.
switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => switch result->RegExp.Result.matches {
| [firstWord, secondWord] => Console.log2(firstWord, secondWord)
| _ => Console.log("Didn't find exactly two words...")
}
}
```

### let RescriptCore.RegExp.Result.index

> let index: (. t) => int

### let RescriptCore.RegExp.Result.input

> let input: (. t) => string

`input(regExpResult)` returns the full input string that was passed to what produced the `RegExp.Result.t`.

#### Examples
```rescript
// Match the first two words separated by a space
let regexp = RegExp.fromString("(\\w+) (\\w+)")

// This below will log the full input string "ReScript is pretty cool, right?" to the console.
switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.input)
}
```

### let RescriptCore.RegExp.fromString

> let fromString: (. string) => t

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

> let fromStringWithFlags: (. string, ~flags: string) => t

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

> let test: (. t, string) => bool

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

> let exec: (. t, string) => option<Result.t>

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

> let lastIndex: (. t) => int

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

> let ignoreCase: (. t) => bool

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

> let global: (. t) => bool

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

> let multiline: (. t) => bool

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

> let source: (. t) => string

`source(regexp)` returns the source text for this `RegExp`, without the two forward slashes (if present), and without any set flags.

See [`RegExp.source`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) on MDN.

#### Examples
```rescript
let regexp = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp->RegExp.source) // Logs `\w+`, the source text of the `RegExp`
```

### let RescriptCore.RegExp.sticky

> let sticky: (. t) => bool

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

> let unicode: (. t) => bool

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

### let RescriptCore.String.make

> let make: (. 'a) => string

`make(value)` converts the given value to a `string`.

#### Examples

```rescript
String.make(3.5) == "3.5"
String.make([1, 2, 3]) == "1,2,3"
```

### let RescriptCore.String.fromCharCode

> let fromCharCode: (. int) => string

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

> let fromCharCodeMany: (. array<int>) => string

`fromCharCodeMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given numbers, using the same rules as `fromCharCode`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode) on MDN.

#### Examples

```rescript
String.fromCharCodeMany([189, 43, 190, 61]) == "½+¾="
String.fromCharCode([65, 66, 67]) == "ABC"
```

### let RescriptCore.String.fromCodePoint

> let fromCodePoint: (. int) => string

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

> let fromCodePointMany: (. array<int>) => string

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

> let equal: (. string, string) => bool

### let RescriptCore.String.compare

> let compare: (. string, string) => Core__Ordering.t

### let RescriptCore.String.length

> let length: (. string) => int

`length(str)` returns the length of the given `string`.
See [`String.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) on MDN.

#### Examples

```rescript
String.length("abcd") == 4
```

### let RescriptCore.String.get

> let get: (. string, int) => option<string>

`get(str, index)` returns an `option<string>` at the given `index` number. If
`index` is out of range, this function returns `None`.

#### Examples

```rescript
String.get("ReScript", 0) == Some("R")
String.get("Hello", 4) == Some("o")
String.get(`JS`, 4) == None
```

### let RescriptCore.String.charAt

> let charAt: (. string, int) => string

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

> let charCodeAt: (. string, int) => float

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

> let codePointAt: (. string, int) => option<int>

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

> let concat: (. string, string) => string

`concat(original, append)` returns a new `string` with `append` added after
`original`.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat) on MDN.

#### Examples

```rescript
String.concat("cow", "bell") == "cowbell"
String.concat("Re", "Script") == "ReScript"
```

### let RescriptCore.String.concatMany

> let concatMany: (. string, array<string>) => string

`concatMany(original, arr)` returns a new `string` consisting of each item of an
array of strings added to the `original` string.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat) on MDN.

#### Examples

```rescript
String.concatMany("1st", ["2nd", "3rd", "4th"]) == "1st2nd3rd4th"
```

### let RescriptCore.String.endsWith

> let endsWith: (. string, string) => bool

`endsWith(str, substr)` returns `true` if the `str` ends with `substr`, `false`
otherwise.
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith) on MDN.

#### Examples

```rescript
String.endsWith("BuckleScript", "Script") == true
String.endsWith("BuckleShoes", "Script") == false
```

### let RescriptCore.String.endsWithFrom

> let endsWithFrom: (. string, string, int) => bool

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

> let includes: (. string, string) => bool

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

> let includesFrom: (. string, string, int) => bool

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

> let indexOf: (. string, string) => int

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

> let indexOfOpt: (. string, string) => option<int>

`indexOfOpt(str, searchValue)`. Like `indexOf`, but return an `option<int>`.

#### Examples

```rescript
String.indexOf("bookseller", "ok") == Some(2)
String.indexOf("bookseller", "xyz") == None
```

### let RescriptCore.String.indexOfFrom

> let indexOfFrom: (. string, string, int) => int

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

> let lastIndexOf: (. string, string) => int

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

> let lastIndexOfOpt: (. string, string) => option<int>

`lastIndexOfOpt(str, searchValue)`. Like `lastIndexOfOpt`, but return an
`option<int>`.

#### Examples

```rescript
String.lastIndexOf("bookseller", "ok") == Some(2)
String.lastIndexOf("beekeeper", "ee") == Some(4)
String.lastIndexOf("abcdefg", "xyz") == None
```

### let RescriptCore.String.lastIndexOfFrom

> let lastIndexOfFrom: (. string, string, int) => int

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

> let match: (. string, Core__RegExp.t) => option<Core__RegExp.Result.t>

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

> let normalize: (. string) => string

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

> type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]

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

> let normalizeByForm: (. string, normalizeForm) => string

### let RescriptCore.String.repeat

> let repeat: (. string, int) => string

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

> let replace: (. string, string, string) => string

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

> let replaceRegExp: (. string, Core__RegExp.t, string) => string

`replaceRegExp(str, regex, replacement)` returns a new `string` where
occurrences matching regex have been replaced by `replacement`.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

#### Examples

```rescript
String.replaceRegExp("vowels be gone", %re("/[aeiou]/g"), "x") == "vxwxls bx gxnx"
String.replaceRegExp("Juan Fulano", %re("/(\w+) (\w+)/"), "$2, $1") == "Fulano, Juan"
```

### let RescriptCore.String.unsafeReplaceRegExpBy0

> let unsafeReplaceRegExpBy0: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string

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

> let unsafeReplaceRegExpBy1: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~group1: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string

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

> let unsafeReplaceRegExpBy2: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~group1: string,\n    ~group2: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string

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

> let unsafeReplaceRegExpBy3: (.\n  string,\n  Core__RegExp.t,\n  (.\n    ~match: string,\n    ~group1: string,\n    ~group2: string,\n    ~group3: string,\n    ~offset: int,\n    ~input: string,\n  ) => string,\n) => string

`unsafeReplaceRegExpBy3(str, regexp, f)`. Like `unsafeReplaceRegExpBy1`, but `f`
has three group parameters.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) on MDN.

### let RescriptCore.String.search

> let search: (. string, Core__RegExp.t) => int

`search(str, regexp)` returns the starting position of the first match of
`regexp` in the given `str`, or -1 if there is no match.
See [`String.search`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search) on MDN.

#### Examples

```rescript
String.search("testing 1 2 3", %re("/\d+/")) == 8
String.search("no numbers", %re("/\d+/")) == -1
```

### let RescriptCore.String.searchOpt

> let searchOpt: (. string, Core__RegExp.t) => option<int>

`searchOpt(str, regexp)`. Like `search`, but return an `option<int>`.

#### Examples

```rescript
String.search("testing 1 2 3", %re("/\d+/")) == Some(8)
String.search("no numbers", %re("/\d+/")) == None
```

### let RescriptCore.String.slice

> let slice: (. string, ~start: int, ~end: int) => string

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

> let sliceToEnd: (. string, ~start: int) => string

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

> let split: (. string, string) => array<string>

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

> let splitAtMost: (. string, string, ~limit: int) => array<string>

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

> let splitByRegExp: (. string, Core__RegExp.t) => array<option<string>>

`splitByRegExp(str, regexp)` splits the given `str` at every occurrence of
`regexp` and returns an array of the resulting substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) on MDN.

#### Examples

```rescript
String.splitByRegExp("Jan,Feb,Mar", %re("/,/")) == [Some("Jan"), Some("Feb"), Some("Mar")]
```

### let RescriptCore.String.splitByRegExpAtMost

> let splitByRegExpAtMost: (.\n  string,\n  Core__RegExp.t,\n  ~limit: int,\n) => array<option<string>>

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

> let startsWith: (. string, string) => bool

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

> let startsWithFrom: (. string, string, int) => bool

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

> let substring: (. string, ~start: int, ~end: int) => string

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

> let substringToEnd: (. string, ~start: int) => string

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

> let toLowerCase: (. string) => string

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

> let toLocaleLowerCase: (. string) => string

`toLocaleLowerCase(str)` converts `str` to lower case using the current locale.
See [`String.toLocaleLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleLowerCase) on MDN.

### let RescriptCore.String.toUpperCase

> let toUpperCase: (. string) => string

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

> let toLocaleUpperCase: (. string) => string

`toLocaleUpperCase(str)` converts `str` to upper case using the current locale.
See [`String.toLocaleUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleUpperCase) on MDN.

### let RescriptCore.String.trim

> let trim: (. string) => string

`trim(str)` returns a string that is `str` with whitespace stripped from both
ends. Internal whitespace is not removed.
See [`String.trim`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim) on MDN.

#### Examples

```rescript
String.trim("   abc def   ") == "abc def"
String.trim("\n\r\t abc def \n\n\t\r ") == "abc def"
```

### let RescriptCore.String.trimStart

> let trimStart: (. string) => string

`trimStart(str)` returns a string that is `str` with whitespace stripped from
the beginning of a string. Internal whitespace is not removed.
See [`String.trimStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart) on MDN.

#### Examples

```rescript
String.trimStart("   Hello world!   ") == "Hello world!   "
String.trimStart("   Hello   world!   ") == "Hello   world!   "
```

### let RescriptCore.String.trimEnd

> let trimEnd: (. string) => string

`trinEnd(str)` returns a string that is `str` with whitespace stripped from the
end of a string. Internal whitespace is not removed.
See [`String.trimEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd) on MDN.

#### Examples

```rescript
String.trimEnd("   Hello world!   ") == "   Hello world!"
String.trimEnd("   Hello   world!   ") == "   Hello   world!"
```

### let RescriptCore.String.padStart

> let padStart: (. string, int, string) => string

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

> let padEnd: (. string, int, string) => string

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

> let getSymbol: (. string, Core__Symbol.t) => option<'a>

### let RescriptCore.String.getSymbolUnsafe

> let getSymbolUnsafe: (. string, Core__Symbol.t) => 'a

### let RescriptCore.String.setSymbol

> let setSymbol: (. string, Core__Symbol.t, 'a) => unit

### let RescriptCore.String.localeCompare

> let localeCompare: (. string, string) => float

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

> type t = Js.Types.symbol

### let RescriptCore.Symbol.make

> let make: (. string) => t

### let RescriptCore.Symbol.getFor

> let getFor: (. string) => t

### let RescriptCore.Symbol.keyFor

> let keyFor: (. t) => option<string>

### let RescriptCore.Symbol.asyncIterator

> let asyncIterator: t

### let RescriptCore.Symbol.hasInstance

> let hasInstance: t

### let RescriptCore.Symbol.isConcatSpreadable

> let isConcatSpreadable: t

### let RescriptCore.Symbol.iterator

> let iterator: t

### let RescriptCore.Symbol.match

> let match: t

### let RescriptCore.Symbol.matchAll

> let matchAll: t

### let RescriptCore.Symbol.replace

> let replace: t

### let RescriptCore.Symbol.search

> let search: t

### let RescriptCore.Symbol.species

> let species: t

### let RescriptCore.Symbol.split

> let split: t

### let RescriptCore.Symbol.toPrimitive

> let toPrimitive: t

### let RescriptCore.Symbol.toStringTag

> let toStringTag: t

### let RescriptCore.Symbol.unscopables

> let unscopables: t

## module RescriptCore.Type `alias`

### type RescriptCore.Type.t

> type t = [\n  | #bigint\n  | #boolean\n  | #function\n  | #number\n  | #object\n  | #string\n  | #symbol\n  | #undefined\n]

The possible types of JavaScript values.

### let RescriptCore.Type.typeof

> let typeof: (. 'a) => t

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

> type function

An abstract type representing a JavaScript function.

See [`function`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) on MDN.

### type RescriptCore.Type.Classify.object

> type object

An abstract type representing a JavaScript object.

See [`object`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) on MDN.

### type RescriptCore.Type.Classify.t

> type t =\n  | Bool(bool)\n  | Null\n  | Undefined\n  | String(string)\n  | Number(float)\n  | Object(object)\n  | Function(function)\n  | Symbol(Core__Symbol.t)\n  | BigInt(Core__BigInt.t)

The type representing a classified JavaScript value.

### let RescriptCore.Type.Classify.classify

> let classify: (. 'a) => t

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

### type RescriptCore.JSON.t

> type t = Js.Json.t

A type representing a JSON object.

### let RescriptCore.JSON.parseExn

> let parseExn: (. string) => t

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

> let parseExnWithReviver: (. string, (. string, t) => t) => t

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

> let stringify: (. t) => string

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

> let stringifyWithIndent: (. t, int) => string

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

> let stringifyWithReplacer: (. t, (. string, t) => t) => string

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

> let stringifyWithReplacerAndIndent: (. t, (. string, t) => t, int) => string

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

> let stringifyWithFilter: (. t, array<string>) => string

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

> let stringifyWithFilterAndIndent: (. t, array<string>, int) => string

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

> let stringifyAny: (. 'a) => option<string>

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

> let stringifyAnyWithIndent: (. 'a, int) => option<string>

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

> let stringifyAnyWithReplacer: (. 'a, (. string, t) => t) => option<string>

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

> let stringifyAnyWithReplacerAndIndent: (. 'a, (. string, t) => t, int) => option<string>

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

> let stringifyAnyWithFilter: (. 'a, array<string>) => string

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

> let stringifyAnyWithFilterAndIndent: (. 'a, array<string>, int) => string

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

> type t =\n  | Bool(bool)\n  | Null\n  | String(string)\n  | Number(float)\n  | Object(Core__Dict.t<t>)\n  | Array(array<t>)

A type representing a JavaScript type.

### let RescriptCore.JSON.Classify.classify

> let classify: (. 'a) => t

Returns the JSON type of any value.

#### Examples
```rescript
JSON.Classify.classify("hello world")
// String("hello world")

JSON.Classify.classify(42)
// Number(42)
```

## module RescriptCore.JSON.Encode

### let RescriptCore.JSON.Encode.bool

> let bool: (. bool) => t

Returns a boolean as a JSON object.

#### Examples
```rescript
JSON.Encode.bool(true)
```

### let RescriptCore.JSON.Encode.null

> let null: t

Returns null as a JSON object.

#### Examples
```rescript
JSON.Encode.null
```

### let RescriptCore.JSON.Encode.string

> let string: (. string) => t

Returns a string as a JSON object.

#### Examples
```rescript
JSON.Encode.string("hello world")
```

### let RescriptCore.JSON.Encode.int

> let int: (. int) => t

Returns an int as a JSON object.

#### Examples
```rescript
JSON.Encode.int(42)
```

### let RescriptCore.JSON.Encode.float

> let float: (. float) => t

Returns a float as a JSON object.

#### Examples
```rescript
JSON.Encode.float(42.0)
```

### let RescriptCore.JSON.Encode.object

> let object: (. Core__Dict.t<t>) => t

Returns a dict as a JSON object.

#### Examples
```rescript
let dict = Dict.fromArray([
("foo", JSON.Encode.string("bar")),
("hello", JSON.Encode.string("world")),
])

JSON.Encode.object(dict)
```

### let RescriptCore.JSON.Encode.array

> let array: (. array<t>) => t

Returns an array as a JSON object.

#### Examples
```rescript
let array = [JSON.Encode.string("hello world"), JSON.Encode.int(42)]

JSON.Encode.array(array)
```

## module RescriptCore.JSON.Decode

### let RescriptCore.JSON.Decode.bool

> let bool: (. t) => option<bool>

Decodes a single JSON value. If the value is a bool, it will return `Some(bool)` - otherwise it will return `None`.

#### Examples
```rescript
JSON.parseExn(`true`)->JSON.Decode.bool
// Some(true)

JSON.parseExn(`"hello world"`)->JSON.Decode.bool
// None
```

### let RescriptCore.JSON.Decode.null

> let null: (. t) => option<Core__Null.t<'a>>

Decodes a single JSON value. If the value is null, it will return `Some(Null.t)` - otherwise it will return `None`.

#### Examples
```rescript
JSON.parseExn(`null`)->JSON.Decode.null
// Some(null)

JSON.parseExn(`"hello world"`)->JSON.Decode.null
// None
```

### let RescriptCore.JSON.Decode.string

> let string: (. t) => option<string>

Decodes a single JSON value. If the value is a string, it will return `Some(string)` - otherwise it will return `None`.

#### Examples
```rescript
JSON.parseExn(`"hello world"`)->JSON.Decode.string
// Some("hello world")

JSON.parseExn(`42`)->JSON.Decode.string
// None 
```

### let RescriptCore.JSON.Decode.float

> let float: (. t) => option<float>

Decodes a single JSON value. If the value is a float, it will return `Some(float)` - otherwise it will return `None`.

#### Examples
```rescript
JSON.parseExn(`42.0`)->JSON.Decode.float
// Some(42.0)

JSON.parseExn(`"hello world"`)->JSON.Decode.float
// None
```

### let RescriptCore.JSON.Decode.object

> let object: (. t) => option<Core__Dict.t<t>>

Decodes a single JSON value. If the value is an object, it will return `Some(Dict.t)` - otherwise it will return `None`.

#### Examples
```rescript
JSON.parseExn(`{"foo":"bar"}`)->JSON.Decode.object
// Some({ foo: 'bar' })

JSON.parseExn(`"hello world"`)->JSON.Decode.object
// None
```

### let RescriptCore.JSON.Decode.array

> let array: (. t) => option<array<t>>

Decodes a single JSON value. If the value is an array, it will return `Some(array)` - otherwise it will return `None`.

#### Examples
```rescript
JSON.parseExn(`["foo", "bar"]`)->JSON.Decode.array
// Some([ 'foo', 'bar' ])

JSON.parseExn(`"hello world"`)->JSON.Decode.array
// None
```

## module RescriptCore.Iterator `alias`

### type RescriptCore.Iterator.t

> type t<'a>

The type representing an iterator.

### type RescriptCore.Iterator.value

> type value<'a> = {done: bool, value: option<'a>}

The current value of an iterator.

### let RescriptCore.Iterator.next

> let next: (. t<'a>) => value<'a>

Returns the next value of the iterator, if any.

See [iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) on MDN.

#### Examples
```rescript
// Pulls out the next value of the iterator
let {done, value} = someIterator->Iterator.next
```

### let RescriptCore.Iterator.toArray

> let toArray: (. t<'a>) => array<'a>

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

> let toArrayWithMapper: (. t<'a>, (. 'a) => 'b) => array<'b>

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

### type RescriptCore.AsyncIterator.t

> type t<'a>

The type representing an async iterator.

### type RescriptCore.AsyncIterator.value

> type value<'a> = {done: bool, value: option<'a>}

### let RescriptCore.AsyncIterator.next

> let next: (. t<'a>) => promise<value<'a>>

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

### type RescriptCore.Map.t

> type t<'k, 'v> = Js.Map.t<'k, 'v>

Type representing an instance of `Map`.

### let RescriptCore.Map.make

> let make: (. unit) => t<'k, 'v>

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

> let fromArray: (. array<('k, 'v)>) => t<'k, 'v>

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

> let fromIterator: (. Core__Iterator.t<('k, 'v)>) => t<'k, 'v>

Turns an iterator in the shape of `('key, 'value)` into a `Map`.

#### Examples
```rescript
// Let's pretend we have an interator in the correct shape
@val external someIterator: Iterator.t<(string, int)> = "someIterator"

let map = Map.fromIterator(someIterator) // Map.t<string, int>
```

### let RescriptCore.Map.size

> let size: (. t<'k, 'v>) => int

Returns the size, the number of key/value pairs, of the map.

#### Examples
```rescript
let map = Map.make()

map->Map.set("someKey", "someValue")

let size = map->Map.size // 1
```

### let RescriptCore.Map.clear

> let clear: (. t<'k, 'v>) => unit

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

> let forEach: (. t<'k, 'v>, (. 'v) => unit) => unit

Iterates through all values of the map.

> Please note that this is *without the keys*, just the values. If you need the key as well, use `Map.forEachWithKey`.

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

> let forEachWithKey: (. t<'k, 'v>, (. 'v, 'k) => unit) => unit

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

> let get: (. t<'k, 'v>, 'k) => option<'v>

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

> let has: (. t<'k, 'v>, 'k) => bool

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

> let set: (. t<'k, 'v>, 'k, 'v) => unit

Sets the provided `value` to the provided `key`.

#### Examples
```rescript
let map = Map.make()
map->Map.set("someKey", "someValue")
```

### let RescriptCore.Map.delete

> let delete: (. t<'k, 'v>, 'k) => bool

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

> let keys: (. t<'k, 'v>) => Core__Iterator.t<'k>

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

> let values: (. t<'k, 'v>) => Core__Iterator.t<'v>

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

> let entries: (. t<'k, 'v>) => Core__Iterator.t<('k, 'v)>

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

> type t<'k, 'v> = Js.WeakMap.t<'k, 'v>

### let RescriptCore.WeakMap.make

> let make: (. unit) => t<'k, 'v>

### let RescriptCore.WeakMap.get

> let get: (. t<'k, 'v>, 'k) => option<'v>

### let RescriptCore.WeakMap.has

> let has: (. t<'k, 'v>, 'k) => bool

### let RescriptCore.WeakMap.set

> let set: (. t<'k, 'v>, 'k, 'v) => t<'k, 'v>

### let RescriptCore.WeakMap.delete

> let delete: (. t<'k, 'v>, 'k) => bool

## module RescriptCore.Set `alias`

### type RescriptCore.Set.t

> type t<'a> = Js.Set.t<'a>

Type representing an instance of `Set`.

### let RescriptCore.Set.make

> let make: (. unit) => t<'a>

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

> let fromArray: (. array<'a>) => t<'a>

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

> let fromIterator: (. Core__Iterator.t<'a>) => t<'a>

Turns an iterator into a `Set`.

#### Examples
```rescript
// Let's pretend we have an interator
@val external someIterator: Iterator.t<int> = "someIterator"

let set = Set.fromIterator(someIterator) // Set.t<int>
```

### let RescriptCore.Set.size

> let size: (. t<'a>) => int

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

> let clear: (. t<'a>) => unit

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

> let add: (. t<'a>, 'a) => unit

Adds a new value to the set.

#### Examples
```rescript
let set = Set.make()
set->Set.add("someValue")
```

### let RescriptCore.Set.delete

> let delete: (. t<'a>, 'a) => bool

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

> let has: (. t<'a>, 'a) => bool

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

> let forEach: (. t<'a>, (. 'a) => unit) => unit

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

> let values: (. t<'a>) => Core__Iterator.t<'a>

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

> type t<'a> = Js.WeakSet.t<'a>

### let RescriptCore.WeakSet.make

> let make: (. unit) => t<'a>

### let RescriptCore.WeakSet.add

> let add: (. t<'a>, 'a) => t<'a>

### let RescriptCore.WeakSet.delete

> let delete: (. t<'a>, 'a) => bool

### let RescriptCore.WeakSet.has

> let has: (. t<'a>, 'a) => bool

## module RescriptCore.ArrayBuffer `alias`

### type RescriptCore.ArrayBuffer.t

> type t = Js.TypedArray2.ArrayBuffer.t

### let RescriptCore.ArrayBuffer.make

> let make: (. int) => t

### let RescriptCore.ArrayBuffer.byteLength

> let byteLength: (. t) => int

### let RescriptCore.ArrayBuffer.slice

> let slice: (. t, ~start: int, ~end: int) => t

### let RescriptCore.ArrayBuffer.sliceToEnd

> let sliceToEnd: (. t, ~start: int) => t

## module RescriptCore.TypedArray `alias`

### type RescriptCore.TypedArray.t

> type t<'a>

### let RescriptCore.TypedArray.get

> let get: (. t<'a>, int) => option<'a>

### let RescriptCore.TypedArray.set

> let set: (. t<'a>, int, 'a) => unit

### let RescriptCore.TypedArray.buffer

> let buffer: (. t<'a>) => Core__ArrayBuffer.t

### let RescriptCore.TypedArray.byteLength

> let byteLength: (. t<'a>) => int

### let RescriptCore.TypedArray.byteOffset

> let byteOffset: (. t<'a>) => int

### let RescriptCore.TypedArray.setArray

> let setArray: (. t<'a>, array<'a>) => unit

### let RescriptCore.TypedArray.setArrayFrom

> let setArrayFrom: (. t<'a>, array<'a>, int) => unit

### let RescriptCore.TypedArray.length

> let length: (. t<'a>) => int

### let RescriptCore.TypedArray.copyAllWithin

> let copyAllWithin: (. t<'a>, ~target: int) => array<'a>

### let RescriptCore.TypedArray.copyWithinToEnd

> let copyWithinToEnd: (. t<'a>, ~target: int, ~start: int) => array<'a>

### let RescriptCore.TypedArray.copyWithin

> let copyWithin: (. t<'a>, ~target: int, ~start: int, ~end: int) => array<'a>

### let RescriptCore.TypedArray.fillAll

> let fillAll: (. t<'a>, 'a) => t<'a>

### let RescriptCore.TypedArray.fillToEnd

> let fillToEnd: (. t<'a>, 'a, ~start: int) => t<'a>

### let RescriptCore.TypedArray.fill

> let fill: (. t<'a>, 'a, ~start: int, ~end: int) => t<'a>

### let RescriptCore.TypedArray.reverse

> let reverse: (. t<'a>) => unit

### let RescriptCore.TypedArray.toReversed

> let toReversed: (. t<'a>) => t<'a>

### let RescriptCore.TypedArray.sort

> let sort: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => unit

### let RescriptCore.TypedArray.toSorted

> let toSorted: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => t<'a>

### let RescriptCore.TypedArray.with

> let with: (. t<'a>, int, 'a) => t<'a>

### let RescriptCore.TypedArray.includes

> let includes: (. t<'a>, 'a) => bool

### let RescriptCore.TypedArray.indexOf

> let indexOf: (. t<'a>, 'a) => int

### let RescriptCore.TypedArray.indexOfFrom

> let indexOfFrom: (. t<'a>, 'a, int) => int

### let RescriptCore.TypedArray.joinWith

> let joinWith: (. t<'a>, string) => string

### let RescriptCore.TypedArray.lastIndexOf

> let lastIndexOf: (. t<'a>, 'a) => int

### let RescriptCore.TypedArray.lastIndexOfFrom

> let lastIndexOfFrom: (. t<'a>, 'a, int) => int

### let RescriptCore.TypedArray.slice

> let slice: (. t<'a>, ~start: int, ~end: int) => t<'a>

### let RescriptCore.TypedArray.sliceToEnd

> let sliceToEnd: (. t<'a>, ~start: int) => t<'a>

### let RescriptCore.TypedArray.copy

> let copy: (. t<'a>) => t<'a>

### let RescriptCore.TypedArray.subarray

> let subarray: (. t<'a>, ~start: int, ~end: int) => t<'a>

### let RescriptCore.TypedArray.subarrayToEnd

> let subarrayToEnd: (. t<'a>, ~start: int) => t<'a>

### let RescriptCore.TypedArray.toString

> let toString: (. t<'a>) => string

### let RescriptCore.TypedArray.toLocaleString

> let toLocaleString: (. t<'a>) => string

### let RescriptCore.TypedArray.every

> let every: (. t<'a>, (. 'a) => bool) => bool

### let RescriptCore.TypedArray.everyWithIndex

> let everyWithIndex: (. t<'a>, (. 'a, int) => bool) => bool

### let RescriptCore.TypedArray.filter

> let filter: (. t<'a>, (. 'a) => bool) => t<'a>

### let RescriptCore.TypedArray.filterWithIndex

> let filterWithIndex: (. t<'a>, (. 'a, int) => bool) => t<'a>

### let RescriptCore.TypedArray.find

> let find: (. t<'a>, (. 'a) => bool) => option<'a>

### let RescriptCore.TypedArray.findWithIndex

> let findWithIndex: (. t<'a>, (. 'a, int) => bool) => option<'a>

### let RescriptCore.TypedArray.findIndex

> let findIndex: (. t<'a>, (. 'a) => bool) => int

### let RescriptCore.TypedArray.findIndexWithIndex

> let findIndexWithIndex: (. t<'a>, (. 'a, int) => bool) => int

### let RescriptCore.TypedArray.forEach

> let forEach: (. t<'a>, (. 'a) => unit) => unit

### let RescriptCore.TypedArray.forEachWithIndex

> let forEachWithIndex: (. t<'a>, (. 'a, int) => unit) => unit

### let RescriptCore.TypedArray.map

> let map: (. t<'a>, (. 'a) => 'b) => t<'b>

### let RescriptCore.TypedArray.mapWithIndex

> let mapWithIndex: (. t<'a>, (. 'a, int) => 'b) => t<'b>

### let RescriptCore.TypedArray.reduce

> let reduce: (. t<'a>, (. 'b, 'a) => 'b, 'b) => 'b

### let RescriptCore.TypedArray.reduceWithIndex

> let reduceWithIndex: (. t<'a>, (. 'b, 'a, int) => 'b, 'b) => 'b

### let RescriptCore.TypedArray.reduceRight

> let reduceRight: (. t<'a>, (. 'b, 'a) => 'b, 'b) => 'b

### let RescriptCore.TypedArray.reduceRightWithIndex

> let reduceRightWithIndex: (. t<'a>, (. 'b, 'a, int) => 'b, 'b) => 'b

### let RescriptCore.TypedArray.some

> let some: (. t<'a>, (. 'a) => bool) => bool

### let RescriptCore.TypedArray.someWithIndex

> let someWithIndex: (. t<'a>, (. 'a, int) => bool) => bool

## module RescriptCore.Float32Array `alias`

### type RescriptCore.Float32Array.t

> type t = Core__TypedArray.t<float>

The `Float32Array` typed array represents an array of 32-bit floating point numbers in platform byte order. See [Float32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array)

## module RescriptCore.Float32Array.Constants

### let RescriptCore.Float32Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Float32Array.fromArray

> let fromArray: (. array<float>) => t

`fromArray` creates a `Float32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

### let RescriptCore.Float32Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Float32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Float32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Float32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Float32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array/Float32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float32Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Float32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Float32Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => float) => t

`fromArrayLikeOrIterableWithMap` creates a `Float32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Float64Array `alias`

### type RescriptCore.Float64Array.t

> type t = Core__TypedArray.t<float>

The `Float64Array` typed array represents an array of 64-bit floating point numbers in platform byte order. See [Float64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array)

## module RescriptCore.Float64Array.Constants

### let RescriptCore.Float64Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Float64Array.fromArray

> let fromArray: (. array<float>) => t

`fromArray` creates a `Float64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

### let RescriptCore.Float64Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Float64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Float64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Float64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Float64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float64Array/Float64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Float64Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Float64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Float64Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => float) => t

`fromArrayLikeOrIterableWithMap` creates a `Float64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Int8Array `alias`

### type RescriptCore.Int8Array.t

> type t = Core__TypedArray.t<int>

The `Int8Array` typed array represents an array of twos-complement 8-bit signed integers. See [Int8Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array)

## module RescriptCore.Int8Array.Constants

### let RescriptCore.Int8Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Int8Array.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Int8Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

### let RescriptCore.Int8Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Int8Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Int8Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Int8Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Int8Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int8Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Int8Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Int8Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Int8Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Int16Array `alias`

### type RescriptCore.Int16Array.t

> type t = Core__TypedArray.t<int>

The `Int16Array` typed array represents an array of twos-complement 16-bit signed integers in platform byte order. See [Int16Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array)

## module RescriptCore.Int16Array.Constants

### let RescriptCore.Int16Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Int16Array.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Int16Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

### let RescriptCore.Int16Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Int16Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Int16Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Int16Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Int16Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int16Array/Int16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int16Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Int16Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Int16Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Int16Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Int32Array `alias`

### type RescriptCore.Int32Array.t

> type t = Core__TypedArray.t<int>

The `Int32Array` typed array represents an array of twos-complemenet 32-bit signed integers in platform byte order. See [Int32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array)

## module RescriptCore.Int32Array.Constants

### let RescriptCore.Int32Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Int32Array.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Int32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

### let RescriptCore.Int32Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Int32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Int32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Int32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Int32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Int32Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Int32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Int32Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Int32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint8Array `alias`

### type RescriptCore.Uint8Array.t

> type t = Core__TypedArray.t<int>

The `Uint8Array` typed array represents an array of 8-bit unsigned integers. See [Uint8Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)

## module RescriptCore.Uint8Array.Constants

### let RescriptCore.Uint8Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint8Array.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Uint8Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

### let RescriptCore.Uint8Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Uint8Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Uint8Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Uint8Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Uint8Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Uint8Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint8Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Uint8Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint16Array `alias`

### type RescriptCore.Uint16Array.t

> type t = Core__TypedArray.t<int>

The `Uint16Array` typed array represents an array of 16-bit unsigned integers in platform byte order. See [Uint16Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array)

## module RescriptCore.Uint16Array.Constants

### let RescriptCore.Uint16Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint16Array.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Uint16Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

### let RescriptCore.Uint16Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Uint16Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Uint16Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Uint16Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Uint16Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint16Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Uint16Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint16Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Uint16Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint32Array `alias`

### type RescriptCore.Uint32Array.t

> type t = Core__TypedArray.t<int>

The `Uint32Array` typed array represents an array of 32-bit unsigned integers in platform byte order. See [Uint32Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array)

## module RescriptCore.Uint32Array.Constants

### let RescriptCore.Uint32Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint32Array.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Uint32Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

### let RescriptCore.Uint32Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Uint32Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Uint32Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Uint32Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Uint32Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint32Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Uint32Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint32Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Uint32Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Uint8ClampedArray `alias`

### type RescriptCore.Uint8ClampedArray.t

> type t = Core__TypedArray.t<int>

The `Uint8ClampedArray` typed array represents an array of 8-bit unsigned integers clamped to 0-255. See [Uint8ClampedArray on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray)

## module RescriptCore.Uint8ClampedArray.Constants

### let RescriptCore.Uint8ClampedArray.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.Uint8ClampedArray.fromArray

> let fromArray: (. array<int>) => t

`fromArray` creates a `Uint8ClampedArray` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

### let RescriptCore.Uint8ClampedArray.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `Uint8ClampedArray` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `Uint8ClampedArray` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray/Uint8ClampedArray)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.Uint8ClampedArray.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `Uint8ClampedArray` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.Uint8ClampedArray.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => int) => t

`fromArrayLikeOrIterableWithMap` creates a `Uint8ClampedArray` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.BigInt64Array `alias`

### type RescriptCore.BigInt64Array.t

> type t = Core__TypedArray.t<Core__BigInt.t>

The `BigInt64Array` typed array represents an array of 64-bit signed integers in platform byte order. See [BigInt64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array)

## module RescriptCore.BigInt64Array.Constants

### let RescriptCore.BigInt64Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.BigInt64Array.fromArray

> let fromArray: (. array<Core__BigInt.t>) => t

`fromArray` creates a `BigInt64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

### let RescriptCore.BigInt64Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `BigInt64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `BigInt64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `BigInt64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `BigInt64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigInt64Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `BigInt64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.BigInt64Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => Core__BigInt.t) => t

`fromArrayLikeOrIterableWithMap` creates a `BigInt64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.BigUint64Array `alias`

### type RescriptCore.BigUint64Array.t

> type t = Core__TypedArray.t<Core__BigInt.t>

The `BigUint64Array` typed array represents an array of 64-bit unsigned integers in platform byte order. See [BigUint64Array on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array)

## module RescriptCore.BigUint64Array.Constants

### let RescriptCore.BigUint64Array.Constants.bytesPerElement

> let bytesPerElement: int

`bytesPerElement` returns the element size. See [BYTES_PER_ELEMENT on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)

### let RescriptCore.BigUint64Array.fromArray

> let fromArray: (. array<Core__BigInt.t>) => t

`fromArray` creates a `BigUint64Array` from an array of values. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

### let RescriptCore.BigUint64Array.fromBuffer

> let fromBuffer: (. Core__ArrayBuffer.t) => t

`fromBuffer` creates a `BigUint64Array` from an `ArrayBuffer.t`. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromBufferToEnd

> let fromBufferToEnd: (. Core__ArrayBuffer.t, ~byteOffset: int) => t

`fromBufferToEnd` creates a `BigUint64Array` from an `ArrayBuffer.t`, starting at a particular offset and continuing through to the end. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromBufferWithRange

> let fromBufferWithRange: (. Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t

`fromBufferWithRange` creates a `BigUint64Array` from an `ArrayBuffer.t`, starting at a particular offset and consuming `length` **bytes**. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromLength

> let fromLength: (. int) => t

`fromLength` creates a zero-initialized `BigUint64Array` to hold the specified count of numbers; this is **not** a byte length. See [TypedArray constructor on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array)

**Note:** This is a potentially unsafe operation. Ensure the buffer is large enough and only accessed within its bounds.

### let RescriptCore.BigUint64Array.fromArrayLikeOrIterable

> let fromArrayLikeOrIterable: (. 'a) => t

`fromArrayLikeOrIterable` creates a `BigUint64Array` from an array-like or iterable object. See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

### let RescriptCore.BigUint64Array.fromArrayLikeOrIterableWithMap

> let fromArrayLikeOrIterableWithMap: (. 'a, (. 'b, int) => Core__BigInt.t) => t

`fromArrayLikeOrIterableWithMap` creates a `BigUint64Array` from an array-like or iterable object and applies the mapping function to each item. The mapping function expects (value, index). See [TypedArray.from on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from)

## module RescriptCore.Intl `alias`

## module RescriptCore.Intl.Collator `alias`

### type RescriptCore.Intl.Collator.t

> type t

### let RescriptCore.Intl.Collator.make

> let make: (. unit) => t

### let RescriptCore.Intl.Collator.makeWithLocale

> let makeWithLocale: (. string) => t

### let RescriptCore.Intl.Collator.makeWithLocales

> let makeWithLocales: (. array<string>) => t

### let RescriptCore.Intl.Collator.makeWithLocaleAndOptions

> let makeWithLocaleAndOptions: (. string, {..}) => t

### let RescriptCore.Intl.Collator.makeWithLocalesAndOptions

> let makeWithLocalesAndOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.Collator.makeWithOptions

> let makeWithOptions: (. {..}) => t

### let RescriptCore.Intl.Collator.supportedLocalesOf

> let supportedLocalesOf: (. array<string>) => t

### let RescriptCore.Intl.Collator.supportedLocalesOfWithOptions

> let supportedLocalesOfWithOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.Collator.resolvedOptions

> let resolvedOptions: (. t) => {..}

### let RescriptCore.Intl.Collator.compare

> let compare: (. t, string, string) => int

## module RescriptCore.Intl.DateTimeFormat `alias`

### type RescriptCore.Intl.DateTimeFormat.t

> type t

### let RescriptCore.Intl.DateTimeFormat.make

> let make: (. unit) => t

### let RescriptCore.Intl.DateTimeFormat.makeWithLocale

> let makeWithLocale: (. string) => t

### let RescriptCore.Intl.DateTimeFormat.makeWithLocales

> let makeWithLocales: (. array<string>) => t

### let RescriptCore.Intl.DateTimeFormat.makeWithLocaleAndOptions

> let makeWithLocaleAndOptions: (. string, {..}) => t

### let RescriptCore.Intl.DateTimeFormat.makeWithLocalesAndOptions

> let makeWithLocalesAndOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.DateTimeFormat.makeWithOptions

> let makeWithOptions: (. {..}) => t

### let RescriptCore.Intl.DateTimeFormat.supportedLocalesOf

> let supportedLocalesOf: (. array<string>) => t

### let RescriptCore.Intl.DateTimeFormat.supportedLocalesOfWithOptions

> let supportedLocalesOfWithOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.DateTimeFormat.resolvedOptions

> let resolvedOptions: (. t) => {..}

### let RescriptCore.Intl.DateTimeFormat.format

> let format: (. t, Core__Date.t) => string

### let RescriptCore.Intl.DateTimeFormat.formatToParts

> let formatToParts: (.\n  t,\n  Core__Date.t,\n) => array<{\"type\": string, \"value\": string}>

### let RescriptCore.Intl.DateTimeFormat.formatRange

> let formatRange: (.\n  t,\n  ~startDate: Core__Date.t,\n  ~endDate: Core__Date.t,\n) => string

### let RescriptCore.Intl.DateTimeFormat.formatRangeToParts

> let formatRangeToParts: (.\n  t,\n  ~startDate: Core__Date.t,\n  ~endDate: Core__Date.t,\n) => array<\n  {\"source\": string, \"type\": string, \"value\": string},\n>

## module RescriptCore.Intl.Locale `alias`

### type RescriptCore.Intl.Locale.t

> type t

### let RescriptCore.Intl.Locale.make

> let make: (. string) => t

### let RescriptCore.Intl.Locale.makeWithOptions

> let makeWithOptions: (. string, {..}) => t

### let RescriptCore.Intl.Locale.baseName

> let baseName: (. t) => string

### let RescriptCore.Intl.Locale.calendar

> let calendar: (. t) => option<string>

### let RescriptCore.Intl.Locale.caseFirst

> let caseFirst: (. t) => option<string>

### let RescriptCore.Intl.Locale.collation

> let collation: (. t) => option<string>

### let RescriptCore.Intl.Locale.hourCycle

> let hourCycle: (. t) => option<string>

### let RescriptCore.Intl.Locale.language

> let language: (. t) => string

### let RescriptCore.Intl.Locale.numberingSystem

> let numberingSystem: (. t) => option<string>

### let RescriptCore.Intl.Locale.numeric

> let numeric: (. t) => bool

### let RescriptCore.Intl.Locale.region

> let region: (. t) => option<string>

### let RescriptCore.Intl.Locale.script

> let script: (. t) => option<string>

### let RescriptCore.Intl.Locale.maximize

> let maximize: (. t) => t

### let RescriptCore.Intl.Locale.minimize

> let minimize: (. t) => t

## module RescriptCore.Intl.NumberFormat `alias`

### type RescriptCore.Intl.NumberFormat.t

> type t

### let RescriptCore.Intl.NumberFormat.make

> let make: (. unit) => t

### let RescriptCore.Intl.NumberFormat.makeWithLocale

> let makeWithLocale: (. string) => t

### let RescriptCore.Intl.NumberFormat.makeWithLocales

> let makeWithLocales: (. array<string>) => t

### let RescriptCore.Intl.NumberFormat.makeWithLocaleAndOptions

> let makeWithLocaleAndOptions: (. string, {..}) => t

### let RescriptCore.Intl.NumberFormat.makeWithLocalesAndOptions

> let makeWithLocalesAndOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.NumberFormat.makeWithOptions

> let makeWithOptions: (. {..}) => t

### let RescriptCore.Intl.NumberFormat.supportedLocalesOf

> let supportedLocalesOf: (. array<string>) => t

### let RescriptCore.Intl.NumberFormat.supportedLocalesOfWithOptions

> let supportedLocalesOfWithOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.NumberFormat.resolvedOptions

> let resolvedOptions: (. t) => {..}

### let RescriptCore.Intl.NumberFormat.format

> let format: (. t, float) => string

### let RescriptCore.Intl.NumberFormat.formatToParts

> let formatToParts: (. t, float) => array<{\"type\": string, \"value\": string}>

### let RescriptCore.Intl.NumberFormat.formatInt

> let formatInt: (. t, int) => string

### let RescriptCore.Intl.NumberFormat.formatIntToParts

> let formatIntToParts: (. t, int) => array<{\"type\": string, \"value\": string}>

### let RescriptCore.Intl.NumberFormat.formatBigInt

> let formatBigInt: (. t, Core__BigInt.t) => string

### let RescriptCore.Intl.NumberFormat.formatBigIntToParts

> let formatBigIntToParts: (.\n  t,\n  Core__BigInt.t,\n) => array<{\"type\": string, \"value\": string}>

## module RescriptCore.Intl.PluralRules `alias`

### type RescriptCore.Intl.PluralRules.t

> type t

### let RescriptCore.Intl.PluralRules.make

> let make: (. unit) => t

### let RescriptCore.Intl.PluralRules.makeWithLocale

> let makeWithLocale: (. string) => t

### let RescriptCore.Intl.PluralRules.makeWithLocales

> let makeWithLocales: (. array<string>) => t

### let RescriptCore.Intl.PluralRules.makeWithLocaleAndOptions

> let makeWithLocaleAndOptions: (. string, {..}) => t

### let RescriptCore.Intl.PluralRules.makeWithLocalesAndOptions

> let makeWithLocalesAndOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.PluralRules.makeWithOptions

> let makeWithOptions: (. {..}) => t

### let RescriptCore.Intl.PluralRules.supportedLocalesOf

> let supportedLocalesOf: (. array<string>) => t

### let RescriptCore.Intl.PluralRules.supportedLocalesOfWithOptions

> let supportedLocalesOfWithOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.PluralRules.resolvedOptions

> let resolvedOptions: (. t) => {..}

### type RescriptCore.Intl.PluralRules.rule

> type rule = [#few | #many | #one | #other | #two | #zero]

### let RescriptCore.Intl.PluralRules.select

> let select: (. t, float) => rule

### let RescriptCore.Intl.PluralRules.selectInt

> let selectInt: (. t, int) => rule

### let RescriptCore.Intl.PluralRules.selectBigInt

> let selectBigInt: (. t, Core__BigInt.t) => rule

## module RescriptCore.Intl.RelativeTimeFormat `alias`

### type RescriptCore.Intl.RelativeTimeFormat.t

> type t

### let RescriptCore.Intl.RelativeTimeFormat.make

> let make: (. unit) => t

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocale

> let makeWithLocale: (. string) => t

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocales

> let makeWithLocales: (. array<string>) => t

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocaleAndOptions

> let makeWithLocaleAndOptions: (. string, {..}) => t

### let RescriptCore.Intl.RelativeTimeFormat.makeWithLocalesAndOptions

> let makeWithLocalesAndOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.RelativeTimeFormat.makeWithOptions

> let makeWithOptions: (. {..}) => t

### let RescriptCore.Intl.RelativeTimeFormat.supportedLocalesOf

> let supportedLocalesOf: (. array<string>) => t

### let RescriptCore.Intl.RelativeTimeFormat.supportedLocalesOfWithOptions

> let supportedLocalesOfWithOptions: (. array<string>, {..}) => t

### let RescriptCore.Intl.RelativeTimeFormat.resolvedOptions

> let resolvedOptions: (. t) => {..}

### type RescriptCore.Intl.RelativeTimeFormat.timeUnit

> type timeUnit = [\n  | #day\n  | #hour\n  | #minute\n  | #month\n  | #quarter\n  | #second\n  | #week\n  | #year\n]

### let RescriptCore.Intl.RelativeTimeFormat.format

> let format: (. t, int, timeUnit) => string

### let RescriptCore.Intl.RelativeTimeFormat.formatToParts

> let formatToParts: (.\n  t,\n  int,\n  timeUnit,\n) => array<\n  {\"type\": string, \"unit\": option<string>, \"value\": string},\n>

### let RescriptCore.window

> let window: Dom.window

### let RescriptCore.document

> let document: Dom.document

### let RescriptCore.globalThis

> let globalThis: {..}

### let RescriptCore.null

> let null: Core__Nullable.t<'a>

### let RescriptCore.undefined

> let undefined: Core__Nullable.t<'a>

### let RescriptCore.typeof

> let typeof: (. 'a) => Core__Type.t

### type RescriptCore.t

> type t<'a> = Js.t<'a>\n  constraint 'a = {..}

## module RescriptCore.MapperRt `alias`

## module RescriptCore.Internal `alias`

## module RescriptCore.Re `alias`

### type RescriptCore.Re.t

> type t = Js.Re.t

Type representing an instantiated `RegExp`.

## module RescriptCore.Re.Result

### type RescriptCore.Re.Result.t

> type t = array<string>

Type representing the result of a `RegExp` execution.

### let RescriptCore.Re.Result.fullMatch

> let fullMatch: (. t) => string

`fullMatch(regExpResult)` returns the full string that matched in this result.

#### Examples
```rescript
// Match the first two words separated by a space
let regexp = RegExp.fromString("(\\w+) (\\w+)")

switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.fullMatch) // Prints the full string that matched, "ReScript is"
}
```

### let RescriptCore.Re.Result.matches

> let matches: (. t) => array<string>

`matches(regExpResult)` returns all matches for `regExpResult`.

#### Examples
```rescript
// Match the first two words separated by a space
let regexp = RegExp.fromString("(\\w+) (\\w+)")

// This below will log "ReScript" and "is" to the console.
switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => switch result->RegExp.Result.matches {
| [firstWord, secondWord] => Console.log2(firstWord, secondWord)
| _ => Console.log("Didn't find exactly two words...")
}
}
```

### let RescriptCore.Re.Result.index

> let index: (. t) => int

### let RescriptCore.Re.Result.input

> let input: (. t) => string

`input(regExpResult)` returns the full input string that was passed to what produced the `RegExp.Result.t`.

#### Examples
```rescript
// Match the first two words separated by a space
let regexp = RegExp.fromString("(\\w+) (\\w+)")

// This below will log the full input string "ReScript is pretty cool, right?" to the console.
switch regexp->RegExp.exec("ReScript is pretty cool, right?") {
| None => Console.log("Nope, no match...")
| Some(result) => Console.log(result->RegExp.Result.input)
}
```

### let RescriptCore.Re.fromString

> let fromString: (. string) => t

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

> let fromStringWithFlags: (. string, ~flags: string) => t

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

> let test: (. t, string) => bool

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

> let exec: (. t, string) => option<Result.t>

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

> let lastIndex: (. t) => int

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

> let ignoreCase: (. t) => bool

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

> let global: (. t) => bool

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

> let multiline: (. t) => bool

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

> let source: (. t) => string

`source(regexp)` returns the source text for this `RegExp`, without the two forward slashes (if present), and without any set flags.

See [`RegExp.source`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/source) on MDN.

#### Examples
```rescript
let regexp = RegExp.fromStringWithFlags("\\w+", ~flags="g")
Console.log(regexp->RegExp.source) // Logs `\w+`, the source text of the `RegExp`
```

### let RescriptCore.Re.sticky

> let sticky: (. t) => bool

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

> let unicode: (. t) => bool

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

### let RescriptCore.Option.filter

> let filter: (. option<'a>, (. 'a) => bool) => option<'a>

`filter(opt, f)` applies `f` to `opt`, if `f` returns `true`, then it returns `Some(value)`, otherwise returns `None`.

#### Examples

```rescript
Option.filter(Some(10), x => x > 5) // Some(10)
Option.filter(Some(4), x => x > 5) // None
Option.filter(None, x => x > 5) // None
```

### let RescriptCore.Option.forEach

> let forEach: (. option<'a>, (. 'a) => unit) => unit

`forEach(opt, f)` call `f` on `opt`. if `opt` is `Some(value)`, then if calls
`f`, otherwise returns `unit`.

#### Examples

```rescript
Option.forEach(Some("thing"), x => Console.log(x)) // logs "thing"
Option.forEach(None, x => Console.log(x)) // returns ()
```

### let RescriptCore.Option.getExn

> let getExn: (. option<'a>) => 'a

`getExn(opt)` returns `value` if `opt` is `Some(value)`, otherwise raises an exception.

```rescript
Option.getExn(Some(3)) // 3
Option.getExn(None) /* Raises an Error */
```

#### Exceptions

- Raises an error if `opt` is `None`

### let RescriptCore.Option.getUnsafe

> let getUnsafe: (. option<'a>) => 'a

`getUnsafe(opt)` returns `value` if `opt` is `Some(value)`, otherwise `undefined`.

#### Examples

```rescript
Option.getUnsafe(Some(3)) == 3
Option.getUnsafe(None: option<int>) // Returns `undefined`, which is not a valid `int`
```

#### Notes

- This is an unsafe operation. It assumes `value` is not `None`, and may cause undefined behaviour if it is.

### let RescriptCore.Option.mapOr

> let mapOr: (. option<'a>, 'b, (. 'a) => 'b) => 'b

`mapOr(opt, default, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `default`.

#### Examples

```rescript
let someValue = Some(3)
someValue->Option.mapOr(0, x => x + 5) // 8

let noneValue = None
noneValue->Option.mapOr(0, x => x + 5) // 0
```

### let RescriptCore.Option.mapWithDefault

**DEPRECATED: Use mapOr instead**

> let mapWithDefault: (. option<'a>, 'b, (. 'a) => 'b) => 'b

### let RescriptCore.Option.map

> let map: (. option<'a>, (. 'a) => 'b) => option<'b>

`map(opt, f)` returns `Some(f(value))` if `opt` is `Some(value)`, otherwise `None`.

#### Examples

```rescript
Option.map(Some(3), x => x * x) // Some(9)
Option.map(None, x => x * x) // None
```

### let RescriptCore.Option.flatMap

> let flatMap: (. option<'a>, (. 'a) => option<'b>) => option<'b>

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

> let getOr: (. option<'a>, 'a) => 'a

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

**DEPRECATED: Use getOr instead**

> let getWithDefault: (. option<'a>, 'a) => 'a

### let RescriptCore.Option.orElse

> let orElse: (. option<'a>, option<'a>) => option<'a>

`orElse(opt1, opt2)` returns `opt2` if `opt1` is `None`, otherwise `opt1`.

#### Examples

```rescript
Option.orElse(Some(1812), Some(1066)) == Some(1812)
Option.orElse(None, Some(1066) == Some(1066)
Option.orElse(None, None) == None
```

### let RescriptCore.Option.isSome

> let isSome: (. option<'a>) => bool

`isSome(opt)` returns `true` if `opt` is `Some(value)`, otherwise returns `false`.

#### Examples

```rescript
Option.isSome(None) // false
Option.isSome(Some(1)) // true
```

### let RescriptCore.Option.isNone

> let isNone: (. option<'a>) => bool

`isNone(opt)` returns `true` if `opt` is `None`, false otherwise.

#### Examples

```rescript
Option.isNone(None) // true
Option.isNone(Some(1)) // false
```

### let RescriptCore.Option.equal

> let equal: (. option<'a>, option<'b>, (. 'a, 'b) => bool) => bool

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

> let compare: (.\n  option<'a>,\n  option<'b>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t

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

> type t<'a> = list<'a>

Collection functions for manipulating the `list` data structures, a singly-linked list.

**Prefer Array** if you need any of the following:

- Random access of element
- Better interop with JavaScript
- Better memory usage & performance.

### let RescriptCore.List.length

> let length: (. t<'a>) => int

`length(list)` returns the length of `list`.

#### Examples

```rescript
List.length(list{1, 2, 3}) // 3
```

### let RescriptCore.List.size

> let size: (. t<'a>) => int

`size(list)`. See [`length`](#length)

#### Examples

```rescript
List.size(list{1, 2, 3}) // 3
```

### let RescriptCore.List.head

> let head: (. t<'a>) => option<'a>

`head(list)` returns `Some(value)` where `value` is the first element in the
list, or `None` if `list` is an empty list.

#### Examples

```rescript
List.head(list{}) // None
List.head(list{1, 2, 3}) // Some(1)
```

### let RescriptCore.List.headExn

> let headExn: (. t<'a>) => 'a

`headExn(list)` same as [`head`](#head).

#### Examples

```rescript
List.headExn(list{1, 2, 3}) // 1

List.headExn(list{}) // Raises an Error
```

#### Exceptions

- Raises an Error if list is empty.

### let RescriptCore.List.tail

> let tail: (. t<'a>) => option<t<'a>>

`tail(list)` returns `None` if `list` is empty, otherwise it returns `Some(tail)`
where `tail` is everything except the first element of `list`.

#### Examples

```rescript
List.tail(list{1, 2, 3}) // Some(list{2, 3})

List.tail(list{}) // None
```

### let RescriptCore.List.tailExn

> let tailExn: (. t<'a>) => t<'a>

`tailExn(list)` same as [`tail`](#tail).

#### Examples

```rescript
List.tailExn(list{1, 2, 3}) // list{2, 3}

List.tailExn(list{}) // Raises an Error
```

#### Exceptions

- Raises an Error if list is empty.

### let RescriptCore.List.add

> let add: (. t<'a>, 'a) => t<'a>

`add(list, value)` adds a `value` to the beginning of list `list`.

#### Examples

```rescript
List.add(list{2, 3}, 1) // list{1, 2, 3}

List.add(list{"World", "!"}, "Hello") // list{"Hello", "World", "!"}
```

### let RescriptCore.List.get

> let get: (. t<'a>, int) => option<'a>

`get(list, index)` return the `index` element in `list`, or `None` if `index`
is larger than the length of list `list`.

#### Examples

```rescript
let abc = list{"A", "B", "C"}

abc->List.get(1) // Some("B")

abc->List.get(4) // None
```

### let RescriptCore.List.getExn

> let getExn: (. t<'a>, int) => 'a

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

> let make: (. int, 'a) => t<'a>

`make(length, value)` returns a list of length `length` with each element filled
with `value`. Returns an empty list if `value` is negative.

#### Examples

```rescript
List.make(3, 1) // list{1, 1, 1}
```

### let RescriptCore.List.makeBy

> let makeBy: (. int, (. int) => 'a) => t<'a>

`makeBy(length, f)` return a list of length `length` with element initialized
with `f`. Returns an empty list if `length` is negative.

#### Examples

```rescript
List.makeBy(5, i => i) // list{0, 1, 2, 3, 4}

List.makeBy(5, i => i * i) // list{0, 1, 4, 9, 16}
```

### let RescriptCore.List.toShuffled

> let toShuffled: (. t<'a>) => t<'a>

`toShuffled(list)` returns a new list in random order.

#### Examples

```rescript
List.toShuffled(list{1, 2, 3}) // list{2, 1, 3}
```

### let RescriptCore.List.drop

> let drop: (. t<'a>, int) => option<t<'a>>

`drop(list, value)` return a new list, dropping the first `value` element.
Returns `None` if `list` has fewer than `value` elements.

#### Examples

```rescript
list{1, 2, 3}->List.drop(2) // Some(list{3})

list{1, 2, 3}->List.drop(3) // Some(list{})

list{1, 2, 3}->List.drop(4) // None
```

### let RescriptCore.List.take

> let take: (. t<'a>, int) => option<t<'a>>

`take(list, value)` returns a list with the first `value` elements from `list`,
or `None` if `list` has fewer than `value` elements.

#### Examples

```rescript
list{1, 2, 3}->List.take(1) // Some(list{1})

list{1, 2, 3}->List.take(2) // Some(list{1, 2})

list{1, 2, 3}->List.take(4) // None
```

### let RescriptCore.List.splitAt

> let splitAt: (. t<'a>, int) => option<(list<'a>, list<'a>)>

`splitAt(list, n)` split the list `list` at `n`. Returns `None` when the length
of `list` is less than `n`.

#### Examples

```rescript
list{"Hello", "World"}->List.splitAt(1) // Some((list{"Hello"}, list{"World"}))

list{0, 1, 2, 3, 4}->List.splitAt(2) // Some((list{0, 1}, list{2, 3, 4}))
```

### let RescriptCore.List.concat

> let concat: (. t<'a>, t<'a>) => t<'a>

`concat(list1, list2)` returns the list obtained by adding `list1` after `list2`.

#### Examples

```rescript
List.concat(list{1, 2, 3}, list{4, 5}) // list{1, 2, 3, 4, 5}
```

### let RescriptCore.List.concatMany

> let concatMany: (. array<t<'a>>) => t<'a>

`concatMany(arr)` returns the list obtained by concatenating all the lists in
array `arr`, in order.

#### Examples

```rescript
List.concatMany([list{1, 2, 3}, list{}, list{3}]) // list{1, 2, 3, 3}
```

### let RescriptCore.List.reverseConcat

> let reverseConcat: (. t<'a>, t<'a>) => t<'a>

`reverseConcat(list1, list2)` is equivalent to writing: `concat(reverse(list1, list2)`

#### Examples

```rescript
List.reverseConcat(list{1, 2}, list{3, 4}) // list{2, 1, 3, 4}
```

### let RescriptCore.List.flatten

> let flatten: (. t<t<'a>>) => t<'a>

`flatten(list)` return the list obtained by concatenating all the lists in
`list`, in order.

#### Examples

```rescript
List.flatten(list{list{1, 2, 3}, list{}, list{3}}) // list{1, 2, 3, 3}
```

### let RescriptCore.List.map

> let map: (. t<'a>, (. 'a) => 'b) => t<'b>

`map(list, f)` returns a new list with `f` applied to each element of `list`.

#### Examples

```rescript
list{1, 2}->List.map(x => x + 1) // list{3, 4}
```

### let RescriptCore.List.zip

> let zip: (. t<'a>, t<'b>) => t<('a, 'b)>

`zip(list1, list2)` returns a list of pairs from the two lists with the length
of the shorter list.

#### Examples

```rescript
List.zip(list{1, 2}, list{3, 4, 5}) // list{(1, 3), (2, 4)}
```

### let RescriptCore.List.zipBy

> let zipBy: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => t<'c>

`zipBy(list1, list2, f)`. See [`zip`](#zip)

#### Examples

```rescript
List.zipBy(list{1, 2, 3}, list{4, 5}, (a, b) => 2 * a + b) // list{6, 9}
```

### let RescriptCore.List.mapWithIndex

> let mapWithIndex: (. t<'a>, (. int, 'a) => 'b) => t<'b>

`mapWithIndex(list, f)` applies `f` to each element of `list`. Function `f`
takes two arguments: the index starting from 0 and the element from `list`, in
that order.

#### Examples

```rescript
list{1, 2, 3}->List.mapWithIndex((index, x) => index + x) // list{1, 3, 5}
```

### let RescriptCore.List.fromArray

> let fromArray: (. array<'a>) => t<'a>

`fromArray(arr)` converts the given array `arr` to a list.

#### Examples

```rescript
List.fromArray([1, 2, 3]) // list{1, 2, 3}
```

### let RescriptCore.List.toArray

> let toArray: (. t<'a>) => array<'a>

`toArray(list)` converts the given list `list` to an array.

#### Examples

```rescript
List.toArray(list{1, 2, 3}) // [1, 2, 3]
```

### let RescriptCore.List.reverse

> let reverse: (. t<'a>) => t<'a>

`reverse(list)` returns a new list whose elements are those of `list` in
reversed order.

#### Examples

```rescript
List.reverse(list{1, 2, 3}) // list{3, 2, 1}
```

### let RescriptCore.List.mapReverse

> let mapReverse: (. t<'a>, (. 'a) => 'b) => t<'b>

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

> let forEach: (. t<'a>, (. 'a) => 'b) => unit

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

> let forEachWithIndex: (. t<'a>, (. int, 'a) => 'b) => unit

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

> let reduce: (. t<'a>, 'b, (. 'b, 'a) => 'b) => 'b

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

> let reduceWithIndex: (. t<'a>, 'b, (. 'b, 'a, int) => 'b) => 'b

`reduceWithIndex(list, initialValue, f)` applies `f` to each element of `list`
from beginning to end. Function `f` has three parameters: the item from the list
and an "accumulator", which starts with a value of `initialValue` and the index
of each element. `reduceWithIndex` returns the final value of the accumulator.

#### Examples

```rescript
list{1, 2, 3, 4}->List.reduceWithIndex(0, (acc, item, index) => acc + item + index) // 16
```

### let RescriptCore.List.reduceReverse

> let reduceReverse: (. t<'a>, 'b, (. 'b, 'a) => 'b) => 'b

`reduceReverse(list, initialValue, f)` works like `reduce`, except that
function `f` is applied to each item of `list` from the last back to the first.

#### Examples

```rescript
list{1, 2, 3, 4}->List.reduceReverse(0, (a, b) => a + b) // 10

list{1, 2, 3, 4}->List.reduceReverse(10, (a, b) => a - b) // 0

list{1, 2, 3, 4}->List.reduceReverse(list{}, List.add) // list{1, 2, 3, 4}
```

### let RescriptCore.List.mapReverse2

> let mapReverse2: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => t<'c>

`mapReverse2(list1, list2, f)` is equivalent to `List.zipBy(list1, list2, f)->List.reverse`.

#### Examples

```rescript
List.mapReverse2(list{1, 2, 3}, list{1, 2}, (a, b) => a + b) // list{4, 2}
```

### let RescriptCore.List.forEach2

> let forEach2: (. t<'a>, t<'b>, (. 'a, 'b) => 'c) => unit

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

> let reduce2: (. t<'b>, t<'c>, 'a, (. 'a, 'b, 'c) => 'a) => 'a

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

> let reduceReverse2: (. t<'a>, t<'b>, 'c, (. 'c, 'a, 'b) => 'c) => 'c

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

> let every: (. t<'a>, (. 'a) => bool) => bool

`every(list, f)` returns `true` if all elements in `list` satisfy `f`, where `f`
is a predicate: a function taking an element and returning a bool.

#### Examples

```rescript
let isBelow10 = value => value < 10

list{1, 9, 8, 2}->List.every(isBelow10) // true

list{1, 99, 8, 2}->List.every(isBelow10) // false
```

### let RescriptCore.List.some

> let some: (. t<'a>, (. 'a) => bool) => bool

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

> let every2: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool

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

> let some2: (. t<'a>, t<'b>, (. 'a, 'b) => bool) => bool

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

> let compareLength: (. t<'a>, t<'a>) => Core__Ordering.t

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

> let compare: (.\n  t<'a>,\n  t<'a>,\n  (. 'a, 'a) => Core__Ordering.t,\n) => Core__Ordering.t

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

> let equal: (. t<'a>, t<'a>, (. 'a, 'a) => bool) => bool

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

> let has: (. t<'a>, 'b, (. 'a, 'b) => bool) => bool

`has(list, element, f)` returns `true` if the list contains at least one
`element` for which `f` returns `true'.

#### Examples

```rescript
list{1, 2, 3}->List.has(2, (a, b) => a == b) // true

list{1, 2, 3}->List.has(4, (a, b) => a == b) // false

list{(-1), (-2), (-3)}->List.has(2, (a, b) => abs(a) == abs(b)) // true
```

### let RescriptCore.List.getBy

> let getBy: (. t<'a>, (. 'a) => bool) => option<'a>

`getBy(list, f)` returns `Some(value)` for the first value in `list` that
satisfies the predicate function `f`. Returns `None` if no element satisfies
the function.

#### Examples

```rescript
List.getBy(list{1, 4, 3, 2}, x => x > 3) // Some(4)

List.getBy(list{1, 4, 3, 2}, x => x > 4) // None
```

### let RescriptCore.List.filter

> let filter: (. t<'a>, (. 'a) => bool) => t<'a>

`filter(list, f)` returns a list of all elements in `list` which satisfy the
predicate function `f`.

#### Examples

```rescript
let isEven = x => mod(x, 2) == 0

List.filter(list{1, 2, 3, 4}, isEven) // list{2, 4}

List.filter(list{None, Some(2), Some(3), None}, Option.isSome) // list{Some(2), Some(3)}
```

### let RescriptCore.List.filterWithIndex

> let filterWithIndex: (. t<'a>, (. 'a, int) => bool) => t<'a>

`filterWithIndex(list, f)` returns a list of all elements in `list` which
satisfy the predicate function `f`.

#### Examples

```rescript
let isEven = x => mod(x, 2) == 0

List.filterWithIndex(list{1, 2, 3, 4}, (_x, index) => isEven(index)) // list{1, 3}
```

### let RescriptCore.List.filterMap

> let filterMap: (. t<'a>, (. 'a) => option<'b>) => t<'b>

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

> let partition: (. t<'a>, (. 'a) => bool) => (t<'a>, t<'a>)

`partition(list, f)` creates a pair of lists; the first list consists of all
elements of `list` that satisfy the predicate function `f`, the second list
consists of all elements of `list` that _do not_ satisfy `f`.

#### Examples

```rescript
// (elementsThatSatisfies, elementsThatDoesNotSatisfy)

List.partition(list{1, 2, 3, 4}, x => x > 2) // (list{3, 4}, list{1, 2})
```

### let RescriptCore.List.unzip

> let unzip: (. t<('a, 'b)>) => (t<'a>, t<'b>)

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

> let getAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => option<'c>

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

> let hasAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => bool

`hasAssoc(list, k, f)` returns `true` if there is a pair in `list` where the
first element equals `k` as per the predicate function `f`.

#### Examples

```rescript
list{(1, "a"), (2, "b"), (3, "c")}->List.hasAssoc(1, (a, b) => a == b) // true

list{(9, "morning"), (15, "afternoon"), (22, "night")}
->List.hasAssoc(25, (k, item) => k /* 25 */ == item /* 9, 5, 22 */) // false
```

### let RescriptCore.List.removeAssoc

> let removeAssoc: (. t<('a, 'c)>, 'b, (. 'a, 'b) => bool) => t<('a, 'c)>

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

> let setAssoc: (. t<('a, 'c)>, 'a, 'c, (. 'a, 'a) => bool) => t<('a, 'c)>

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

> let sort: (. t<'a>, (. 'a, 'a) => Core__Ordering.t) => t<'a>

`sort(list, f)` returns a sorted list.

#### Examples

```rescript
List.sort(list{5, 4, 9, 3, 7}, Int.compare) // list{3, 4, 5, 7, 9}
```

## module RescriptCore.Result `alias`

### type RescriptCore.Result.t

> type t<'a, 'b> = result<'a, 'b> = Ok('a) | Error('b)

Result types are really useful to describe the result of a certain operation
without relying on exceptions or `option` types.

This module gives you useful utilities to create and combine `Result` data.

### let RescriptCore.Result.getExn

> let getExn: (. t<'a, 'b>) => 'a

`getExn(res)`: when `res` is `Ok(n)`, returns `n` when `res` is `Error(m)`, raise an exception

```res example
Result.getExn(Result.Ok(42)) == 42

Result.getExn(Result.Error("Invalid data")) /* raises exception */
```

### let RescriptCore.Result.mapOr

> let mapOr: (. t<'a, 'c>, 'b, (. 'a) => 'b) => 'b

`mapOr(res, default, f)`: When res is `Ok(n)`, returns `f(n)`,
otherwise `default`.

```res example
let ok = Result.Ok(42)
Result.mapOr(ok, 0, (x) => x / 2) == 21

let error = Result.Error("Invalid data")
Result.mapOr(error, 0, (x) => x / 2) == 0
```

### let RescriptCore.Result.mapWithDefault

**DEPRECATED: Use mapOr instead**

> let mapWithDefault: (. t<'a, 'c>, 'b, (. 'a) => 'b) => 'b

### let RescriptCore.Result.map

> let map: (. t<'a, 'c>, (. 'a) => 'b) => t<'b, 'c>

`map(res, f)`: When res is `Ok(n)`, returns `Ok(f(n))`. Otherwise returns res
unchanged. Function `f` takes a value of the same type as `n` and returns an
ordinary value.

```res example
let f = (x) => sqrt(Int.toFloat(x))

Result.map(Ok(64), f) == Ok(8.0)

Result.map(Error("Invalid data"), f) == Error("Invalid data")
```

### let RescriptCore.Result.flatMap

> let flatMap: (. t<'a, 'c>, (. 'a) => t<'b, 'c>) => t<'b, 'c>

`flatMap(res, f)`: When res is `Ok(n)`, returns `f(n)`. Otherwise, returns res
unchanged. Function `f` takes a value of the same type as `n` and returns a
`Result`.

```res example
let recip = (x) =>
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

> let getOr: (. t<'a, 'b>, 'a) => 'a

`getOr(res, defaultValue)`: If `res` is `Ok(n)`, returns `n`,
otherwise `default`

```res example
Result.getOr(Ok(42), 0) == 42

Result.getOr(Error("Invalid Data"), 0) == 0
```

### let RescriptCore.Result.getWithDefault

**DEPRECATED: Use getOr instead**

> let getWithDefault: (. t<'a, 'b>, 'a) => 'a

### let RescriptCore.Result.isOk

> let isOk: (. t<'a, 'b>) => bool

`isOk(res)`: Returns `true` if `res` is of the form `Ok(n)`, `false` if it is
the `Error(e)` variant.

### let RescriptCore.Result.isError

> let isError: (. t<'a, 'b>) => bool

`isError(res)`: Returns `true` if `res` is of the form `Error(e)`, `false` if
it is the `Ok(n)` variant.

### let RescriptCore.Result.equal

> let equal: (. t<'a, 'c>, t<'b, 'd>, (. 'a, 'b) => bool) => bool

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

let mod10equal = (a, b) => mod(a, 10) === mod(b, 10)

Result.equal(good1, good2, mod10equal) == true

Result.equal(good1, bad1, mod10equal) == false

Result.equal(bad2, good2, mod10equal) == false

Result.equal(bad1, bad2, mod10equal) == true
```

### let RescriptCore.Result.compare

> let compare: (.\n  t<'a, 'c>,\n  t<'b, 'd>,\n  (. 'a, 'b) => Core__Ordering.t,\n) => Core__Ordering.t

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

let mod10cmp = (a, b) => Pervasives.compare(mod(a, 10), mod(b, 10))

Result.compare(Ok(39), Ok(57), mod10cmp) == 1.

Result.compare(Ok(57), Ok(39), mod10cmp) == (-1.)

Result.compare(Ok(39), Error("y"), mod10cmp) == 1.

Result.compare(Error("x"), Ok(57), mod10cmp) == (-1.)

Result.compare(Error("x"), Error("y"), mod10cmp) == 0.
```

### let RescriptCore.Result.forEach

> let forEach: (. t<'a, 'b>, (. 'a) => unit) => unit

`forEach(res, f)` runs the provided function `f` on the `Ok` value. If `res` is `Error`, nothing happens.

#### Examples

```rescript
Result.forEach(Ok(3), Console.log) // Logs "3", returns ()
Result.forEach(Error("x"), Console.log) // Does nothing, returns ()
```

### let RescriptCore.Result.mapError

> let mapError: (. result<'a, 'b>, (. 'b) => 'c) => result<'a, 'c>

`mapError(r, f)` generates a new `result` by applying the function `f` to the `Error` value. If the source is `Ok`, return it as-is.

#### Examples

```rescript
let format = n => `Error code: ${n->Int.toString}`
mapError(Error(14), format) // Error("Error code: 14")
mapError(Ok("abc"), format) // Ok("abc")
```

### type RescriptCore.null

> type null<'a> = Js.null<'a>

### type RescriptCore.undefined

> type undefined<'a> = Js.undefined<'a>

### type RescriptCore.nullable

> type nullable<'a> = Js.nullable<'a>

### let RescriptCore.panic

> let panic: (. string) => 'a



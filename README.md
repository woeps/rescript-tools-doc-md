# rescript-tools-doc-md [WIP]

Library to convert an extracted docs json into markdown. This work explores the possibilities of generating easily usable documentation basd on rescript files.

Inspired by a [rescript forum post announcing `@rescript/tools`](https://forum.rescript-lang.org/t/ann-rescript-language-server-and-rescript-tools-released/4819?u=woeps) by `zth` I started tinkering with the idea for this project.  
**This is still work in progress** and I'm thankful for any feedback.

There are several milestones to my vision of a basic general purpose rescript code generator:

1. library to transform type `RescriptTools.Docgen.doc` into a `markdown string` (current efforts focus on this)
2. "orchestrator" to handle fs operations
   - (optionally) parse any needed config
   - parse `rescript.json` for source-dirs
   - read any of those rescript files into a docgen json
   - use the library to get a markdown string from the json representation
   - write the generated markdown to disk
3. potentially integrate above into `@rescript/tools` cli, if everything fits

_Note: 2. may be the beginning for a general purpose rescript (code) generator library_

This project builds heavily upon [`@rescript/tools`](https://github.com/rescript-lang/rescript-vscode/tree/master/tools).

## Example

To see how it works, take a look at the `test` directory.
Based on [`@rescript/core: src/RescriptCore.res`](https://github.com/rescript-association/rescript-core/blob/main/src/RescriptCore.res), [`npm run makeTestJson`](https://github.com/woeps/rescript-tools-doc-md/blob/7c66aa9dd34fe5d7f3b48ee823f57d8fca6cd171/package.json#L8) is used to generate [`test/CoreDoc.json`](https://github.com/woeps/rescript-tools-doc-md/blob/7c66aa9dd34fe5d7f3b48ee823f57d8fca6cd171/test/CoreDoc.json) using `rescript-tools`.

The result of applying this lib can be seen in [`test/result.md`](https://github.com/woeps/rescript-tools-doc-md/blob/7c66aa9dd34fe5d7f3b48ee823f57d8fca6cd171/test/result.md)

## Installation

```sh
npm install
```

## Build

- Build: `npm run build`
- Clean: `npm run clean`
- Build & watch: `npm run dev`

## Test

Print test md to stdout:

```sh
npm run test
```

Print test md to file:

```sh
npm run testToFile
```

## Open Issues

- [x] render `doc.name`
- [x] render `doc.deprecated`
- [x] render `doc.docstrings`
- [x] render _value_ `doc.items`
  - [x] render name / id
  - [x] render docstrings
  - [x] render depecated
  - [x] render signature
- [ ] render _type_ `doc.items`
  - [x] render name / id
  - [x] render deprecated
  - [x] render docstrings
  - [x] render signature
  - [ ] render detail
- [x] render _module_ `doc.items`
  - [x] render name / id
  - [x] render deprecated
  - [x] render docstrings
  - [x] render items
- [x] render _module alias_ `doc.items`
  - [x] render name / id
  - [x] render docstrings
  - [x] render items
- [x] docstrings may also include markdown (e.g. `## Examples`) -> this markdown syntax should be manipulatet to match the current heading level?
- [ ] meaningfull overall structure of md
- [ ] generalize render format: support arbitary output format (e.g. html, markdown)

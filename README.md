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

## Installation

```sh
npm install
```

## Build

- Build: `npm run build`
- Clean: `npm run clean`
- Build & watch: `npm run dev`

## Run

Print test md to stdout:

```sh
npm run test
```

Print test md to file:

```sh
npm run testToFile
```

## Open Issues

- [*] render `doc.name`
- [*] render `doc.deprecated`
- [*] render `doc.docstrings`
- [*] render _value_ `doc.items`
  - [*] render name / id
  - [*] render docstrings
  - [*] render depecated
  - [*] render signature
- [ ] render _type_ `doc.items`
  - [*] render name / id
  - [*] render deprecated
  - [*] render docstrings
  - [*] render signature
  - [ ] render detail
- [*] render _module_ `doc.items`
  - [*] render name / id
  - [*] render deprecated
  - [*] render docstrings
  - [*] render items
- [*] render _module alias_ `doc.items`
  - [*] render name / id
  - [*] render docstrings
  - [*] render items
- [ ] docstrings may also include markdown (e.g. `## Examples`) -> this markdown syntax should be manipulatet to match the current heading level?
- [ ] meaningfull overall structure of md

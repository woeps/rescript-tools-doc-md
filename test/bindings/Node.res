@val
external __dirname: string = "__dirname"

@module("path")
external join: (string, string) => string = "join"

@module("fs")
external readFileSync: (string, @as("utf8") _) => string = "readFileSync"

type spawnSyncOptions = {
  cwd?: string,
  stdio?: string,
  env?: Dict.t<string>,
  encoding?: string,
}
type spawnSyncReturn = {
  pid: int,
  output: array<string>,
  error?: Error.t,
  stdout: string,
  stderr: string,
  status: Nullable.t<int>,
  signal: Nullable.t<int>,
}

@module("child_process")
external spawnSync: (string, array<string>, spawnSyncOptions) => spawnSyncReturn = "spawnSync"

@module("fs")
external writeFileSync: (string, string) => unit = "writeFileSync"

type process = {argv: array<string>, exit: int => unit}
@val
external process: process = "process"

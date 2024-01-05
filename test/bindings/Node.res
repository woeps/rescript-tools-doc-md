@val
external __dirname: string = "__dirname"

@module("path")
external join: (string, string) => string = "join"

@module("fs")
external readFileSync: (string, @as("utf8") _) => string = "readFileSync"

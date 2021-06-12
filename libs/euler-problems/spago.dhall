{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "bhavesh-euler-solutions"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "foldable-traversable"
  , "integers"
  , "lists"
  , "longs"
  , "maybe"
  , "node-buffer"
  , "node-fs"
  , "numbers"
  , "prelude"
  , "psci-support"
  , "strings"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

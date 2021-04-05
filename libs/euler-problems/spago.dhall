{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "bhavesh-euler-solutions"
, dependencies =
  [ "console"
  , "effect"
  , "integers"
  , "lists"
  , "longs"
  , "numbers"
  , "ordered-collections"
  , "psci-support"
  , "strings"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

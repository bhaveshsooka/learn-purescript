{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "http-rest-api-example"
, dependencies =
  [ "aff"
  , "affjax"
  , "arrays"
  , "console"
  , "datetime"
  , "effect"
  , "either"
  , "euler"
  , "httpure"
  , "httpure-middleware"
  , "integers"
  , "maybe"
  , "prelude"
  , "psci-support"
  , "simple-json"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

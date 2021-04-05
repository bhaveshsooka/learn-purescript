{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "http-rest-api-example"
, dependencies =
  [ "affjax"
  , "console"
  , "effect"
  , "euler"
  , "httpure"
  , "httpure-middleware"
  , "psci-support"
  , "simple-json"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

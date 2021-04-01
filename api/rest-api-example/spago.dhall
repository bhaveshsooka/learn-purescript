{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "http-rest-api-example"
, dependencies =
  [ "console"
  , "effect"
  , "httpure"
  , "now"
  , "psci-support"
  , "simple-json"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

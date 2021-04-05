module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Test.Euler (testAllSolutions)

main :: Effect Unit
main = do
  _ <- testAllSolutions 100
  log "Tests Done"
  

module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.EulerProblems (testAllSolutions)

main :: Effect Unit
main
  = testAllSolutions >>= log 

module Main where

import Effect (Effect)
import Effect.Console (log)
import Prelude (Unit, show, (#))
import Problem008 as ProblemModule

main :: Effect Unit
main
  = ProblemModule.solve
    # show
    # log

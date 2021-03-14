module Main where

import Prelude
import Effect ( Effect )
import Effect.Console ( log )

import Problem006 as ProblemModule

main :: Effect Unit
main 
  = ProblemModule.solve
    # show
    # log


module Main where

import Prelude
import Effect ( Effect )
import Effect.Console ( log )

import Problem003 as ProblemModule

main :: Effect Unit
main 
  = ProblemModule.solve
    # show
    # log


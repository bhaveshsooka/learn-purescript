module Problem003 where

import Data.List (filter, sort)
import ListHelpers (getMaxElement)
import MathHelpers (getFactors, isPrime)
import Prelude ((#), (==))

solve :: Int
solve
  = 13195
    # getFactors
    # filter (\e -> isPrime e == true)
    # sort
    # getMaxElement
    
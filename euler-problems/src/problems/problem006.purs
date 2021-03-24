module Problem006 where

import Constants (longOne, longTwo)
import Data.Long (Long, fromInt)
import LongHelpers (sq)
import Prelude (($), (*), (+), (-), (/))

solve :: Long
solve
  = sumSquareDiff $ fromInt 100
  where
    sumSquareDiff :: Long -> Long
    sumSquareDiff n
      = (sq $ sumOfNaturalNumbers n) - sumOfSquareNumbers n
      where
        sumOfNaturalNumbers :: Long -> Long
        sumOfNaturalNumbers limit
          = ((sq limit) + limit) / longTwo

        sumOfSquareNumbers :: Long -> Long
        sumOfSquareNumbers limit
          = (limit * ((longTwo * limit) + longOne) * (limit + longOne)) / (fromInt 6)
 
module Problem006 where

import Data.Long (Long, fromInt)
import LongHelpers (sq)
import Prelude (($), (*), (+), (-), (/))

solve :: Long
solve
  = sumSquareDiff (fromInt 100)
  where
    sumSquareDiff :: Long -> Long
    sumSquareDiff n
      = (sq $ sumOfNaturalNumbers n) - sumOfSquareNumbers n
      where
        sumOfNaturalNumbers :: Long -> Long
        sumOfNaturalNumbers limit
          = ((sq limit) + limit) / (fromInt 2)

        sumOfSquareNumbers :: Long -> Long
        sumOfSquareNumbers limit
          = (limit * (((fromInt 2) * limit) + (fromInt 1)) * (limit + (fromInt 1))) / (fromInt 6)
 
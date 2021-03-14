module Problem006 where

import Data.Long (fromInt, toUnsigned)
import Data.Long.Unsigned (Long)
import MathHelpers (sq)
import Prelude (($), (*), (+), (-), (/))

solve :: Long
solve
  = sumSquareDiff (toUnsigned $ fromInt 100)
  where
    sumOfNaturalNumbers :: Long -> Long
    sumOfNaturalNumbers n
      = ((n * n) + n) / (toUnsigned $ fromInt 2)

    sumOfSquareNumbers :: Long -> Long
    sumOfSquareNumbers n
      = (n * (((toUnsigned $ fromInt 2) * n) + (toUnsigned $ fromInt 1)) * (n + (toUnsigned $ fromInt 1))) / (toUnsigned $ fromInt 6)

    sumSquareDiff :: Long -> Long
    sumSquareDiff limit
      = (sq $ sumOfNaturalNumbers limit) - sumOfSquareNumbers limit
 
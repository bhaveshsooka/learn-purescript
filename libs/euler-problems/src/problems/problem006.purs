module Euler.Internal.Problem006 where

import Data.Long (Long, fromInt)
import Euler.Internal.Constants (longOne, longTwo)
import Euler.Internal.LongHelpers (sq)
import Prelude (($), (*), (+), (-), (/))

-- The sum of the squares of the first ten natural numbers is,
-- 1^2 + 2^2 + ... + 10^2 = 385
-- The square of the sum of the first ten natural numbers is,
-- (1 + 2 + ... + 10)^2 = 55^2 = 3025
-- Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is
-- 3025 - 385 = 2640
-- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
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
 
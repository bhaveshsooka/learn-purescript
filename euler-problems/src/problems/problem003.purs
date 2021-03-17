module Problem003 where

import Converters (stringToLong)
import Data.List (filter)
import Data.Long (Long)
import LongHelpers (getFactors, isPrime, getMaxElement)
import Prelude ((#), (==))

-- | Possible inputs 13195, 600851475143

solve :: Long
solve
  = stringToLong "600851475143"
    # getFactors
    # filter (\e -> isPrime e == true)
    # getMaxElement

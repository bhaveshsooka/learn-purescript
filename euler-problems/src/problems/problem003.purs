module Problem003 where

import Constants (longZero)
import Converters (stringToLong)
import Data.Foldable (maximum)
import Data.List (filter)
import Data.Long (Long)
import Data.Maybe (Maybe(..))
import LongHelpers (getDivisors, isPrime)
import Prelude ((#), (==))

-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?
solve :: Long
solve
  = case getMaxElement of
      Just a -> a
      Nothing -> longZero
  where
    getMaxElement :: Maybe Long
    getMaxElement
      = stringToLong "600851475143"
        # getDivisors
        # filter (\e -> isPrime e == true)
        # maximum

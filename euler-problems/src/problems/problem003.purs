module Problem003 where

import Constants (longZero)
import Converters (stringToLong)
import Data.Foldable (maximum)
import Data.List (filter)
import Data.Long (Long)
import Data.Maybe (Maybe(..))
import LongHelpers (getDivisors, isPrime)
import Prelude ((#), (==))

-- | Possible inputs 13195, 600851475143

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

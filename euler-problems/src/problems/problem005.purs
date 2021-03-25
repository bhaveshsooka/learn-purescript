module Problem005 where

import Constants (longOne)
import Data.List (List(Nil), (:))
import Data.Long (Long, fromInt)
import LongHelpers (range)
import Prelude (lcm)

-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
solve :: Long
solve
  = accumLCM divisorsList longOne 
  where
    accumLCM :: List Long -> Long -> Long
    accumLCM Nil currentLcm
      = currentLcm
    accumLCM (e : es) currentLcm
      = accumLCM es (lcm e currentLcm)

    divisorsList :: List Long
    divisorsList = range (fromInt 11) (fromInt 20)

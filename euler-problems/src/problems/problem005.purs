module Problem005 where

import Data.List (List(Nil), (:))
import Data.Long (Long, fromInt)
import LongHelpers (range)
import Prelude (lcm)

solve :: Long
solve
  = accumLCM (range (fromInt 11) (fromInt 20)) (fromInt 1) 
  where
    accumLCM :: List Long -> Long -> Long
    accumLCM Nil currentLcm
      = currentLcm
    accumLCM (e : es) currentLcm
      = accumLCM es (lcm e currentLcm)
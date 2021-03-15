module Problem005 where

import Data.List (List(Nil), (:))
import Data.Long (fromInt, toUnsigned)
import Data.Long.Unsigned (Long)
import ListHelpers (longRange)
import Prelude (lcm, ($))


solve :: Long
solve
  = continuousLCM (longRange 11 20) (toUnsigned $ fromInt 1) 
  where
    continuousLCM :: List Long -> Long -> Long
    continuousLCM Nil currentLcm
      = currentLcm
    continuousLCM (e : es) currentLcm
      = continuousLCM es (lcm e currentLcm)
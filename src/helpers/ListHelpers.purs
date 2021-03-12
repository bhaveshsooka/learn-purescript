module ListHelpers where

import Data.List (List(Nil), (:))
-- import Data.Long (Long)
-- import MathHelpers (stringToLong)
import Prelude (negate, (<=))

getMaxElement :: List Int -> Int
getMaxElement list
  = innerGetMaxElement list (negate 2147483648)
  where 
    innerGetMaxElement :: List Int -> Int -> Int
    innerGetMaxElement Nil currentMax
      = currentMax
    innerGetMaxElement (e : es) currentMax
      | e <= currentMax
      = innerGetMaxElement es currentMax
    innerGetMaxElement (e : es) currentMax
      = innerGetMaxElement es e


-- getMaxElement' :: List Long -> Long
-- getMaxElement' list
--   = innerGetMaxElement list Long.minValue
--   where 
--     innerGetMaxElement :: List Long -> Long -> Long
--     innerGetMaxElement Nil currentMax
--       = currentMax
--     innerGetMaxElement (e : es) currentMax
--       | e <= currentMax
--       = innerGetMaxElement es currentMax
--     innerGetMaxElement (e : es) currentMax
--       = innerGetMaxElement es e
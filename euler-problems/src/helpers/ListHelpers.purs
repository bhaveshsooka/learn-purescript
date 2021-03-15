module ListHelpers where

import Data.List (List(Nil), range, (:))
import Data.Long (fromInt, toUnsigned)
import Data.Long.Unsigned (Long)
import Prelude (map, negate, (#), ($), (<=))

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

longRange :: Int -> Int -> List Long
longRange start end
  = range start end
    # map (\e -> toUnsigned $ fromInt e)

getMaxElement' :: List Long -> Long
getMaxElement' list
  = innerGetMaxElement list $ toUnsigned $ fromInt 0
  where 
    innerGetMaxElement :: List Long -> Long -> Long
    innerGetMaxElement Nil currentMax
      = currentMax
    innerGetMaxElement (e : es) currentMax
      | e <= currentMax
      = innerGetMaxElement es currentMax
    innerGetMaxElement (e : es) currentMax
      = innerGetMaxElement es e
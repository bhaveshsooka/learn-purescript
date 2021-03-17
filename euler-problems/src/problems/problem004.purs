module Problem004 where

import Data.Int (fromString, toNumber)
import Data.List (filter, range)
import Data.Maybe (fromMaybe)
import Data.Number.Format (toString)
import IntHelpers (getMaxElement)
import Prelude (map, negate, otherwise, (#), ($), (*), (+), (<$>), (<*>), (<=), (==), (>), (||))
import StringHelpers (isPalindrome)

solve :: Int
solve 
   -- = recursiveSoln 100 100 999 999 (-1)
   = listSoln 100 999
   where
      recursiveSoln :: Int -> Int -> Int -> Int -> Int -> Int
      recursiveSoln a b innerLimit outerLimit max
         | a > outerLimit
         = max
         | otherwise
         = recursiveSoln (a + 1) (a + 1) innerLimit outerLimit (innerRecursiveSoln a b innerLimit max)
         where
            innerRecursiveSoln :: Int -> Int -> Int -> Int -> Int
            innerRecursiveSoln innerA innerB limit innerMax
               | innerB > limit
               = innerMax
               | (isPalindrome $ toString $ toNumber (innerA * innerB)) == false || (innerA * innerB) <= innerMax
               = innerRecursiveSoln innerA (innerB + 1) limit innerMax
               | otherwise
               = innerRecursiveSoln innerA (innerB + 1) limit (innerA * innerB)
      
      listSoln :: Int -> Int -> Int
      listSoln min max 
         = (*) <$> range min max <*> range min max
            # map (\e -> toString $ toNumber e)
            # filter (\e -> isPalindrome $ e)
            # map (\e ->  fromMaybe (negate 2147483648) (fromString e))
            # getMaxElement

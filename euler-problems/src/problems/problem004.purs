module Problem004 where

import Data.Int (toNumber)
import Data.Number.Format (toString)
import Prelude (negate, ($), (*), (+), (<=), (==), (>), (||))
import StringHelpers (isPalindrome)

solve :: Int
solve 
   = outer 100 100 999 999 (-1)
   -- = (*) <$> range 100 999 <*> range 100 999
   --  # map (\e -> toString $ toNumber e)
   --  # filter (\e -> isPalindrome $ e)
   --  # map (\e ->  fromMaybe (negate 2147483648) (fromString e))
   --  # getMaxElement
   where
      outer :: Int -> Int -> Int -> Int -> Int -> Int
      outer a b innerLimit outerLimit max
         | a > outerLimit
         = max
      outer a b innerLimit outerLimit max
         = outer (a + 1) (a + 1) innerLimit outerLimit (inner a b innerLimit max)
      
      inner :: Int -> Int -> Int -> Int -> Int
      inner a b limit max
         | b > limit
         = max
      inner a b limit max
         | (isPalindrome $ toString $ toNumber (a*b)) == false || (a * b) <= max
         = inner a (b + 1) limit max
      inner a b limit max
         = inner a (b + 1) limit (a * b)

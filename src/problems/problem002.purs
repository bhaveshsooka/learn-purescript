module Problem002 where

import Prelude ( (+), (/=), mod )
import Data.Ord ( (>) )

solve :: Int
solve
  = sumFibNums 4000000 1 2 0
  where
    sumFibNums :: Int -> Int -> Int -> Int -> Int
    sumFibNums limit a b accumSum
      | a > limit
      = accumSum
    sumFibNums limit a b accumSum
      | a `mod` 2 /= 0 
      = sumFibNums limit b (a + b) accumSum
    sumFibNums limit a b accumSum
      = sumFibNums limit b (a + b) (accumSum + a)

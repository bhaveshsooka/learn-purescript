module Problem002 where

import Prelude (mod, otherwise, (+), (/=), (>))

solve :: Int
solve
  = sumFibNums 4000000 1 2 0
  where
    sumFibNums :: Int -> Int -> Int -> Int -> Int
    sumFibNums limit a b accumSum
      | a > limit       = accumSum
      | a `mod` 2 /= 0  = sumFibNums limit b (a + b) accumSum
      | otherwise       = sumFibNums limit b (a + b) (accumSum + a)

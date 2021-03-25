module Problem001 where

import Prelude (mod, otherwise, (+), (-), (==), (||))

-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.
solve :: Int
solve
  = sumMultiples3And5 999 0
  where
    sumMultiples3And5 :: Int -> Int -> Int
    sumMultiples3And5 limit accumSum
      | limit == 1                                = accumSum
      | limit `mod` 3 == 0 || limit `mod` 5 == 0  = sumMultiples3And5 (limit - 1) (accumSum + limit)
      | otherwise                                 = sumMultiples3And5 (limit - 1) accumSum

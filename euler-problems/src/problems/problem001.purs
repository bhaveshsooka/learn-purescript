module Problem001 where

import Prelude (mod, otherwise, (+), (-), (==), (||))

solve :: Int
solve
  = sumMultiples3And5 999 0
  where
    sumMultiples3And5 :: Int -> Int -> Int
    sumMultiples3And5 limit accumSum
      | limit == 1
      = accumSum
      | limit `mod` 3 == 0 || limit `mod` 5 == 0
      = sumMultiples3And5 (limit - 1) (accumSum + limit)
      | otherwise
      = sumMultiples3And5 (limit - 1) accumSum

module Problem007 where

import IntHelpers (isPrime)
import Prelude (otherwise, (+), (-), (==))

solve :: Int
solve
  = getNthPrime 1 0 10001
  where
    getNthPrime :: Int -> Int -> Int -> Int
    getNthPrime n primeCount limit
      | primeCount == limit = n - 1
      | isPrime n == true   = getNthPrime (n + 1) (primeCount + 1) limit
      | otherwise           = getNthPrime (n + 1) primeCount limit

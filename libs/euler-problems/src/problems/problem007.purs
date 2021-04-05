module Euler.Internal.Problem007 where

import Euler.Internal.IntHelpers (isPrime)
import Prelude (otherwise, (+), (-), (==))

-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
-- What is the 10 001st prime number?
solve :: Int
solve
  = getNthPrime 1 0 10001
  where
    getNthPrime :: Int -> Int -> Int -> Int
    getNthPrime n primeCount limit
      | primeCount == limit = n - 1
      | isPrime n == true   = getNthPrime (n + 1) (primeCount + 1) limit
      | otherwise           = getNthPrime (n + 1) primeCount limit

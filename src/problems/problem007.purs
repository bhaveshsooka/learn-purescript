module Problem007 where

import MathHelpers (isPrime)
import Prelude ((&&), (+), (==))

solve :: Int
solve
  = getNthPrime 1 0 10001
  where
    getNthPrime :: Int -> Int -> Int -> Int
    getNthPrime n primeCount limit
      | primeCount == limit && isPrime n == true
      = n
    getNthPrime n primeCount limit
      | isPrime n == true
      = getNthPrime (n + 1) (primeCount + 1) limit
    getNthPrime n primeCount limit
      = getNthPrime (n + 1) primeCount limit
 
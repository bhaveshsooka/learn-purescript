module Euler.Internal.Problem010 where

import Data.Foldable (sum)
import Data.Long (Long, fromInt)
import Euler.Internal.FFI (sieveOfEratosthenes)
import Prelude ((#))

-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all ~the primes below two million.
solve :: Long
solve
  = fromInt 2000000
    # sieveOfEratosthenes
    # sum

  -- = range longOne (fromInt 2000000)
  --   # filter (\e -> isPrime e == true)
  --   # sum

  -- = sumPrimes (fromInt 2000000) longZero
  -- where
  --   sumPrimes :: Long -> Long -> Long
  --   sumPrimes num accumSum
  --     | num == longOne  = accumSum
  --     | isPrime num     = sumPrimes (num - longOne) (accumSum + num)
  --     | otherwise       = sumPrimes (num - longOne) accumSum

  -- = sumPrimes (fromInt 5) (fromInt 5) (fromInt 2000000)
  -- where
  --   sumPrimes :: Long -> Long -> Long -> Long
  --   sumPrimes num accumSum limit
  --     | num >= limit  = accumSum
  --     | isPrime num = 
  --       case ((num + longTwo) <= limit) && (isPrime (num + longTwo)) of
  --         true -> sumPrimes (num + longTwo + (fromInt 4)) (accumSum + num + (num + longTwo)) limit
  --         false -> sumPrimes (num + longTwo) (accumSum + num) limit
  --     | otherwise     = sumPrimes (num + longTwo) accumSum limit

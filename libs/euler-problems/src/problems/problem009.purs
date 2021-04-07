module Euler.Internal.Problem009 where

import Euler.Internal.IntHelpers (sq)
import Prelude (otherwise, (&&), (*), (+), (-), (==))

-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.
solve :: Int
solve = 
  findPythagorianTriplet 1000 1000 1000 1000
  where
    isPythagorian :: Int -> Int -> Int -> Boolean
    isPythagorian a b c
      | (sq a) + (sq b) == sq c = true
      | (sq b) + (sq c) == sq a = true
      | (sq c) + (sq a) == sq b = true
      | otherwise               = false

    findPythagorianTriplet :: Int -> Int -> Int -> Int -> Int
    findPythagorianTriplet a b c limit
      | isPythagorian a b c == true && (a + b + c == 1000) = a * b * c
      | b == 1    = findPythagorianTriplet (a - 1) limit c limit
      | c == 1    = findPythagorianTriplet a (b - 1) limit limit
      | otherwise = findPythagorianTriplet a b (c - 1) limit


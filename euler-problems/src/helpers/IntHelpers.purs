module IntHelpers where

import Data.List (List(..), length, (:))
import Data.Ord ((>))
import Prelude (mod, negate, (*), (+), (-), (/), (/=), (<), (<=), (==), (>=))

getSqrt :: Int -> Int
getSqrt num 
  | num < 0
  = 0
getSqrt num =
  innerSqrt num 2
  where
    innerSqrt :: Int -> Int -> Int
    innerSqrt n sq
      | (sq * sq) == n
      = sq
    innerSqrt n sq
      | (sq * sq) > n
      = sq - 1
    innerSqrt n sq
      = innerSqrt n (sq + 1)


isPrime :: Int -> Boolean
isPrime num
  = innerIsPrime (Nil) num 1
  where
    innerIsPrime :: List Int -> Int -> Int -> Boolean
    innerIsPrime factors n divisor
      | divisor > getSqrt n
      = length factors == 1
    innerIsPrime factors n divisor
      | n `mod` divisor /= 0
      = innerIsPrime factors n (divisor + 1)
    innerIsPrime factors n divisor
      = innerIsPrime (divisor : factors) n (divisor + 1)

getFactors :: Int -> List Int
getFactors num
  = innerGetFactors num 2 (Nil)
  where
    innerGetFactors :: Int -> Int -> List Int -> List Int
    innerGetFactors n divisor factors
      | divisor >= (getSqrt num)
      = factors
    innerGetFactors n divisor factors
      | n `mod` divisor /= 0
      = innerGetFactors n (divisor + 1) factors
    innerGetFactors n divisor factors
      = innerGetFactors n (divisor + 1) (divisor : (n / divisor) : factors)

getMaxElement :: List Int -> Int
getMaxElement list
  = innerGetMaxElement list (negate 2147483648)
  where 
    innerGetMaxElement :: List Int -> Int -> Int
    innerGetMaxElement Nil currentMax
      = currentMax
    innerGetMaxElement (e : es) currentMax
      | e <= currentMax
      = innerGetMaxElement es currentMax
    innerGetMaxElement (e : es) currentMax
      = innerGetMaxElement es e

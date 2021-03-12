module MathHelpers where

import Data.List (List(Nil), (:), length)
-- import Data.Long (Long, fromInt, fromString, rem)
-- import Data.Maybe
import Data.Ord ((>))
import Prelude (mod, (*), (+), (-), (/), (/=), (<), (==), (>=))

-- stringToLong :: String -> Long
-- stringToLong s
--   = case (fromString s) of
--       Just a -> a
--       Nothing -> fromInt 0


getSqrt :: Int -> Int
getSqrt num
  | num < 0
  = 0
getSqrt num
  = innerSqrt num 2
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


-- getSqrt' :: Long -> Long
-- getSqrt' num
--   | num < fromInt 0
--   = fromInt 0
-- getSqrt' num
--   = innerSqrt num $ fromInt 2
--   where
--     innerSqrt :: Long -> Long -> Long
--     innerSqrt n sq
--       | (sq * sq) == n
--       = sq
--     innerSqrt n sq
--       | (sq * sq) > n
--       = sq - fromInt 1
--     innerSqrt n sq
--       = innerSqrt n (sq + fromInt 1)


-- isPrime' :: Long -> Boolean
-- isPrime' num
--   = innerIsPrime (Nil) num (fromInt 1)
--   where
--     innerIsPrime :: List Long -> Long -> Long -> Boolean
--     innerIsPrime factors n divisor
--       | divisor > getSqrt' n
--       = fromInt (length factors) == fromInt 1
--     innerIsPrime factors n divisor
--       | n `mod` divisor /= fromInt 0
--       = innerIsPrime factors n (divisor + (fromInt 1))
--     innerIsPrime factors n divisor
--       = innerIsPrime (divisor : factors) n (divisor + (fromInt 1))

-- getFactors' :: Long -> List Long
-- getFactors' num
--   = innerGetFactors num (fromInt 2) (Nil)
--   where    
--     innerGetFactors :: Long -> Long -> List Long -> List Long
--     innerGetFactors n divisor factors
--       | divisor >= getSqrt' n
--       = factors
--     innerGetFactors n divisor factors
--       |  n `rem` divisor /= fromInt 0
--       = innerGetFactors n (divisor + (fromInt 1)) factors
--     innerGetFactors n divisor factors
--       = innerGetFactors n (divisor + (fromInt 1)) (divisor : (n / divisor) : factors)
 

module MathHelpers where

import Converters (longtoInt)
import Data.List (List(..), filter, length, range, (:))
import Data.Long (fromInt, toUnsigned)
import Data.Long.Unsigned (Long, rem)
import Data.Ord ((>))
import Prelude (map, mod, (#), ($), (*), (+), (-), (/), (/=), (<), (==), (>=))

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

sqLong :: Long -> Long
sqLong n = n * n 

getSqrt' :: Long -> Long
getSqrt' num
  | num < (toUnsigned $ fromInt 0)
  = toUnsigned $ fromInt 0
getSqrt' num
  = innerSqrt num $ toUnsigned $ fromInt 2
  where
    innerSqrt :: Long -> Long -> Long
    innerSqrt n sq
      | (sq * sq) == n
      = sq
    innerSqrt n sq
      | (sq * sq) > n
      = sq - (toUnsigned $ fromInt 1)
    innerSqrt n sq
      = innerSqrt n (sq + (toUnsigned $ fromInt 1))

isPrime' :: Long -> Boolean
isPrime' num
  = (length (getFactors' num)) == 0

getFactors' :: Long -> List Long
getFactors' num
  | (longtoInt $ getSqrt' num) == 0
  = (Nil)
getFactors' num
  = innerGetFactors num (getDivisors num) (Nil)
  where
    innerGetFactors :: Long -> List Long -> List Long -> List Long
    innerGetFactors n Nil listOfFactors
      = listOfFactors
    innerGetFactors n (currentDivisor : remainingDivisors) listOfFactors
      = innerGetFactors n remainingDivisors ((n / currentDivisor) : currentDivisor : listOfFactors)

    getDivisors :: Long -> List Long
    getDivisors n
      = range 2 (longtoInt $ getSqrt' num)
        # map (\e -> toUnsigned $ fromInt e)
        # filter (\e -> (isDivisible num e) == true)
      where
        isDivisible :: Long -> Long -> Boolean
        isDivisible number divisor
          = (number `rem` divisor) == (toUnsigned $ fromInt 0)

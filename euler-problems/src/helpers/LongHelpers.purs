module LongHelpers where

import Data.List (List(..), filter, length, singleton, (:))
import Data.Long (Long, fromInt, rem)
import Prelude (negate, mod, otherwise, (#), ($), (*), (+), (-), (/), (/=), (<), (<=), (==), (>), (>=))

sq :: Long -> Long
sq n = n * n 

getSqrt :: Long -> Long
getSqrt num
  | num < (fromInt 0)
  = fromInt 0
getSqrt num
  = innerSqrt num $ fromInt 2
  where
    innerSqrt :: Long -> Long -> Long
    innerSqrt n currentSquare
      | (currentSquare * currentSquare) == n
      = currentSquare
    innerSqrt n currentSquare
      | (currentSquare * currentSquare) > n
      = currentSquare - (fromInt 1)
    innerSqrt n currentSquare
      = innerSqrt n (currentSquare + (fromInt 1))

isPrime :: Long -> Boolean
isPrime num
  = (length (getFactors' num)) == 0

getFactors :: Long -> List Long
getFactors num
  | (getSqrt num) == fromInt 0
  = (Nil)
getFactors num
  = innerGetFactors num (getDivisors num) (Nil)
  where
    innerGetFactors :: Long -> List Long -> List Long -> List Long
    innerGetFactors n Nil listOfFactors
      = listOfFactors
    innerGetFactors n (currentDivisor : remainingDivisors) listOfFactors
      = innerGetFactors n remainingDivisors ((n / currentDivisor) : currentDivisor : listOfFactors)

    getDivisors :: Long -> List Long
    getDivisors n
      = range (fromInt 2) (getSqrt n)
        # filter (\e -> (isDivisible num e) == true)
      where
        isDivisible :: Long -> Long -> Boolean
        isDivisible number divisor
          = (number `rem` divisor) == (fromInt 0)

getFactors' :: Long -> List Long
getFactors' num
  | (getSqrt num) == fromInt 0
  = (Nil)
getFactors' num
  = innerGetFactors num (fromInt 2) (Nil)
  where
    innerGetFactors :: Long -> Long -> List Long -> List Long
    innerGetFactors n divisor factors
      | divisor >= (getSqrt num)
      = factors
    innerGetFactors n divisor factors
      | n `mod` divisor /= (fromInt 0)
      = innerGetFactors n (divisor + (fromInt 1)) factors
    innerGetFactors n divisor factors
      = innerGetFactors n (divisor + (fromInt 1)) (divisor : (n / divisor) : factors)

range :: Long -> Long -> List Long
range start end 
  | start == end 
  = singleton start
  | otherwise 
  = go end start (if start > end then (fromInt 1) else (fromInt (-1))) Nil
  where
    go s e step rest 
      | s == e 
      = s : rest
      | otherwise 
      = go (s + step) e step (s : rest)

getMaxElement :: List Long -> Long
getMaxElement list
  = innerGetMaxElement list $ fromInt 0
  where 
    innerGetMaxElement :: List Long -> Long -> Long
    innerGetMaxElement Nil currentMax
      = currentMax
    innerGetMaxElement (e : es) currentMax
      | e <= currentMax
      = innerGetMaxElement es currentMax
    innerGetMaxElement (e : es) currentMax
      = innerGetMaxElement es e
module LongHelpers where

import Constants (longOne, longOneNegative, longThree, longTwo, longZero)
import Data.List (List(Nil), filter, singleton, (:))
import Data.Long (Long)
import Prelude (mod, otherwise, (#), (*), (+), (-), (<), (<=), (==), (>))

sq :: Long -> Long
sq num = num * num

getSqrt :: Long -> Long
getSqrt num
  | num < longZero  = longZero
  | otherwise       = innerSqrt num longTwo
  where
    innerSqrt :: Long -> Long -> Long
    innerSqrt n p
      | sq p == n = p
      | sq p > n  = p - longOne
      | otherwise = innerSqrt n (p + longOne)

isPrime :: Long -> Boolean
isPrime num
  | num <= longZero   = false
  | num == longOne    = false
  | num == longTwo    = true
  | num == longThree  = true
  | otherwise         = getDivisors num == longOne : Nil

getDivisors :: Long -> List Long
getDivisors num
  | num <= longZero = Nil
  | num == longOne  = longOne : Nil
  | otherwise
      = range longOne (getSqrt num) 
        # filter (\e -> (num `mod` e) == longZero)

range :: Long -> Long -> List Long
range start end
  | start == end  = singleton start
  | otherwise     = go end start (if start > end then longOne else longOneNegative) Nil
  where
    go :: Long -> Long -> Long -> List Long -> List Long
    go s e step rest 
      | s == e      = s : rest
      | otherwise   = go (s + step) e step (s : rest)

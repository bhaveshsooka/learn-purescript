module IntHelpers where

import Data.List (List(Nil), filter, range, (:))
import Prelude (mod, otherwise, (#), (*), (+), (-), (<), (<=), (==), (>))

sq :: Int -> Int
sq num = num * num

getSqrt :: Int -> Int
getSqrt num 
  | num < 0   = 0
  | otherwise = innerSqrt num 2
  where
    innerSqrt :: Int -> Int -> Int
    innerSqrt n p
      | sq p == n = p
      | sq p > n  = p - 1
      | otherwise = innerSqrt n (p + 1)

isPrime :: Int -> Boolean
isPrime num
  | num <= 0  = false
  | num == 1  = false
  | num == 2  = true
  | num == 3  = true
  | otherwise = getDivisors num == 1 : Nil

getDivisors :: Int -> List Int
getDivisors num
  | num <= 0  = Nil
  | num == 1  = 1 : Nil
  | otherwise
      = range 1 (getSqrt num) 
        # filter (\e -> (num `mod` e) == 0)

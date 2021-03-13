module Converters where

import Data.Maybe

import Data.Long (fromInt, toUnsigned)
import Data.Long.Unsigned (Long, fromString, toInt)
import Prelude (($))

stringToLong :: String -> Long
stringToLong s
  = case (fromString s) of
      Just a -> a
      Nothing -> toUnsigned $ fromInt 0

longtoInt :: Long -> Int
longtoInt num
  = case (toInt num) of
      Just a -> a
      Nothing -> 0
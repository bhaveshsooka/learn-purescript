module Converters where

import Data.Long (Long, fromInt, fromString)
import Data.Maybe (Maybe(..))

stringToLong :: String -> Long
stringToLong s =
  case (fromString s) of
    Just a -> a
    Nothing -> fromInt 0

module Converters where

import Constants (longZero)
import Data.Long (Long, fromString)
import Data.Maybe (Maybe(..))

stringToLong :: String -> Long
stringToLong s =
  case (fromString s) of
    Just a -> a
    Nothing -> longZero

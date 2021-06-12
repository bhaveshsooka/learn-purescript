module Euler.Internal.Converters where

import Data.Long (Long, fromString)
import Data.Maybe (Maybe(..))
import Euler.Internal.Constants (longZero)

stringToLong :: String -> Long
stringToLong s =
  case (fromString s) of
    Just a -> a
    Nothing -> longZero

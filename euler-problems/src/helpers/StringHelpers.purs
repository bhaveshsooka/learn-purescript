module Euler.Internal.StringHelpers where

import Data.Array (reverse)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Prelude ((#), (==))

isPalindrome :: String -> Boolean
isPalindrome s
  = s == (reverseString s)

reverseString :: String -> String
reverseString s
  = toCharArray s
    # reverse
    # fromCharArray
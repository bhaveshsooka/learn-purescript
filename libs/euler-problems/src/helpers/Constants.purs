module Euler.Internal.Constants where

import Data.Long (Long, fromInt)
import Prelude (negate, ($))

longOneNegative :: Long
longOneNegative = fromInt $ negate 1

longZero :: Long
longZero = fromInt 0

longOne :: Long
longOne = fromInt 1

longTwo :: Long
longTwo = fromInt 2

longThree :: Long
longThree = fromInt 3
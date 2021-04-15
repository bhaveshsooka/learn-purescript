module Euler where

import Euler.Internal.Problem001 as Problem001
import Euler.Internal.Problem002 as Problem002
import Euler.Internal.Problem003 as Problem003
import Euler.Internal.Problem004 as Problem004
import Euler.Internal.Problem005 as Problem005
import Euler.Internal.Problem006 as Problem006
import Euler.Internal.Problem007 as Problem007
import Euler.Internal.Problem008 as Problem008
import Euler.Internal.Problem009 as Problem009
import Euler.Internal.Problem010 as Problem010
import Prelude (show)

computeEulerAnswer :: Int -> String
computeEulerAnswer questionNumber =
  case questionNumber of
    1 -> show Problem001.solve
    2 -> show Problem002.solve
    3 -> show Problem003.solve
    4 -> show Problem004.solve
    5 -> show Problem005.solve
    6 -> show Problem006.solve
    7 -> show Problem007.solve
    8 -> show Problem008.solve
    9 -> show Problem009.solve
    10 -> show Problem010.solve
    otherwise -> "Problem not solved as yet"

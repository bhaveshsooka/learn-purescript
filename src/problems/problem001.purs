module Problem001 where

import Prelude ( (#), (||), (==), mod )
import Data.List ( List, range, filter )
import Data.Foldable ( sum )

solve :: Int
solve
  = gen_list 999
    # filter (\e -> (e `mod` 3 == 0) || (e `mod` 5 == 0))
    # sum 
  where
    gen_list :: Int -> List Int
    gen_list limit = range 1 limit

module Test.Euler (
  testAllSolutions
)
where

import CustomTypes (EulerAnswer, EulerResult(..))
import Data.Array (filter, find, length, range)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Data.Tuple.Nested (get1, get2, get3, get4, tuple2, tuple3, tuple4)
import Effect (Effect)
import Effect.Class.Console (log)
import Euler (computeEulerAnswer)
import Prelude (Unit, bind, map, otherwise, pure, show, (#), ($), (<>), (==))
import Test.EulerAnswers (eulerAnswers)


testAllSolutions :: Int -> Effect Unit
testAllSolutions q = do
  raw_info <- pure
    $ range 1 q
    # map (\e -> tuple2 e (computeEulerAnswer e))
    # map (\e -> tuple3 (get1 e) (get2 e) (checkSolution (get1 e) (get2 e)))
    # map (\e -> tuple4 (get1 e) (get2 e) (lookupAnswer (get1 e)) (get3 e))
  
  correct <- pure $ filter (\e -> get4 e == Correct) raw_info
  incorrect <- pure $ filter (\e -> get4 e == Incorrect) raw_info
  unsolved <- pure $ filter (\e -> get4 e == NotSolved) raw_info

  stats <- 
    pure
    $ (formatCorrect correct) <> "\n" 
    <> (formatIncorrect incorrect) <> "\n" 
    <> (formmatUnsolved unsolved)
  
  log $ stats

  where
    formatCorrect arr = (show Correct) <> "                     :   " <> (show $ length arr)

    formmatUnsolved arr = (show NotSolved) <> "   :   " <> (show $ length arr)

    formatIncorrect [] = (show Incorrect) <> "                   :   0"
    formatIncorrect arr =
      arr
      # map (\e -> "incorrect -> expected " <> (show $ get3 e) <> " got " <> (show $ get2 e))
      # joinWith "\n"

checkSolution :: Int -> String -> EulerResult
checkSolution question answer
  | answer == show NotSolved          = NotSolved
  | answer == lookupAnswer question   = Correct
  | otherwise                         = Incorrect

lookupAnswer :: Int -> String
lookupAnswer question
  = case maybeEulerAnswer of
      Just a -> a.value
      Nothing -> ""
  where 
    maybeEulerAnswer :: Maybe EulerAnswer
    maybeEulerAnswer = find (\eulerAnswer -> eulerAnswer.questionNumber == question) eulerAnswers

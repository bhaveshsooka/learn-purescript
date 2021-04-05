module Test.Euler (
  testAllSolutions
)
where

import Data.Array (find, range, zip)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Class.Console (log)
import Euler (computeEulerAnswer)
import Prelude (Unit, otherwise, show, ($), (<#>), (<$>), (<>), (==))
import Test.EulerAnswers (EulerAnswer, eulerAnswers)

testAllSolutions :: Int -> Effect Unit
testAllSolutions q =
  let 
    answers = (zip (range 1 q) (computeEulerAnswer <$> range 1 q)) <#> f

    f :: Tuple Int String -> String
    f (Tuple a b) = checkSolution a b
  in
  log $ joinWith "\n" answers

checkSolution :: Int -> String -> String
checkSolution question answer
  | answer == "Problem not solved as yet" = show question <> "   : " <> answer
  | answer == lookupAnswer question       = show question <> "   : correct"
  | otherwise                             = show question <> "   : incorrect -> expected " <> lookupAnswer question <> " got " <> answer

lookupAnswer :: Int -> String
lookupAnswer question
  = case maybeEulerAnswer of
      Just a -> a.value
      Nothing -> "Problem not solved as yet"
  where 
    maybeEulerAnswer :: Maybe EulerAnswer
    maybeEulerAnswer = find (\eulerAnswer -> eulerAnswer.questionNumber == question) eulerAnswers

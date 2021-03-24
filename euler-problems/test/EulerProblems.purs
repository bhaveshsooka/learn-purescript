module Test.EulerProblems (
  testAllSolutions
)
where

import Data.Array (find)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Test.EulerAnswers (EulerAnswer, eulerAnswers)
import Prelude (bind, pure, show, ($), (<>), (==))
import Problem001 as Problem001
import Problem002 as Problem002
import Problem003 as Problem003
import Problem004 as Problem004
import Problem005 as Problem005
import Problem006 as Problem006
import Problem007 as Problem007
import Problem008 as Problem008
import Problem009 as Problem009

testAllSolutions :: Effect String
testAllSolutions = do
  _ <- log $ checkSolution 1 (show Problem001.solve)
  _ <- log $ checkSolution 2 (show Problem002.solve)
  _ <- log $ checkSolution 3 (show Problem003.solve)
  _ <- log $ checkSolution 4 (show Problem004.solve)
  _ <- log $ checkSolution 5 (show Problem005.solve)
  _ <- log $ checkSolution 6 (show Problem006.solve)
  _ <- log $ checkSolution 7 (show Problem007.solve)
  _ <- log $ checkSolution 8 (show Problem008.solve)
  _ <- log $ checkSolution 9 (show Problem009.solve)
  pure "Done"


checkSolution :: Int -> String -> String
checkSolution question answer
  = case answer == expectedAnswer of
      true ->  show question <> "   : correct"
      false -> show question <> "   : incorrect -> expected " <> expectedAnswer <> " got " <> answer
  where
    expectedAnswer :: String
    expectedAnswer = lookupAnswer question

lookupAnswer :: Int -> String
lookupAnswer question
  = case maybeEulerAnswer of
      Just a -> a.value
      Nothing -> "Question not solved yet"
  where 
    maybeEulerAnswer :: Maybe EulerAnswer
    maybeEulerAnswer = find (\eulerAnswer -> eulerAnswer.questionNumber == question) eulerAnswers

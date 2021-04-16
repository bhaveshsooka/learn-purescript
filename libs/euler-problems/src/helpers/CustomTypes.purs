module CustomTypes where

import Prelude (class Eq, class Show)

data EulerResult
  = Correct
  | Incorrect
  | NotSolved

type EulerAnswer = {
  questionNumber :: Int,
  value :: String 
}

instance showEulerResult :: Show EulerResult where
  show Correct    = "Correct"
  show Incorrect  = "Incorrect"
  show NotSolved  = "Problem not solved as yet"
    
instance eqEulerResult :: Eq EulerResult where
  eq Correct Correct = true 
  eq Incorrect Incorrect = true
  eq NotSolved NotSolved = true
  eq _ _ = false

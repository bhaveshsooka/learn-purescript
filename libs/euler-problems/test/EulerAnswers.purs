module Test.EulerAnswers where

type EulerAnswer = {
  questionNumber :: Int,
  value :: String 
}

eulerAnswers :: Array EulerAnswer
eulerAnswers = [
  { questionNumber: 1, value: "233168"},
  { questionNumber: 2, value: "4613732"},
  { questionNumber: 3, value: "6857l"},
  { questionNumber: 4, value: "906609"},
  { questionNumber: 5, value: "232792560l"},
  { questionNumber: 6, value: "25164150l"},
  { questionNumber: 7, value: "104743"},
  { questionNumber: 8, value: "23514624000l"},
  { questionNumber: 9, value: "31875000"},
  { questionNumber: 10, value: "142913828922l"}
]

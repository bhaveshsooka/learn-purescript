module EulerController where

import Affjax (get, printError)
import Affjax.ResponseFormat (string)
import Data.Either (Either(..))
import Data.Int (fromString)
import Data.Maybe (Maybe(..))
import Euler (computeEulerAnswer)
import HTTPure (Method(..), Request, ResponseM, badRequest, notImplemented, ok, (!?), (!@))
import Prelude (bind, otherwise, ($), (&&), (<>), (==))

-- | We can safely assume that the path is '/api/euler*'

routerEuler :: Request -> ResponseM
routerEuler req
  | req.method == Get && req.query !? "question"
    = handleQuestion $ req.query !@ "question"

  | req.method == Get && req.query !? "answer" 
    = handleAnswer $ req.query !@ "answer"

  | otherwise
    = notImplemented

handleQuestion :: String -> ResponseM
handleQuestion questionNumber = do
  requestResponse <- get string $ "https://projecteuler.net/problem=" <> questionNumber
  case requestResponse of
    Left err -> badRequest $ "There was an error: " <> printError err
    Right a -> ok a.body

handleAnswer :: String -> ResponseM
handleAnswer questionNumber = 
  case fromString questionNumber of
    Just a -> ok $ computeEulerAnswer a
    Nothing -> badRequest $ "Invalid question number provided"

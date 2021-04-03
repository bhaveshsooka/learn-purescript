module BooksController where

import Books

import Data.Either (Either(..))
import Data.Int (fromString)
import Data.Maybe (Maybe(..))
import Data.Time.Duration (Milliseconds(..))
import Effect.Aff (delay)
import HTTPure (Method(..), Request, ResponseM, badRequest, notImplemented, ok, (!?), (!@))
import Prelude (discard, otherwise, show, ($), (&&), (<>), (==))
import Simple.JSON (readJSON)

-- | We can safely assume that the path is '/api/books*'

routerBook :: Request -> ResponseM
routerBook req    
  | req.method == Get && req.query !? "id"
    = getBook $ req.query !@ "id"

  | req.method == Put && req.query !? "id"
    = updateBook $ req.query !@ "id"
  
  | req.method == Delete && req.query !? "id"
    = deleteBook $ req.query !@ "id"
  
  | req.method == Get
    = getBooks req

  | req.method == Post
    = addBook req.body

  | otherwise
    = notImplemented

getBooks :: Request -> ResponseM
getBooks req = do
  delay $ Milliseconds 5000.0
  ok "list all books"

getBook :: String -> ResponseM
getBook bookId =
  case fromString bookId of
    Just a -> ok $ "retrieve book " <> show a <> "'s information"
    Nothing -> badRequest "no book ID provided"

addBook :: String -> ResponseM
addBook body =
  case readJSON body of
    Right (r :: Book) -> ok $ show r
    Left e -> badRequest $ show e

updateBook :: String -> ResponseM
updateBook bookId =
  case fromString bookId of
    Just a -> ok $ "update book " <> show a <> "'s information"
    Nothing -> badRequest "no book ID provided"

deleteBook :: String -> ResponseM
deleteBook bookId =
  case fromString bookId of
    Just a -> ok $ "delete book " <> show a
    Nothing -> badRequest "no book ID provided"

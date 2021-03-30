module BooksController where

import Data.Int (fromString)
import Data.Maybe (Maybe(..))
import Data.String (length)
import HTTPure (Method(..), Request, ResponseM, badRequest, internalServerError, ok, (!@))
import Prelude (otherwise, show, ($), (&&), (<>), (==), (>))

-- | We can safely assume that the path is '/api/books*'

routerBook :: Request -> ResponseM
routerBook req
  | req.method == Get && (length $ req.path !@ 2) > 0
    = getBook $ req.path !@ 2
  
  | req.method == Get
    = getBooks req

  | req.method == Post
    = addBook req
  
  | req.method == Put
    = updateBook $ req.path !@ 2
  
  | req.method == Delete
    = deleteBook $ req.path !@ 2
  
  | otherwise
    = internalServerError "Method not implemented"

getBooks :: Request -> ResponseM
getBooks req = ok "list all books"

getBook :: String -> ResponseM
getBook bookId =
  case fromString bookId of
    Just a -> ok $ "retrieve book " <> show a <> "'s information"
    Nothing -> badRequest "no book ID provided"

addBook :: Request -> ResponseM
addBook req = ok $ "add a book "

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

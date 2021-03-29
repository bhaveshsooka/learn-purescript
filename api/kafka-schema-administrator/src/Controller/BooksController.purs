module BooksController where

import Prelude

import ErrorHelpers (errorHandler)
import Node.Express.App (App, delete, get, post, put, useOnError)
import Node.Express.Handler (Handler)
import Node.Express.Request (getRouteParam)
import Node.Express.Response (sendJson)

routePath :: String
routePath = "/api/books/"

routerBook :: App
routerBook = do
  get routePath getBooks 
  post routePath $ addBook
  get (routePath <> ":id") getBook
  put (routePath <> ":id") updateBook
  delete (routePath <> ":id") deleteBook
  useOnError $ errorHandler 400

getBooks :: Handler
getBooks = sendJson "list all books"

addBook :: Handler
addBook = sendJson "add a new book"

getBook :: Handler
getBook = do
  id <- getRouteParam "id"
  sendJson "retrieve a single book’s information"

updateBook :: Handler
updateBook = sendJson "update a single book’s information"

deleteBook :: Handler
deleteBook = sendJson "delete a single book"
module Main where

import Prelude

import BooksController (routerBook)
import Effect (Effect)
import Effect.Class.Console (log)
import ErrorHelpers (errorHandler, notFound)
import Node.Express.App (App, all, listenHttp, useOnError)
import Node.HTTP (Server)

app :: App
app = do
  routerBook
  useOnError $ errorHandler 0
  all "*" notFound

main :: Effect Server
main = do
  port <- pure 8080
  listenHttp app port \_ ->
    log $ "Listening on " <> show port
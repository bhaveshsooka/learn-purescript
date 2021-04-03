module Main where

import AppController (healthCheck)
import AuthorizationInterceptor (authorizationMiddleware)
import BooksController (routerBook)
import Data.Array (take)
import Data.Time.Duration (Milliseconds(..))
import Effect.Class.Console (log)
import HTTPure (Request, ResponseM, ServerM, fullPath, notFound, serve)
import HTTPure.Middleware (developmentLogFormat, timeout)
import Prelude (bind, otherwise, pure, show, ($), (<>), (==), (>>>))

main :: ServerM
main = do
  port <- pure 8080
  serve 
    port 
    (middlewares router)
    (log $ "Server now up on port " <> show port <> "\n\n")
  where
    middlewares = (timeout $ Milliseconds 3000.0) >>> authorizationMiddleware >>> developmentLogFormat

router :: Request -> ResponseM
router req
  | fullPath req == "/"                   = healthCheck
  | take 2 req.path == ["api", "books"]   = routerBook req
  | otherwise                             = notFound

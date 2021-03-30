module LoggerInterceptor where

import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import HTTPure (Request, ResponseM, fullPath)
import Prelude (bind, pure, show, ($), (<>))

-- | A middleware that logs at the beginning and end of each request
loggingMiddleware :: (Request -> ResponseM) ->
                     Request ->
                     ResponseM
loggingMiddleware router request = do
  -- _ <- liftEffect $ log $ "Request starting for " <> path
  -- startTime :: DateTime <- liftEffect nowDateTime
 
  response <- router request
  
  -- endTime :: DateTime <- liftEffect nowDateTime
  -- timeTaken <- pure $ diff startTime endTime

  _ <- liftEffect $ log $ "Request ending for " <> show request.method <> " " <> path <> " -- took " <> "TODO: show timeTaken" <> "ms\n"

  pure response
  where
    path = fullPath request

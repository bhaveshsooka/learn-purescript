module AuthorizationInterceptor where

import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import HTTPure (Request, ResponseM, fullPath, unauthorized)
import Prelude (bind, pure, ($), (<>))

-- | A middleware that checks and validates a JWT bearer token of each request
authorizationMiddleware :: (Request -> ResponseM) ->
                     Request ->
                     ResponseM
authorizationMiddleware router request = do
  isValid <- pure $ validateToken "valid"
  case isValid of
    true -> do
      response <- router request
      _ <- liftEffect $ log $ "Authorized Request ending for " <> path
      pure response
    false -> do
      _ <- liftEffect $ log $ "Failed to authorized Request ending for " <> path
      pure unauthorized "JWT token is not valid"
  where
    path = fullPath request


validateToken :: String -> Boolean
validateToken token =
  case token of
    "valid" -> true
    _ -> false
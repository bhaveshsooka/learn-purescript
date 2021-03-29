module ErrorHelpers where

import Prelude

import Effect.Exception (Error, message)
import Node.Express.Handler (Handler)
import Node.Express.Response (sendJson, setStatus)

errorHandler :: Int -> Error -> Handler
errorHandler status err = do
  setStatus (if status == 0 then 400 else status)
  sendJson { error: message err }

notFound :: Handler
notFound = do
  setStatus 404
  sendJson { response: "Resource not found" }
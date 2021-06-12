module Euler.Internal.FileHelpers (
  readQ008_1
) where

import Effect.Unsafe (unsafePerformEffect)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readTextFile)
import Prelude (($), (<>))

resourcesDir :: String
resourcesDir = "/mnt/e/repo-personal/project-fundamentals/learn-purescript/libs/euler-problems/src/resources/"

readInputFromResourceFile :: String -> String
readInputFromResourceFile resourceFile = unsafePerformEffect $ readTextFile UTF8 (resourcesDir <> resourceFile)

readQ008_1 :: String
readQ008_1 = readInputFromResourceFile "q008_1.txt"

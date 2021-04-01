module Books where


type Book = 
  { title   :: String
  , author  :: String
  }

-- stringToBook :: String -> Maybe Book
-- stringToBook str = 
--   case readJSON str of
--     Right (r :: Book) -> pure r
--     Left e -> Nothing
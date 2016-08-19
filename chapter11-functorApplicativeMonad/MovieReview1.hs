movies = [("name", Just "Atilla \"The Hun\""), ("occupation", Just "Khan")]

data MovieReview = MovieReview {
      revTitle  :: String
    , revUser   :: String
    , revReview :: String
                               } deriving Show

-- Create movie review only if all 3 values (title, user & review) are present
-- simpleReview [("title", Just "Don"), ("review", Just "Don Review"), ("user", Just "me")]

simpleReview :: [(String, Maybe String)] -> Maybe MovieReview
simpleReview aList =
  case lookup "title" aList of
    Just (Just title@(_:_)) ->
      case lookup "review" aList of
        Just (Just review@(_:_)) ->
          case lookup "user" aList of
            Just (Just user@(_:_)) ->
              Just (MovieReview title user review)
            _ -> Nothing
        _ -> Nothing -- no review
    _ -> Nothing -- no title



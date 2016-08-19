import Control.Monad

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

maybeReview aList = do
  title <- lookup1 "title" aList
  review <- lookup1 "review" aList
  user <- lookup1 "user" aList
  return $ MovieReview title user review

lookup1 :: String -> [(String, Maybe String)]-> Maybe String
lookup1 key list = case lookup key list of
                     Just(Just value@(_:_)) -> Just value
                     _ -> Nothing

liftedReview aList = liftM3 MovieReview (lookup1 "title" aList)
                                   (lookup1 "user" aList)
                                   (lookup1 "review" aList)

-- Here only MovieReview have 3 arguments
-- In case we have n number of arguments, then liftM is not available
-- Here we can user Control.Monad.ap i.e. generialized lifting
apReview aList = MovieReview `liftM` lookup1 "title" aList
                          `ap` lookup1 "user" aList
                          `ap` lookup1 "review" aList


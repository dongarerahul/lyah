data Context = Home | Mobile | Business deriving (Eq, Show)

type Phone = String

rahul = [(Home, "123-123-1234"), (Mobile, "833-202-3233")]
milind = [(Mobile, "+91 8554036966"), (Business, "+91 20 1234 1234"), (Home, "+91 20 4565 3453"), (Business, "+91 20 2323 3434")]
anna = [(Business, "+260-23-1212")]

-- lookup :: Eq a => a -> [(a, b)] -> Maybe b
onePersonalPhone :: [(Context, Phone)] -> Maybe Phone
onePersonalPhone addressBook = case lookup Home addressBook of
                        Nothing -> lookup Mobile addressBook
                        Just n  -> Just n

allBusinessPhones :: [(Context, Phone)] -> [Phone]
allBusinessPhones addressBook = map snd numbers
  where numbers = case filter (isContext Business) addressBook of
                    [] -> filter(isContext Mobile) addressBook
                    bPhone -> bPhone

isContext phoneTypeToFind (phoneType, phone) = phoneTypeToFind == phoneType

oneBusinessPhone :: [(Context, Phone)] -> Maybe Phone
oneBusinessPhone addressBook = lookup Business addressBook `mplus` lookup Mobile addressBook

allPersonalPhones :: [(Context, Phone)] -> [Phone]
allPersonalPhones addressBook = map snd $ filter (isContext Home) addressBook `mplus` filter (isContext Mobile) addressBook

class Monad m => MonadPlus m where
  mzero :: m a
  mplus :: m a -> m a -> m a

instance MonadPlus [] where
  mzero = []
  mplus = (++)

instance MonadPlus Maybe where
  mzero = Nothing
  ys `mplus` Nothing = ys
  xs `mplus` _ = xs





class Numberish a where
  fromNo :: Integer -> a
  toNo :: a -> Integer

newtype Age = Age Integer deriving (Show, Eq)

instance Numberish Age where
  fromNo n = Age n
  toNo (Age n) = n

newtype Year = Year Integer deriving (Show, Eq)

instance Numberish Year where
  fromNo n = Year n
  toNo (Year n) = n

sumNumberish :: Numberish a => a -> a -> a
sumNumberish a a' = fromNo summed
  where integerOfA  = toNo a
        integerOfA' = toNo a'
        summed = integerOfA + integerOfA'

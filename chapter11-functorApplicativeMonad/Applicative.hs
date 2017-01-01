main = do
  a <- getLine
  b <- getLine
  return $ a ++ b


-- fmap = <$>
-- apply = <*>
--
-- Execution sequence is
-- (++) fmap getLine ==> IO (++ . getLine)
-- then apply
-- IO (getLine ++ getLine)
--
main1 = (++) <$> getLine <*> getLine

main2 = do
  a <- (++) <$> getLine <*> getLine
  putStrLn $ "Concatenated Lines: "  ++ a

main3 = do -- use applicative functor instead of list comprehensions
  putStrLn $ show [x * y | x <- [1, 2, 3], y <- [1, 2, 3]]

main4 = do -- using pure applicative functor
           putStrLn $ show $ [(*0), (+100), (^2)] <*> [1, 2, 3]

main5 = do -- using functor + applicative functor
  putStrLn $ show $ (*) <$> [1, 2, 3] <*> [100, 200, 300]

--main6 = do -- making zip like functionality

--class (Functor f) => ZipList
--  pure x =

--instance Applicative ZipList where
--  pure x = ZipList (repeat x)
--  ZipList fs <*> ZipList xs = ZipList (zipWith (\f x -> f x) fs xs)


-- (+) <$> (+3) <*> (*100) <*> 5
-- gives 508
--
--(\x y z -> [x, y, z]) <$> (+3) <*> (*2) <*> (/2) $ 5
--(\x y z -> [x, y, z]) <$> (5+3) <*> (5*2) <*> (5/2)
--(\ (5+3)  (5*2) <*> (5/2) -> [x, y, z])
--gives [8, 10, 2.5]

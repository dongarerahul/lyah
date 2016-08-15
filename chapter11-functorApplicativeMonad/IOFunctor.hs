import Data.List
import Data.Char

main = do line' <- fmap reverse  getLine
          putStrLn $ "You said " ++ line' ++ " backwords!"

-- fmap reverse will give "Just halb" from "Just Blah"
-- getLine gives IO String and mapping it to reverse IO gnirtS kind of :)-


main1 = do line' <- fmap (++ "!") getLine
           putStrLn $ "You said " ++ line'

-- fmap does postfix "!" to everyline
--

main2 = do line' <- fmap (intersperse '-' . reverse . map toUpper ) getLine
           putStrLn $ "You said (With beautification) : " ++ line'

--Two Functor laws
--fmap id = id
--fmap (f . g) = fmap f . fmap g

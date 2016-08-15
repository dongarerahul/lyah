import Data.List

solveRPN :: (Floating a, Read a) => String -> a
-- solveRPN expression = head (foldl f [] ( words expression))

-- point free style to avoid too many parantheses
solveRPN = head . foldl f [] . words
  where
    f (x:y:ys) "*" = (x * y) : ys
    f (x:y:ys) "+" = (x + y) : ys
    f (x:y:ys) "-" = (x - y) : ys
    f (x:y:ys) "/" = (x / y) : ys
    f (y:ys)  "ln" = log y:ys
    f ys     "sum" = [sum ys]
    f (x:y:ys) "^" = (x ** y) : ys
    f xs numberString = read numberString:xs

-- runghc Calculator.hs "10 20 2 * -"

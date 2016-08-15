import System.Environment
import System.IO

main = do (fileName: _) <- getArgs
          contents <- readFile fileName
          putStrLn $ "File has " ++ show (length $ lines contents) ++ " lines!"


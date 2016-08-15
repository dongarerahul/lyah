import System.Environment
import System.IO
import System.IO.CatchIOError

main = toTry `catch` handler

toTry :: IO()
toTry = do (fileName: _) <- getArgs
           contents <- readFile fileName
           putStrLn $ "File has " ++ show (length $ lines contents) ++ " lines!"

handler :: IOError -> IO()
handler e
  | isDoesNotExistError e = putStrLn $ "File Doesn't Exists: "
  | Otherwise = putStrLn $ " Error !!! " -- ++ fileName

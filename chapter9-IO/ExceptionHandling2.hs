import System.Environment
import System.IO
import System.Directory

main = do (fileName: _) <- getArgs
          fileExists <- doesFileExist fileName
          if fileExists
             then do contents <- readFile fileName
                     putStrLn $ "File has " ++ show (length $ lines contents) ++ " lines!"
             else do putStrLn $ " File Doesn't Exists: " ++ fileName

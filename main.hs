module Main where

import Data.Char
import System.Directory
import System.IO
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    let fileName = head args
    inFD <- openFile fileName ReadMode
    inString <- hGetContents inFD
    (tempFileName, tempFD) <- (openTempFileWithDefaultPermissions "." "sample_output.txt")

    let trimmedFileLines = map trimLine $ lines inString
    mapM (hPutStrLn tempFD) trimmedFileLines

    removeFile fileName
    renameFile tempFileName fileName
    hClose tempFD
    hClose inFD

trimLine :: String -> String
trimLine str = reverse $ dropWhile isSpace $ reverse str


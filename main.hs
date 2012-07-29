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
    outFD <- openFile "sample_output.txt" WriteMode

    let trimmedFileLines = map trimLine $ lines inString
    mapM (hPutStrLn outFD) trimmedFileLines

    removeFile fileName
    renameFile "sample_output.txt" fileName
    hClose outFD
    hClose inFD

trimLine :: String -> String
trimLine str = reverse $ dropWhile isSpace $ reverse str


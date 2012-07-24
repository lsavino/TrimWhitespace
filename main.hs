module Main where

import Data.Char
import System.Directory
import System.IO

main :: IO ()
main = do
    inFD <- openFile "sample_input.txt" ReadMode
    inString <- hGetContents inFD
    outFD <- openFile "sample_output.txt" WriteMode

    let trimmedFileLines = map trimLine $ lines inString
    mapM (hPutStrLn outFD) trimmedFileLines

    removeFile "sample_input.txt"
    renameFile "sample_output.txt" "sample_input.txt"
    hClose outFD
    hClose inFD

trimLine :: String -> String
trimLine str = reverse $ dropWhile isSpace $ reverse str


module Main where

import System.IO
import Data.Char

main :: IO ()
main = do
    inFD <- openFile "sample_input.txt" ReadMode
    inString <- hGetContents inFD
    outFD <- openFile "sample_output.txt" WriteMode

    let trimmedFileLines = map trimLine $ lines inString
    mapM (hPutStrLn outFD) trimmedFileLines

    hClose outFD

trimLine :: String -> String
trimLine str = reverse $ dropWhile isSpace $ reverse str


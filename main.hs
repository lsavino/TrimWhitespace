module Main where

import System.IO

main :: IO ()
main = do
    inFD <- openFile "sample_input.txt" ReadMode
    inString <- hGetContents inFD
    outFD <- openFile "sample_output.txt" WriteMode
    hPutStr outFD inString

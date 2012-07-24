module Main where

import System.IO
import Data.Char

main :: IO ()
main = do
    inFD <- openFile "sample_input.txt" ReadMode
    inString <- hGetContents inFD
    outFD <- openFile "sample_output.txt" WriteMode
    let fileLines = lines inString
        trimmedFileLines = map trimLine fileLines
    mapM putStrLn trimmedFileLines
    return ()

trimLine :: String -> String
trimLine str = 
    let reversed = reverse str
    in dropWhile isSpace reversed


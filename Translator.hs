module Main where

import PGF
import System (getArgs)

main :: IO ()
main = do
	file:_ <- getArgs
	gr     <- readPGF file
	loop (translate gr)

loop :: (String -> String) -> IO ()
loop trans = do
	s <- getLine
	putStr ("ACE: " ++ s)
	putStrLn $ trans s
	loop trans

translate :: PGF -> String -> String
translate gr s = case parseAllLang gr (startCat gr) s of
	(lg,t:_):_ -> " (" ++ (unlines [linearize gr l t | l <- languages gr, l /= lg]) ++ ")"
	_ -> " (NO PARSE)"

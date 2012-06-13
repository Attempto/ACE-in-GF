module Main where

-- Translates from STDIN to STDOUT, from Lang1 to Lang2.
-- The (obligatory) command-line arguments are:
--
-- * PGF file
-- * start category
-- * source language
-- * target language
--
-- Usage:
--
-- cat tests/acewiki_aceowl/sentences.txt | ./Translator TestAttempto.pgf ACEText TestAttemptoAce TestAttemptoCat

import PGF
import Data.Maybe
import System.Environment (getArgs)

main :: IO ()
main = do
	file:cat:lang1:lang2:_ <- getArgs
	pgf <- readPGF file
	loop (translate pgf (fromJust (readType cat)) (fromJust (readLanguage lang1)) (fromJust (readLanguage lang2)))

loop :: (String -> String) -> IO ()
loop trans = do
	s <- getLine
	putStr s
	putStrLn $ trans s
	loop trans

translate :: PGF -> Type -> Language -> Language -> String -> String
translate pgf cat lang1 lang2 s =
	case parse_ pgf lang1 cat (Just 4) s of
		(ParseFailed num, _) -> "|FAIL " ++ unwords (take num (words s))
		(ParseOk trees, _) -> "|OK (" ++ show (length trees) ++ ") " ++ (unlines [linearize pgf lang2 t | t <- trees])
		_ -> "|FAIL"

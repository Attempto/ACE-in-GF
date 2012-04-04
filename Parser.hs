module Main where

-- Copies every line of STDIN to STDOUT, adding
--   * "|OK", if line can be parsed with the given PGF,
--   * "|FAIL" otherwise.
-- The successfully consumed line prefix (plus the failing token)
-- is added to "FAIL".
--
-- Usage example:
--
-- $ echo -e "John asks Mary .\nJohn aasks Mary ." | ./Parser ACE-0_0_2.pgf TestAttemptoAce
-- John asks Mary .|OK
-- John aasks Mary .|FAIL John aasks
-- Parser: <stdin>: hGetLine: end of file

-- TODO: maybe the simple tokenizer `words` is not the best choice
-- TODO: how to suppress the "end of file" error
-- TODO: what does "Just 4" mean?

import PGF
import Data.Maybe
import System (getArgs)

main :: IO ()
main = do
	file:lang:_ <- getArgs
	pgf    <- readPGF file
	loop (parseResult pgf (fromJust (readLanguage lang)))

loop :: (String -> String) -> IO ()
loop trans = do
	s <- getLine
	putStr s
	putStrLn $ trans s
	loop trans

parseResult :: PGF -> Language -> String -> String
parseResult pgf lang s =
	case parse_ pgf lang (startCat pgf) (Just 4) s of
		(ParseFailed num, _) -> "|FAIL " ++ unwords (take num (words s))
		(ParseOk trees, _) -> "|OK"
		_ -> "|FAIL"

-- (Unused)
-- Returns the first language in the PGF
getEng :: PGF -> Language
getEng pgf =
	case languages pgf of
		lang:_ -> lang

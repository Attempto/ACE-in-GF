module Main where

-- This program helps to analyze the amount of ambiguity present
-- in the given PGF. It takes a set of trees from STDIN and outputs
-- the "roundtrip report" to STDOUT. Each line in the report corresponds
-- to a single tree and has 3 fields:
--   1. chosen linearization of the tree
--   2. language ID
--   3. parse result
-- where
--   "chosen linearization" is the linearization of the tree into a language that
--     the user has specified on the commandline. Ideally it should
--     correspond to a disambiguation language, i.e. a language
--     which has the "most bijective" mapping to the trees
--   "language ID" is a name of the concrete language that is used to linearize
--     the tree
--   "parse result" is one of the results of parsing the linearization. One of
--     a) "SAME_TREE" if the resulting tree matches the input tree,
--     b) "SAME_LIN" if the chosen linearization matches the chosen linearization of the input tree,
--     c) the chosen linearization,
--     d) serialization of the tree in case the chosen linearization is empty.
--
-- The output format is designed to be easily processable with Unix commandline tools, e.g.
--
--   cat out.txt | grep -v SAME_ | cut -f2 | sort | uniq -c | sort -nr
--
-- ranks the languages by ambiguity.
--
--
-- Input parameters:
--
--   file: PGF file name
--   cat: start category (TODO: should be optional)
--   lang: language that is used to present the tree (should be disambiguation language)
--
-- Usage example:
--
--   cat trees.txt | ./Roundtripper TestAttempto.pgf ACEText TestAttemptoAce
--

import PGF
import Data.Maybe
import System.Environment (getArgs)

-- Parses the input parameters and starts the loop
main :: IO ()
main = do
	file:cat:lang:_ <- getArgs
	pgf <- readPGF file
	loop (showAmb
		pgf
		(fromJust (readType cat))
		(fromJust (readLanguage lang))
		(languages pgf))


-- Loops over trees in STDIN writing the roundtripping information
-- about each tree to STDOUT.
loop :: (String -> String) -> IO ()
loop showAmb = do
	s <- getLine
	putStrLn $ showAmb s
	loop showAmb


-- Shows the ambiguity of a given string.
showAmb :: PGF -> Type -> Language -> [Language] -> String -> String
showAmb pgf cat disambLang langs s =
	let tree = readExpr s
	in case tree of
		Nothing -> "ERROR: tree not supported: " ++ s
		_       -> showAmb2 pgf cat disambLang langs (fromJust tree)


showAmb2 :: PGF -> Type -> Language -> [Language] -> Tree -> String
showAmb2 pgf cat disambLang langs tree =
	unlines [showLangAmb pgf cat disambLang lang tree | lang <- langs]


showLangAmb :: PGF -> Type -> Language -> Language -> Tree -> String
showLangAmb pgf cat disambLang lang tree =
	unlines (showLangAmb2 pgf cat disambLang lang tree)


showLangAmb2 :: PGF -> Type -> Language -> Language -> Tree -> [String]
showLangAmb2 pgf cat disambLang lang tree =
	map (ppResult pgf tree disambLang lang) (treeToTrees pgf cat lang tree)


-- Based on the given tree and the given language, create
-- one or more trees, like this:
-- 1. linearize the given tree into the given language
--    (note that a tree has only one linearization as we are ignoring variants)
-- 2. parse the result into a set of trees
-- The result is guaranteed (?) to contain at least one tree,
-- the given tree.
treeToTrees :: PGF -> Type -> Language -> Tree -> [Tree]
treeToTrees pgf cat lang tree =
	getTrees pgf cat lang (linearize pgf lang tree)


-- Returns all the trees that result from parsing this sentence.
-- TODO: we currently map a parse failure to an empty list
-- which is not quite correct
getTrees :: PGF -> Type -> Language -> String -> [Tree]
getTrees pgf cat lang s =
	case parse_ pgf lang cat (Just 4) s of
		(ParseFailed num, _) -> []
		(ParseOk trees, _) -> trees
		_ -> error $ "ERROR: Unknown error: " ++ s


-- Pretty-prints the result in a tab-separated 3-column format
ppResult :: PGF -> Tree -> Language -> Language -> Tree -> String
ppResult pgf tree1 disambLang lang tree2 =
	let lin1 = (ppLinearize pgf disambLang tree1)
	in if tree1 == tree2
		then lin1 ++ "\t" ++ (showLanguage lang) ++ "\tSAME_TREE"
		else
			let lin2 = (ppLinearize pgf disambLang tree2)
			in if lin1 == lin2
				then lin1 ++ "\t" ++ (showLanguage lang) ++ "\tSAME_LIN"
				else lin1 ++ "\t" ++ (showLanguage lang) ++ "\t" ++ lin2


-- If linearization fails (i.e. produces an empty string)
-- then return the tree itself.
ppLinearize :: PGF -> Language -> Tree -> String
ppLinearize pgf lang tree =
	let lin = linearize pgf lang tree
	in case lin of
		"" -> (showExpr [] tree)
		_  -> lin

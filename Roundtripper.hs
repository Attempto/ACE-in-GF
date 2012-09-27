module Main where

-- This program helps to analyze the amount of ambiguity present
-- in the given PGF. It takes a set of trees from STDIN and outputs
-- the "roundtrip report" to STDOUT. Roundtrip is done by first linearizing the
-- tree into a concrete language and then parsing the linearization
-- and obtaining one or more trees one of which is the original tree.
-- In the report, the trees are represented in a chosen linearization language
-- which the user has specified on the commandline. Ideally it should correspond
-- to a disambiguation language, i.e. a language which has a bijective
-- mapping to the trees.
--
-- Each line in the report corresponds to a single tree and has
-- 3 or 4 tab-separated fields:
--   1. tag
--   2. language ID
--   3. chosen linearization of the tree
--   4. parse result (missing if SAME_TREE or SAME_LIN)
-- where
--   "tag" is one of
--     a) SAME_TREE: result tree matches input tree,
--     b) SAME_LIN: linearization of result tree matches linearization of input tree,
--     c) EMPTY_LIN: linearization of result tree is empty
--        (in this case parse result == serialization of the tree),
--     d) DIFF_ORDER: linearizations differ only in word order,
--     e) DIFF_WORDS1: lin1 uses more words than lin2,
--     f) DIFF_WORDS2: lin2 uses more words than lin1,
--     g) DIFF: linearizations differ in other ways.
--   "language ID" is a name of the concrete language that is used to linearize
--     the tree in the round-trip.
--   "chosen linearization" is the linearization of the tree into a language that
--     the user has specified on the commandline.
--   "parse result" is one of the results of parsing the linearization. One of
--     a) the chosen linearization,
--     b) serialization of the tree in case the chosen linearization is empty.
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
--   lang: language that is used to present the tree (should be disambiguation language)
--
-- Usage examples:
--
--   cat trees.txt | ./Roundtripper TestAttempto.pgf TestAttemptoAce
--   echo "gr -number=10" | gf --run TestAttempto.pgf | ./Roundtripper TestAttempto.pgf TestAttemptoAce | grep DIFF
--
-- Output example (where the chosen lin language is English):
--
--   SAME_TREE  \t Est \t John likes Mary .
--   DIFF_ORDER \t Est \t John likes Mary . \t Mary likes John .
--
-- means that the input was a tree whose English lin is "John likes Mary.",
-- however if this tree is linearized into Estonian which is then parsed then
-- we obtain two trees, one is identical to the original, the other is different.
-- The English lin of the 2nd tree has a different word order than the English
-- lin of the 1st tree, indicating that the Estonian parser might have a bug.
--
-- TODO: learn Haskell and make this code elegant
-- TODO: add support for &+
-- TODO: allow startcat to be user-specified: (fromJust (readType cat))
-- TODO: do not print an error message when STDIN ends
-- TODO: handle parsing errors better
-- TODO: add more DIFF types
--

import PGF
import Data.Maybe
import Data.Set (isProperSubsetOf, fromList)
import Data.List
import System.Environment (getArgs)

-- Parses the input parameters and starts the loop
main :: IO ()
main = do
	file:lang:_ <- getArgs
	pgf <- readPGF file
	loop (showAmb
		pgf
		(startCat pgf)
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
		_ -> []


ppResult :: PGF -> Tree -> Language -> Language -> Tree -> String
ppResult pgf tree1 disambLang lang tree2 =
	let lin1 = (linWithBind pgf disambLang tree1)
	in if tree1 == tree2
		then ppLine3 "SAME_TREE" lang lin1
		else
			let lin2 = (linWithBind pgf disambLang tree2)
			in if lin2 == ""
				then ppLine4 "EMPTY_LIN" lang lin1 (showExpr [] tree2)
				else if lin1 == lin2
					then ppLine3 "SAME_LIN" lang lin1
					else if (sort . words) lin1 == (sort . words) lin2
						then ppLine4 "DIFF_ORDER" lang lin1 lin2
						else if usesLessWords lin2 lin1
							then ppLine4 "DIFF_WORDS1" lang lin1 lin2
							else if usesLessWords lin1 lin2
								then ppLine4 "DIFF_WORDS2" lang lin1 lin2
								else ppLine4 "DIFF" lang lin1 lin2

-- Uses less (unique) words
usesLessWords :: String -> String -> Bool
usesLessWords s1 s2 =
	isProperSubsetOf ((fromList . words) s1) ((fromList . words) s2)


-- TODO: add glue (&+) handling
linWithBind :: PGF -> Language -> Tree -> String
linWithBind pgf lang tree =
	linearize pgf lang tree


-- Pretty-prints the result line
ppLine4 :: String -> Language -> String -> String -> String
ppLine4 tag lang lin1 lin2 =
	tag ++ "\t" ++ (showLanguage lang) ++ "\t" ++ lin1 ++ "\t" ++ lin2

ppLine3 :: String -> Language -> String -> String
ppLine3 tag lang lin1 =
	tag ++ "\t" ++ (showLanguage lang) ++ "\t" ++ lin1

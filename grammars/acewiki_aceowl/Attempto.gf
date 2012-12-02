abstract Attempto =
  Numeral, Symbols, Questions ** {

-- Use Text to get only single-sentence texts.
flags startcat = ACEText ;

cat CN ; cat VarCN ;

cat NPType ; NP NPType ;

cat Card ;
cat PN ;
-- Some lexicons require A (see e.g. /words/acewiki_aceowl/)
cat A ;
cat A2 ;
cat RS ;
cat Pron ;
cat IndefPron NPType ;
cat S ; cat SimpleS ;
cat VP ;
cat V ;
cat V2 ;
cat Conj ;
cat IP ;
cat IDet ;
cat QS ;
cat Text ;
cat RP ;
cat Unit ;
cat MCN ;
cat PP ;
cat VPS ;
cat [VPS] {2} ;

fun exist_plus, exist_minus : NPType ;

fun aNP : VarCN -> NP exist_plus ;
fun theNP : VarCN -> NP exist_minus ;

-- Note: in full ACE this must be 'exist_plus'
fun noNP : VarCN -> NP exist_minus ;
fun everyNP : VarCN -> NP exist_minus ;
fun pnNP : PN -> NP exist_minus ;

-- [JJC] [KK]
-- - ACE and AceWiki allow 'there is some-'
-- - ACE and AceWiki do not allow 'there is every-'
-- - AceWiki does not allow 'there is no-' (but ACE does)
fun somebody_IPron : IndefPron exist_plus ;
fun something_IPron : IndefPron exist_plus ;
fun everybody_IPron : IndefPron exist_minus ;
fun everything_IPron : IndefPron exist_minus ;
fun nobody_IPron : IndefPron exist_minus ;
fun nothing_IPron : IndefPron exist_minus ;

fun indefPronNP : (k : NPType) -> IndefPron k -> NP k ;
fun indefPronVarNP : (k : NPType) -> IndefPron k -> Var -> NP k ;

fun at_leastNP : Card -> VarCN -> NP exist_plus ;
fun at_mostNP : Card -> VarCN -> NP exist_plus ;
fun more_thanNP : Card -> VarCN -> NP exist_plus ;
fun less_thanNP : Card -> VarCN -> NP exist_plus ;
fun exactlyNP : Card -> VarCN -> NP exist_plus ;

fun nothing_butNP : VarCN -> NP exist_minus ;

fun apposVarCN : CN -> Var -> VarCN ;  -- a man X

fun cn_as_VarCN : CN -> VarCN ;

-- Note: in full ACE this must be 'exist_plus'
fun termNP : (k : NPType) -> Term -> NP k ;

-- Relative clause can be attached to both CNs and NPs.
-- relCN provides relative clauses in constructs like
-- `which woman who ...` and `for every woman who ...`
fun relCN : VarCN -> RS -> VarCN ;

fun relNP : (k : NPType) -> NP k -> RS -> NP k ;

fun andRS : RS -> RS -> RS ;
fun orRS : RS -> RS -> RS ;

fun predRS : RP -> VP -> RS ;
fun neg_predRS : RP -> VP -> RS ;
fun slashRS : (k : NPType) -> RP -> NP k -> V2 -> RS ;
fun neg_slashRS : (k : NPType) -> RP -> NP k -> V2 -> RS ;

fun which_RP : RP ;

-- of-construction
-- example: dog of John and Mary
-- This version does not allow 'dog X of John' which is supported
-- by full ACE but not in AceWiki. Note that naively changing the rule to
-- "VarCN -> NP -> VarCN" would allow complex of-structures,
-- e.g. ((dog of X) of X), most of which ACE does not allow. [KK]
fun ofCN : (k : NPType) -> CN -> NP k -> VarCN ;

fun vpS : (k : NPType) -> NP k -> VP -> SimpleS ;
fun neg_vpS : (k : NPType) -> NP k -> VP -> SimpleS ;

fun v2VP : (k : NPType) -> V2 -> NP k -> VP ;

fun a2VP : (k : NPType) -> A2 -> NP k -> VP ; -- is mad-about NP

fun thereNP : NP exist_plus -> SimpleS ;  -- there is/are

fun coordS : Conj -> S -> S -> S ;

fun and_Conj : Conj ;
fun or_Conj : Conj ;

-- In order to implement VP coordination, we
-- (1) convert VP into VPS,
-- (2) use VPS coordination producing VPS,
-- (3) map VPS into S (and QS?) (but definitely not into RS).
fun vp_as_posVPS : VP -> VPS ;
fun vp_as_negVPS : VP -> VPS ;
fun np_coord_VPS : (k : NPType) -> NP k -> Conj -> [VPS] -> SimpleS ;

fun for_everyS : VarCN -> S -> S ;

fun if_thenS : S -> S -> S ;
fun falseS : SimpleS -> S ; -- it is false that

fun simpleS_as_S : SimpleS -> S ;

-- These have been replaced by the more generic function npqQS, which allows
-- for wh-words in the object position of a relative clause as subject
-- e.g. "somebody who is who is a man?"
--fun ipQS : IP -> VP -> QS ;
--fun neg_ipQS : IP -> VP -> QS ;

-- who does Mary like?
fun slash_ipQS : (k : NPType) -> IP -> NP k -> V2 -> QS ;

-- who does Mary not like?
fun neg_slash_ipQS : (k : NPType) -> IP -> NP k -> V2 -> QS ;

fun whoSg_IP : IP ;
fun whatSg_IP : IP ;

fun whichIP : IDet -> VarCN -> IP ;
fun which_IDet : IDet ;
fun whichPl_IDet : IDet ;

cat ACEText ;
fun consText : Text -> ACEText -> ACEText ;

fun baseText : Text -> ACEText ;

fun sText : S -> Text ;
fun qsText : QS -> Text ;

fun npVP : (k : NPType) -> NP k -> VP ;              -- is a bank
fun digitsCard : Digits -> Card ;   -- 8 banks
fun v2_byVP : (k : NPType) -> V2 -> NP k -> VP ;      -- is bought by a customer

}

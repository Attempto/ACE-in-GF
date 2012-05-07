abstract Attempto =
  Numeral, Symbols ** {

-- Use Text to get only single-sentence texts.
flags startcat = ACEText ;

-- Do not delete these categories,
-- even if they are not used below.
-- This way we do not need to modify the
-- other files in this directory.
cat CN ;
cat NP ;
cat Card ;
---cat Numeral ;
cat PN ;
cat A ;
cat A2 ;
cat AP ;
cat RS ;
cat Pron ; cat IndefPron ;
cat Prep ;
cat S ;
cat VP ;
cat V ;
cat VS ;
cat V2 ;
cat V3 ;
cat Adv ;
cat Conj ;
cat IP ;
cat IAdv ;
cat IDet ;
cat QS ;
cat Text ;
cat RP ;
cat Unit ;
cat MCN ;
cat PP ;
cat VPS ;
cat [VPS] {2} ;


fun aNP : CN -> NP ;
fun theNP : CN -> NP ;
fun cardNP : Card -> CN -> NP ;
fun noNP : CN -> NP ;
fun everyNP : CN -> NP ;

fun pnNP : PN -> NP ;

-- [JJC]
fun somebody_IPron : IndefPron ;
fun something_IPron : IndefPron ;
fun everybody_IPron : IndefPron ;
fun everything_IPron : IndefPron ;
fun nobody_IPron : IndefPron ;
fun nothing_IPron : IndefPron ;

-- [JJC]
fun indefPronNP : IndefPron -> NP ;
fun indefPronVarNP : IndefPron -> Var -> NP ;


fun at_leastNP : Card -> CN -> NP ;
fun at_mostNP : Card -> CN -> NP ;
fun more_thanNP : Card -> CN -> NP ;
fun less_thanNP : Card -> CN -> NP ;
fun exactlyNP : Card -> CN -> NP ;

fun nothing_butNP : CN -> NP ;

fun apposVarCN : CN -> Var -> CN ;  -- a man X
fun termNP : Term -> NP ;

-- 2.2.2

-- Relative clause can be attached to
-- both CNs and NPs.
-- TODO: maybe get rid of relCN, as
-- CN goes to NP anyway.
-- We should avoid the ambiguity that would
-- result if both rules are present.
fun relCN : CN -> RS -> CN ;
fun relNP : NP -> RS -> NP ;

fun andRS : RS -> RS -> RS ;
fun orRS : RS -> RS -> RS ;

fun predRS : RP -> VP -> RS ;
fun neg_predRS : RP -> VP -> RS ;
fun slashRS : RP -> NP -> V2 -> RS ;
fun neg_slashRS : RP -> NP -> V2 -> RS ;

fun which_RP : RP ;

-- 2.2.4

fun ofCN : CN -> NP -> CN ; -- dog of John and Mary

-- 2.3.1

fun vpS : NP -> VP -> S ;
fun neg_vpS : NP -> VP -> S ;

fun v2VP : V2 -> NP -> VP ;

fun vVP : V -> VP ; -- John waits [JJC]

-- 2.3.2 [JJC]

fun a2VP : A2 -> NP -> VP ; -- is mad-about NP

-- 3.2

fun thereNP : NP -> S ;  -- there is/are

-- 3.4.1

fun coordS : Conj -> S -> S -> S ;

fun and_Conj : Conj ;
fun or_Conj : Conj ;

-- In order to implement VP coordination, we
-- (1) convert VP into VPS,
-- (2) use VPS coordination producing VPS,
-- (3) map VPS into S (and QS?) (but definitely not into RS).
fun vp_as_posVPS : VP -> VPS ;
fun vp_as_negVPS : VP -> VPS ;
fun np_coord_VPS : NP -> Conj -> [VPS] -> S ;

-- 3.4.3

fun for_everyS : CN -> S -> S ;

-- 3.4.4

fun if_thenS : S -> S -> S ;
fun falseS : S -> S ; -- it is false that

-- 3.5

-- who likes Mary?
fun ipQS : IP -> VP -> QS ;

-- who does not like Mary?
fun neg_ipQS : IP -> VP -> QS ;

-- WH-word in object position.
-- Note that AceWiki only supports `Mary likes who?' but because
-- it is DRS-equivalent to `who does Mary like?' in (full) ACE,
-- supporting just the latter in the GF implementation can be considered enough.

-- who does Mary like?
fun slash_ipQS : IP -> NP -> V2 -> QS ;

-- who does Mary not like?
fun neg_slash_ipQS : IP -> NP -> V2 -> QS ;

fun whoSg_IP : IP ;
fun whatSg_IP : IP ;

fun whichIP : IDet -> CN -> IP ;
fun which_IDet : IDet ;
fun whichPl_IDet : IDet ;

-- 4

cat ACEText ;
fun consText : Text -> ACEText -> ACEText ;

fun baseText : Text -> ACEText ;

fun sText : S -> Text ;
fun qsText : QS -> Text ;

-- more

fun npVP  : NP -> VP ;              -- is a bank
fun digitsCard : Digits -> Card ;   -- 8 banks
fun v2_byVP : V2 -> NP -> VP ;      -- is bought by a customer

}

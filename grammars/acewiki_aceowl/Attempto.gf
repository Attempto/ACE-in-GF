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
cat Pron ;
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
cat QS ;
cat Text ;
cat RP ;
cat Unit ;
cat MCN ;
cat PP ;


fun aNP : CN -> NP ;
fun theNP : CN -> NP ;
fun cardNP : Card -> CN -> NP ;
fun noNP : CN -> NP ;
fun everyNP : CN -> NP ;
-- TODO: remove this
-- currently it is required to make the negated copula work, i.e.
-- ... is not every man
-- or actually, the negated copula is `isn't`, so we could
-- remove this rule, only this would affect existing statistics.
fun notEveryNP : CN -> NP ;


fun pnNP : PN -> NP ;


fun somebody_NP : NP ;
fun something_NP : NP ;
fun everybody_NP : NP ;
fun nobody_NP : NP ;
fun nothing_NP : NP ;
-- TODO: remove the next 2
fun not_everybodyNP : NP ;
fun not_everythingNP : NP ;

fun at_leastNP : Card -> CN -> NP ;
fun at_mostNP : Card -> CN -> NP ;
fun more_thanNP : Card -> CN -> NP ;
fun less_thanNP : Card -> CN -> NP ;
fun exactlyNP : Card -> CN -> NP ;

fun apposVarCN : CN -> Var -> CN ;  -- a man X
fun termNP : Term -> NP ;

-- 2.2.2

-- TODO: what is the difference?
fun relCN : CN -> RS -> CN ;
--fun relNP : NP -> RS -> NP ;

fun andRS : RS -> RS -> RS ;
fun orRS : RS -> RS -> RS ;

fun suchCN : CN -> S -> CN ;

fun predRS : RP -> VP -> RS ;

fun which_RP : RP ;

-- 2.2.4

fun ofCN : CN -> NP -> CN ; -- dog of John and Mary

-- 2.3.1

fun vpS : NP -> VP -> S ;
fun neg_vpS : NP -> VP -> S ;

fun vVP  : V -> VP ;
fun v2VP : V2 -> NP -> VP ;

-- 3.2

fun thereNP : NP -> S ;  -- there is/are

-- 3.4.1

fun coordS : Conj -> S -> S -> S ;

fun and_Conj : Conj ;
fun or_Conj : Conj ;

-- 3.4.3

fun for_everyS : CN -> S -> S ;

-- 3.4.4

fun if_thenS : S -> S -> S ;
fun falseS : S -> S ; -- it is false that

-- 3.5

-- TODO: what is the difference?
fun ipQS : IP -> VP -> QS ;
--fun npQS : NP -> VP -> QS ;

fun whoSg_IP : IP ;

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

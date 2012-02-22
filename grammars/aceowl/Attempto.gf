abstract Attempto =
  Numeral, Symbols ** {

-- We allow only single-sentence texts.
flags startcat = Text ;

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
fun notEveryNP : CN -> NP ;
fun notEachNP : CN -> NP ;


fun pnNP : PN -> NP ;
fun intNP : Int -> NP ;
fun floatNP : Float -> NP ;


--fun someone_NP : NP ;
fun somebody_NP : NP ;
fun something_NP : NP ;
fun everybody_NP : NP ;
--fun noone_NP : NP ;
fun nobody_NP : NP ;
fun nothing_NP : NP ;
--fun not_everyoneNP : NP ;
fun not_everybodyNP : NP ;
fun not_everythingNP : NP ;

fun at_leastNP : Card -> CN -> NP ;
fun at_mostNP : Card -> CN -> NP ;
fun more_thanNP : Card -> CN -> NP ;
fun exactlyNP : Card -> CN -> NP ;

fun nothing_butNP : CN -> NP ; -- nothing but apples
fun nobody_butNP : PN -> NP ; -- nobody but John
fun no_butNP : CN -> PN -> NP ; -- no man but John

fun apposVarCN : CN -> Var -> CN ;  -- a man X
fun termNP : Term -> NP ;

-- 2.2.1

fun adjCN : AP -> CN -> CN ;
fun positAP : A -> AP ;
fun comparAP : A -> AP ;
fun superlAP : A -> AP ;


-- 2.2.2

fun relCN : CN -> RS -> CN ;
fun relNP : NP -> RS -> NP ;
fun andRS : RS -> RS -> RS ;
fun orRS : RS -> RS -> RS ;

fun suchCN : CN -> S -> CN ;

fun predRS : RP -> VP -> RS ;
fun slashRS : RP -> NP -> V2 -> RS ;

fun which_RP : RP ;

-- 2.2.4

fun genNP : NP -> CN -> NP ; -- everybody's customer
fun ofCN : CN -> NP -> CN ; -- dog of John and Mary
fun genOwnNP : NP -> CN -> NP ; -- his own customer

-- 2.3.1

fun vpS : NP -> VP -> S ;
fun neg_vpS : NP -> VP -> S ;

fun vVP  : V -> VP ;
fun v2VP : V2 -> NP -> VP ;

-- 2.3.2

fun apVP    : AP -> VP ;
fun compVP  : A -> NP -> VP ;  -- John is richer than Mary
fun as_asVP : AP -> NP -> VP ; -- John is as rich as Mary
fun more_thanVP : AP -> NP -> VP ; -- John is as rich as Mary

-- John is as fond-of Mary as of Sue
-- John is more fond-of Mary than of Sue

-- 3.2

fun thereNP : NP -> S ;  -- there is/are

-- 3.4.1

fun coordS : Conj -> S -> S -> S ;

fun and_Conj : Conj ;
fun or_Conj : Conj ;
fun commaAnd_Conj : Conj ; -- lower precedence
fun commaOr_Conj : Conj ;

-- 3.4.3

fun for_everyS : CN -> S -> S ;

-- 3.4.4

fun if_thenS : S -> S -> S ;
fun falseS : S -> S ; -- it is false that

-- 3.5

fun npQS : NP -> VP -> QS ;
fun ipQS : IP -> VP -> QS ;

fun whoSg_IP : IP ;
fun whoPl_IP : IP ;

fun there_ipQS : IP -> QS ; -- there is who

fun whoseIP : CN -> IP ;  -- whose dog

-- 4

cat ACEText ;
fun consText : Text -> ACEText -> ACEText ;

fun baseText : Text -> ACEText ;

fun sText : S -> Text ;
fun qsText : QS -> Text ;

-- more

fun npVP  : NP -> VP ;              -- is a bank
fun numeralCard : Numeral -> Card ; -- fifteen banks
fun digitsCard : Digits -> Card ;   -- 8 banks
fun have_V2 : V2 ;                  -- has (an apple)
fun v2_byVP : V2 -> NP -> VP ;      -- is bought by a customer

}

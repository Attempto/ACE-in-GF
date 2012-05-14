abstract ACE =
  Attempto, SymbolsACE ** {

flags startcat = ACEText ;

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

-- 4 men X
fun cardNP : Card -> VarCN -> ThereNP ;

fun eachNP : CN -> NP ;
fun notEveryNP : CN -> NP ;
fun notEachNP : CN -> NP ;

fun theCollNP : CN -> NP ;
fun someCollNP : CN -> ThereNP ;
fun allCollNP : CN -> NP ;
fun noCollNP : CN -> NP ;

fun eachTheNP : CN -> NP ;
fun eachSomeNP : CN -> NP ;
fun eachNumNP : Card -> CN -> NP ;

cat MCN ;

fun someMassNP : MCN -> ThereNP ;
fun noMassNP : MCN -> ThereNP ;
fun allMassNP : MCN -> NP ;
fun notAllMassNP : MCN -> NP ;

---fun one_Card : Card ;
---fun two_Card : Card ;
---fun five_Card : Card ;
---fun ten_Card : Card ;


fun intNP : Int -> NP ;
fun floatNP : Float -> NP ;


-- arithmetic expressions with + - * /

-- strings "foo" and "foo" & "bar

-- sets {a,b,c}

-- lists [a,b,c]

fun it_NP : NP ;
fun he_NP : NP ;
fun she_NP : NP ;
fun he_she_NP : NP ;
fun they_NP : NP ;


-- reflexive pronouns: itself, himself, herself, himself/herself, themselves

--fun someone_IPron : IndefPron ;
--fun noone_Ipron : IndefPron;
--fun not_everyoneNP : NP ;
fun not_everybodyNP : NP ;
fun not_everythingNP : NP ;

fun nothing_butMassNP : MCN -> NP ; -- nothing but water
fun nobody_butNP : PN -> NP ; -- nobody but John
fun no_butNP : CN -> PN -> NP ; -- no man but John

cat Unit ; -- SI measurement units

fun unitNP : Card -> Unit -> ThereNP ;
fun unit_ofNP : Card -> Unit -> CN -> ThereNP ;      -- 3 kg of apples
fun unit_ofMassNP : Card -> Unit -> MCN -> ThereNP ; -- 3 l of water

fun conjNP : NP -> NP -> NP ;

-- 2.2.1

fun adjCN : AP -> CN -> CN ;
fun positAP : A -> AP ;
fun comparAP : A -> AP ;
fun superlAP : A -> AP ;


-- 2.2.2

fun eachRP : RP ;

-- 2.2.4

fun genNP : NP -> CN -> NP ; -- everybody's customer
fun genOwnNP : NP -> CN -> ThereNP ; -- his own customer

-- 2.3.1

fun not_provably_vpS : NP -> VP -> S ;

fun vVP  : V -> VP ;
fun vsVP : VS -> S  -> VP ;
fun v3VP : V3 -> NP -> NP -> VP ;

-- 2.3.2

fun apVP    : AP -> VP ;
fun compVP  : A -> NP -> VP ;  -- John is richer than Mary
fun as_asVP : AP -> NP -> VP ; -- John is as rich as Mary
fun more_thanVP : AP -> NP -> VP ; -- John is as rich as Mary

-- John is as fond-of Mary as of Sue
-- John is more fond-of Mary than of Sue

cat PP ;
--cat [PP] {1} ;
--fun ppVP : [PP] -> VP ; -- John is in the garden in the morning
fun ppVP : PP -> VP ; -- iteration is done by advPP and modVP

fun prepPP : Prep -> NP -> PP ;
fun advPP : PP -> Adv ;

-- 2.3.5

fun canVP : VP -> VP ;
fun mustVP : VP -> VP ;
fun have_toVP : VP -> VP ;

-- 2.4

fun modVP : VP -> Adv -> VP ;

-- 3.3

fun formulaS : Formula -> S ;

-- 3.4.1

fun commaAnd_Conj : Conj ; -- lower precedence
fun commaOr_Conj : Conj ;

-- 3.4.3

fun for_eachS : CN -> S -> S ;
fun for_each_ofS : Card -> CN -> S -> S ; -- for each of 3 men
fun for_allMassS : MCN -> S -> S ; -- for all water

-- 3.4.4

fun not_provableS : S -> S ; -- it is not provable that
fun possibleS : S -> S ; -- it is possible that
fun not_possibleS : S -> S ;
fun necessaryS : S -> S ;
fun not_necessaryS : S -> S ;

-- 3.5

-- Yes/No-question: does Mary like everybody ?
fun npQS : NP -> VP -> QS ;

fun iadvQS : IAdv -> NP -> VP -> QS ;

fun where_IAdv : IAdv ;
fun when_IAdv : IAdv ;
fun whoPl_IP : IP ;

fun there_ipQS : IP -> QS ; -- there is who

fun whoseIP : CN -> IP ;  -- whose dog

-- 3.6

fun np_impVP : NP -> VP -> Text ; -- John, go to the bank!

-- 4

cat ACEText ;

-- more

fun impVP : VP -> Text ;            -- go to the bank!
fun numeralCard : Numeral -> Card ; -- fifteen banks
fun have_V2 : V2 ;                  -- has (an apple)

}

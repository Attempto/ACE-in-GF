--# -path=.:present

concrete GeographyGer of Geography = AttemptoGer **
  open SyntaxGer, ParadigmsGer in {

flags coding=utf8 ;

oper DUMMY : Str = "~" ;

oper mkkN : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;
oper mk2N : Str -> Str -> Gender -> AttemptoGer.CN =
	\sg,pl,gen -> mkCN (mkN sg pl gen) ;

-- Input forms:
-- 1. Infinitiv Präsens
-- 2. Präsens Indikativ er/sie/es
-- 3. Partizip Perfekt
oper aceV : (_,_,_:Str) -> AttemptoGer.V = \x,y,z ->
	mkV x y DUMMY DUMMY z ;

lin

country_N = mk2N "Land" "Länder" neuter ;
sea_N = mk2N "Meer" "Meere" neuter ;

-- TODO: Schweiz is feminine
-- Does RGL support gender with German PN?
switzerland_PN = mkPN "die Schweiz" "die Schweiz" "der Schweiz" "der Schweiz" ;
germany_PN = mkPN "Deutschland" ;
zurich_PN = mkPN "Zürich" ;

border_V2 = prepV2 (regV "grenzen") (mkPrep "an" accusative) ;
contain_V2 = mkV2 (aceV "enthalten" "enthält" "enthalten") accusative ;

}

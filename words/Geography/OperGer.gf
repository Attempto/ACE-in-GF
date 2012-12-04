resource OperGer = AttemptoGer ** open SyntaxGer, ParadigmsGer in {

-- TODO: do we need to specify "AttemptoGer"

oper

DUMMY : Str = "~" ;

aceN = overload {
  aceN : Str -> AttemptoGer.CN = mk_1N ;
  aceN : (g:Gender) -> (man,men : Str) -> AttemptoGer.CN = mk_gen_2N;
};

acePN = overload {
  acePN : Str -> PN = mkPN ;
  acePN : (_,_,_,_:Str) -> PN = mkPN ;
};

-- Input forms:
-- 1. Infinitiv Präsens
-- 2. Präsens Indikativ er/sie/es
-- 3. Partizip Perfekt
aceV : (_,_,_:Str) -> AttemptoGer.V = \x,y,z ->
	mkV x y DUMMY DUMMY z ;


mk_1N : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;

mk_gen_2N : Gender -> Str -> Str -> AttemptoGer.CN =
	\gen,sg,pl -> mkCN (mkN sg pl gen) ;

}

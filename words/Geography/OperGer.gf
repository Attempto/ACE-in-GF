resource OperGer = AttemptoGer ** open SyntaxGer, ParadigmsGer in {

-- TODO: do we need to specify "AttemptoGer"

-- TODO: rename
param AceGerPnType = der | die | das | pl ;

oper

DUMMY : Str = "~" ;

-- Map der/die/das to international gender terms.
-- der/die/das are shorter and more familiar to German-speakers.
-- masculine/feminine/neuter are more familiar to general linguists.
-- So both could be supported in the lexicon editor.
-- TODO: this should never be called with 'pl' but for some reason the compiler
-- wants us to handle 'pl' as well...
mkGen : AceGerPnType -> Gender = \g -> case g of {
  der => masculine ;
  das => neuter ;
  die => feminine ;
  _ => neuter
} ;

aceN = overload {
  aceN : Str -> AttemptoGer.CN = mk_1N ;
  aceN : AceGerPnType -> Str -> AttemptoGer.CN = \g,s -> mk_gen_1N (mkGen g) s;
  aceN : Gender -> Str -> AttemptoGer.CN = mk_gen_1N;
  aceN : (g:Gender) -> (man,men : Str) -> AttemptoGer.CN = mk_gen_2N;
};

acePN = overload {
  acePN : Str -> PN = mkPN ;
  acePN : (_,_,_,_:Str) -> PN = mkPN ;
};

-- This operator is for creating proper name NPs, which in
-- some cases need to have gender and plurality information.
-- The proper names have only one surface form which is syntactically
-- either singular (die Schweiz, das Schwarze Meer) or plural (die Alpen).
-- In case of plural there is no notion of gender.
-- TODO: the implementation of plural is not quite right. See reg2N in ParadigmsGer
-- which seems to often ignore the provided plural form and generate
-- the plural from the singular using gender. So we currently give the
-- the input form as both singular and plural, which works at least for Alpen.
mkNP = overload {
  mkNP : Str -> NP = \john -> SyntaxGer.mkNP (acePN john) ;
  mkNP : AceGerPnType -> Str -> NP = \g,pn -> case g of {
    pl => SyntaxGer.mkNP thePl_Det (mk_gen_2N neuter pn pn) ;
    _  => SyntaxGer.mkNP the_Art (mk_gen_2N (mkGen g) pn "")
  } ;
  mkNP : AceGerPnType -> Str -> Str -> Str -> Str -> NP = \g,x1,x2,x3,x4 -> case g of {
    pl => SyntaxGer.mkNP thePl_Det (mkCN (mkN x1 x2 x3 x4 DUMMY DUMMY neuter)) ;
    _  => SyntaxGer.mkNP the_Art (mkCN (mkN x1 x2 x3 x4 DUMMY DUMMY (mkGen g)))
  }
};

-- Input forms:
-- 1. Infinitiv Präsens
-- 2. Präsens Indikativ er/sie/es
-- 3. Partizip Perfekt
aceV : (_,_,_:Str) -> AttemptoGer.V = \x,y,z ->
	mkV x y DUMMY DUMMY z ;


mk_1N : Str -> AttemptoGer.CN = \n -> mkCN (mkN n) ;

-- TODO: fix this: first guess the plural and then use it.
-- Not sure it will work though.
mk_gen_1N : Gender -> Str -> AttemptoGer.CN =
	\gen,sg -> mkCN (mkN sg sg gen) ;

mk_gen_2N : Gender -> Str -> Str -> AttemptoGer.CN =
	\gen,sg,pl -> mkCN (mkN sg pl gen) ;

}

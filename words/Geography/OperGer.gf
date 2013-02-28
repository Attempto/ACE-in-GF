resource OperGer = AttemptoGer ** open (S=SyntaxGer), (P=ParadigmsGer), (R=ResGer) in {

-- AttemptoGer provides: CN, NP, V.

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
mkGen : AceGerPnType -> P.Gender = \g -> case g of {
  der => P.masculine ;
  das => P.neuter ;
  die => P.feminine ;
  _ => P.neuter
} ;

aceN = overload {
  aceN : Str -> CN = mk_1N ;
  aceN : AceGerPnType -> Str -> CN = \g,s -> mk_gen_1N (mkGen g) s ;
  aceN : AceGerPnType -> (man,men : Str) -> CN = \g,sg,pl -> mk_gen_2N (mkGen g) sg pl ;
  aceN : P.Gender -> Str -> CN = mk_gen_1N ;
  aceN : P.Gender -> (man,men : Str) -> CN = mk_gen_2N ;
};

acePN = overload {
  acePN : Str -> PN = P.mkPN ;
  acePN : (_,_,_,_:Str) -> PN = P.mkPN ;
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
  mkNP : Str -> NP = \john -> S.mkNP (acePN john) ;
  mkNP : AceGerPnType -> Str -> NP = \g,pn -> case g of {
    pl => S.mkNP S.thePl_Det (mk_gen_2N P.neuter pn pn) ;
    _  => S.mkNP S.the_Art (mk_gen_2N (mkGen g) pn "")
  } ;
  mkNP : AceGerPnType -> Str -> Str -> Str -> Str -> NP = \g,x1,x2,x3,x4 -> case g of {
    pl => S.mkNP S.thePl_Det (S.mkCN (P.mkN x1 x2 x3 x4 DUMMY DUMMY P.neuter)) ;
    _  => S.mkNP S.the_Art (S.mkCN (P.mkN x1 x2 x3 x4 DUMMY DUMMY (mkGen g)))
  }
};

-- Input forms:
-- 1. Infinitiv Präsens
-- 2. Präsens Indikativ er/sie/es
-- 3. Partizip Perfekt
aceV : (_,_,_:Str) -> V = \x,y,z ->
	P.mkV x y DUMMY DUMMY z ;


mk_1N : Str -> CN = \n -> S.mkCN (P.mkN n) ;

-- There is no GF paradigm that takes singular+gender as input,
-- so we implement this here. But just to be able to handle more
-- lexicon entries (from the spreadsheet).
-- Do not use it, it does not work correctly.
mk_gen_1N : P.Gender -> Str -> CN = \gen,sg ->
	let pl = ((P.mkN sg).s ! R.Pl ! R.Nom) in
		S.mkCN (P.mkN sg pl gen) ;

mk_gen_2N : P.Gender -> Str -> Str -> CN =
	\gen,sg,pl -> S.mkCN (P.mkN sg pl gen) ;

}

resource OperSpa = AttemptoSpa ** open SyntaxSpa, ParadigmsSpa in {

param AceSpaPnType = el | la | los | las ;

oper

aceN = overload {
  aceN : Str -> AttemptoSpa.CN = mk_1N ;
  aceN : (g:Gender) -> (man,men : Str) -> AttemptoSpa.CN = mk_gen_2N;
};

acePN = overload {
  acePN : Str -> PN = mkPN ;
};

-- Map el/la/los/las to international gender terms.
-- el/la/... are shorter and more familiar to Spanish-speakers.
-- masculine/feminine are more familiar to general linguists.
-- TODO: So both could be supported in the lexicon editor.
mkNP = overload {
  mkNP : Str -> NP = \john -> SyntaxSpa.mkNP (acePN john) ;
  mkNP : AceSpaPnType -> Str -> NP = \g,pn -> case g of {
    el => SyntaxSpa.mkNP the_Art (mk_gen_2N masculine pn pn) ;
    la => SyntaxSpa.mkNP the_Art (mk_gen_2N feminine pn pn) ;
    los => SyntaxSpa.mkNP thePl_Det (mk_gen_2N masculine pn pn) ;
    las => SyntaxSpa.mkNP thePl_Det (mk_gen_2N feminine pn pn)
  }
};

mk_1N : Str -> AttemptoSpa.CN = \n -> mkCN (mkN n) ;

mk_gen_2N : Gender -> Str -> Str -> AttemptoSpa.CN =
	\gen,sg,pl -> mkCN (mkN sg pl gen) ;

}

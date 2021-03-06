instance LexAttemptoGer of LexAttempto = 
  open ExtraGer, SyntaxGer, ParadigmsGer, ConstructX,
    MakeStructuralGer, 
    IrregGer, Prelude in {

oper
  possible_A = mkA "m�glich" ;
  necessary_A = mkA "n�tig" ;
  own_A = mkA "eigen" ;
  have_VV = SyntaxGer.must_VV ;
  provably_Adv = mkAdv "beweisbar" ;
  provable_A = mkA "beweisbar" ;
  false_A = mkA "falsch" ;

  genitiveNP np cn = mkNP (mkNP the_Art cn) (SyntaxGer.mkAdv possess_Prep np) ;

  each_Det = every_Det ;

  that_Subj = mkSubj "da�" ;

  comma_and_Conj = mkConj [] ", und" plural ;
  comma_or_Conj = mkConj [] ", oder" singular ;
  slash_Conj = mkConj [] "/" singular ;

  whose_IDet = mkIDet (mkIQuant "wessen") ;

  eachOf np = mkNP (mkPredet (mkA "jed") "von" dative True singular) np ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = mkAdN "genau" ;

}

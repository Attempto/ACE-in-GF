instance LexACEAce of LexACE = LexAttemptoAce **
  open 
   ExtraAce,
   SyntaxAce, 
   ParadigmsAce, 
   ConstructX, 
   (M = MakeStructuralAce),
   IrregAce in {

oper
  possible_A = mkA "possible" ;
  necessary_A = mkA "necessary" ;
  own_A = mkA "own" ;
  have_VV = mkVV have_V ;
  provably_Adv = ParadigmsAce.mkAdv "provably" ;
  provable_A = mkA "provable" ;
  false_A = mkA "false" ;
 
  genitiveNP np = mkNP (GenNP np) ;

  kilogram_CN = mkCN (mkN "kilogram") ;

  each_Det = ExtraAce.each_Det ;

  that_Subj = M.mkSubj "that" ;

  comma_and_Conj = mkConj [] ", and" plural ;
  comma_or_Conj = mkConj [] ", or" singular ;
  slash_Conj = mkConj [] "/" singular ;

  whose_IDet = M.mkIDet "whose" singular ;

  eachOf np = mkNP (mkNP each_Det) (SyntaxAce.mkAdv part_Prep np) ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = mkAdN "exactly" ;

}

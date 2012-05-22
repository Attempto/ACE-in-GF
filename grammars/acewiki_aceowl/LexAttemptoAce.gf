instance LexAttemptoAce of LexAttempto = open
  ExtraAce,
  SyntaxAce,
  ParadigmsAce,
  ConstructX,
  (M = MakeStructuralAce),
  IrregAce in {

flags coding=utf8;

oper
  false_A = mkA "false" ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ParadigmsAce.mkAdN "exactly" ;

}

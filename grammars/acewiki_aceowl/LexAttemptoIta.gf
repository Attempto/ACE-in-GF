instance LexAttemptoIta of LexAttempto = open
  ExtraIta,
  SyntaxIta,
  ParadigmsIta,
  ConstructX, 
  MakeStructuralIta
  in {

flags coding=utf8;

oper
  false_A = mkA "falso" ;

  adj_thatCl : A -> S -> Cl = \a,s -> 
    mkCl (mkVP (mkVP (mkAP a)) (SyntaxIta.mkAdv (mkSubj "che") s)) ;

  exactly_AdN = ConstructX.mkAdN "esattamente" ;
}

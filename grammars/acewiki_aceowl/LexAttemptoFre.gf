instance LexAttemptoFre of LexAttempto = 
  open ExtraFre, SyntaxFre, ParadigmsFre, ConstructX, 
    MakeStructuralFre,
    IrregFre, (P = Prelude) in {

flags coding=utf8;

oper
  false_A = mkA "faux" ;

  adj_thatCl : A -> S -> Cl = \a,s -> 
    mkCl (mkVP (mkVP (mkAP a)) (SyntaxFre.mkAdv (mkSubj "que") s)) ;

  exactly_AdN = ConstructX.mkAdN "exactement" ;
}

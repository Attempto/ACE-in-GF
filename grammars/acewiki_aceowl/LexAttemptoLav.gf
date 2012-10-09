instance LexAttemptoLav of LexAttempto =
  open
   SyntaxLav,
   ParadigmsLav,
   ConstructX,
   (E = ExtraLav),
   (L = LangLav)
   in {

flags coding=utf8 ;

oper
  false_A = mkA "tiesa" ; -- the same adj. ('true') is used in both falseS and "trueS"; negated copula makes falseS

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "tieši" ;

} ;

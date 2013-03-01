resource OperFin = AttemptoFin ** open (S=SyntaxFin), (P=ParadigmsFin), (R=ResFin) in {

oper

mkNP = overload {
  mkNP : Str -> NP = \john -> S.mkNP (P.mkPN john) ;
} ;

}

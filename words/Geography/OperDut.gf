resource OperDut = AttemptoDut ** open (S=SyntaxDut), (P=ParadigmsDut), (R=ResDut) in {

oper

mkNP = overload {
  mkNP : Str -> NP = \john -> S.mkNP (P.mkPN john) ;
} ;

}

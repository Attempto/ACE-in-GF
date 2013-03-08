resource OperIta = AttemptoIta ** open (S=SyntaxIta), (P=ParadigmsIta), (R=ResIta) in {

oper

mkNP = overload {
  mkNP : Str -> NP = \john -> S.mkNP (P.mkPN john) ;
} ;

}

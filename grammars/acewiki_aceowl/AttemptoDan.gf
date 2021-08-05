--# -path=.:present

-- TODO: this module is based on Swedish + some modifications
-- based on Google Translate + some changes/omissions to get it to compile.
concrete AttemptoDan of Attempto = SymbolsC, NumeralDan **
  AttemptoI - [nobody_IPron, nothing_IPron, noNP] with
  (Syntax = SyntaxDan),
  (Symbolic = SymbolicDan),
  (Extra = ExtraDan),
  (LexAttempto = LexAttemptoDan) ** open CommonScand, ResDan in {

  flags coding=utf8;

  -- Questions
  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.g ip.n}) ;

  oper at_least_AdN = ss "mindst" ;
  oper at_most_AdN = ss "højst" ;

  --det = DIndef
{--
  no_Quant =
    {s,sp = table {
       Sg => \\_,_ => genderForms "ingen" "inget" ;
       Pl => \\_,_,_ => "inga"
       } ;
     det = DDef Indef
    } ;
--}

  if_then_Conj = {s1 = "hvis" ; s2 = "så" ; n = Sg } ;

  lin nobody_IPron = regNP "ingen" "ingens" Utr Sg ;
  lin nothing_IPron = regNP "inget" "ingets" Neutr Sg ;

  lin noNP = variants {};

} ;

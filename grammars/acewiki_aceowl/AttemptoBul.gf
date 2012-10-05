--# -path=.:present

concrete AttemptoBul of Attempto = SymbolsC, NumeralBul **
  AttemptoI - [noNP, nobody_IPron, nothing_IPron, if_thenS] with
  (Syntax = SyntaxBul),
  (Symbolic = SymbolicBul),
  (Extra = ExtraBul),
  (LexAttempto = LexAttemptoBul) ** open ResBul in {

  flags coding=utf8;

  oper S2QS : Syntax.S -> Syntax.QS = variants {};

  oper at_least_AdN = ss "at least";
  oper at_most_AdN = ss "at most";


  -- Tried the following (but nothing worked):
  -- or_Conj
  -- variants {}
  -- mkConj "if"
  -- {s=[]; conj=0; distr=False; n = Pl}
  -- lin if_then_Conj = {s="ако"; conj=1; distr=True; n = Sg} ;
  --lin if_then_Conj = variants {} ;

  lin ipNPQ ip = variants {};
  lin noNP, nobody_IPron, nothing_IPron = variants {};

} ;

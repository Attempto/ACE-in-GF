--# -path=.:present

concrete AttemptoFin of Attempto = NumeralFin **
  AttemptoI - [
    apposVarCN, indefTherePronVarNP, indefPronVarNP,
    termNP
  ] with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (Extra = ExtraFin),
  (LexAttempto = LexAttemptoFin) ** open (M=MorphoFin), ResFin in {

  lincat Var = M.Noun ;

  -- Variables in apposition are always in singular nominative
  -- TODO: is this correct for Finnish?
  oper mkApposStr : M.Noun -> Str = \v -> v.s ! NCase Sg Nom ;

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;


  oper mkPronVarNP : NP -> Var -> NP = \pr,v -> lin NP {
    s = \\c => pr.s ! c ++ mkApposStr v ;
    isNeg = False ;
    isPron = True ;
    a = pr.a
  };


  lin ipNPQ ip = lin NP (ip ** {a = agrP3 ip.n ; isNeg = False ; isPron = True}) ;

  lin X_Var = M.nForms2N (M.dSDP "X") ;
  lin Y_Var = M.nForms2N (M.dSDP "Y") ;
  lin Z_Var = M.nForms2N (M.dSDP "Z") ;

  -- "everybody X" etc
  -- "somebody X" and "something X"
  lin indefPronVarNP, indefTherePronVarNP = mkPronVarNP ;

  lin apposVarCN cn v = mkCN cn (symb (mkApposStr v)) ;

  lin termNP = mkNP ;

}

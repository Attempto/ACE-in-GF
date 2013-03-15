--# -path=.:present

concrete AttemptoFin of Attempto = NumeralFin **
  AttemptoI - [
    apposVarCN, indefTherePronVarNP, indefPronVarNP,
    termNP,
    ofCN
  ] with
  (Syntax = SyntaxFin),
  (Symbolic = SymbolicFin),
  (Extra = ExtraFin),
  (LexAttempto = LexAttemptoFin) ** open (M=MorphoFin), ResFin in {

  lincat Var = M.Noun ;

  -- Variables in apposition are always in singular nominative.
  -- However, proper names (if we supported them) would change:
  -- presidentti Niinistöllä on koira
  -- *presidentillä Niinistö on koira
  oper mkApposStr : M.Noun -> Str = \v -> v.s ! NCase Sg Nom ;

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = s.s} ;


  oper mkPronVarNP : Syntax.NP -> Var -> Syntax.NP = \pr,v -> lin NP {
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

  lin termNP = Syntax.mkNP ;

  -- John on [NP jokaisen lentokoneen] [CN poliisi] .
  lin ofCN cn np = ExtraFin.GenCN np cn ;

  -- TODO: this causes: no overload instance of mkCN for CN Quant
  -- lin ofCN cn np = Syntax.mkCN cn (ExtraFin.GenNP np) ;

}

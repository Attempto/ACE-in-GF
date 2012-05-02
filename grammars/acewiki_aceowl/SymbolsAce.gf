-- Reimplementation of SymbolsC with support for saxon genitives [JJC]
concrete SymbolsAce of Symbols = open Precedence, Prelude, CatAce, ResAce in {

  lincat Term = TermWithPrec ;
  lincat Var = {s : Case => Str};

  lin var_Term v = mkpConst (NomVar v) ;

  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;

  oper IPronVarNP : NP -> {s : Case => Str} -> NP = \pr,v -> lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive
--    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case (NCase Nom)) ; -- no inflection for genitive
    a = pr.a
  };

  oper NomVar : {s : Case => Str} -> Str = \v -> v.s ! Nom ;

}

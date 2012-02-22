concrete SymbolsC of Symbols = open Precedence, Prelude in {

lincat Term = TermWithPrec ;
lincat Formula = SS ;
lincat Var = SS ;

lin int_Term i = mkpConst i.s ;
lin var_Term i = mkpConst i.s ;

lin X_Var = ss "X" ;
lin Y_Var = ss "Y" ;

}

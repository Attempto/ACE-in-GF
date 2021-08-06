concrete SymbolsACEC of SymbolsACE = SymbolsC ** open Precedence, Prelude in {

lincat Formula = SS ;
lincat Term = TermWithPrec ;

lin plus_Term  = mkpInfixL "+" p1 ;
lin minus_Term = mkpInfixL "-" p1 ;
lin div_Term   = mkpInfixL "/" p2 ;
lin times_Term = mkpInfixL "*" p2 ;
lin neg_Term   = mkpFun1 "-" ;
lin int_Term i = mkpConst i.s ;

lin eq_Formula = infixSS "=" ;
lin lt_Formula = infixSS "<" ;
lin gt_Formula = infixSS ">" ;
lin le_Formula = infixSS "=<" ;
lin ge_Formula = infixSS ">=" ;
lin ne_Formula = infixSS "\\=" ;

}

--# -path=.:./present
concrete AttemptoUrd of Attempto = NumeralUrd [Digits], SymbolsC, NullVPS **
  AttemptoI - [mustVP] with
  (Syntax = SyntaxUrd),
  (Symbolic = SymbolicUrd),
  (LexAttempto = LexAttemptoUrd) ** open CommonHindustani in {

oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s} ;
       
lin ipNPQ ip = lin NP {
      s = \\c => case c of { NPC cs => ip.s ! cs ; _ => ip.s ! Dir } ;
      a = agrP3 ip.g ip.n
    } ;    

} ;

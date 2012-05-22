--# -path=.:./present
concrete AttemptoUrd of Attempto =
  -- This is an ugly workaround for waht I suspect is a bug in the RGL implementation of NumeralUrd
  NumeralUrd [D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,
                Dig,Digit,IDig,IIDig,
                Sub10,Sub100,Sub1000,Sub1000000,
                n2,n3,n4,n5,n6,n7,n8,n9,num,
                pot0,pot01,pot0as1,pot1,pot110,pot111,pot1as2,pot1plus,pot1to19,pot2,pot2as3,pot2plus,pot3,pot3plus,
                DForm,DSize,Size,
                r2,r3,r4,r5,r6,r7,r8,r9,sg,unit,ten,singl,less100,more100,
                Digits,Numeral],
  SymbolsC, NullVPS **
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

--# -path=.:present

{-

TODO: This is just a place holder for Dutch, which uses
German resources. Trying to use Dut-resources results in:

.../ACE-in-GF/grammars/acewiki_aceowl/AttemptoDut.gf:
   cannot unify the information
       lincat A = {s : ParamX.Degree => ResDut.AForm => Str} ;
       lindef A = \str_0 -> {s = table ParamX.Degree {
                                   q_A__0 => table ResDut.AForm {
                                               q_A__1 => str_0
                                             }
                                 }} ;
   in module CatDut with
       lincat A = Syntax.A ;
   in module AttemptoDut

-}

concrete AttemptoDut of Attempto = NumeralGer, SymbolsC ** AttemptoI
with
  (Syntax = SyntaxGer),
  (Symbolic = SymbolicGer),
  (LexAttempto = LexAttemptoGer) ;

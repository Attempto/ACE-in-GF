--# -path=.:../abstract:../common:prelude

concrete GrammarAce of Grammar = 
  NounAce, 
  VerbAce, 
  AdjectiveAce,
  AdverbAce,
  NumeralAce,
  SentenceAce,
  QuestionAce,
  RelativeAce,
  ConjunctionAce,
  PhraseAce,
  TextX - [Pol,PPos,PNeg],
  StructuralAce,
  IdiomAce,
  TenseX - [Pol,PPos,PNeg]
  ** open ResAce, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

lin
  PPos = {s = [] ; p = CPos} ;
  PNeg = {s = [] ; p = CNeg (True|False)} ; -- Both contracted and not (do not, don't) [JJC]


} ;

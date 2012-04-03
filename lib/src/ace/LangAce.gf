--# -path=.:../abstract:../common:../prelude

concrete LangAce of Lang = 
  GrammarAce,
  LexiconAce
  ** {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;

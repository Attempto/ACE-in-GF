--# -path=.:alltenses:prelude

resource TryAce = SyntaxAce-[mkAdN], LexiconAce, ParadigmsAce - [mkAdv,mkAdN,mkOrd,mkQuant] ** 
  open (P = ParadigmsAce) in {

oper

  mkAdv = overload SyntaxAce {
    mkAdv : Str -> Adv = P.mkAdv ;
  } ;

  mkAdN = overload {
    mkAdN : CAdv -> AdN = SyntaxAce.mkAdN ;
    mkAdN : Str -> AdN = P.mkAdN ;
  } ;

  mkOrd = overload SyntaxAce {
    mkOrd : Str -> Ord = P.mkOrd ;
  } ;


}

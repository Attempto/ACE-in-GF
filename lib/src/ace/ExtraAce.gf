concrete ExtraAce of ExtraAceAbs = ExtraEng ** open ResAce, Prelude in {

oper
  -- To complement UncNeg [JJC]
  ConNeg = {s = [] ; p = CNeg True} ; 
  AnyNeg = ConNeg | UncNeg ; 

}

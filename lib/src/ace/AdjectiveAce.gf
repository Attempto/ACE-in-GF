concrete AdjectiveAce of Adjective = AdjectiveEng - [ComplA2] ** open ResAce, Prelude in {

  lin
    ComplA2 a np = {
--      s = \\_ => a.s ! AAdj Posit Nom ++ a.c2 ++ np.s ! NPAcc ; 
      s = \\_ => a.s ! AAdj Posit Nom ++ "-" ++ a.c2 ++ np.s ! NPAcc ; -- "mad - about" [JJC]
      isPre = False
      } ;

}

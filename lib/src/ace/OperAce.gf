--# -path=.:../abstract:../../prelude:../common

instance OperAce of Oper =
  ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open CatAce, ResAce in {
  oper
    aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes "~" gone "~") ;
    acePN : (_:Str) -> PN = \john -> mkPN john ;

{--
    aceCN = overload {
      aceCN : (dog : Str) -> CN = aceCN_1 ;
      aceCN : (mouse,mice : Str) -> CN = aceCN_2 ;
    };

    aceCN_1 : Str -> CN = \sg -> mkCN (mkN sg (sg + "s")) ;

    aceCN_2 : Str -> Str -> CN = \sg,pl -> mkCN (mkN sg pl) ;
--}
}

instance OperAce of Oper =
  ParadigmsEng - [mkA2, mkA2S, mkA2V, prepA2] ** open SyntaxAce, CatAce, ResAce in {
  oper
    aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes "~" gone "~") ;
    acePN : Str -> PN = \john -> mkPN john ;

    aceN = overload {
      aceN : (dog : Str) -> CN = aceN_1 nonhuman ;
      aceN : (man,men : Str) -> CN = aceN_2 nonhuman ;
      aceN : Gender -> Str -> CN = aceN_1 ;
      aceN : Gender -> (man,men : Str) -> CN = aceN_2 ;
    };

    aceN_1 : Gender -> Str -> CN = \g,sg -> mkCN (mkN g (mkN sg)) ;
    aceN_2 : Gender -> Str -> Str -> CN = \g,sg,pl -> mkCN (mkN g (mkN sg pl)) ;

}

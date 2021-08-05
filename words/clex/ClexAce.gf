concrete ClexAce of Clex = ACEAce ** open SyntaxAce, ParadigmsAce in {

flags coding=utf8;
oper
aceV : (_,_:Str) -> V = \go,goes -> mkV go goes "~" "~" "~";
aceV2 : (_,_,_:Str) -> V2 = \go,goes,gone -> mkV2 (mkV go goes "~" gone "~");
aceV3 : (_,_,_,_:Str) -> V3 = \go,goes,gone,prep -> mkV3 (mkV go goes "~" gone "~") (mkPrep prep);
aceA : (_,_,_:Str) -> A = \good,better,best -> mkA good better best "~";
aceA2 : (_,_,_:Str) -> A2 = \good,better,best -> mkA2 (aceA good better best) "";

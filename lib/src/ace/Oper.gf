
-- TODO: what's the point of having this?
-- TODO: can I put "aceN = overload" here?

interface Oper = open Syntax in {
  oper
    aceV2 : (_,_,_:Str) -> V2 ;
    acePN : Str -> PN ;
}

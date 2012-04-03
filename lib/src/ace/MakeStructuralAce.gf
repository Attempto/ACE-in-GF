--# -path=.:../common:../abstract

resource MakeStructuralAce = open CatAce, ParadigmsAce, ResAce, MorphoAce, Prelude in {

oper 
  mkSubj : Str -> Subj = \x -> 
    lin Subj {s = x} ;
  mkNP : Str -> ParadigmsAce.Number -> NP = \s,n ->
    lin NP (regNP s n) ;
  mkIDet : Str -> ParadigmsAce.Number -> IDet = \s,n ->
    lin IDet {s = s ; n = n} ;
  mkIQuant : Str -> Str -> IQuant = \s,n ->
    lin IQuant {s = table {Sg => s ; Pl => n}} ;

}

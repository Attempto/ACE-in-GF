--# -path=.:alltenses:prelude

resource CombinatorsAce = Combinators with 
  (Cat = CatAce),
  (Structural = StructuralAce),
  (Constructors = ConstructorsAce) ;

concrete NumeralDut of Numeral = CatDut [Numeral,Digits] ** open ResDut, Prelude in {

flags optimize = all_subs ;

lincat 
  Digit = {s : DForm => CardOrd => Str ; en : Str} ;
  Sub10 = {s : DForm => CardOrd => Str ; n : Number ; en : Str ; attr : Str} ;
  Sub100, Sub1000, Sub1000000 = 
          {s :          CardOrd => Str ; n : Number ; attr : Str} ;

lin 
  num x = x ;

  n2 = mkDigit  "twee"  "twaalf"  "twintig"  "tweede" ;
  n3 = mkDigit  "drie"  "dertien" "dertig"  "derde" ;
  n4 = mkDigit  "vier"  "veertien" "veertig" "vierde" ;
  n5 = mkDigit  "vijf"  "vijftien" "vijftig" "vijfde" ;
  n6 = mkDigit  "zes"   "zestien" "zestig" "zesde" ;
  n7 = mkDigit  "zeven" "zeventien" "zeventig" "zevende" ;
  n8 = mkDigit  "acht"  "achttien"   "tachtig"  "achtste" ;
  n9 = mkDigit  "negen" "negentien" "negentig" "negende" ;

  pot01 = {
    s = \\f => table {
          NCard g _ => "een" ; ---- "��n" ;
          NOrd af => (regAdjective "eerst").s ! Posit ! af
          } ; 
    n = Sg ;
    attr = [] ;
    en = "en"
    } ;
  pot0 d = {s = \\f,g => d.s ! f ! g ; n = Pl ; en = d.en ; attr = d.s ! DUnit ! invNum ++ BIND} ;
  pot110 = {s = cardOrd "tien" "tiende" ; n = Pl ; attr = "tien" ++ BIND} ;
  pot111 = {s = cardOrd "elf" "elfde" ; n = Pl ; attr = "elf" ++ BIND} ;
  pot1to19 d = addAttr {s = d.s ! DTeen ; n = Pl} ;
  pot0as1 n = {s = n.s ! DUnit; n = n.n ; attr = n.attr} ;
  pot1 d = addAttr {s = d.s ! DTen ; n = Pl} ;
  pot1plus d e = addAttr {s = \\g => 
    e.s ! DUnit ! invNum ++ BIND ++ e.en ++ BIND ++ d.s ! DTen ! g ; n = Pl} ;
  pot1as2 n = n ;
  pot2 d = 
    addAttr {s = \\g => d.attr ++ cardOrd "honderd" "honderdste" ! g ; n = Pl} ;
  pot2plus d e = 
    addAttr {s = \\g => d.attr ++ "honderd" ++ BIND ++ e.s ! g ; n = Pl} ;
  pot2as3 n = n ;
  pot3 n = 
    addAttr {s = \\g => n.attr ++ cardOrd "duizend" "duizendste" ! g ; n = Pl} ; 
  pot3plus n m = 
    addAttr {s = \\g => n.attr ++ "duizend" ++ m.s ! g ; n = Pl} ;


  lincat 
    Dig = TDigit ;

  lin
    IDig d = d ; 

    IIDig d i = {
      s = \\o => d.s ! invNum ++ i.s ! o ;
      n = Pl
    } ;

    D_0 = mkDig "0" ;
    D_1 = mk3Dig "1" "1e" Sg ;
    D_2 = mk2Dig "2" "2e" ;
    D_3 = mkDig "3" ;
    D_4 = mkDig "4" ;
    D_5 = mkDig "5" ;
    D_6 = mkDig "6" ;
    D_7 = mkDig "7" ;
    D_8 = mkDig "8" ;
    D_9 = mkDig "9" ;

  oper
    mk2Dig : Str -> Str -> TDigit = \c,o -> mk3Dig c o Pl ;
    mkDig : Str -> TDigit = \c -> mk2Dig c (c + "e") ;

    mk3Dig : Str -> Str -> Number -> TDigit = \c,o,n -> {
      s = table {NCard _ _ => c ; NOrd _ => o} ;
      n = n
      } ;

    TDigit = {
      n : Number ;
      s : CardOrd => Str
    } ;

  LinDigit = {s : DForm => CardOrd => Str ; en : Str} ;

  cardOrd : Str -> Str -> CardOrd => Str = \drei,dritte ->
    let dritt = init dritte in
    table {
      NCard _ _ => drei ;
      NOrd a => (regAdjective dritt).s ! Posit ! a
      } ;

  mkDigit : (x1,_,_,x4 : Str) -> LinDigit = 
    \drei,dreizehn,dreissig,dritte ->
    {s = table {
           DUnit => cardOrd drei dritte ;
           DTeen => cardOrd dreizehn (dreizehn + "de") ;
           DTen  => cardOrd dreissig (dreissig + "ste")
           } ;
     en = case drei of {_ + "e" => "�n" ; _ => "en"}
     } ;
  invNum : CardOrd = NCard Utr Nom ;

  addAttr : {s : CardOrd => Str ; n : Number} -> 
    {s : CardOrd => Str ; n : Number ; attr : Str} = \n -> n ** {attr = n.s ! invNum ++ BIND} ;

}

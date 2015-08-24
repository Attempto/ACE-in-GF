--# -coding=cp1251
concrete NumeralBul of Numeral = CatBul [Numeral,Digits] ** open Prelude, ResBul in {
  flags coding=cp1251 ;


lincat 
  Digit      = {s : DForm => CardOrd => Str} ;
  Sub10      = {s : DForm => CardOrd => Str; n : Number} ;
  Sub100     = {s : CardOrd => NumF => Str; n : Number; i : Bool} ;
  Sub1000    = {s : CardOrd => NumF => Str; n : Number; i : Bool} ;
  Sub1000000 = {s : CardOrd => NumF => Str; n : Number} ;

lin num x = {s = \\c => x.s ! c ! Formal; n=x.n} ;
lin n2 = mkDigit "���"    "�����"    "���"    "�����"    "�������"    "������" ;
lin n3 = mkDigit "���"    "�����"    "���"    "�����"    "�������"    "������" ;
lin n4 = mkDigit "������" "��������" "������" "��������" "����������" "������������" ;
lin n5 = mkDigit "���"    "������"   "���"    "����"     "��������"   "���������" ;
lin n6 = mkDigit "����"   "�������"  "����"   "�����"    "������"     "����������" ;
lin n7 = mkDigit "�����"  "�������"  "�����"  "�����"    "����������" "�����������" ;
lin n8 = mkDigit "����"   "������"   "����"   "����"     "���������"  "����������" ;
lin n9 = mkDigit "�����"  "��������" "�����"  "������"   "����������" "�����������" ;

lin pot01 =
      {s = table {
             unit    => table {
                          NCard (CFMasc Indef _)    => "����" ;
                          NCard (CFMasc Def _)      => "������" ;
                          NCard (CFMascDefNom _)    => "�������" ;
                          NCard (CFFem  Indef)      => "����" ;
                          NCard (CFFem  Def)        => "������" ;
                          NCard (CFNeut Indef)      => "����" ;
                          NCard (CFNeut Def)        => "������" ;
                          NOrd  aform               => case aform of {
                                                         ASg Masc Indef => "�����" ;
                                                         ASg Masc Def   => "������" ;
                                                         ASgMascDefNom  => "�������" ;
                                                         ASg Fem  Indef => "�����" ;
                                                         ASg Fem  Def   => "�������" ;
                                                         ASg Neut Indef => "�����" ;
                                                         ASg Neut Def   => "�������" ;
                                                         APl Indef      => "�����" ;
                                                         APl Def        => "�������"
                                                       }
                        } ;
             teen nf => case nf of {
                          Formal   => mkCardOrd "����������" "�������������" "����������" "�����������" ;
                          Informal => mkCardOrd "���������"  "���������"     "���������"  "���������"
                        } ;
             ten  nf => mkCardOrd "�����" "��������" "�����" "������" ;
             hundred => mkCardOrd100 "���" "������"
           }
      ;n = Sg
      } ;
lin pot0 d = d ** {n = Pl} ;

lin pot110 = {s=\\c,nf => pot01.s ! ten nf ! c;  n = Pl; i = True} ;
lin pot111 = {s=\\c,nf => pot01.s ! teen nf ! c; n = Pl; i = True} ;
lin pot1to19 d = {s = \\c,nf => d.s ! teen nf ! c; n = Pl; i = True} ;
lin pot0as1 n = {s = \\c,nf => n.s ! unit ! c; n = n.n; i = True} ;
lin pot1 d = {s = \\c,nf => d.s ! ten nf ! c; n = Pl; i = True} ;
lin pot1plus d e = {
   s = \\c,nf => d.s ! ten nf ! NCard (CFMasc Indef NonHuman) ++ "�" ++ e.s ! unit ! c ; n = Pl; i = False} ;

lin pot1as2 n = n ;
lin pot2 n = {s = \\c,nf => n.s ! hundred ! c; n = Pl; i = True} ;
lin pot2plus d e = {
  s = \\c,nf => d.s ! hundred ! NCard (CFMasc Indef NonHuman) ++ case e.i of {False => []; True  => "�"} ++ e.s ! c ! nf ;
  n = Pl ;
  i = False
  } ;

lin pot2as3 n = n ;
lin pot3 n = {
  s = \\c,nf => case n.n of {
                  Sg => mkCardOrd100 "������" "�������" ! c ;
                  Pl => n.s ! NCard (CFFem Indef) ! nf ++ mkCardOrd100 "������" "�������" ! c
                } ;
  n = Pl
  } ;
lin pot3plus n m = {
  s = \\c,nf => case n.n of {
                  Sg => mkCardOrd100 "������" "�������" ! NCard (CFMasc Indef NonHuman) ;
                  Pl => n.s ! NCard (CFFem Indef) ! nf ++ mkCardOrd100 "������" "�������" ! NCard (CFMasc Indef NonHuman)
                }
                ++ case m.i of {False => []; True  => "�"} ++ m.s ! c ! nf ;
  n = Pl
  } ;


-- numerals as sequences of digits

  lincat 
    Dig = TDigit ;

  lin
    IDig d = d ** {tail = T1} ;

    IIDig d i = {
      s = \\o => d.s ! NCard (CFMasc Indef NonHuman) ++ spaceIf i.tail ++ i.s ! o ;
      n = Pl ;
      tail = inc i.tail
    } ;

    D_0 = mk3Dig "0" "0" "0��" Pl ;
    D_1 = mk3Dig "1" "1" "1��" Sg ;
    D_2 = mk2Dig "2" "2��" ;
    D_3 = mkDig "3" ;
    D_4 = mkDig "4" ;
    D_5 = mkDig "5" ;
    D_6 = mkDig "6" ;
    D_7 = mk3Dig "7" "7��" "7��" Pl ;
    D_8 = mk3Dig "8" "8��" "8��" Pl ;
    D_9 = mk3Dig "9" "9���" "9��" Pl ;

  oper
    spaceIf : DTail -> Str = \t -> case t of {
      T3 => SOFT_BIND ;
      _  => BIND
      } ;

    inc : DTail -> DTail = \t -> case t of {
      T1 => T2 ;
      T2 => T3 ;
      T3 => T1
      } ;

    mk2Dig : Str -> Str -> TDigit = \c,o -> mk3Dig c (c+"��") o Pl ;
    mkDig : Str -> TDigit = \c -> mk2Dig c (c + "��") ;

    mk3Dig : Str -> Str -> Str -> Number -> TDigit = \c1,c2,o,n -> {
      s = mkCardOrd c1 c2 c1 o ;
      n = n
      } ;

    TDigit = {
      n : Number ;
      s : CardOrd => Str
    } ;
}

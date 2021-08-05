concrete NumeralAce of Numeral = NumeralEng - [IIDig] ** open ResEng in {

-- Otherwise like NumeralEng, but numerals consisting of digits don't have comma
  lin

    -- 100 000
    -- RGL produces 100,000
    IIDig d i = {
      s = \\o,c => d.s ! NCard ! Nom ++ i.s ! o ! c ;
      n = Pl ;
      tail = inc i.tail
    } ;
}

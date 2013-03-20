--# -path=.:present

concrete AttemptoSpa of Attempto = SymbolsC, NumeralSpa **
  AttemptoI - [A2, a2VP, refl_a2VP] with
  (Syntax = SyntaxSpa),
  (Symbolic = SymbolicSpa),
  (Extra = ExtraSpa),
  (LexAttempto = LexAttemptoSpa) ** open (B = BeschSpa), (P = ParadigmsSpa), AdjectiveRomance, CommonRomance, ResSpa in {

  param A2Type = rglDefault | ser | estar ;

  oper LincatA2 : Type = {auxType : A2Type ; adj : Syntax.A2} ;

  oper

  -- Copied from RGL and modified to be able to explicitly add the aux-verb
  -- TODO: is there a better way?
  mkA2VP : Verb -> Syntax.Comp -> Syntax.VP =
    \aux,comp -> insertComplement comp.s (predV aux) ;

  -- Copied verbatim from the RGL and added the type.
  -- TODO: wanted to use "CompAP" from VerbRomance, but got the error
  -- "cannot infer type of constant CompAP", gave up and created MyCompAP.
  MyCompAP : Syntax.AP -> Syntax.Comp =
    \ap -> lin Comp {s = \\ag => let agr = complAgr ag in ap.s ! AF agr.g agr.n} ;

  S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\_ => s.s ! Indic} ; -- TODO: Indic ?

  -- RGL defines copula = verbBeschH (ser_1 "ser")
  -- RGL defines auxPassive = verbBeschH (estar_2 "estar")
  map_A2Type_to_Verb : A2Type -> Verb = \auxType -> case auxType of {
    rglDefault => copula ;
    ser => verbBeschH (B.ser_1 "ser") ;
    estar => verbBeschH (B.estar_2 "estar")
  } ;

  mkLincatA2 = overload {
    mkLincatA2 : Syntax.A2 -> LincatA2 =
      \adj -> {auxType = rglDefault ; adj = adj} ;
    mkLincatA2 : A2Type -> Syntax.A2 -> LincatA2 =
      \auxType,adj -> {auxType = auxType ; adj = adj} ;
  } ;

  mkA2 = overload {
    -- TODO: make sure it always behaves like the in RGL API
    mkA2 : A -> Prep -> LincatA2 = \a,prep -> mkLincatA2 (P.mkA2 a prep) ;
    -- TODO: remove this, as this would confuse the RGL API user
    mkA2 : A2Type -> A -> Prep -> LincatA2 = \auxType,a,prep -> mkLincatA2 auxType (P.mkA2 a prep) ;
  } ;

  -- like mkA2 but forces 'estar' as the aux verb
  mkA2b = overload {
    mkA2b : A -> Prep -> LincatA2 = \a,prep -> mkLincatA2 estar (P.mkA2 a prep) ;
  } ;

  op_a2VP : LincatA2 -> NP -> VP =
    \a,np -> mkA2VP (map_A2Type_to_Verb a.auxType) (MyCompAP (mkAP a.adj np)) ;

  op_relf_a2VP : LincatA2 -> VP =
    \a -> mkA2VP (map_A2Type_to_Verb a.auxType) (MyCompAP (reflAP a.adj)) ;

  -- Copied from ResRomance.heavyNP
  lin ipNPQ ip = lin NP {
    s = \\c => {comp,ton = ip.s ! c ; c1,c2 = []} ;
    a = Ag ip.a.g ip.a.n P3 ;
    isNeg = False ;
    hasClit = False ;
    isPol = False
  } ;

  lincat A2 = LincatA2 ;
  lin a2VP = op_a2VP ;

  lin refl_a2VP = op_relf_a2VP ;


} ;

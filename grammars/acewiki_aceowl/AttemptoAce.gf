--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC [Term], NumeralAce ** AttemptoI - [slash_ipQS, neg_slash_ipQS, apposVarCN, indefPronVarNP, vVP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce, ResAce, SentenceAce, Precedence in {

  oper
    ip2np : SyntaxAce.IP -> Agr -> SyntaxAce.NP = \ip,agr -> lin NP ( ip ** {a = agr} ) ;

  -- wh-word in object position. Needs closer analysis. [JJC]
  lin slash_ipQS ip np v2 =
      mkQS (mkQCl ip (mkClSlash np v2)) -- who does Mary like?
    | lin QS {
        s = \\qf => cl.s ! Pres ! Simul ! CPos ! ODir
      } where {
        cl = PredVP np (ComplV2 v2 (ip2np ip np.a))
      } ; -- Mary likes who?
  lin neg_slash_ipQS ip np v2 =
      mkQS negativePol (mkQCl ip (mkClSlash np v2))
    | lin QS {
        s = \\qf => cl.s ! Pres ! Simul ! CNeg (True|False) ! ODir
      } where {
        cl = PredVP np (ComplV2 v2 (ip2np ip np.a))
      } ;

  -- Using IP in a VP to form a QS [JJC]
  lin is_NPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefPronNP somebody)) (predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is who"
  lin v2_NPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefPronNP somebody)) (predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who asks who"
  lin is_vpq_QS np npq = lin QS { -- "Mary is somebody who is/asks who ?"
    s = \\qf => (mkCl np npq).s ! Pres ! Simul ! CPos ! ODir
  } ;
  lin v2_vpq_QS np v2 npq = lin QS { -- "Mary asks somebody who is/asks who ?"
    s = \\qf => (mkCl np v2 npq).s ! Pres ! Simul ! CPos ! ODir
  } ;


  -- Variables have genitives [JJC]
  lincat Var = {s : Case => Str};
  lin var_Term v = mkpConst (NomVar v) ;
  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;
  oper NomVar : {s : Case => Str} -> Str = \v -> v.s ! Nom ;

  -- "somebody X" etc [JJC]
  lin indefPronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
--    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case (NCase Nom)) ; -- no inflection for genitive
    a = pr.a
  };

  -- We override this because of the linearisation of Var [JJC]
  lin apposVarCN cn v = mkCN cn (symb (NomVar v)) ;

  -- VP coordination
  lincat
    VPS = ExtraAce.VPS ;
    [VPS] = ExtraAce.ListVPS ;
  lin
    BaseVPS = ExtraAce.BaseVPS ;
    ConsVPS = ExtraAce.ConsVPS ;
    vp_as_posVPS = MkVPS (mkTemp presentTense simultaneousAnt) positivePol ;
    vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) UncNeg ;
    np_coord_VPS np conj vpss = ExtraAce.PredVPS np (ExtraAce.ConjVPS conj vpss);

}

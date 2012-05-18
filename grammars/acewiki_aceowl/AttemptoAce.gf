--# -path=.:present

concrete AttemptoAce of Attempto = SymbolsC [Term], NumeralAce ** AttemptoI - [apposVarCN, indefTherePronVarNP, indefPronVarNP] with
  (Syntax = SyntaxAce),
  (Symbolic = SymbolicAce),
  (LexAttempto = LexAttemptoAce) ** open SyntaxAce, ExtraAce, ResAce, SentenceAce, Precedence in {

  -- All the functions below deal with having wh-words in object position. [JJC]
  oper
    ip2np : SyntaxAce.IP -> Agr -> SyntaxAce.NP = \ip,agr -> lin NP ( ip ** {a = agr} ) ;
    ssQS : Str -> SyntaxAce.QS = \s -> lin QS {s = \\_ => s} ;

  lin
    ipNPQ ip = lin NPQ ( ip2np ip (agrP3 Sg) ) ; -- Is agrP3 Sg suitable for all cases..? [JJC]
    ofNPQ np ip = lin NPQ ( SyntaxAce.mkNP np (mkAdv possess_Prep (ip2np ip (agrP3 Sg))) ) ;
    is_ThereNPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is who"
    v2_ThereNPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who asks who"
    a2_ThereNPQ somebody a2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (predRS AttemptoAce.which_RP (a2VP a2 (ip2np who somebody.a))) ; -- "somebody who is mad-about who"
    neg_is_ThereNPQ somebody who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (npVP (ip2np who somebody.a))) ; -- "somebody who is not who"
    neg_v2_ThereNPQ somebody v2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (v2VP v2 (ip2np who somebody.a))) ; -- "somebody who does not ask who"
    neg_a2_ThereNPQ somebody a2 who = Syntax.mkNP (thereNP_as_NP (indefTherePronNP somebody)) (neg_predRS AttemptoAce.which_RP (a2VP a2 (ip2np who somebody.a))) ; -- "somebody who is not mad-about who"

    is_vpq_QS np npq = ssQS ((mkCl np npq).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary is somebody who is/asks who ?"
    v2_vpq_QS np v2 npq = ssQS ((mkCl np v2 npq).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary asks somebody who is/asks who ?"
    a2_vpq_QS np a2 npq = ssQS ((mkCl np a2 npq).s ! Pres ! Simul ! CPos ! ODir) ; -- "Mary is mad-about who ?"
    neg_is_vpq_QS np npq = ssQS ((mkCl np npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is npt somebody who is/asks who ?"
    neg_v2_vpq_QS np v2 npq = ssQS ((mkCl np v2 npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary does not ask somebody who is/asks who ?"
    neg_a2_vpq_QS np a2 npq = ssQS ((mkCl np a2 npq).s ! Pres ! Simul ! CNeg (True|False) ! ODir) ; -- "Mary is not mad-about who ?"

    qs_and_VP qs vp = ssQS s where {
      vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) positivePol vp ;
      s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    } ;
    qs_and_negVP qs vp = ssQS s where {
      vps = ExtraAce.MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg vp ;
      s:Str = (mkS SyntaxAce.and_Conj (lin S (ss (qs.s ! QDir))) (lin S (ss (vps.s ! agrP3 Sg)))).s ;
    } ;
  -- end of wh-word object pos stuff

  -- Variables have genitives [JJC]
  lincat Var = {s : Case => Str};
  lin var_Term v = mkpConst (NomVar v) ;
  lin X_Var = {s = regGenitiveS "X"} ;
  lin Y_Var = {s = regGenitiveS "Y"} ;
  oper NomVar : {s : Case => Str} -> Str = \v -> v.s ! Nom ;

  -- "everybody X" etc [JJC]
  lin indefPronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
--    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case (NCase Nom)) ; -- no inflection for genitive
    a = pr.a
  };

  -- "somebody X" and "something X" [KK]
  lin indefTherePronVarNP pr v = lin NP {
    s = \\c => pr.s ! NCase Nom ++ v.s ! (npcase2case c) ; -- with genitive "somebody X's"
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
    vp_as_negVPS = MkVPS (mkTemp presentTense simultaneousAnt) AnyNeg ;
    np_coord_VPS np conj vpss = ExtraAce.PredVPS np (ExtraAce.ConjVPS conj vpss);

}

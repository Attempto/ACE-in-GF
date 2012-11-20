--# -path=.:present

concrete TestAttemptoApe of TestAttempto = AttemptoAce **
  TestAttemptoI with
    (Syntax = SyntaxAce),
	(Oper = OperApe) ;

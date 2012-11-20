--# -path=.:present

concrete TestAttemptoAce of TestAttempto = AttemptoAce **
  TestAttemptoI with
    (Syntax = SyntaxAce),
	(Oper = OperAce) ;

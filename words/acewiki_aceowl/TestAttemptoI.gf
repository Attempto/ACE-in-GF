--# -path=.:present

incomplete concrete TestAttemptoI of TestAttempto = AttemptoAce **
  open Oper in {

lin

mary_PN = acePN feminine "Mary" ;
john_PN = acePN masculine "John" ;

woman_CN = aceN feminine "woman" "women" ;
man_CN = aceN masculine "man" "men" ;
friend_CN = aceN human "friend" ;

ask_V2 = aceV2 "ask" "asks" "asked" ;

wait_V = mkV "wait" "waits" "waited" "waited" "~" ;
mad_A = mkA "mad" "madder*" ;
mad_about_A2 = aceA2 "mad-about" ;
happy_A = mkA "happy" "happier" ;

}

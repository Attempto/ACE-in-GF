incomplete abstract Questions = {

-- Categories
cat VarCNQ ; -- question CN, e.g. "friend of who" ?
cat NPQ ; -- question NP, e.g. "a friend of who" ?
cat VPQ ; -- question VP, e.g. "is who" ?
cat RSQ ; -- question RS, e.g. somebody "who is who" ?

-- Syntax
fun vpqQS : NP -> VPQ -> QS ; -- "Mary is who ?"
fun neg_vpqQS : NP -> VPQ -> QS ; -- "Mary isn't who ?"

-- These replace the ipQS functions, i.e. "who is a man ?"
fun npqQS : NPQ -> VP -> QS ; -- "somebody who is who is a man ?"
fun neg_npqQS : NPQ -> VP -> QS ; -- "somebody who isn't who is a man ?"

-- VPQ, VPS
fun npqVPQ : NPQ -> VPQ ; -- "is who"
fun v2VPQ : V2 -> NPQ -> VPQ ; -- "likes who"
fun a2VPQ : A2 -> NPQ -> VPQ ; -- "is mad-about who"
fun v2_byVPQ : V2 -> NPQ -> VPQ ; -- "is asked by who"

-- Co-ordination
cat VPSQ ; [VPSQ] {2} ; -- a VPS which contains at least one VPQ (ie the sentence should be a question)
fun vp_as_posVPSQ, vp_as_negVPSQ : VP -> VPSQ ; -- this allows heterogenous lists of VP/VPQ's
fun vpq_as_posVPSQ, vpq_as_negVPSQ : VPQ -> VPSQ ;
fun np_coord_VPSQ : NP -> Conj -> [VPSQ] -> QS ;
fun npq_coord_VPS : NPQ -> Conj -> [VPS] -> QS ;

-- VarCNQ, NPQ
fun ofnpqCN : VarCN -> NPQ -> VarCNQ ; -- "friend of who" ?
fun aNPQ : VarCNQ -> NPQ ;
fun theNPQ : VarCNQ -> NPQ ;
fun noNPQ : VarCNQ -> NPQ ;
fun everyNPQ : VarCNQ -> NPQ ;

fun ipNPQ : IP -> NPQ ; -- "who"
fun relNPQ : NP -> RSQ -> NPQ ; -- "somebody who is a friend of who" ?

-- RSQ
fun predRSQ : RP -> VPQ -> RSQ ; -- "who is who" ?
fun neg_predRSQ : RP -> VPQ -> RSQ ; -- "who isn't who" ?
fun slashRSQ : RP -> NPQ -> V2 -> RSQ ; -- "who who asks" ?
fun neg_slashRSQ : RP -> NPQ -> V2 -> RSQ ; -- "who who doesn't ask"?

}

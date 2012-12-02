incomplete abstract Questions = {

-- Categories
cat VarCNQ ; -- question CN, e.g. "friend of who" ?
-- question NP, e.g. "a friend of who" ?
cat NPQ NPType ;
cat VPQ ; -- question VP, e.g. "is who" ?
cat RSQ ; -- question RS, e.g. somebody "who is who" ?

-- Syntax
fun vpqQS : (k : NPType) -> NP k -> VPQ -> QS ; -- "Mary is who ?"
fun neg_vpqQS : (k : NPType) -> NP k -> VPQ -> QS ; -- "Mary isn't who ?"

-- These replace the ipQS functions, i.e. "who is a man ?"
fun npqQS : (k : NPType) -> NPQ k -> VP -> QS ; -- "somebody who is who is a man ?"
fun neg_npqQS : (k : NPType) -> NPQ k -> VP -> QS ; -- "somebody who isn't who is a man ?"

-- VPQ, VPS
fun npqVPQ : (k : NPType) -> NPQ k -> VPQ ; -- "is who"
fun v2VPQ : (k : NPType) -> V2 -> NPQ k -> VPQ ; -- "likes who"
fun a2VPQ : (k : NPType) -> A2 -> NPQ k -> VPQ ; -- "is mad-about who"
fun v2_byVPQ : (k : NPType) -> V2 -> NPQ k -> VPQ ; -- "is asked by who"

-- Co-ordination
cat VPSQ ; [VPSQ] {2} ; -- a VPS which contains at least one VPQ (ie the sentence should be a question)
fun vp_as_posVPSQ, vp_as_negVPSQ : VP -> VPSQ ; -- this allows heterogenous lists of VP/VPQ's
fun vpq_as_posVPSQ, vpq_as_negVPSQ : VPQ -> VPSQ ;
fun np_coord_VPSQ : (k : NPType) -> NP k -> Conj -> [VPSQ] -> QS ;
fun npq_coord_VPS : (k : NPType) -> NPQ k -> Conj -> [VPS] -> QS ;

-- VarCNQ, NPQ
fun ofnpqCN : (k : NPType) -> VarCN -> NPQ k -> VarCNQ ; -- "friend of who" ?
fun aNPQ : (k : NPType) -> VarCNQ -> NPQ k ;
fun theNPQ : (k : NPType) -> VarCNQ -> NPQ k ;
fun noNPQ : (k : NPType) -> VarCNQ -> NPQ k ;
fun everyNPQ : (k : NPType) -> VarCNQ -> NPQ k ;

fun ipNPQ : (k : NPType) -> IP -> NPQ k ; -- "who"

-- "somebody who is a friend of who" ?
fun relNPQ : (k : NPType) -> NP k -> RSQ -> NPQ k ;

-- RSQ
fun predRSQ : RP -> VPQ -> RSQ ; -- "who is who" ?
fun neg_predRSQ : RP -> VPQ -> RSQ ; -- "who isn't who" ?
fun slashRSQ : (k : NPType) -> RP -> NPQ k -> V2 -> RSQ ; -- "who who asks" ?
fun neg_slashRSQ : (k : NPType) -> RP -> NPQ k -> V2 -> RSQ ; -- "who who doesn't ask"?

}

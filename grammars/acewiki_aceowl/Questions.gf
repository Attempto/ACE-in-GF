abstract Questions = {

cat NPQ ; -- question NP, e.g. "a friend of who ?"
cat VPQ ; -- question VP, e.g. "is who ?"

-- fun ipNPQ : IP -> NPQ ; -- "who"
-- fun ofNPQ : NP -> IP -> NPQ ; -- "a friend of who"
-- fun is_ThereNPQ : IndefTherePron -> IP -> NPQ ; -- "somebody who is who"
-- fun v2_ThereNPQ : IndefTherePron -> V2 -> IP -> NPQ ; -- "somebody who asks who"
-- fun a2_ThereNPQ : IndefTherePron -> A2 -> IP -> NPQ ; -- "somebody who is mad-about who"
-- fun neg_is_ThereNPQ : IndefTherePron -> IP -> NPQ ; -- "somebody who is not who"
-- fun neg_v2_ThereNPQ : IndefTherePron -> V2 -> IP -> NPQ ; -- "somebody who does not ask who"
-- fun neg_a2_ThereNPQ : IndefTherePron -> A2 -> IP -> NPQ ; -- "somebody who is not mad-about who"
-- fun is_npq_QS : NP -> NPQ -> QS ; -- "Mary is who ?"
-- fun v2_npq_QS : NP -> V2 -> NPQ -> QS ; -- "Mary asks who ?"
-- fun v2passive_npq_QS : NP -> V2 -> NPQ -> QS ; -- "Mary is asked by who ?"
-- fun a2_npq_QS : NP -> A2 -> NPQ -> QS ; -- "Mary is mad-about who ?"
-- fun neg_is_npq_QS : NP -> NPQ -> QS ; -- "Mary is not who ?"
-- fun neg_v2_npq_QS : NP -> V2 -> NPQ -> QS ; -- "Mary does not ask who ?"
-- fun neg_v2passive_npq_QS : NP -> V2 -> NPQ -> QS ; -- "Mary is not asked by who ?"
-- fun neg_a2_npq_QS : NP -> A2 -> NPQ -> QS ; -- "Mary is not mad-about who ?"

-- -- A question coordinated with a VP, eg "Mary is who and likes John?"
-- fun qs_and_VP : QS -> VP -> QS ;
-- fun qs_and_negVP : QS -> VP -> QS ;


}

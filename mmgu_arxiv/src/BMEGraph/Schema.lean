/-!
# BME-MathGraph Node & Edge Schema (Lean-side type definitions)

Mirrors the JSON Schema described in §6.
-/

namespace Mathlib.MMGU.BMEGraph

/- Node type -/
inductive NodeType : Type
  | definition | lemma | theorem | idea | conjecture

/- Domain tag -/
inductive Domain : Type
  | NT | ALG | GEO | REP | PR | MART | GEXP | META

/- Formalization status -/
inductive FormalStatus : Type
  | axiom | formalized | partial | conjecture | sorry_status

/- Creator role -/
inductive CreatorRole : Type
  | human | llm | lean_tactic | mixed

structure Creator where
  agent_id : String
  role : CreatorRole
  weight : ℝ

/- A graph node -/
structure Node where
  id : String
  node_type : NodeType
  label : String
  domains : List Domain
  formal_status : FormalStatus
  lean_ref : Option String
  creators : List Creator
  entropy_I : ℝ
  ipfs_cid : String
  tx_hash : String

/- Edge type -/
inductive EdgeType : Type
  | uses | inspires | analog

/- A graph edge -/
structure Edge where
  source : String
  target : String
  edge_type : EdgeType
  weight : ℝ
  depth : Option ℕ
  freq : Option ℕ

/- The dependency matrix (conceptual; actual computation in Python/notebooks). -/
def dependencyMatrix (nodes : List Node) (edges : List Edge) : Matrix ℕ ℕ ℝ := sorry

end Mathlib.MMGU.BMEGraph

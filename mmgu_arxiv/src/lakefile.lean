import Lake
open Lake DSL

package «Mathlib.MMGU» where
  leanOptions := #[⟨`pp.unicode.fun, true⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "master"

@[default_target]
lean_lib «Mathlib.MMGU»

lean_exe mmgu_test from
  «Mathlib.MMGU»

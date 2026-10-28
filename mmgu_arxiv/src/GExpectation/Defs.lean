/-!
# G-Expectation (Peng's framework)

A sublinear expectation space and G-Brownian motion.
-/

namespace Mathlib.Probability.GExpectation

structure GExpectationSpace (Ω : Type*) (𝔼 : (Ω → ℝ) → ℝ) : Prop where
  monotonicity : ∀ (X Y : Ω → ℝ), (∀ ω, X ω ≤ Y ω) → 𝔼 X ≤ 𝔼 Y
  constant_preservation : ∀ (c : ℝ), 𝔼 (fun _ => c) = c
  subadditivity : ∀ (X Y : Ω → ℝ), 𝔼 (X + Y) ≤ 𝔼 X + 𝔼 Y
  positive_homogeneity : ∀ (X : Ω → ℝ) (λ : ℝ), 0 ≤ λ → 𝔼 (λ • X) = λ * 𝔼 X

/- Matrix-valued G-Brownian motion (skeleton) -/
structure GBrownianMotion (F : Type*) where
  Ω : Type*
  𝔼 : (Ω → ℝ) → ℝ
  B : ℝ≥0 → Ω → Matrix F F
  is_GBrownian : GExpectationSpace Ω 𝔼

end Mathlib.Probability.GExpectation

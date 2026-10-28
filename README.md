# MMGU: A Stochastic Extension of the Fundamental Lemma

> **Status: research preprint-in-progress.** Parts of this are likely naive or wrong.
> Open items in the Lean code are marked `sorry` (or listed below as axioms).
> Pointed questions and counterexamples are more useful to us than endorsement.

## What this is

This project starts from Ngô's proof of the Lie-algebra Fundamental Lemma and the
support theorem for the Hitchin fibration, and asks whether they can be lifted to a
stochastic setting. The proposed framework is called **MMGU** (Meta-Mathematical
Grand Unification; the name is a working title).

The central idea: replace classical orbital integrals by **G-expectation** averages
over random Higgs fields.

> **Notation warning.** "G-expectation" refers to Peng's nonlinear expectation.
> The letter *G* there has nothing to do with the reductive group *G* (e.g. GL(2),
> `dim G`) appearing elsewhere in the text.

## Claimed results (to be scrutinized)

1. **GL(2):** the stochastic orbital integral equals the classical one multiplied by
   a survival factor
   `Ψ_G(σ) = exp(-½ σ² t · dim G)`.
2. The transfer factor `Δ` is unchanged, so endoscopy is claimed to be stable under
   volatility.
3. As `σ → 0`, the classical Fundamental Lemma is recovered exactly.

## Questions we most want answered

1. Is "G-expectation on the Hitchin base" coherent with the perverse-sheaf support
   decomposition?
2. Where does the stochastic SFL most likely break for non-split endoscopy?
3. Is the entropy-conservation conjecture (§4) merely heuristic, or does it admit a
   trace-identity formulation?

If you only have time for one sentence: **which assumption should be discarded first?**

## Repository layout

```
paper/        LaTeX source (main.tex) and compiled PDF (mmgu.pdf)
lean/         Lean 4 skeleton (lakefile.lean, lean-toolchain)
  GExpectation/Defs.lean     G-expectation definitions
  SFL/GL2/Main.lean          stochastic fundamental lemma, GL(2) case
  Functor/Phi.lean           the Φ-functor
  Entropy/Conservation.lean  entropy-conservation conjecture (§4)
  BMEGraph/Schema.lean       BME-MathGraph schema
  M44/Axiom.lean             [describe: what this file assumes]
experiments/  numerical validation scripts
  psi_g_survival.py          compares finite-σ deviation with Ψ_G
  degeneracy_test.py         checks σ → 0 recovers classical values
data/         orbital_integrals.csv, plus BME-MathGraph (nodes/edges/schema JSON)
notebooks/    exploratory notebooks
```

## Reproducing

**Numerics**

```bash
pip install -r experiments/requirements.txt
python experiments/degeneracy_test.py
python experiments/psi_g_survival.py
```

Reported outcome: `σ → 0` reproduces the classical values; finite-σ deviation is
tracked by `Ψ_G` to < 1e-3 relative error.

*What this does and does not check:* [ONE OR TWO SENTENCES. For example: whether
`Ψ_G` is derived independently or inserted by hand, and where the reference values in
`data/orbital_integrals.csv` come from, with citation.]

**Lean**

```bash
cd lean
lake build
```

Toolchain: see `lean/lean-toolchain`. Dependencies: [Mathlib version, if used].

## Lean status

| Item | Status |
|------|--------|
| G-expectation definitions | [done / partial] |
| SFL, GL(2) | [done / `sorry`] |
| Φ-functor | [..] |
| Entropy conservation (§4) | open, `sorry` |
| T4 items | open, `sorry` |
| Axioms in `M44/Axiom.lean` | [list each axiom explicitly] |

Everything not listed as proved should be read as unproved.

## Known limitations

- Only the GL(2) case is treated.
- Non-split endoscopy is not handled.
- The entropy-conservation statement (§4) is currently a conjecture.
- [Add anything else you already suspect is weak.]

## Data sources

- `data/orbital_integrals.csv`: [source / citation / how generated]

## Feedback

Please open an issue or email [your email]. Counterexamples, references to existing
work we missed, and "this step is wrong because…" are all welcome.

## Citation

See `CITATION.cff`.

## License

Code: MIT (see `LICENSE`). Paper text: CC BY 4.0.

## Authors

CHEN Cibo, YUAN Rongchang (AI-Math team)

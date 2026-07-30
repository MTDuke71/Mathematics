# Progress log

Newest entries at the top. Status is one of: `reading`, `exercises`,
`note drafted`, `done`.

| Date | Phase | Chapter / topic | Exercises | Lean | Status |
|---|---|---|---|---|---|
| 2026-07-29 | 0 | **Macbeth, *The Mechanics of Proof*** cloned to `lean/math2001/` (gitignored) and building — `Library` 1020 targets clean, sample exercise file type-checks. Pinned Lean **v4.3.0**, and it disables `simp`/`linarith`/`aesop`/`tauto` on purpose. Two-track split documented in [lean/README.md](lean/README.md): drills in math2001, deliverables in `math201/` | — | env verified | done |
| 2026-07-29 | 1 | Hammack §1.1 — answers to #1–#5 graded, all conclusions correct; #6 recurrence found, closed form outstanding. Methods + diagnosis captured in [notes/Book of Proof/1_1-review.md](notes/Book%20of%20Proof/1_1-review.md). Named: Bézout, zero-product property / integral domain / zero divisors, extensionality, von Neumann ordinals, successive differences, telescoping | 5 of 6 | `∅ ≠ {∅}` (target) | exercises |
| 2026-07-27 | — | Repo under git (`main`); Lean project relocated to `lean/math201/`; `.lake` ignored | — | — | done |
| 2026-07-27 | 0 | **Lean 4 + Mathlib installed** — elan 4.2.3, Lean v4.32.1, Mathlib pinned v4.32.1. Project at [lean/math201/](lean/math201/). Smoke tests: [lean/hello.lean](lean/hello.lean), `lean/math201/Math201/Scratch.lean` | — | `ring`, `norm_num`, `apply … at` verified | done |
| 2026-07-27 | 1 | Hammack Ch. 1 (Sets) — [schedule issued](exercises/01-sets.md), 4 sessions + Lean install | assigned | subset transitivity (target) | reading |
| 2026-07-27 | 0 | NNG: **Implication World complete** — `intro`, `exact`, `apply`, `apply … at`; `zero_ne_one`, `2 + 2 ≠ 5` | all levels | `succ_inj`, `zero_ne_succ` | done |
| 2026-07-27 | — | Diagnostic Q4–Q12 graded; [assessment](exercises/00-diagnostic-assessment.md) rewritten for all 12 | 12 of 12 | — | done |
| 2026-07-27 | — | Diagnostic Q1–Q3 + Euclid follow-up; [assessment](exercises/00-diagnostic-assessment.md) | 3 of 12 | — | done |
| 2026-07-27 | 0 | Notation/vocabulary sheet built ([notes/00-notation.md](notes/00-notation.md)) | — | — | done |
| 2026-07-26 | 0 | NNG: Tutorial World, Addition World — both complete | all levels | `add_comm` from Peano axioms | done |
| 2026-07-26 | 0 | NNG: Multiplication + Implication opened, 1 level each | — | — | in progress |
| 2026-07-26 | — | Repo set up; diagnostic issued | — | — | diagnostic outstanding |

Tactics acquired so far: `rfl`, `rw` (and `←`, and `at h`), `induction`,
`intro`, `exact`, `apply` (and `apply … at h`).

**Diagnostic is closed. Implication World is closed. Next: Phase 1,
Hammack Ch. 1 (sets)**, then Ch. 4–5 (direct / contrapositive), which is where
the Q4 converse-proof gets repaired properly.

Multiplication World remains optional and can be run alongside as warm-up.

Concepts banked in Implication World, worth not re-teaching: `≠` is notation
for `→ False`; `False` is the uninhabited type; a proof of `¬P` is a function
`P → False`; modus ponens is function application. Curry–Howard met from the
practical side, day three.

Standing emphasis from the diagnostic (details in the assessment): drill
**witness form over test form**, mark **converse-proofs wrong every time**,
and **name every result in canonical vocabulary** — the Q1/Q10 gap was
transfer, not reasoning.

## Notes to self

- A chapter is `done` when the note in `notes/` is written, not when the
  reading is finished.
- Record wrong proofs. The diagnosed failure is worth more later than the
  correct version.

# lean/

Lean 4 + Mathlib project. Not created yet — Phase 0 step 2.

## Setup, once `elan` exists

```powershell
# 1. install elan (Lean's rustup)
#    https://github.com/leanprover/elan  — or via winget:
winget install Lean.Elan

# 2. create the project with Mathlib as a dependency
lake +leanprover-community/mathlib4:lean-toolchain new math201 math
cd math201
lake exe cache get      # downloads prebuilt Mathlib olean files; do NOT skip
lake build
```

`lake exe cache get` is the step people skip and then spend an hour compiling
Mathlib from source. Don't.

Editor: VS Code + the `leanprover.lean4` extension. It talks to the Lean
language server and shows the goal state in a side panel — the goal panel is
the whole point, it's the REPL for proofs.

## Before installing anything

Do the **Natural Number Game** in a browser first — no install, and it teaches
the tactic vocabulary everything else assumes.

<https://adam.math.hhu.de/#/g/leanprover-community/NNG4>

### How far to go: through **Implication World**. Then stop.

| World | Buys | |
|---|---|---|
| Tutorial | `rfl`, `rw`, Peano axioms as axioms | required |
| Addition | `induction` | required |
| Multiplication | same moves, new operator | skim |
| Power | ditto; ends `(a+b)² = a² + 2ab + b²` | optional |
| **Implication** | `intro`, `apply`, `exact`, `have` — **logic** | **the target** |
| Algorithm / Adv. Addition / ≤ / Adv. Mult. | Peano lemma-chasing | skip unless enjoying it |

`add_comm` at the end of Addition World is the game's ceremonial endpoint, not
the useful one. Implication World is the useful one: it's the only world that
teaches propositional-logic tactics, and propositional logic is what Hammack
(Phase 1) is made of. Stopping at Addition World means arriving at Book of
Proof able to prove things about ℕ and unable to prove `P → Q`.

The tail worlds hand-derive `mul_left_cancel`, `le_antisymm` etc. from the
Peano axioms. Honest exercise, but `import Mathlib` provides all of it and
those proofs never get written again.

Side payoff in Implication World: proving `P → Q` is `intro h`, then producing
a term of type `Q` from `h : P`. That's a function. Propositions are types,
proofs are programs — Curry–Howard, one of the two north stars, delivered in
about forty minutes.

### Done when — not "levels are green", but:

- can read a goal state: what's hypothesis, what's goal, without squinting
- can say what `induction n with d hd` did to the goal — the two branches, and
  where `hd` came from
- when `rw [h]` fails, can tell from the error whether it's wrong direction
  (`rw [← h]`) or wrong subterm

Budget: an afternoon or two. At four evenings, overshot — stop and move on.
The goal panel is the product, not the level counter. Read it before every
tactic.

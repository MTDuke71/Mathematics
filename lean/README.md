# lean/

Lean 4 + Mathlib. Installed 2026-07-27: elan 4.2.3, Lean v4.32.1, Mathlib
pinned to v4.32.1.

## Two projects, two jobs

| Dir | Toolchain | Tracked in git? | For |
|---|---|---|---|
| [math201/](math201/) | v4.32.1 | **yes** | the graded deliverables — one formalized theorem per Hammack chapter, current Mathlib, all tactics allowed |
| `math2001/` | **v4.3.0** | no (gitignored) | drills from Macbeth's *The Mechanics of Proof*, in its own walled sandbox |

`elan` reads `lean-toolchain` per directory, so the two coexist and neither
disturbs the other. Verified: `lean --version` reports 4.32.1 inside
`math201/` and 4.3.0 inside `math2001/`.

### Why math2001 is quarantined

Two reasons, both worth knowing before sitting down in it.

**1. It is pinned to Lean v4.3.0** — twenty-nine minor versions behind, last
upstream commit 2024-12-09. Not broken (the Mathlib cache for that revision
is still hosted — 3969/3972 files pulled), but its Mathlib is from early 2024
and lemma names have drifted since.

**2. It deliberately disables the standard tactics.** From
`Library/Basic.lean`: `simp`, `linarith`, `nlinarith`, `polyrith`, `decide`,
`aesop`, and `tauto` are all macro'd to `fail`. Confirmed empirically —
`by simp` errors with `simp tactic disabled`. In their place it supplies its
own: `numbers`, `addarith`, `cancel`, `extra`, `obtain`, `exhaust`, and a
custom `induction`.

That is sound pedagogy — `simp` and `aesop` will close beginner goals
*without* teaching why, which is the Lean-flavoured version of reading a
proof and nodding. But it means part of the vocabulary is book-local and does
not exist in real Lean.

**So: drills there, deliverables in `math201/`.** What transfers is the hard
part and it is version-independent — `calc` chains, `obtain`, case splitting,
induction structure, ∃-witnesses. What doesn't transfer is tactic names.

Reproduce the clone with:

```bash
cd lean && git clone --depth 1 https://github.com/hrmacbeth/math2001.git
cd math2001 && lake exe cache get && lake build Library
```

`lake build Library` compiles Duper from source (~1000 targets) and is the
slow step. Book text ships offline in `math2001/html/`; work it side by side
with the exercise files, which are `sorry`-holes to fill.

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

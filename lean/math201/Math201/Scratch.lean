/-
  Scratch.lean — Mathlib smoke test.

  Narrow imports on purpose. `import Mathlib` pulls in everything and takes
  ~30s to elaborate every time you open the file. Import what you need.
-/

import Mathlib.Tactic
import Mathlib.Data.Set.Basic

-- 1. Mathlib is here.
#eval 2 + 2

-- 2. Tactics that do NOT exist in core Lean.
example (x y : ℝ) : (x + y) ^ 2 = x ^ 2 + 2 * x * y + y ^ 2 := by ring

example : (37 : ℝ) / 4 < 10 := by norm_num

-- 3. `apply ... at` — the NNG tactic that failed in hello.lean.
--    It works here, because it comes from Mathlib.
example (P Q : Prop) (hpq : P → Q) (hp : P) : Q := by
  apply hpq at hp
  exact hp

-- 4. Set notation exists, which is what Hammack Ch. 1 needs.
--    (Statements only — no proofs. The Ch. 1 Lean target is yours to do.)
section Chapter1

variable {α : Type*} (A B : Set α)

#check A ⊆ B
#check A ∪ B
#check A ∩ B
#check A \ B
#check Aᶜ
#check (∅ : Set α)
#check 𝒫 A          -- power set. Type it as \powerset

end Chapter1

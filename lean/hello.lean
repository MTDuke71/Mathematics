/-
  hello.lean — smoke test for the Lean 4 install.

  No Mathlib. Core Lean only, so this file works before the math201
  project is built.

  Open in VS Code with the `lean4` extension. Nothing needs to be run:
  put the cursor on a `#eval` / `#check` line and read the InfoView panel.
  Ctrl+Shift+Enter opens the InfoView if it isn't showing.
-/

-- ─────────────────────────────────────────────────────────────
-- 1. Lean as a programming language.
--    This is the boring hello world. It is here for completeness.
-- ─────────────────────────────────────────────────────────────

def main : IO Unit :=
  IO.println "Hello, world!"

#eval main

-- Lean is a real language. This is a strict, dependently typed,
-- ML-family functional language that happens to also be a proof
-- assistant. Recursion, pattern matching, the usual.

def fib : Nat → Nat
  | 0     => 0
  | 1     => 1
  | n + 2 => fib n + fib (n + 1)

#eval fib 20            -- 6765

#eval (List.range 10).map fib


-- ─────────────────────────────────────────────────────────────
-- 2. Lean as a proof assistant.
--    This is the hello world that matters.
-- ─────────────────────────────────────────────────────────────

-- `#check` asks for the TYPE of something without evaluating it.
-- Get in the habit; it is the single most useful command in Lean.

#check 2 + 2            -- Nat
#check fib              -- Nat → Nat
#check (rfl : 2 + 2 = 4) -- 2 + 2 = 4


-- Here is the point from the tactics notes, made executable.
-- `rfl` closes this because both sides COMPUTE to the same normal form.
-- Nothing is being proved in the informal sense; Lean just runs them.

example : 2 + 2 = 4 := by rfl

-- Same statement, no tactic block at all. `rfl` is a term, not magic.
example : 2 + 2 = 4 := rfl


-- And the pair from Addition World, now outside NNG:

example (n : Nat) : n + 0 = n := by rfl      -- computes. `add` recurses on arg 2.

-- example (n : Nat) : 0 + n = n := by rfl   -- UNCOMMENT ME. It fails.
                                             -- The match is stuck on a variable.
example (n : Nat) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ d hd => rw [Nat.add_succ, hd]

-- Note the `induction ... with | zero => ... | succ d hd => ...` syntax.
-- This is real Lean 4. NNG's `induction n with d hd` is NNG-only.


-- ─────────────────────────────────────────────────────────────
-- 3. Modus ponens, since that just came up.
--    An implication is a function. Applying it is modus ponens.
-- ─────────────────────────────────────────────────────────────

-- Backward: goal is Q, `apply` turns it into P.
example (P Q : Prop) (hpq : P → Q) (hp : P) : Q := by
  apply hpq
  exact hp

-- Forward: push the hypothesis through.
-- NOTE: `apply f at h` is NOT core Lean. It comes from Mathlib (and NNG
-- provides it too). This will not compile until the math201 project exists.
--
--   example (P Q : Prop) (hpq : P → Q) (hp : P) : Q := by
--     apply hpq at hp
--     exact hp
--
-- Core-only equivalent, using `have` to name the forward step:
example (P Q : Prop) (hpq : P → Q) (hp : P) : Q := by
  have hq : Q := hpq hp
  exact hq

-- No tactics at all. This is what the two proofs above elaborate to:
-- function application, and nothing else.
example (P Q : Prop) (hpq : P → Q) (hp : P) : Q := hpq hp


-- ¬P is notation for P → False. `False` is the uninhabited type.
-- So a proof of ¬P is a function that can never be called.
#check @Not          -- Prop → Prop
#print Not           -- fun a => a → False

example (P : Prop) (hnp : ¬P) (hp : P) : False := hnp hp


-- ─────────────────────────────────────────────────────────────
-- 4. What the whole thing rests on.
-- ─────────────────────────────────────────────────────────────

-- `#print axioms` shows which axioms a theorem actually depends on.
-- Anything reported here is trusted, not proved.

theorem two_plus_two : 2 + 2 = 4 := rfl

#print axioms two_plus_two    -- 'two_plus_two' does not depend on any axioms

-- That message is the reason this whole approach is worth the trouble.
-- Not "I checked it and it looked right" — a machine-verified statement
-- that the proof reduces to the definitions and nothing else.

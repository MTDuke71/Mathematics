# Lean tactic reference

Fill in as I meet each one, in my own words. Written for me, 12+ months cold.

The **When I reach for it** column is the one that matters. "introduces a
hypothesis" is a restatement of the name and is worthless a year from now.
"goal is `P → Q` and I want to assume `P`" is a decision rule.

| Tactic | What it does to the goal | When I reach for it |
|---|---|---|
| `rfl` | Closes the goal `a = b` if both sides *compute* to the same thing | The two sides are already the same once Lean unfolds the definitions. If it fails they are not definitionally equal — go get a `rw`. |
| `rw [h]` | `h : a = b` — finds `a` in the goal, replaces it with `b`. Left→right. | I can see the left side of some lemma sitting in my goal and I want it turned into the right side. |
| `rw [← h]` | Same, backwards: finds `b`, replaces with `a`. Right→left. | The goal has the *result* form and I want to un-apply the lemma to get a shape some other lemma will match. (get the back arrow by typing \left or \l)|
| `induction n with d hd` | Splits into **one base case** `P 0` and **one inductive step** `P (succ d)`, where `hd : P d` is handed to me free | The statement is about all naturals and `rfl`/`rw` stalled. Induct on the variable the *definition* recurses on. |
| `intro h` | Changes goal to right side of implication and add left side of implication as a hypothesis |when we have P => Q, we can assume P and then prove Q |
| `exact h` | will close the goal if h is a proof of the problem| if a hypothesis h is the goal use exact h|
| `apply f` |applies the implication to Goal or assumption |used if you have an [if then] (implication) apply f at h (forward) apply f to argue backwards |
| `have h : P := ...` | | |
| `symm` | Symmetry. Turns goal `a = b` into `b = a`; `symm at h` flips a hypothesis instead. | I already have exactly the fact I need and it is pointing the wrong way, so `exact` or `rw` refuses to match. If the mismatch is *inside* a bigger expression rather than the whole statement, want `rw [← h]` instead. |

Add rows as they show up. Mathlib adds `simp`, `ring`, `omega`, `linarith`,
`exact?` — those come later, in *Mathematics in Lean*, not in NNG.

### Things that bit / will bite

**`rfl` does real work — it is not "both sides look the same."** It unfolds
definitions and evaluates. The pair that shows this, both from Addition World:

- `n + 0 = n` — **closes by `rfl`.** `add` is defined by recursion on its
  *second* argument, so `add n 0` reduces to `n` on the spot.
- `0 + n = n` — **does not.** Needs induction.

Identical-looking statements, different proofs, and the whole difference is
which argument the recursion is on. Remember this one; it explains most `rfl`
failures.

Also: `rfl` closes **a** goal, not the proof. After `induction` there are two.

**`rw` rewrites *every* occurrence of the pattern, not just the first.** When a
rewrite does more than intended, this is why.

**`rw` automatically tries `rfl` when it's done.** So a proof often ends on a
`rw` line with no `rfl` after it — and deleting a `rw` that looks redundant can
break a proof that appeared finished.

`rw [h]` rewrites the goal; `rw [h] at h2` rewrites inside a hypothesis.

**`induction` syntax differs between NNG and real Lean 4.** NNG:
`induction n with d hd`. Mathlib/Lean 4 proper:
`induction n with | zero => ... | succ d hd => ...`. Don't paste one into the
other.

**The standard way to stall in the inductive step is forgetting `hd` exists**
and trying to prove `P (succ d)` from nothing. It is a free hypothesis. Use it.

**`a = b` and `b = a` are different propositions**, not two spellings of one.
`Eq a b` and `Eq b a` are different types, so `exact h` fails on a flipped
goal. Lean will not silently apply symmetry — it is a theorem (`Eq.symm`) and
theorems must be invoked. Same reason `rfl` can't rescue it: nothing reduces.

**The three equality tactics are the three axioms of an equivalence relation:**

| Tactic | Property | Term |
|---|---|---|
| `rfl` | reflexive — `a = a` | `Eq.refl` |
| `symm` | symmetric — `a = b → b = a` | `Eq.symm` |
| `trans` | transitive — `a = b → b = c → a = c` | `Eq.trans` |

That is not a coincidence or a mnemonic; equality *is* an equivalence relation
and these tactics are its three defining properties, one apiece. Hammack's
equivalence-relations chapter is this same triple in prose. (`trans` hasn't
come up yet — a `calc` block is chained `trans`.)

---

## Surprise log

Every time I thought the proof was done and Lean disagreed. One line each:
what I believed, what it actually wanted. Target ~5 entries for the whole
game, not 50.

These are the entries worth rereading. Each one is a spot where informal
reasoning had a gap that didn't feel like a gap — which is the whole reason
the proof assistant comes before the proof book.

-  adding at h after a rw[x] rewrites the hypothesis not the Problem statement
-
-

---

## Goal-state reading

Notes on parsing the goal panel — what's above the `⊢`, what's below, what
changes after a tactic fires. Anything that was confusing the first time.

-

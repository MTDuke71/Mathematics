# Hammack Chapter 1 — Sets

Schedule and assignment. Issued 2026-07-27.

**Sessions, not dates.** Four sittings, in order. A session ends when its
exercises are written down, not when the reading is finished. If a session
takes two evenings, it takes two evenings — CLAUDE.md's no-cadence-pressure
rule applies and I will not ask where you are.

> **Section numbers below are for the 3rd edition.** If yours differs, go by
> section *name* — the ordering is stable across editions even when the
> numbering shifts.

---

## What this chapter is, and what it is not

Hammack does not prove anything until Chapter 4. Chapter 1 is **notation and
vocabulary**, and it is the chapter people skim.

Do not skim it. The diagnostic conclusion was that the reasoning is intact and
the vocabulary is missing — this is the chapter that fixes the thing that is
actually broken. The payoff is not in Chapter 1; it is that Chapters 4–8 become
readable instead of foreign.

Concretely: you solved diagnostic Q9 (power sets) correctly *and enumerated in
binary order without noticing you had built a bijection*. Section 1.4 is that
question with the name attached. That gap — right answer, no name, no transfer
— is the whole reason for this chapter.

---

## Session 0 — install Lean 4 + Mathlib — **DONE 2026-07-27**

elan 4.2.3, Lean v4.32.1, Mathlib pinned to v4.32.1. Project lives at
[../lean/math201/](../lean/math201/).

- Write proofs in `lean/math201/Math201/`. Scratch file already there.
- Build from inside `lean/math201`: `lake build`.
- Type-check one file without a full build: `lake env lean Math201\Scratch.lean`.
- `elan` is at `%USERPROFILE%\.elan\bin` — on PATH for new terminals.
- **Import narrowly.** `import Mathlib.Tactic` + what you need. Bare
  `import Mathlib` re-elaborates the world every time the file opens.
- **`apply f at h` is Mathlib, not core Lean.** Fine inside this project;
  fails in a bare `.lean` file. Same for `ring` and `norm_num`.

---

## Session 1 — 1.1 Introduction to Sets, 1.2 Cartesian Product, 1.3 Subsets

**Read** all three. They are short.

**Exercises**

- **1.1** — the list-notation and cardinality blocks. Do about 8, and make
  sure two of them are the ones with sets *inside* sets.
- **1.2** — do 6, including at least two that ask you to sketch a subset of
  ℝ². The sketches matter; do not skip them because they feel like busywork.
- **1.3** — do 6, including every one that asks you to *count* subsets.

**What I'm looking for:** whether `∈` and `⊆` are distinct in your hands. See
"The trap" below — this is where it bites.

**Rust connection, worth writing down as you go:** a set is not a `Vec`. No
order, no duplicates — `HashSet`. And `|A × B| = |A|·|B|` is not a curiosity,
it is why a struct's inhabitant count is the product of its fields' and an
enum's is the sum. `(A, B)` is the Cartesian product. `enum {A, B}` is the
disjoint union. `Option<T>` has `|T| + 1` values because it is `T ⊔ {none}`.
Product types and sum types are named after exactly this.

---

## Session 2 — 1.4 Power Sets, 1.5 Union/Intersection/Difference, 1.6 Complement, 1.7 Venn Diagrams

**Read** all four.

**Exercises**

- **1.4** — do 8. Include at least one with `∅` or `{∅}` in it, and at least
  one asking for `|P(A)|` where `A` is itself a set of sets.
- **1.5** — do 8.
- **1.6** — do 4.
- **1.7** — do the ones that ask you to *express* a shaded region as a set
  expression, and the ones that ask whether two expressions are equal. Skip
  pure shading drills after the first couple.

**Write out, in your own words, in the note:** why `|P(A)| = 2^|A|`. You
already have the argument from diagnostic Q9 — you just never stated it. State
it now: the bijection between subsets of an *n*-element set and *n*-bit
strings, each element independently in or out, product rule.

Then say the sentence out loud: **a bitboard is an element of `P(squares)`.**
`u64` ↔ subset, `|` union, `&` intersection, `~` complement, `^` symmetric
difference. Section 1.5 is your move generator's algebra with different
handwriting.

---

## Session 3 — 1.8 Indexed Sets

**Its own session.** This is the section that actually bites, and it is short
enough that people read it in five minutes and then can't parse `⋃` for a year.

**Read** it twice. The second time, translate every displayed expression into a
sentence in English before moving on.

**Exercises** — do 8, and include the ones with an *infinite* index set. That
is where the notation stops being decoration.

**The thing to get:** `⋃_{i∈I} A_i` is not an operator with two arguments. It
is "the set of things that are in *at least one* of the `A_i`," and `⋂` is "in
*every* one." Once you see that `⋃` is a disguised `∃` and `⋂` is a disguised
`∀`, the section collapses into something you already understand — and the
quantifier order question from diagnostic Q6 is suddenly relevant.

If it helps: `⋃` is `.any()`, `⋂` is `.all()`, over the index set.

---

## Session 4 — 1.9 Number Systems, 1.10 Russell's Paradox, + Lean + the note

**Read** both. 1.9 is a light read. 1.10 is the interesting one and it is two
pages.

**Exercises** — a few from 1.9. 1.10 has essentially none; that's fine.

**On Russell's paradox:** "the set of all sets that do not contain
themselves." Ask whether it contains itself, get a contradiction either way.
This broke Frege's life work in 1902 and is a genuine reason things are the
way they are — it is why Lean has *universes* and why you cannot write
`Type : Type`. You are using the fix daily; this is the bug report.

### Lean target

Formalize **transitivity of the subset relation**:

```lean
example (A B C : Set α) (hab : A ⊆ B) (hbc : B ⊆ C) : A ⊆ C := by
  sorry
```

Chosen deliberately: it needs `intro`, `apply`, `exact` and nothing else. You
have all three.

The reason it is worth doing rather than being told: **`A ⊆ B` unfolds to
`∀ x, x ∈ A → x ∈ B`.** Subset is an implication wearing a costume. Every
subset proof you will ever write is an Implication World level. Find that out
by hitting it, not by reading this paragraph again.

Stretch, if that one goes fast: `A ⊆ A ∪ B`.

### The note

`notes/01-sets.md`, per the CLAUDE.md six-part shape:

1. Definitions restated **in your own words** — not copied.
2. Why the definitions are that way. For this chapter that mostly means: why
   `∅ ⊆ A` for every `A` (vacuous truth, and it will feel wrong), and why
   `{∅} ≠ ∅`.
3. 3–5 worked exercises with complete solutions, **including one you got
   wrong first**, wrong version preserved, failure diagnosed.
4. The Lean formalization.
5. Where you've already met this — bitboards, product/sum types, `HashSet`.
6. Cross-links.

The chapter is `done` when that file exists. Not when the reading is finished.

---

## The trap

**`∈` versus `⊆`.** This is the Chapter 1 error and it catches everyone once.

- `2 ∈ {1, 2, 3}` — true. `2` is an element.
- `2 ⊆ {1, 2, 3}` — **not false. Meaningless.** `2` is not a set.
- `{2} ⊆ {1, 2, 3}` — true.
- `{2} ∈ {1, 2, 3}` — false. The *set* `{2}` is not one of the three elements.
- `{2} ∈ {{1}, {2}}` — true.

And the pair that trips people hardest, both true for different reasons:

- `∅ ⊆ A` — true for every `A`, vacuously.
- `∅ ∈ P(A)` — true for every `A`, because `P(A)` collects the subsets and
  `∅` is one of them.

Then: `{∅} ≠ ∅`. One is a box containing an empty box; the other is an empty
box. `Some(vec![])` versus `None`, close enough to be worth the analogy.

If you can do the list above cold, section 1.1–1.4 has landed.

---

## Answers

Write below, or in a sibling `01-sets_ans.md` if this gets long — whichever.
Photos of paper are fine. Preserve the wrong versions.

### Session 1

>

### Session 2

>

### Session 3

>

### Session 4

>

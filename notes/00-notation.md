# 00 — Notation and vocabulary

> Chapter 0. Not mathematics — the decoder ring for reading it. Written
> 2026-07-27 because the first diagnostic was unanswerable on notation alone,
> which is a vocabulary problem, not a reasoning problem.
>
> Nothing here is deep. All of it is assumed by every book on the list.

---

## 1. Symbols

### Functions

| Symbol | Read as | What it means | Rust |
|---|---|---|---|
| `f : A → B` | "f from A to B" | `f` takes an element of set `A`, returns an element of `B` | `fn f(a: A) -> B` |
| `x ↦ x²` | "x maps to x squared" | the *rule*, without naming the function | `\|x\| x * x` |
| `f(x)` | "f of x" | the output at input `x` | `f(x)` |
| `A` | domain | the set of legal inputs | argument type |
| `B` | codomain | the *declared* output type | return type |
| image / range | | the outputs actually produced — may be smaller than `B` | — |

**`→` vs `↦` is the one people trip on.** `→` sits between *sets* (types).
`↦` sits between *elements* (values). `sq : ℝ → ℝ` and `x ↦ x²` describe the
same function — one gives its signature, one gives its body.

The domain/codomain/image distinction has no Rust equivalent and it matters:
`fn f(x: i32) -> i32 { x * x }` declares codomain `i32`, but the image is only
the non-negative squares. The type system can't say that. Mathematics can, and
that gap is exactly what "surjective" is about.

### Sets

| Symbol | Read as | Means |
|---|---|---|
| `{a, b, c}` | "the set containing a, b, c" | unordered, no duplicates |
| `x ∈ A` | "x is in A" / "x is an element of A" | membership |
| `x ∉ A` | "x is not in A" | |
| `A ⊆ B` | "A is a subset of B" | every element of `A` is in `B` |
| `A ⊂ B` | "proper subset" | subset, and not equal |
| `A ∪ B` | "A union B" | everything in either |
| `A ∩ B` | "A intersect B" | everything in both |
| `A \ B` or `A − B` | "A minus B" | in `A`, not in `B` |
| `∅` or `{}` | "the empty set" | no elements |
| `\|A\|` | "cardinality of A" | how many elements |
| `A × B` | "A cross B" | all ordered pairs `(a, b)` — a tuple type |
| `P(A)` or `2^A` | "power set of A" | the set of **all subsets** of `A` |

**Power set, the honest version:** a subset of an `n`-element set is exactly a
choice of in-or-out for each element — an `n`-bit mask. So there are `2ⁿ` of
them, and the `2^A` notation is not a coincidence. The subsets of the 64
squares of a chessboard are in exact correspondence with the `u64` bitboards.
That's the same fact.

### Number sets

| Symbol | Name | Contents |
|---|---|---|
| `ℕ` | naturals | `0, 1, 2, 3, …` (some authors start at 1 — books differ, and they will tell you) |
| `ℤ` | integers | `…, −2, −1, 0, 1, 2, …` (Z for *Zahlen*) |
| `ℚ` | rationals | fractions `p/q` (Q for *quotient*) |
| `ℝ` | reals | everything on the number line |
| `ℂ` | complexes | `a + bi` |

`ℤ⁺`, `ℝ⁺` etc. mean the positive part. `ℝ≥0` means non-negative.

### Logic

| Symbol | Read as | Means | Rust-ish |
|---|---|---|---|
| `∀x` | "for all x" | true of every `x` | `iter.all(\|x\| …)` |
| `∃x` | "there exists x" | true of at least one `x` | `iter.any(\|x\| …)` |
| `∃!x` | "there exists a unique x" | exactly one | |
| `P ⟹ Q` or `P → Q` | "P implies Q" / "if P then Q" | whenever `P` holds, `Q` holds | |
| `P ⟺ Q` or `P ↔ Q` | "P if and only if Q" | both directions; "iff" | |
| `¬P` | "not P" | | `!p` |
| `P ∧ Q` | "P and Q" | | `p && q` |
| `P ∨ Q` | "P or Q" | inclusive — one, the other, or both | `p \|\| q` |
| `s.t.` | "such that" | | |
| `∎` or `QED` | end of proof | | |

`∀ε>0 ∃δ>0 …` is just nested quantifiers: *for every* choice of `ε`, *there
exists* some `δ` that works. Order matters enormously — `∀x ∃y` and `∃y ∀x`
say different things. (Compare: "every lock has a key" vs. "there's one key
that opens every lock.")

### Number theory

| Symbol | Read as | Means | Rust |
|---|---|---|---|
| `a \| b` | "a divides b" | `b` is a multiple of `a`, exactly | `b % a == 0` |
| `a ∤ b` | "a does not divide b" | | |
| `a ≡ b (mod m)` | "a is congruent to b mod m" | `a` and `b` leave the same remainder on division by `m` | `a.rem_euclid(m) == b.rem_euclid(m)` |
| `gcd(a,b)` | greatest common divisor | largest number dividing both | |
| `lcm(a,b)` | least common multiple | smallest number both divide | |

**Two gotchas.**

`a | b` (divides, a *statement* — true or false) vs `|a|` (absolute value, a
*number*). Same character, unrelated meanings, told apart by position.

Rust's `%` is a **remainder**, not a modulus: `(-7) % 3 == -1`, not `2`. Use
`rem_euclid` when you mean the mathematical mod. This bites in AoC constantly.

### Lean

| Symbol | Means |
|---|---|
| `⊢` | "turnstile" — everything above is assumed, the thing after it is what's left to prove |
| `h : P` | "`h` is a proof of `P`" — a hypothesis named `h` |

---

## 2. Words

### The three function words

Let `f : A → B`.

- **Injective** (one-to-one): different inputs never collide. If `f(x) = f(y)`
  then `x = y`. *A hash function with zero collisions.* Information is not
  lost.
- **Surjective** (onto): every element of `B` is actually hit by something.
  *The image fills the codomain.* Nothing in the output type is unreachable.
- **Bijective**: both. Then `f` has a true inverse `f⁻¹`. *A lossless,
  total round-trip codec.*

These three are the entire content of the AoC 2019 Day 12 argument, which is
why they're first.

### The proof words

| Word | Means |
|---|---|
| **Axiom** | assumed without proof; the starting rules |
| **Definition** | a name for a precise condition. Not a claim — nothing to prove |
| **Theorem** | a proved claim, important enough to name |
| **Proposition** | a proved claim, less important |
| **Lemma** | a proved claim used as a stepping-stone to a bigger one |
| **Corollary** | a claim that falls out immediately from one just proved |
| **Conjecture** | believed, *not* proved. The open ones are conjectures |
| **Counterexample** | one case where a claim fails. Kills it permanently |
| **Proof** | an argument covering *every* case, from axioms and prior results |

### The structure words

For a statement `P ⟹ Q`:

- **Converse**: `Q ⟹ P`. A *different* statement — may be false when the
  original is true. ("Squares are rectangles" vs "rectangles are squares.")
- **Contrapositive**: `¬Q ⟹ ¬P`. Always has the *same* truth value as the
  original. This is why "prove the contrapositive instead" is legitimate and
  not a trick.
- **Inverse**: `¬P ⟹ ¬Q`. The converse's contrapositive. Rarely used.
- **Necessary / sufficient**: in `P ⟹ Q`, `P` is *sufficient* for `Q`, and
  `Q` is *necessary* for `P`.
- **Vacuously true**: `P ⟹ Q` where `P` never holds. Counts as true. "Every
  element of the empty set is purple" is true.
- **WLOG** ("without loss of generality"): the remaining cases are the same
  argument with names swapped, so only one is written.

### The proof techniques (all of Phase 1)

| Technique | Shape |
|---|---|
| **Direct** | assume `P`, derive `Q` |
| **Contrapositive** | assume `¬Q`, derive `¬P` |
| **Contradiction** | assume `P ∧ ¬Q`, derive something impossible |
| **Induction** | prove it for the base case; prove "if it holds at `n`, it holds at `n+1`" |
| **Cases** | split into exhaustive alternatives, prove each |
| **Construction** | to prove `∃x P(x)`, exhibit one |
| **Counterexample** | to *disprove* `∀x P(x)`, exhibit one failure |

Induction is the one with a programming twin worth stating: it is structural
recursion. Base case and recursive case, and the induction hypothesis is the
recursive call's return value assumed to be correct. `induction n with d hd`
in Lean hands you `hd` — that's the recursive call.

---

## 3. What this chapter is not

This is a lookup table, not knowledge. Knowing that "injective" means
"no collisions" is not the same as being able to prove a given function is
injective. That's Phase 1, and it's the real work.

Reread this whenever a symbol stops parsing. That's what it's for.

## See also

- [[_template]] — the shape every real chapter note takes
- `../exercises/00-diagnostic.md`
- `../lean/tactics.md`

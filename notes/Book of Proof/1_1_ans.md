# Sets

> Source: Book of Proof, chapter 1.1 — Date range worked: 28 July 2026 – 7 Aug 2026

## 1. Definitions, in my own words

<!-- Not copied. If I can't restate it, I haven't got it. -->

- A set is a collection of elements.
- Elements can be anything, but usually numbers in mathematics.
- Sets can be infinite or finite.
- Notation: `{1, 2, 3}`, or `{..., -1, 0, 1, ...}` for infinite.
- Sets are equal if they have the same elements, independent of order.
- Sets are notated by capital letters.
- `x ∈ A` — "x is in A" / "x is an element of A"
- `x ∉ A` — "x is not in A"
- `ℕ` is the set of positive whole numbers.
- `ℤ` is the set of integers (positive, negative, and zero whole numbers).
- `ℝ` is the set of real numbers.
- `ℚ` is the set of rational numbers, `{x : x = m/n where m, n ∈ ℤ and n ≠ 0}`.
- The size (cardinality) of a set is denoted `|A|`.
- The empty set `{}` has size 0 and no elements.
- Set-builder notation (shorthand): `{2n : n ∈ ℤ}`, written as **expression : rule**.
- Intervals can be open (does not include the endpoint) or closed (includes the
  endpoint), and can be infinite: `(-∞, 3)` or `(-3, ∞)`. All of these are infinite
  sets, since there are an infinite number of points in an interval.

## 2. Why the definition is that way

<!-- What breaks with the obvious alternative? Counterexample if there is one.
     This is the section I will actually reread. -->

The empty set `{}` is an empty box, also known as `∅`. By contrast, `{∅}` is a box
with an empty box inside it.

## 3. Worked exercises

Six problems, chosen so each one has a specific way to fail. Numbering is from
Hammack 3rd edition (the free PDF); if yours differs, match by content.

---

### 1. `{5a + 2b : a, b ∈ ℤ}` — Part A, #15

### 2. `{6a + 2b : a, b ∈ ℤ}` — Part A, #16

> Do these as a pair and do not just write the answer. For each, write why — an
> argument that every element you claim is in the set really is, and that nothing
> else is. These two sets are different, and the reason they differ is the single
> most important fact in Phase 2. This is the gcd question from Day 12 wearing a
> set-notation costume.

**#15.**

**`S ⊆ ℤ`:** for any `a, b ∈ ℤ`, `5a + 2b ∈ ℤ`, since ℤ is closed under
multiplication and addition.

**`ℤ ⊆ S`:** let `n ∈ ℤ`.

- `n` even: `n = 2k` for some `k ∈ ℤ`. Take `a = 0, b = k`; then
  `5a + 2b = 2k = n`.
- `n` odd: then `n − 5` is even, so `n − 5 = 2k` for some `k ∈ ℤ`. Take
  `a = 1, b = k`; then `5(1) + 2k = 5 + (n − 5) = n`.

Both inclusions hold, so `S = ℤ`. ∎

**#16.**

**`S ⊆ E`:** `6a + 2b = 2(3a + b)`, and `3a + b ∈ ℤ`, so every element of `S` is
even.

**`E ⊆ S`:** let `n = 2k` with `k ∈ ℤ`. Take `a = 0, b = k`.

So `S = E`. ∎

**The general fact behind both:**

```
{ ma + nb : a, b ∈ ℤ }  =  gcd(m, n) · ℤ
```

`gcd(5, 2) = 1` → `1·ℤ = ℤ`.  `gcd(6, 2) = 2` → `2ℤ`.

---

### Bonus. `{6a + 10b + 15c : a, b, c ∈ ℤ}` — what set is this? Prove it.

**`S ⊆ ℤ`:** for any `a, b, c ∈ ℤ`, `6a + 10b + 15c ∈ ℤ`, since ℤ is closed under
multiplication and addition.

**`ℤ ⊆ S`:** let `n ∈ ℤ`. Take `a = n`, `b = −2n`, `c = n`; then

```
6(n) + 10(−2n) + 15(n) = (6 − 20 + 15)·n = 1·n = n
```

These coefficients are integers, therefore `n ∈ S`. Since `n` was arbitrary,
`ℤ ⊆ S`.

Both inclusions hold, so `S = ℤ`. ∎

**Alt solution, following #15 (odd/even):**

- `n` even: `n = 2k` for some `k ∈ ℤ`. Take `a = 2k, b = −k, c = 0`; then
  `6(2k) + 10(−k) = 12k − 10k = 2k = n`.
- `n` odd: then `n − 15` is even, so `n − 15 = 2k` for some `k ∈ ℤ`. Take
  `a = 2k, b = −k, c = 1`; then
  `6(2k) + 10(−k) + 15 = 2k + 15 = (n − 15) + 15 = n`.

**Why this problem is interesting:** `gcd(6, 10, 15) = 1`, but no *pair* is
coprime — `gcd(6,10) = 2`, `gcd(6,15) = 3`, `gcd(10,15) = 5`. The set is
**setwise coprime** but not **pairwise coprime**. These are different conditions,
and CRT in Phase 2 requires the pairwise one.

---

### 3. `{x ∈ ℝ : x³ + 5x² = −6x}` — Part A, #8

> Factoring problem. There is a specific way to lose an element here, and most
> people lose it. If you get three elements, check you didn't get them by accident.

```
    x³ + 5x² = −6x
⟺  x³ + 5x² + 6x = 0        (add 6x — reversible)
⟺  x(x² + 5x + 6) = 0       (factor — an identity, reversible)
⟺  x(x + 2)(x + 3) = 0      (factor — reversible)
⟺  x = 0 or x = −2 or x = −3    (a product is zero only if a factor is zero)
```

Therefore the set is `{−3, −2, 0}`.

---

### 4. `{x ∈ ℤ : |6x| < 5}` — Part A, #13

> Trivial-looking. Say precisely what the answer is and how it differs from ∅.

The set is `{0}`.

`|6x| < 5 ⟺ 6|x| < 5 ⟺ |x| < 5/6`, and the only integer with `|x| < 5/6` is `0`.

`{0}` is a set of size 1 with `0` as its element. `∅` is the empty set; its size is
0 and it has no elements.

---

### 5. `|{{1}, {2, {3, 4}}, ∅}|` — Part C, #29

> Then, unassigned by Hammack but assigned by me: also compute
> `|{{{1}, {2, {3, 4}}, ∅}}|` and `|{∅, {∅}}|`. Three cardinalities, one sentence
> each on why.

- **Size 3** for the 1st set, with elements `{1}`, `{2, {3, 4}}`, and `∅`.
  A set can contain other sets, or even coordinates with sets.
- **Size 1** for the 2nd set, the single element being `{{1}, {2, {3, 4}}, ∅}`.
  Pay attention to matching set brackets.
- **Size 2** for the 3rd, the elements being `∅` and `{∅}`. Since `∅ ≠ {∅}`, they
  are two distinct elements.

---

### 6. `{3, 6, 11, 18, 27, 38, ...}` — Part B, #22

> The reverse direction: given elements, produce set-builder notation. State which
> index set you're using (ℕ or ℤ), because the answer depends on it and getting
> this wrong is invisible until it bites you.

`{n² + 2n + 3 : n ∈ ℤ, n ≥ 0}` is the answer if the index set is `ℤ≥0`. However,
the definition Hammack uses for ℕ is `{1, 2, 3, ...}`. To convert from 0-based to
1-based indexing I need to solve for

```
(n−1)² + 2(n−1) + 3
= n² − 2n + 1 + 2n − 2 + 3
= n² + 2
```

So the final answer is `{n² + 2 : n ∈ ℕ}`.

---

### Written question (not from the book)

> `{1, 1, 2}` and `{1, 2}` are the same set. Name a mathematical object for which
> they would not be the same, and name the Rust type that corresponds to each.
> Then: is there an operation that's cheap on one and expensive on the other?

`{1,1,2}` and `{1,2}` are equal as sets. But if you consider them as multisets,
they are not equal. For a multiset you would use `HashMap<T, usize>` in Rust,
while for a set you would use `HashSet<T>`. The operation that is informative for a
multiset is number of occurrences (multiplicity). For a `HashMap` this operation is
O(1), derived from the `usize` parameter. For a `HashSet` it degenerates into a
question of whether the element exists (true/false).

**Side note from discussions, preserved for future reference:**

| Object   | Rust                  | `insert` twice | Order matters |
| -------- | --------------------- | ---------------- | ------------- |
| Set      | `HashSet<T>`        | idempotent       | no            |
| Multiset | `HashMap<T, usize>` | not idempotent   | no            |
| Sequence | `Vec<T>`            | not idempotent   | yes           |

Each row drops one guarantee. A set is the most forgetful of the three, and that's
the trade: the more it forgets, the fewer questions you can ask it. Idempotence of
insertion is the algebraic name for what makes `{1,1,2}` and `{1,2}` the same set
in the first place — it comes back as a real structure in Phase 3.

---

### Lean target for §1.1

> Prove `∅ ≠ {∅}`. It's two or three tactics. The point is not difficulty — it's
> that Lean will not let you wave at the box picture.

See [Section 4](#4-lean) below.

### 3.1 — (one I got wrong first)

See Section 4.3 for one example

## 4. Lean

**Target:** `∅ ≠ {∅}` — the empty box vs. the box containing an empty box, from §2.
Lives in [`lean/math201/Math201/Problems/1_1.lean`](../../lean/math201/Math201/Problems/1_1.lean).

The version I kept is the one that transcribes my English argument line for line:
*if two sets are equal their sizes are equal; ∅ has size 0 and {∅} has size 1;
0 ≠ 1; so the sets are not equal.*

```lean
import Mathlib.Data.Set.Card

theorem empty_ne_singleton_empty (α : Type) : (∅ : Set (Set α)) ≠ {∅} := by
  intro h                                              -- suppose they ARE equal
  have hcard : (∅ : Set (Set α)).ncard = ({∅} : Set (Set α)).ncard :=
    congrArg Set.ncard h                               -- equal sets ⇒ equal size
  rw [Set.ncard_empty, Set.ncard_singleton] at hcard   -- 0 = 1
  exact Nat.zero_ne_one hcard                          -- but 0 ≠ 1
```

Note the import: `Set.ncard` lives in `Mathlib.Data.Set.Card`, **not** `Set.Basic`.

### 4.1 `intro h` on a `≠` goal is not proof by contradiction

`a ≠ b` is *notation* for `¬(a = b)`, which is *notation* for `a = b → False`.
The goal was already an implication, so `intro h` is the ordinary
introduce-the-hypothesis move — the same one used to prove `n even → n² even`.
Nothing was "assumed for contradiction."

The textbook name (Hammack ch. 6) is proof by contradiction. The precise name is
**direct proof of a negation**, and it is strictly weaker:

| Goal shape           | Tactic          | Needs classical logic?            |
| -------------------- | --------------- | --------------------------------- |
| `¬P` / `a ≠ b` | `intro h`     | no — it's definitional           |
| `P` (positive)     | `by_contra h` | yes (double-negation elimination) |

Genuine reductio proves a **positive** `P` by refuting `¬P`, which requires
`¬¬P → P`. Lean can tell the difference — `#print axioms` on the membership
version of this proof (§4.4) reports **no axioms at all**.

**Operational rule: on a `≠` goal, use `intro`. Reaching for `by_contra` is extra
machinery I don't need.**

### 4.2 `congrArg` — the invariant engine

```
congrArg : ∀ {α β} {a₁ a₂ : α} (f : α → β), a₁ = a₂ → f a₁ = f a₂
                                            ───┬───    ────┬────
                                          hypothesis    conclusion
```

Any function applied to equal inputs gives equal outputs. `Set.ncard` is just the
`f` I picked. This is *not* a fact about sets — swap in a different `f` and the
same proof shape works. That generality is why this argument is worth more than
the membership trick in §4.4.

Formal name for `f` used this way: an **invariant**. "Find an invariant that
separates them" is a standard move for proving two objects distinct, and it
returns constantly in Phase 3 (proving two groups non-isomorphic is almost always
this, with `f` = element orders, or abelian-or-not).

### 4.3 The direction trap — I got this backwards first

**What I said (wrong):** "we're proving equality of sets by proving a function of
the sets."

**Why it breaks:** that's the *converse* of `congrArg`, and it is false. Three
statements, only two of them true:

|                        | Statement                            | True?                        |
| ---------------------- | ------------------------------------ | ---------------------------- |
| Forward (`congrArg`) | `s = t` ⟹ `ncard s = ncard t`   | **yes**, for any `f` |
| Converse               | `ncard s = ncard t` ⟹ `s = t`   | **no**                 |
| Contrapositive         | `ncard s ≠ ncard t` ⟹ `s ≠ t` | **yes**                |

Counterexample killing the converse: `{1}` and `{2}` both have `ncard = 1`, and
they are different sets. Verified in Lean.

**Corrected statement:** we prove the sets are **un**equal by showing a function
of them differs. My proof is the contrapositive row, inlined.

The converse would hold exactly when `ncard` is **injective**. It isn't. An
invariant can only ever prove two objects *different*; it can never prove them
*the same* — unless it happens to be injective, in which case it earns the name
**complete invariant**. Most useful invariants, `ncard` included, are not complete.

### 4.4 Two other proofs of the same theorem

**Membership version** — no cardinality, and constructively cleanest:

```lean
theorem empty_ne_singleton_empty' (α : Type) : (∅ : Set (Set α)) ≠ {∅} := by
  intro h
  have hmem : (∅ : Set α) ∈ ({∅} : Set (Set α)) := rfl  -- {∅} has an element
  rw [← h] at hmem                                       -- so ∅ has that element
  exact Set.notMem_empty _ hmem                          -- but ∅ has no members
```

Three definitional facts Lean uses silently here (each checked with a standalone
`rfl`, so these are literal identities, not analogies):

- `Set β` is `β → Prop`, and `∅` is `{_ | False}`. So **`x ∈ ∅` *is* `False`** —
  a proof of `∅ ∈ ∅` closes a `False` goal with no lemma at all.
- `{a}` is `{x | x = a}`. So **`x ∈ {a}` *is* `x = a`**, which is why `rfl` proves
  `∅ ∈ {∅}`.
- `a ≠ b` *is* `a = b → False` (§4.1).

**`encard` version** — honest at infinity:

```lean
  have hcard := congrArg Set.encard h
  rw [Set.encard_empty, Set.encard_singleton] at hcard
  exact zero_ne_one hcard
```

`Set.ncard : Set α → ℕ` has **no honest value for an infinite set**, so Mathlib
gives it a junk one — `Set.Infinite.ncard : s.Infinite → s.ncard = 0`. *Every*
infinite set has `ncard = 0`, same as `∅`. My proof is unaffected (it only uses
the forward direction, which always holds), but `ncard` cannot distinguish ℕ from
the even numbers from ∅. `Set.encard` lands in `ℕ∞` and gives `⊤` for infinite
sets. Rule: `ncard` for finite work, `encard` when infinity is in play. When
cardinality and the diagonal argument arrive later in Hammack, `ncard` stops being
usable at all.

### 4.5 Mechanics I had to learn to write this

**Mathlib is a library, not the language.** `Set`, `∅`, `{a}`, `∈`, `ncard`,
`ncard_empty`, `ncard_singleton` — every one is *defined* in Mathlib, an ordinary
package pinned in [`lakefile.toml`](../../lean/math201/lakefile.toml) at
`rev = "v4.32.1"`. Lean-the-language has no notion of a set. `Set.ncard_empty` is
a two-line theorem someone wrote, at `Mathlib/Data/Set/Card.lean:676`; I re-proved
both lemmas under my own names to check nothing was borrowed that couldn't be
rebuilt. `#print axioms` shows the real bedrock: `propext`, `Classical.choice`,
`Quot.sound`. Three axioms, everything else derived.

(Rust analogy, but *weaker* than `std`: rustc privileges `std` with lang items and
intrinsics. Mathlib gets no special treatment — delete it and Lean still works,
you just have no mathematics.)

**`rw` matches shapes and never looks inside.** `Set.ncard_singleton` is
`∀ (a : α), ({a} : Set α).ncard = 1`. The `∀ a` makes `a` a *hole*, so the search
pattern is `Set.ncard (singleton ?a)`. Unification finds the one subterm of that
shape and pins `?a := ∅`. The `∅` came *out* of the match — `rw` never inspected
it. The same rewrite works on `{37}` and on `{fun n => n + 1}`.

- `ncard_empty` didn't grab the *inner* `∅` because its pattern is `ncard ∅`, and
  the inner `∅` sits under `singleton`, not under `ncard`. The patterns are
  disjoint, so the order in `rw [A, B]` doesn't matter here.
- **Sharp edge:** the first match pins the metavariable, then *every occurrence of
  that instance* is rewritten — but other matches of the general pattern are left
  alone. On `{1}.ncard + {1}.ncard + {2}.ncard`, one `rw` clears both `{1}`s and
  leaves `{2}`. This is the "I rewrote it and one is still there" trap.
- When `rw` fails it prints the exact pattern it hunted for. Read that message as
  "here is the shape I needed, here is what you gave me."

This is `match` on an expression tree — the same machinery as a constant-folding
pass, with `∀`-bound variables as pattern binders. `rw` is one rule applied once;
`simp` is the rule set applied to fixpoint. The only addition over a compiler pass
is that every rule ships with a proof it preserves meaning.

**`@[simp]` is load-bearing.** Both `ncard_empty` and `ncard_singleton` carry it,
which registers them in the global simp set — that's why the whole proof collapses
to `simpa using congrArg Set.ncard h`. Keep the long version; it's the one that
reads back as English.

**Finding lemma names** is the real bottleneck, and it's mostly a naming
convention: names are built mechanically from the statement (`ncard_empty`,
`ncard_singleton`, `ncard_eq_zero`, `notMem_empty`). Construct the name, then
`#check` it. When that fails, `exact?` / `rw?` / `simp?` search for you. Guessing
misses sometimes — `Set.singleton_ne_empty` does not exist in v4.32.1.

## 5. Where I've already met this

<!-- Rust / Haskell / Racket / chess engine / embedded / compiler. Only where
     the analogy is honest — a forced analogy is worse than none. -->

**Zobrist hashing is `congrArg` (§4.2), including the failure mode.** A Zobrist
hash is a function from positions to `u64`. Same position ⟹ same hash,
guaranteed — that's the forward direction, and it's what makes the transposition
table sound. Same hash ⟹ *probably* the same position, and I write collision
handling precisely because that converse is false. The hash is not injective. The
whole §4.3 asymmetry — an invariant proves *different*, never *same* — is the
reason a TT entry stores a verification key instead of trusting the bucket. And
`ncard` is just a hash with one bucket per cardinality.

**`rw` is a constant-folding pass (§4.5).** A rewrite rule is a `match` arm over an
expression tree with `∀`-bound variables as pattern binders; `rw` fires one rule
once, `simp` runs the rule set to fixpoint. The only thing a proof assistant adds
over the compiler pass I've written is that every rule carries a proof it preserves
meaning — which is exactly the property I test for by hand with a fold/no-fold
output diff.

**Sets vs. multisets vs. sequences** — see the `HashSet` / `HashMap<T, usize>` /
`Vec<T>` table in §3.

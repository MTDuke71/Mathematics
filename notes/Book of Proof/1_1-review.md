# §1.1 — Review session (29 July 2026)

Grading + methods reference for the six problems assigned in
[1_1.md](1_1.md). This is scaffolding: the durable note is `1_1.md`.
Written to be read while writing that note up concisely.

Answers withheld deliberately in one place — see [#6](#6--3-6-11-18-27-38-)
and [Still open](#still-open). Don't come here looking for those.

---

## Part I — The methods (reusable, and the actual point of the chapter)

### M1. A set equality is two claims

`S = T` is never one proof. It is:

- `S ⊆ T` — everything the formula produces lands in the target
- `T ⊆ S` — everything in the target is produced by the formula

Write them as two labelled paragraphs. Both must appear even when one is
one line long. The habit is what's being built, not the line.

### M2. Witness form, not test form

To prove `T ⊆ S`, do **not** describe a search:

> ✗ "any odd integer can be created by increasing or decreasing `b`"

**Hand over the answer**, then discharge the debt that it's legal:

> ✓ "let `n` be odd; then `n − 5` is even, so `n − 5 = 2k` for some `k ∈ ℤ`;
> take `a = 1, b = k`"

The clause after "so" is where the real content hides. "Increase `b` until
it works" quietly assumes you can land exactly on `n` — which is the thing
being proved.

*Standing note from the diagnostic. This is the recurring gap.*

### M3. Solving an equation proves a set equality only if every step is reversible

Write the chain with `⟺`, not `=` stacked down the page. Then both
inclusions of M1 are discharged at once, for free.

| Bad step                  | Direction that fails | Effect                   |
| ------------------------- | -------------------- | ------------------------ |
| divide both sides by`x` | `⟸`               | **lose** solutions |
| square both sides         | `⟹`               | **gain** solutions |

`√x = −1 ⟹ x = 1` is the mirror image of losing `x = 0`. One step, one
direction broken, one wrong answer.

### M4. Dividing by `x` is an undeclared case assumption

Not "you can't divide by zero" — that's the slogan. The reason: dividing by
`x` silently enters the branch `x ≠ 0` and discards the other branch. The
legitimate move keeps both:

- Case `x = 0`: check directly.
- Case `x ≠ 0`: now `x⁻¹` exists; divide.

The sin isn't the division, it's the undeclared branch.

### M5. Set-builder notation has three roles, and they don't interchange

`{ expression : rule }` — expression **left**, rule **right**.

| Part       | Role                                          | Legal form                                                    |
| ---------- | --------------------------------------------- | ------------------------------------------------------------- |
| binder     | introduces the variable, says where it ranges | `n ∈ ℕ` — a **bare variable**, never `n+1 ∈ ℕ` |
| condition  | constrains an already-bound variable          | `n > 3`                                                     |
| expression | builds the output element                     | `n² + 2`                                                   |

Consequences:

- One index variable, used repeatedly — not two independently bound ones
  (two binders range over all *pairs*).
- To shift an index, shift it in the **expression**, not the binder.
- The expression can't be self-referential. A recursive definition has to be
  established *first*, outside the braces, then the set formed from it:
  `let f: ℕ → ℤ be …; then { f(n) : n ∈ ℕ }`.
- In `{x ∈ A : P(x)}` the `A` is load-bearing, not decoration. Same
  predicate, different universe, different answer — see [#4](#4--x--z--6x--5).

### M6. Cardinality counts top-level elements only. It does not recurse.

`|A|` = number of items separated by the outermost commas. Nesting depth is
irrelevant. `{2, {3,4}}` is **one** element even though it has two of its own.

Rust says the same and you already trust it there:

```rust
vec![vec![1], vec![2, 3]].len()   // 2, not 3
```

`len()` is the outer count. Nobody expects it to flatten.

### M7. Method of successive differences

For any "guess the pattern" sequence, difference it.

| First differences              | Closed form is |
| ------------------------------ | -------------- |
| constant                       | linear         |
| constant*second* differences | quadratic      |
| constant*k*-th differences   | degree`k`    |

Two routes from a recurrence to a closed form:

- **Telescope** — unroll `f(n)` as `f(base)` plus the accumulated sum of all
  increments, then find a closed form for that sum.
- **Fit** — if the closed form is a degree-`k` polynomial, fit
  `an² + bn + c` (etc.) using `k+1` data points and solve the linear system.
  This is finite differences; same machinery as a discrete-time filter.

Do both. They must agree; disagreement means one has an index error.

Then **check the endpoint**: evaluate at the smallest element of your chosen
index set and confirm you get the sequence's first term — not a term sitting
*before* it. Widening the index set silently prepends an element and the
notation gives no warning.

---

## Part II — Problem by problem

### #1 — `{5a + 2b : a, b ∈ ℤ}`

**Answer: `ℤ`.** Correct. Reasoning was correct in substance; form failed
M1 (`S ⊆ ℤ` never stated) and M2 ("increase or decrease `b`").

Clean version — let `S = {5a + 2b : a, b ∈ ℤ}`:

> **`S ⊆ ℤ`:** for any `a, b ∈ ℤ`, `5a + 2b ∈ ℤ`, since ℤ is closed under
> multiplication and addition.
>
> **`ℤ ⊆ S`:** let `n ∈ ℤ`.
>
> - `n` even: `n = 2k` for some `k ∈ ℤ`. Take `a = 0, b = k`; then
>   `5a + 2b = 2k = n`.
> - `n` odd: then `n − 5` is even, so `n − 5 = 2k` for some `k ∈ ℤ`. Take
>   `a = 1, b = k`; then `5(1) + 2k = 5 + (n − 5) = n`.
>
> Both inclusions hold, so `S = ℤ`. ∎

### #2 — `{6a + 2b : a, b ∈ ℤ}`

**Answer: the even integers, `2ℤ`.** Correct. Had `S ⊆ 2ℤ` (the right
insight, narrated rather than computed) and covered `2ℤ ⊆ S` with three
examples — examples never close a `⊇`.

Clean version — `S = {6a + 2b : a, b ∈ ℤ}`, `E = {2k : k ∈ ℤ}`:

> **`S ⊆ E`:** `6a + 2b = 2(3a + b)`, and `3a + b ∈ ℤ`, so every element of
> `S` is even.
>
> **`E ⊆ S`:** let `n = 2k` with `k ∈ ℤ`. Take `a = 0, b = k`.
>
> So `S = E`. ∎

Four lines, and it replaces the whole "the `a` factor only offsets by a
multiple of 6" paragraph. **Factor out; don't narrate.** The identity
`6a + 2b = 2(3a+b)` is the same insight with nothing left to argue about.

#### Why these two differ — the actual content

```
{ ma + nb : a, b ∈ ℤ }  =  gcd(m, n) · ℤ
```

`gcd(5,2) = 1` → `1·ℤ = ℤ`. `gcd(6,2) = 2` → `2ℤ`.

This is **Bézout's identity**: the set of integer combinations of `m` and `n`
is exactly the multiples of `gcd(m,n)`, and in particular `gcd(m,n)` itself
is always expressible as `ma + nb`. It is the theorem that makes the AoC 2019
Day 12 `lcm` argument legitimate instead of lucky. First real result of
Phase 2.

One level down — *why* does gcd control it? `S` is closed under subtraction,
which makes it a **subgroup of ℤ**; every subgroup of ℤ is `dℤ` for a single
`d`, obtained by taking the smallest positive element and running the
division algorithm against any other element to force the remainder to zero.
So `{5a+2b}` could not have come out as anything but `dℤ` — the only question
was which `d`. *(Phase 3 vocabulary. Not assigned.)*

### #3 — `{x ∈ ℝ : x³ + 5x² = −6x}`

**Answer: `{0, −2, −3}`.** Correct, and the lost element correctly
identified in advance as `0`, lost by dividing through by `x` — see M4.

Write-up owes the reversible chain (M3) and the declared case (M4):

```
x³ + 5x² = −6x
⟺ x³ + 5x² + 6x = 0        (add 6x — reversible)
⟺ x(x² + 5x + 6) = 0       (factor — an identity, reversible)
⟺ x(x + 2)(x + 3) = 0      (factor — reversible)
⟺ x = 0 or x = −2 or x = −3
```

#### The engine, named

That last `⟺` — a product is zero, therefore some factor is zero — is the
**zero-product property**. Canonically: ℝ has **no zero divisors**, i.e. ℝ is
an **integral domain**. It is the entire reason factoring solves equations,
and it is a *hypothesis*, not a law of arithmetic.

Drop it and watch it break. In ℤ/6ℤ take `f(x) = x² − x = x(x−1)`:

| `x` | `x² − x` | mod 6          |
| ----- | ------------ | -------------- |
| 0     | 0            | **0** ✓ |
| 1     | 0            | **0** ✓ |
| 2     | 2            | 2              |
| 3     | 6            | **0** ✓ |
| 4     | 12           | **0** ✓ |
| 5     | 20           | 2              |

Four roots for a quadratic. Factoring said `x = 0` or `x = 1` and was
**wrong**, because `2 · 3 ≡ 0 (mod 6)` with neither factor zero. `2` and `3`
are **zero divisors**; their existence kills both "degree `n` has at most `n`
roots" and factoring-as-a-solution-method.

Which is why real crypto uses a prime modulus, or a prime power with the
field structure built properly — `GF(2⁸)` for AES, not `ℤ/256ℤ`. Already
shipped the consequence of this on hardware. Phase 3 proves it.

### #4 — `{x ∈ ℤ : |6x| < 5}`

**Answer: `{0}`.** Correct.

`|6x| < 5 ⟺ 6|x| < 5 ⟺ |x| < 5/6`, and the only integer with `|x| < 1` is `0`.

**How it differs from `∅`:** `|{0}| = 1` — there *is* an element; it happens
to be the number zero. `|∅| = 0` — there is no element. Also `0 ≠ {0}`: the
number and the box containing it are different objects. Same distinction as
`{}` vs `{∅}` in §2 of the note. Rust enforces it at the type level:
`vec![0].len() == 1` and `is_empty() == false`; `Some(0)` is not `None`.

**The `A` matters** (M5):

- over `ℤ`: `{0}`, one element.
- over `ℝ`: the open interval `(−5/6, 5/6)`, uncountably infinite.

Same predicate, cardinality `1` vs `𝔠`.

### #5 — `|{{1}, {2, {3, 4}}, ∅}|` and the two unassigned

**Answers: `3`, `1`, `2`.** All correct, all for the right reason (M6).

- `|{{1}, {2,{3,4}}, ∅}| = 3` — three elements: `{1}`, `{2,{3,4}}`, `∅`.
- `|{{{1}, {2,{3,4}}, ∅}}| = 1` — one element, namely the set above.
- `|{∅, {∅}}| = 2` — two elements: `∅` and `{∅}`.

**The third one is load-bearing.** `|{∅, {∅}}| = 2` holds *because*
`∅ ≠ {∅}`. If they were the same object the set would be `{∅}` and the answer
`1`. So that `2` asserts the theorem that's the Lean target — used before
proved, which is fine, but it's a claim and not bookkeeping.

One line from **extensionality** (two sets are equal iff they have the same
elements): `∅ ∈ {∅}` but `∅ ∉ ∅`, so they differ on an element, so they
differ. That's also the shape the Lean proof takes — exhibit the
distinguishing element.

**Aside (NNG connection).** There's a competing construction of ℕ where the
numerals *are* these nested boxes: `0 := ∅`, `1 := {∅}`, `2 := {∅, {∅}}`,
`n+1 := n ∪ {n}`. Those are the **von Neumann ordinals**, and `{∅, {∅}}`
isn't merely a set of size 2 — it *is* the numeral `2` under that encoding.
Set theory's answer to the question NNG answered with `succ`. Two
foundations, same ℕ.

### #6 — `{3, 6, 11, 18, 27, 38, ...}`

**Not closed. Closed form still owed — deliberately not recorded here.**

Progress made, and it's real: increments are `3, 5, 7, 9, 11` — consecutive
odd numbers — so

```
f(1) = 3,    f(n) = f(n−1) + (2n + 1)
```

Verified: `3 → 3+3=6 → 6+5=11 → 11+7=18 → 18+9=27 → 27+11=38`. ✓
That's M7 found independently.

**The base case is not a patch.** A recurrence relation alone does not
determine a sequence — `f(n) = f(n−1) + (2n+1)` is satisfied by infinitely
many sequences, one per choice of starting value. The initial condition is
what selects one. Exactly why induction needs a base case, and why
`Nat.rec` in Lean takes *both* the zero case and the successor case: a
recursor without a base case has nothing to return. Same structure, three
costumes.

**Notation attempt, diagnosed** — `{x ∈ ℕ, y+1 ∈ ℕ : (2x+1) + f(y−1)}`:

1. Sides swapped — `{expression : rule}`, per line 22 of the note itself.
2. `y+1 ∈ ℕ` is a condition shaped as a binder. Binders take bare
   variables. (M5)
3. Two independently bound variables for one index — ranges over pairs. (M5)
4. `f` dangling: referenced inside the braces, defined outside. No place for
   a base case inside `{ : }`. (M5)
5. Off-by-one: line 16 of the note defines ℕ as the *positive* whole numbers,
   so `f(0)` is out of domain and `f(y−1)` at `y = 1` runs off the end.

**The recursive answer, written legally** — a correct and complete answer,
though weaker than the closed form (it says how to *walk* to the 500th term,
not what it is):

```
Let f : ℕ → ℤ be defined by  f(1) = 3,  f(n) = f(n−1) + (2n + 1) for n ≥ 2.
Then the set is  { f(n) : n ∈ ℕ }.
```

**To finish:** telescope or fit (M7), then check the endpoint. Declare ℕ or
`ℕ₀`/`ℤ≥0` explicitly and make the base case agree with it — the exercise
made you declare the index set precisely because the same formula over a
wider one prepends an element silently.

---

## Glossary of names introduced today

Canonical vocabulary is what makes a technique transferable. Each of these
is the searchable name for something already used above.

| Name                             | What it is                                          | Where         |
| -------------------------------- | --------------------------------------------------- | ------------- |
| Bézout's identity               | `{ma+nb} = gcd(m,n)·ℤ`                          | #1, #2        |
| subgroup of ℤ                   | closed under subtraction ⟹ equals`dℤ`           | #2, why-level |
| zero-product property            | `ab = 0 ⟹ a = 0 or b = 0`                        | #3            |
| integral domain                  | ring with no zero divisors                          | #3            |
| zero divisor                     | nonzero`a` with `ab = 0` for some nonzero `b` | #3, ℤ/6ℤ    |
| extensionality                   | sets equal iff same elements                        | #5, Lean      |
| von Neumann ordinals             | `0 := ∅`, `n+1 := n ∪ {n}`                    | #5 aside      |
| method of successive differences | difference the sequence to find degree              | #6            |
| telescoping                      | unroll a recurrence into a sum                      | #6            |
| finite differences               | fit a polynomial from`k+1` samples                | #6            |

## Still open

- [ ] **#6** — closed form. Method in M7; answer not written down anywhere
  in this repo on purpose.
- [ ] **Written question** — `{1,1,2}` vs `{1,2}` are the same set. Name a
  mathematical object for which they would *not* be, name the Rust type
  corresponding to each, and give an operation that's cheap on one and
  expensive on the other. One paragraph, no more.
- [ ] **Lean target** — prove `∅ ≠ {∅}`. Two or three tactics. Shape is in
  #5: extensionality, then exhibit the distinguishing element. The point
  isn't difficulty, it's that Lean won't accept the box picture.
- [ ] **Rewrite #1–#3** with two inclusions (M1), explicit witnesses (M2),
  and reversible chains (M3), then fold into
  [1_1.md](1_1.md) §3.

## See also

- [1_1.md](1_1.md) — the deliverable note for this chapter
- [../00-notation.md](../00-notation.md) — notation sheet
- [../../exercises/00-diagnostic-assessment.md](../../exercises/00-diagnostic-assessment.md) — where the witness-form note originates

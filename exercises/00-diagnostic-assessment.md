# Diagnostic — assessment

> For a future session with no context. Written 2026-07-27; completed
> 2026-07-27 (Q1–Q3 in one sitting, Q4–Q12 later the same day).
> **Status: complete — 12 of 12.**
>
> If reading only three sections, read **"Failure modes to watch"**,
> **"The pattern across all twelve"**, and **Q10**. Q10 is the one that
> produced the argument for the whole curriculum.
>
> Q3 also spun off a long follow-up on Euclid's algorithm that was worth more
> than the question itself.

---

## Headline

**Matt's self-assessment was wrong, in the direction of underestimating.**

He said, before starting: *"the terminology was unfamiliar so I think the
answer to most of them is going to be I don't know."* He then answered three
questions substantially correctly, including writing an actual proof unprompted.

**The gap is vocabulary and notation. It is not reasoning.** This confirms the
hypothesis that motivated rewriting the diagnostic into plain English — the
original notation-heavy version was measuring the wrong variable.

**No 101 is needed. Phase 1 (Hammack) is the correct entry point**, on
schedule, with the emphasis noted in "What to train first" below.

---

## Raw answers and grading

### Q1 — injective / surjective

> *"y = x is like that and y = x^2 is not. part b sounds like a complete set"*
>
> When pushed for the mechanism: *"-1 and 1 both produce the output 1. A parabola"*
> When pushed on "complete set of what": *"Set of Real numbers"*

**Correct on both.** Identified injectivity by example with the right
counterexample family, and when pushed produced the actual colliding pair
rather than a hand-wave about shape. "Complete set" is a decent unprompted
reach for surjectivity.

Did **not** spontaneously notice that `x² : ℝ → ℝ` fails surjectivity — he
named ℝ as the target without testing his own example against it. Needed to be
walked to codomain-vs-image. Once there, took it without difficulty.

Vocabulary absent, concepts present. This is the pattern for all three.

*Taught in passing:* codomain vs. image; surjectivity as a property of
rule + declared target, not the rule alone; injectivity repaired by shrinking
the domain, surjectivity by shrinking the codomain; `x² : ℝ≥0 → ℝ≥0` as a
bijection and why that is the real reason `√` is single-valued.
**Q7 is therefore already answered — skip it.**

### Q2 — sum of two evens (the important one)

> *"an even number by definition is a number divisable by 2. so if a and b are
> even a mod 2 and b mod 2 are both 0. so the sum of the mods is also 0 which
> makes the sum even. if b was odd b mod 2 is 1. and the sum would be 1 mod 2
> which is 1, making it odd. The sum of two odd numbers would be even, and
> taking the mod the sum of the mod would be 2. and then taking the mod of the
> sum would be 0, making it even. I know this is rambling"*

**He wrote a proof, not examples.** This is the single most important
observation in the whole diagnostic. Arbitrary `a` and `b`, symbolic
reasoning, zero numerical instances. This is the CLAUDE.md script's central
probe ("does he write proofs at all, or does he write examples?") and it came
back clean.

Correct throughout. Notably handled the odd+odd wraparound properly —
recognized the mod-sum of 2 needed re-reduction rather than calling it odd.
That's mechanism, not pattern-matching.

**The gap:** he used the *test* definition (`a mod 2 == 0`) rather than the
*witness* definition (`a = 2m for some integer m`), which forced him to lean on
an unstated and much heavier theorem — that reduction commutes with addition,
i.e. `mod n` is a ring homomorphism ℤ → ℤ/nℤ. True, but it needs the division
algorithm, and it is Phase 2 material. Power tool, piece of string.

Also over-delivered: proved even+even, even+odd, and odd+odd when asked for
one. Scope creep, not confusion — and a good instinct (exhausting the case
table) worth leaving alone.

*Taught in passing:* the witness form; unpack → algebra → repack as the core
Chapter-1 reflex; `is_some()` vs `if let Some(x)` as the honest Rust reading.

### Q3 — gcd(84, 132)

> *"you would need to break each number into its prime factors then the largest
> whole number would be the intersection of the prime factors for each"*
>
> Follow-up: *"I did not solve it but I was considering that you needed to keep
> track of the exponents as part of the intersection."*

**Method correct**, and it implicitly invokes the Fundamental Theorem of
Arithmetic (uniqueness is what makes it well-defined).

Said "intersection" where multiset intersection / min-of-exponents is needed;
set intersection gives 6 instead of 12. **He identified this himself** on
follow-up, unprompted, before being shown the failure — the instinct was
already running, it just hadn't been stated.

**Did not compute the answer (12).** Gave the method and stopped. Worth
watching: this happened on Q3 and arguably on Q1 — states the approach,
doesn't execute it. Could be economy of effort, could be a real reluctance to
commit to a number. Not enough data yet. *Watch for it on Q5 and Q9.*

**Did not mention Euclid's algorithm.** Probably not known, at least not by
name. Fine — Phase 2.

*Taught in passing:* multiset intersection; gcd/lcm as min/max on exponents
and hence `gcd·lcm = a·b`, connected back to Day 12's `lcm`.

### Q3 follow-up — "how does factoring hold up on two 200-digit numbers?"

This ran long and produced the most informative exchange of the session.

**Move 1 — the rearrangement.**

> *"gcd(a,b) · lcm(a,b) = a · b so if you wanted gcd it would be product / lcm.
> But that is not what you are asking"*

Algebraic manipulation instant and correct. **More importantly, he flagged his
own answer as a non-answer before being told.** He didn't articulate why, but
he knew it didn't bite.

That is the "good nose for hand-waving" from CLAUDE.md, pointed inward, and it
is the most valuable single trait on display so far. Someone who can detect
that their own argument is hollow can be taught; someone who can't, can't.

*Named for him:* the formula is one equation in two unknowns — it converts
either quantity into the other and manufactures neither, since the only cheap
route to `lcm` is via `gcd`. Introduced the **theorem vs. algorithm**
distinction: `gcd·lcm = a·b` has full content as an assertion and none as a
procedure. Also showed that the identity fails for three numbers
(`a=b=c=2`) — a warning against extending a 2-variable identity to *n* by
pattern.

**Move 2 — is gcd of 200-digit numbers infeasible?**

> *"I think the answer is it is not infeasible. Because if you have the public
> and private keys you can easily decrypt."*

**Correct conclusion, invalid argument.** See the failure-mode section below —
this is the most important observation in the file.

The RSA instinct was well-aimed but mislocated: Euclid is not adjacent to RSA,
it's *inside* it (`gcd(e, φ(n)) = 1` at key selection; `d` produced by the
extended Euclidean algorithm). Domain knowledge is a live asset here and
should keep being used — it points at the right building even when it gets the
room wrong.

*Taught in passing (Phase 2 content, pulled forward by his own question, and
worth it):* Euclid's algorithm; the lemma `gcd(a,b) = gcd(b, a mod b)` with
its full proof via equality of the two sets of common divisors; the observation
that **that proof runs entirely on the witness form** (`d | x` means `x = dk`)
— i.e. the Q2 lesson doing real work three questions later. Empirical demo:
179 divisions, 22 µs, recovering a 100-digit common factor from two 200-digit
numbers without learning a single prime factor, against ~10¹⁰⁰ operations for
trial division.

**Do not re-teach Euclid in Phase 2. Build on it.**

---

### Q4 — n² even ⟹ n even — **WRONG**

> *"This is extension of Problem 2. If you are squaring a number then you are
> multiply n x n, or another way of saying it you are adding n copies of n. if
> n is even and we know that adding 2 even numbers is even the adding 2n copies
> of a number is also even."*

**He proved the converse.** Asked for `n² even ⟹ n even`; delivered a correct
proof of `n even ⟹ n² even`. The argument never begins from "n² is even" —
every line runs the other direction.

This is the single most important wrong answer in the diagnostic. See
"Failure modes to watch → proving the converse."

Both directions happen to be true here, which is exactly what makes the error
invisible from the inside: the answer *feels* delivered.

*Shown to him — the counterexample that proves direction-swapping is not a
legal move:* `4 | n ⟹ 4 | n²` is true; its converse `4 | n² ⟹ 4 | n` is
false at `n = 2`. Same shape, collapses.

*Taught in passing:* the contrapositive proof (`n odd ⟹ n² odd` via
`n = 2k+1`, `n² = 2(2k²+2k)+1`); **why** contrapositive is required here —
the direct form hands you `n² = 2m` and there is nothing to do with `m`
without unique factorization, whereas the flipped form hands you a witness you
can multiply out. Named as the load-bearing lemma in √2's irrationality.

Minor: wrote "2n copies" for "n copies"; and "sum of two evens is even" ⟹
"sum of n evens is even" needs induction, which was not noted.

### Q5 — 1+2+…+n = n(n+1)/2 — **right method, incomplete**

> *"you split the range in half and reverse the second half and then add then
> you have a list of size n/2 and the sum of each number is (n+1)"*

Gauss pairing, correct, and a better proof than the induction the question was
fishing for.

**Gap: `n/2` pairs assumes n is even.** Odd n leaves a middle term unpaired.
The formula survives; his argument as written does not cover the case. The
question explicitly asked for all-cases, so this counts as a hole — half of
all n.

*Taught in passing:* the parity-free version — write S forwards and backwards,
add columnwise, `2S = n(n+1)`. Double instead of halve and the case split
disappears. Also flagged that the induction proof is the one Hammack drills,
and that it is the same `induction` tactic he already used for `add_comm`.

**Watch-item resolved:** he executed this time (produced `n/2` and `n+1`)
rather than stopping at the method. Stopped one step short of assembling the
formula — economy, not avoidance.

### Q6 — quantifier order (∀ε ∃δ) — **wrong, expected**

> *"the input is chosen first because that becomes the divisor of the limit and
> you cant divide by zero"*

Backwards. ε is chosen first by an adversary; δ is produced in response and is
permitted to depend on ε. That dependence is the entire content of the
definition.

Calibration only — CLAUDE.md predicted this was gone and it is.

*Taught in passing:* the adversary game framing; `∀ε ∃δ` is a **function**
`fn(f64) -> f64`, `∃δ ∀ε` is a **constant** — Curry–Howard, different types,
and the reversed order is satisfied by essentially nothing.

**The "divisor" remark is not noise — see Q8.**

### Q7 — x² injective — **right** (was already answered in the Q1 exchange)

> *"1^2 and -1^2 both square to 1. If you allow only 0 and positive number then
> the ans is no."*

Correct.

Did not answer "what changed." Told him: **the rule didn't change, the domain
did.** Injectivity is a property of the function together with its domain,
never of the formula — which is why it is repairable by shrinking the domain.

Notation nit worth making to a compiler author: `-1^2` parses as `−(1²) = −1`;
he means `(−1)²`. Exponentiation binds tighter than unary minus.

### Q8 — derivative of x² — **right instinct, garbled expression**

> *"(x + Delta x)/(delta x)"*

Missing the square and the subtraction; as written it is not the difference
quotient. But he reached for the difference quotient rather than answering
"power rule," and that is the actual result of this question.

*Taught in passing:* the full computation
`((x+Δx)² − x²)/Δx = 2x + Δx → 2x`; and **where the 2 comes from** — expanding
`(x+h)²` yields *two* cross terms because there are two slots. Geometric
version: a square of side x grown by h gains two x·h rectangles plus one h²
corner, and the corner is second-order and dies. For `xⁿ` it is n faces —
that is the power rule's actual content.

**Q6 and Q8 are one confusion, not two.** "Can't divide by zero" is a real
memory of `Δx → 0` sitting in a denominator. He met limits exactly once, 35
years ago, inside a difference quotient, and the word still points there.
Nothing to repair — worth naming when Abbott/Spivak eventually come up.

### Q9 — power set of {a,b,c} — **right, and more than he claimed**

> *"it would be 8 2^3 power, 0, c, b, bc, a, ac, ab, abc"*

Correct. **And the enumeration order is binary counting** — `∅, c, b, bc, a,
ac, ab, abc` = `000, 001, 010, 011, 100, 101, 110, 111` with a=4, b=2, c=1.

He used the subsets ↔ n-bit-strings bijection by hand without stating it, and
that bijection *is* the proof of 2ⁿ. Did not state the general case; closed it
for him (n independent in/out choices, product rule).

*Taught in passing:* **a bitboard is an element of the power set of the 64
squares.** `u64` ↔ subset; `|` union, `&` intersection, `~` complement, `^`
symmetric difference. Flagged that in Phase 3 this becomes a 64-dimensional
vector space over GF(2), and magic-bitboard multiplication becomes a linear
map over that field.

### Q10 — Day 12 restated cold — **blank ("not sure")**

The highest-value question in the set, and the blank is more informative than
most of the answers.

*Given to him in full:* finite state space ⟹ the orbit repeats, so
`Sⁱ(x₀) = Sʲ(x₀)` for some minimal `i < j`. If `i > 0`, then `S^{i−1}(x₀)` and
`S^{j−1}(x₀)` map to the same state; **injectivity** forces them equal,
contradicting minimality of `i`. So `i = 0` — the first repeat is the start.
No tail, no ρ.

*Counterexample shown:* `x ↦ x² mod 10` from 3 gives 3, 9, 1, 1, 1… — repeats,
never returns. Injectivity is doing all the work.

Also noted: injective on a finite set ⟹ bijective ⟹ invertible, and Day 12's
inverse is visible directly — the time-reversal `J(p,v) = (p,−v)` satisfies
`J∘S∘J = S⁻¹`, so injectivity comes for free.

**The finding: Q1 and Q10 are the same question.** He answered Q1 cleanly
(`y = x` yes, `y = x²` no, −1 and 1 collide) and wrote "not sure" for the
identical property wearing a simulation costume.

**The concept is present. The transfer is missing.** Transfer is precisely
what a name buys — once "injective" is a word he owns, he scans for it and
Day 12 becomes an instance rather than a puzzle. This is the cleanest
argument for Phase 1 the diagnostic produced, and he generated it himself.
Use it when motivation flags.

### Q11 — congruence vs. equality — **right**

> *"It is not saying that 17 and 5 are the same, but 17 mod 12 and 5 mod 12 are
> the same. Can extend this to any number 5+12n where n is a integer."*

Correct, including the residue class. He built a quotient unprompted.

*Named for him:* congruence mod 12, `17 ≡ 5 (mod 12)`; the set `5 + 12n` as
the **residue class**; the claim as genuine equality — of classes, in ℤ/12ℤ,
not of integers. Connected forward to Hammack's equivalence-relations chapter
and to quotient groups in Phase 3.

**Test form again.** "17 mod 12 and 5 mod 12 are the same" is compute-and-
compare. The witness form is `12 | (17 − 5)`, which needs no remainders and is
what actually proves transitivity. **Fourth occurrence of this split.**

### Q12 — testing vs. proving — **right**

> *"It just takes one wrong anwer to negate the 10,000 correct answers.
> observation does not sunsitute for a formal proof by facts."*

Correct, and correctly asymmetric. Grounded it in quantifier structure: the
negation of ∀ is ∃, so refutation needs one object and confirmation needs all.

*Given as ammunition:* `n² + n + 41` prime for n = 0…39, fails at 40; circle
chord regions 1, 2, 4, 8, 16, **31**; Pólya's conjecture failing near 906
million. The circle one is the keeper — five terms of clean doubling.

---

## The pattern across all twelve

Scorecard: **Q2, Q3, Q7, Q9, Q11, Q12 right. Q5 right-but-incomplete
(missed the odd-n case). Q8 right instinct, wrong expression. Q4 wrong
(converse). Q6 wrong (expected). Q10 blank. Q1 right with prompting.**

**He reasons computationally by default, not structurally.** Every answer
reached for a procedure or a test: `mod`, "break it into prime factors,"
"intersect them," "17 mod 12 and 5 mod 12 are the same." None reached for an
existential object — *there exists an m such that*.

That is the engineer's signature and it is not a deficiency; it is a different
and highly functional idiom. But it is precisely the translation Phase 1
exists to perform. Proof is constructive: you need a witness you can do
algebra with, not a predicate that returns a boolean.

**Corollary for teaching: the highest-value early drill is the
unpack-witness-repack reflex.** Definition → existential form → manipulate →
repackage. It is Hammack Chapters 1–4 and it is the thing that will feel most
foreign, because it is the exact inverse of the instinct that has served him
for twenty years.

The second finding, from Q10 against Q1: **the concepts are present and the
transfer is not.** He owns injectivity in the abstract and did not recognize
it in the concrete problem that started this whole track. That is a vocabulary
deficit, not a reasoning one, and it is the single best answer to "why not just
read more books" — a name is what makes a technique portable.

---

## Failure modes to watch

Two, both of the same species: **the conclusion is evaluated instead of the
argument.** Both times the conclusion was in fact true, which is what makes
them self-reinforcing. Be strict about these and only these.

### 1. Proving the converse (Q4)

Asked for `n² even ⟹ n even`, he proved `n even ⟹ n² even` — cleanly, and
apparently without noticing the direction had flipped. The whole answer runs
backwards and reads as complete.

This is the more dangerous of the two because it is invisible from the inside:
when both directions are true, the converse-proof *feels* like a proof. The
tell is structural, not semantic — check that the first line assumes the
hypothesis as stated.

*Already shown to him:* `4 | n ⟹ 4 | n²` is true, its converse is false at
`n = 2`. Same shape, collapses. Reuse this exact counterexample; it is the
cheapest demonstration that direction-swapping is not a legal move.

Hammack Ch. 4–5 (direct / contrapositive) is the direct remedy, and NNG's
**Implication World** (`intro` / `apply` / `exact`) is the even more direct
one — a backwards proof simply will not close the goal.

### 2. Conclusion-by-association (Q3 follow-up)

On the 200-digit gcd question he produced the right answer via an argument
that did not support it — "you can decrypt with the private key" is a claim
about decryption, presupposes possession of `d`, and involves nobody solving a
hard problem (the key generator *chose* `p` and `q` and multiplied forward).

The move was: *this smells like the RSA neighbourhood, RSA has an easy
direction, therefore easy.* Reasoning from adjacency and vibe rather than from
derivation. The domain instinct is good enough that it lands on true
conclusions often, which is exactly what makes it dangerous — it will be
reinforced by being right.

**This is the thing to be strict about.** Not the wrong answers — the right
answers with broken derivations. In Phase 1 those get marked wrong, and the
first several times it will feel like pedantry rather than substance.

*Already said to him once:* validity is a property of the argument, not of the
conclusion. Expect to say it several more times. Say it the same way each
time, without softening.

Note this is also the strongest argument for the Lean track running in
parallel: the type-checker cannot be persuaded by adjacency. It is the one
grader immune to a plausible-sounding step.

---

## Calibration note (affects how to respond, not what to teach)

He under-rates his own work — twice in one session (*"I know this is
rambling"*, and predicting he'd answer "I don't know" to most of the
diagnostic). Both were wrong.

Interestingly, the self-doubt is *not* uniform: on Q3's follow-up he correctly
identified his own answer as a non-answer. So the internal critic is accurate
about **arguments** and miscalibrated about **himself**. Trust the first,
correct the second — and correct it with facts, not reassurance.

CLAUDE.md forbids cheerleading, and that remains correct. The resolution isn't
encouragement, it's **precision**: grade exactly, say what was right and what
was assumed, and let accurate leveling do the calibrating. "You wrote a proof,
not examples" is a factual observation and it lands harder than praise would.

Do not soften. Do not reassure. Just be exact.

---

## Also on the record

**NNG, 2026-07-26 evening, one sitting:** Tutorial World and Addition World
both complete — `add_comm` proved from the Peano axioms. `rfl`, `rw`,
`induction` acquired. Multiplication and Implication both opened, one level
each. That pace on a first exposure is itself a data point.

---

## Verdict and entry point

**Hammack, Phase 1, unchanged.** Nine further questions confirmed the Q1–Q3
read rather than revising it: reasoning intact, vocabulary and proof-discipline
are the gaps. No 101 needed, no calculus refresher, no warm-up.

Emphasis, in order:

1. **Witness form over test form** — the reflex that four separate answers
   reached past. Hammack Ch. 1–4.
2. **Direction of implication** — Hammack Ch. 4–5 plus NNG Implication World.
   Mark converse-proofs wrong every time, in the same words.
3. **Naming things** — the Q1/Q10 transfer gap. Say the canonical word out
   loud on every result; that is what makes it portable.

Watch-items resolved by this half:

- *"States the method, doesn't execute"* (open after Q1/Q3) — **closed.**
  Q5 and Q9 both got computed. Dropping it.
- *Quantifiers / ε-δ* — gone, as predicted, and the residue points at the
  difference quotient (Q6 + Q8 are one memory). Nothing to do until analysis.

Do not re-teach in Phase 2: Euclid's algorithm, `gcd·lcm = a·b`,
multiset intersection. Build on them.

## See also

- [00-diagnostic.md](00-diagnostic.md) — the questions
- [../notes/00-notation.md](../notes/00-notation.md) — the vocabulary sheet built for this

# Diagnostic — plain English version

> Revised 2026-07-27. The first version wrapped every question in notation,
> so a blank answer couldn't distinguish "can't reason about this" from
> "don't know what that symbol means." Those need different responses. This
> version strips the notation out to isolate the reasoning.
>
> Reference if a word is unclear: [notes/00-notation.md](../notes/00-notation.md).
> Looking things up there is fine — this is not a closed-book test.

Not a test. Calibration. ~20 minutes. "I don't know" is a real answer and a
useful one.

The one instruction that matters: where a question asks you to **show** or
**convince**, try to write an argument that covers *every* case, not a few
examples that work. What's being measured is which moves are available to
you — not whether you land the right answer.

---

**1.** Think of a function as a deterministic machine: same input, same
output, always.

- What would it mean to say *no two different inputs ever produce the same
  output*? Can you name a function like that, and one that isn't?
- What would it mean to say *every possible output actually gets produced by
  some input*?

>

**2.** Convince me that adding two even numbers always gives an even number.
Not by trying examples — by an argument that covers all of them at once.

>

**3.** What is the largest whole number that divides both 84 and 132? How did
you get it? Is there a procedure that would work for any two numbers?

>

**4.** Suppose you know that some whole number squared is even. Does that
force the original number to be even? Argue for it or find a case where it
fails.


>

**5.** Adding up `1 + 2 + 3 + … + n` gives `n(n+1)/2`. Why is that true for
*every* n? (Not "check it for n=5" — why does it never fail?)

>

**6.** Here is an informal description of a limit: *"you can force the output
to be as close to L as anyone demands, provided you make the input close
enough to a."* Two quantities are hiding in that sentence — the demanded
closeness, and the required closeness of the input. Which one gets chosen
first, and why does the order matter?

>

**7.** Squaring a number: can two *different* numbers square to the same
result? What if you only allow numbers that are zero or positive? What changed?

>

**8.** The derivative of `x²` is `2x`. **Why is it 2x?** ("The power rule" is a
legitimate answer here and tells me something specific — but if you can say
where `2x` comes from, say that.)

>

**9.** Take the set `{a, b, c}`. How many different subsets does it have —
counting the empty one and the whole thing? What about a set of n things, and
why? (If a bitmask occurs to you, follow that thought.)

>

**10.** In AoC 2019 Day 12 you argued the simulation must come back to its
*exact starting state*, rather than landing on some state it had already
passed through mid-run. Write that argument as carefully as you can. What
property of the step function was doing the work?

>

**11.** "17 and 5 leave the same remainder when divided by 12." Is that the
same *kind* of claim as "17 equals 5"? What is it asserting about, exactly?

>

**12.** You've tested a property on ten thousand cases and it held every time.
What is still missing? Is there a point at which enough testing becomes a
proof — and if not, why not?

>

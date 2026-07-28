# Mathematics 201

Self-study track. Depth-first, proof-first, exercise-driven.
Full working agreement and curriculum: [CLAUDE.md](CLAUDE.md).

## The plan, one screen

| Phase | What | Book | Rough span |
|---|---|---|---|
| 0 | Get the feedback loop running | Natural Number Game → *Mathematics in Lean* | 1–2 weeks |
| 1 | Proof | Hammack, *Book of Proof* (free PDF) | months 1–3 |
| 2 | Elementary number theory | Silverman, *A Friendly Introduction to Number Theory* | months 4–6 |
| 3 | Abstract algebra | Pinter, *A Book of Abstract Algebra* | months 7–12 |
| 4 | Branch on taste | Axler / Abbott / Spivak / Concrete Mathematics — **pick one** | year 2 |

North stars, years out: Arnold's *Mathematical Methods of Classical Mechanics*
(where the AoC 2019 Day 12 symplectic result actually lives), and type theory /
Curry–Howard (the bridge to the Lox compiler and to Lean itself).

## Layout

```
CLAUDE.md     the working agreement + curriculum (the contract)
README.md     this file
PROGRESS.md   reading log: date, chapter, exercises done, status
notes/        NN-topic.md — the durable artifact
exercises/    written work (markdown, or photos of paper)
lean/         Lean 4 project with Mathlib
reading/      book list, links, PDFs
```

## The deliverable per chapter

`notes/NN-topic.md`, containing:

1. Definitions restated in my own words — not copied.
2. **Why the definition is that way** — what breaks with the obvious alternative.
3. 3–5 worked exercises with complete proofs, including at least one I got
   wrong first, wrong version preserved, failure diagnosed.
4. A Lean formalization of at least one result from the chapter.
5. "Where I've already met this" — the CS / embedded / chess connection.
6. Cross-links to other notes.

Written for a reader who is 12+ months cold. That reader is me.

## Rules

- Exercises are the content. Reading a proof is not doing one.
- One book at a time, finished.
- No cadence pressure. A half-written note is an unfinished chapter, and that's fine.
- This is a sibling to the Advent of Code rotation, not a replacement for it.

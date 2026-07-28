# Gödel, Escher, Bach — how it maps onto Mathematics 201

Hofstadter, 1979. In flight, stalled, being resumed alongside this track.

**Status: parallel reading, not a curriculum book.** It has no exercises, so it
does not compete for the "one book at a time, finished" slot — that rule is
about texts that demand the study hour. GEB is the non-study slot.

## What it is, for this track's purposes

GEB is the motivation document. It asks, at length and beautifully, the exact
questions this curriculum answers with technique. It is a north star in the
same category as Arnold — except it can be read now, because it demands no
machinery.

## The mapping

| GEB | Where the curriculum makes it operational |
|---|---|
| MU puzzle / MIU-system; derivation from axioms | **Phase 0.** Lean *is* a formal system with axioms + production rules. NNG is the MU puzzle with stakes. |
| pq-system; "isomorphism" as the book's central obsession | **Phase 3.** Hofstadter gestures at isomorphism for 700 pages. Pinter defines it and demands proofs. |
| **Typographical Number Theory (TNT)** | **Phase 0, direct hit.** TNT *is* Peano arithmetic. NNG builds ℕ from the Peano axioms. Same object. |
| Gödel numbering | **Phase 2.** The encoding runs on unique prime factorization — fundamental theorem of arithmetic, early Silverman. |
| Incompleteness proper | **Phase 1 + 2.** Engine is Cantor's diagonal argument — already an explicit Phase 1 target. |
| Carroll's Tortoise refusing modus ponens ("Two-Part Invention") | **Phase 0.** Infinite regress in justifying an inference rule. `apply` is where the regress stops, and you feel why it must be primitive. |
| BlooP / FlooP, primitive vs. general recursion | Computability — not in this curriculum. Adjacent to the Lox compiler and the Curry–Howard north star. |
| Strange loops, typogenetics, the AI chapters | Stays literary. The 1979 AI material is now historical interest; the formal-systems core has not aged. |

## The stall

Classic stall points are Ch. VIII (TNT arrives) and the run-up to the
incompleteness proof around Ch. XIV — the point where it stops being dialogues
and Escher plates and starts demanding you read formal strings.

Diagnosis: the grind is not conceptual difficulty. It's that the book gives no
way to *operate* a formal system, only to watch one being operated, and there
are no exercises to fix it. NNG fixes it in an afternoon.

**Action: resume TNT after Addition World.** `∀a:∀b:⟨a+b⟩=⟨b+a⟩` is `add_comm`,
which by then will have been proved by hand from the axioms.

## The trap

GEB produces a strong sensation of understanding while conferring almost no
ability. That is what the book is for and not a criticism of it — but it is
the exact failure mode this whole repo exists to defeat, in its most charming
available form. A longer, more seductive 3Blue1Brown.

Read for pleasure and motivation. It does not count as work. The chapter that
feels best is the one that taught least.

## See also

- [[books]] — the actual curriculum reading list
- `../lean/README.md` — NNG scope and stopping point

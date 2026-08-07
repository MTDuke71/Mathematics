import Mathlib.Data.Set.Card

theorem empty_ne_singleton_empty (α : Type) : (∅ : Set (Set α)) ≠ {∅} := by
  intro h                                              -- suppose they ARE equal
  have hcard : (∅ : Set (Set α)).ncard = ({∅} : Set (Set α)).ncard :=
    congrArg Set.ncard h                               -- equal sets ⇒ equal size
  rw [Set.ncard_empty, Set.ncard_singleton] at hcard   -- 0 = 1
  exact Nat.zero_ne_one hcard                          -- but 0 ≠ 1

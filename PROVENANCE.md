# Provenance and attribution

The Lean implementation in this repository was written for this project. It
does not vendor or copy code from an earlier formalization project or another
subproject in the same repository. The sole formal dependency is Mathlib at
immutable commit `db584cd6d46c92f209a44c0f1c829460d327499d`, recorded in
`lakefile.toml` and `formalization.yaml`.

The project uses Mathlib's free-group quotient, reduction relation, and
canonical representative API from `Mathlib/GroupTheory/FreeGroup/Reduce.lean`
and its imported free-group definitions. The selected new result is a verified
finite-automaton construction and membership theorem for arbitrary finite
generating lists in `FreeGroup (Fin 2)`.

The mathematical source is John R. Stallings, “Topology of Finite Graphs,”
*Inventiones Mathematicae* 71 (1983), 551–565,
doi:10.1007/BF02095993. The formalization adapts the finite labelled graph and
folding method to an exhaustive least-congruence implementation. It does not
implement core pruning or the paper's subsequent basis, intersection, and
finite-index applications. No source code is adapted from the paper.

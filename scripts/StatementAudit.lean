import Solution
import Lean

open Lean Elab Command

/-!
# Compiled statement-surface audit

This audit inspects the compiled declarations, not Lean source text. The
selected closed statement may depend on its own selected definition and on
proposition proofs, but it must not reach any unselected candidate-defined
mathematical data.
-/

run_cmd do
  let env ← getEnv
  let statementName := `Stallings.completeStatement
  let theoremName := `Stallings.folded_recognizer_exists
  let some (.defnInfo statementInfo) := env.find? statementName
    | throwError "selected completeStatement is missing or is not a definition"
  let some (.thmInfo theoremInfo) := env.find? theoremName
    | throwError "selected folded_recognizer_exists is missing or is not a theorem"
  let refs := statementInfo.type.getUsedConstants ++ statementInfo.value.getUsedConstants ++
    theoremInfo.type.getUsedConstants
  for name in refs do
    if name.getRoot == `Stallings && name != statementName then
      match env.find? name with
      | some (.thmInfo _) => pure ()
      | _ => throwError "compiled statement reaches unselected candidate data: {name}"
  logInfo "compiled Challenge statement surface is closed"

#print axioms Stallings.folded_recognizer_exists

# Code Comments

- Code comments are a smell, not a goal. They should be rare. The code, its names, the tests, and the commit message carry the meaning. A comment is the last resort once none of those can.
- Before writing a comment, prefer these in loose order. There's weight to the order, but it's not absolute. Apply each only where it makes sense, and don't force an earlier one when a later one already tells the story (a manufactured extraction is its own smell):
  1. **Rename** — a clearer method, variable, or class name that states the intent.
  2. **Extract** — pull a confusing expression into a well-named method that names the concept. If a whole concept is missing, extract the right PORO/domain class (see models rules).
  3. **Test** — let a well-written spec tell the story of the behaviour and its edge cases.
  4. **Commit message** — explain the *why* and the history there, not in the source.
- Only then write a comment. Typically when the rationale matters but a commit message is too far removed from the code for someone to find it when they need it.
- Favour explaining *why* over *what* — the code already shows what it does, so restating it is noise. The rare exception is genuinely dense mechanics, eg. a non-obvious algorithm, where naming what each step does earns its keep.
- No narration, no TODO/changelog/decision-log comments, no commented-out code.

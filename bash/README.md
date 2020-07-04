# Bash

In addition to [shell](/shell/) best practices:

- Prefer `${var,,}` and `${var^^}` over `tr` for changing case.
- Prefer `${var//from/to}` over `sed` for simple string replacements.
- Prefer `[[` over `test` or `[`.
- Prefer process substitution over a pipe in `while read` loops.
- Use `((` or `let`, not `$((` when you don't need the result

Shell
=====

* Break long lines on `|`, `&&`, or `||` and indent the continuations.
* Don't add an extension to executable shell scripts.
* Don't put a line break before `then` or `do`, use `if ...; then` and `while
  ...; do`.
* Use `for x; do`, not `for x in "$@"; do`.
* Use `snake_case` for variable names and `ALLCAPS` for environment variables.
* Use single quotes for strings that don't contain escapes or variables.
* Use two-space indentation.

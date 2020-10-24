# Shell

- Break long lines on `|`, `&&`, or `||` and indent the continuations.
- Don't add an extension to executable shell scripts.
- Don't put a line break before `then` or `do`, use `if ...; then` and `while
  ...; do`.
- Use `for x; do`, not `for x in "$@"; do`.
- Use `snake_case` for variable names and `ALLCAPS` for environment variables.
- Use single quotes for strings that don't contain escapes or variables.
- Use two-space indentation.
- Don't parse the output of `ls`. Understand [why you shouldn't and available
  alternatives].
- Don't use `cat` to provide a file on `stdin` to a process that accepts file
  arguments itself.
- Don't use `echo` with options, escapes, or variables (use `printf` for those
  cases).
- Don't use a `/bin/sh` [shebang] unless you plan to test and run your script on
  at least: Actual Sh, Dash in POSIX-compatible mode (as it will be run on
  Debian), and Bash in POSIX-compatible mode (as it will be run on macOS).
- Don't use any [non-POSIX features] when using a `/bin/sh` [shebang].
- If calling `cd`, have code to handle a failure to change directories.
- If calling `rm` with a variable, ensure the variable is not empty.
- Prefer "$@" over "$\*" unless you know exactly what you're doing.
- Prefer `awk '/re/ { ... }'` to `grep re | awk '{ ... }'`.
- Prefer `find -exec {} +` to `find -print0 | xargs -0`.
- Prefer `for` loops over `while read` loops.
- Prefer `grep -c` to `grep | wc -l`.
- Prefer `mktemp` over using `$$` to "uniquely" name a temporary file.
- Prefer `sed '/re/!d; s//.../'` to `grep re | sed 's/re/.../'`.
- Prefer `sed 'cmd; cmd'` to `sed -e 'cmd' -e 'cmd'`.
- Prefer checking exit statuses over output in `if` statements (`if grep -q
  ...;`, not `if [ -n "$(grep ...)" ];`).
- Prefer reading environment variables over process output (`$TTY` not `$(tty)`,
  `$PWD` not `$(pwd)`, etc).
- Use `$( ... )`, not backticks for capturing command output.
- Use `$(( ... ))`, not `expr` for executing arithmetic expressions.
- Use `1` and `0`, not `true` and `false` to represent boolean variables.
- Use `find -print0 | xargs -0`, not `find | xargs`.
- Use quotes around every `"$variable"` and `"$( ... )"` expression unless you
  want them to be word-split and/or interpreted as globs.
- Use the `local` keyword with function-scoped variables.
- Identify common problems with [shellcheck].

[shebang]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[why you shouldn't and available alternatives]: http://mywiki.wooledge.org/ParsingLs
[non-posix features]: http://mywiki.wooledge.org/Bashism
[shellcheck]: http://www.shellcheck.net/

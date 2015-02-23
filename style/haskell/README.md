Haskell
=======

[Sample](sample.hs)

* Break long expressions before operators or keywords.
* Break long type signatures between arguments.
* Use a blank line between pragma and module statements.
* Order imports in three sections, separating each by a blank line:
  [standard libraries], third-party libraries, application modules.
  Within each section, alphabetize the imports and place qualified
  imports last.
* Order pragma statements alphabetically.
* Use comma-first style exports, records, and lists.
* Use four-space indentation except the `where` keyword which is
  indented two spaces. [Example].
* Use only one pragma statement per line.

[standard libraries]: http://www.haskell.org/ghc/docs/latest/html/libraries/index.html
[Example]: /style/haskell/sample.hs#L41

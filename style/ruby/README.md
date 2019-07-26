Ruby
====

[Sample](sample.rb)

* Avoid conditional modifiers (lines that end with conditionals). [36491dbb9]
* Avoid multiple assignments per line (`one, two = 1, 2`). [#109]
* Avoid organizational comments (`# Validations`). [#63]
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches. [36491dbb9]
* Avoid explicit return statements. [#48]
* Avoid using semicolons. [#108]
* Avoid bang (!) method names. Prefer descriptive names. [#122]
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't use `self` explicitly anywhere except class methods (`def self.method`)
  and assignments (`self.attribute =`). [#89]
* Don't vertically align tokens on consecutive lines.
* If you break up a chain of method invocations, keep each method invocation on
  its own line. Place the `.` at the end of each line, except the last.
* If you break up a hash, keep the elements on their own lines and closing curly
  brace on its own line.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* Name variables created by a factory after the factory (`user_factory`
  creates `user`).
* Prefer nested class and module definitions over the shorthand version
  [Example][class definition example] [#332]
* Prefer `detect` over `find`. [0d819844]
* Prefer `select` over `find_all`. [0d819844]
* Prefer `map` over `collect`. [0d819844]
* Prefer `reduce` over `inject`. [#237]
* Prefer double quotes for strings. [#174]
* Prefer `&&` and `||` over `and` and `or`. [#153]
* Prefer `!` over `not`. [#195]
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls. [#183]
* Prefer `if` over `unless`. [#254]
* Use `_` for unused block parameters. [0d819844]
* Prefix unused variables or parameters with underscore (`_`). [#335]
* Suffix variables holding a factory with `_factory` (`user_factory`).
* Use 2 space indentation (no tabs).
* Use a leading underscore when defining instance variables for memoization.
  [#373]
* Use an empty line between methods.
* Use spaces after commas, after colons and semicolons, around `{` and before
  `}`.
* Use `%{}` for single-line strings containing double-quotes that require 
  interpolation. [36491dbb9]
* Use `{...}` for single-line blocks. Use `do..end` for multi-line blocks.
  [0d819844]
* Use `?` suffix for predicate methods. [0d819844]
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants. [36491dbb9]
* Use `def self.method`, not `def Class.method` or `class << self`. [40090e22]
* Use `def` with parentheses when there are arguments. [36491dbb9]
* Don't use spaces after required keyword arguments. [Example][required kwargs]
  [#205]
* Use `each`, not `for`, for iteration. [36491dbb9]
* Use a trailing comma after each item in a multi-line list, including the last
  item. [Example][trailing comma example] [#167]
* Use heredocs for multi-line strings. [36491dbb9]
* Prefer `private` over `protected` for non-public `attr_reader`s,
  `attr_writer`s, and `attr_accessor`s. [#417], [#190]
* Order class methods above instance methods. [#320]
* Prefer method invocation over instance variables. [#331]

[#48]: https://github.com/thoughtbot/guides/pull/48
[#63]: https://github.com/thoughtbot/guides/pull/63
[#89]: https://github.com/thoughtbot/guides/pull/89
[#108]: https://github.com/thoughtbot/guides/pull/108
[#109]: https://github.com/thoughtbot/guides/pull/109
[#122]: https://github.com/thoughtbot/guides/pull/122
[#153]: https://github.com/thoughtbot/guides/pull/153
[#167]: https://github.com/thoughtbot/guides/pull/167
[#174]: https://github.com/thoughtbot/guides/pull/174
[#183]: https://github.com/thoughtbot/guides/pull/183
[#190]: https://github.com/thoughtbot/guides/pull/190
[#195]: https://github.com/thoughtbot/guides/pull/195
[#205]: https://github.com/thoughtbot/guides/pull/205
[#237]: https://github.com/thoughtbot/guides/pull/237
[#254]: https://github.com/thoughtbot/guides/pull/254
[#320]: https://github.com/thoughtbot/guides/pull/320
[#331]: https://github.com/thoughtbot/guides/pull/331
[#332]: https://github.com/thoughtbot/guides/pull/332
[#335]: https://github.com/thoughtbot/guides/pull/335
[#373]: https://github.com/thoughtbot/guides/pull/373
[#417]: https://github.com/thoughtbot/guides/pull/417
[0d819844]: https://github.com/thoughtbot/guides/commit/0d819844
[36491dbb9]: https://github.com/thoughtbot/guides/commit/36491dbb9
[40090e22]: https://github.com/thoughtbot/guides/commit/40090e22
[trailing comma example]: /style/ruby/sample.rb#L53
[required kwargs]: /style/ruby/sample.rb#L16
[class definition example]: /style/ruby/sample.rb#L103

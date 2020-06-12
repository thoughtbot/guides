Ruby
====

[Sample](sample.rb)

* Use [standard](https://github.com/testdouble/standard)

* Avoid conditional modifiers (lines that end with conditionals). [36491dbb9]
* Avoid multiple assignments per line (`one, two = 1, 2`). [#109]
* Avoid organizational comments (`# Validations`). [#63]
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches. [36491dbb9]
* Avoid bang (!) method names. Prefer descriptive names. [#122]
* Name variables created by a factory after the factory (`user_factory`
  creates `user`).
* Prefer nested class and module definitions over the shorthand version
  [Example][class definition example] [#332]
* Prefer `detect` over `find`. [0d819844]
* Prefer `select` over `find_all`. [0d819844]
* Prefer `map` over `collect`. [0d819844]
* Prefer `reduce` over `inject`. [#237]
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls. [#183]
* Use `_` for unused block parameters. [0d819844]
* Prefix unused variables or parameters with underscore (`_`). [#335]
* Suffix variables holding a factory with `_factory` (`user_factory`).
* Use a leading underscore when defining instance variables for memoization.
  [#373]
* Use `%()` for single-line strings containing double-quotes that require 
  interpolation. [36491dbb9]
* Use `?` suffix for predicate methods. [0d819844]
* Use `def self.method`, not `class << self`. [40090e22]
* Use `def` with parentheses when there are arguments. [36491dbb9]
* Use heredocs for multi-line strings. [36491dbb9]
* Order class methods above instance methods. [#320]
* Prefer method invocation over instance variables. [#331]

[#63]: https://github.com/thoughtbot/guides/pull/63
[#109]: https://github.com/thoughtbot/guides/pull/109
[#122]: https://github.com/thoughtbot/guides/pull/122
[#183]: https://github.com/thoughtbot/guides/pull/183
[#237]: https://github.com/thoughtbot/guides/pull/237
[#320]: https://github.com/thoughtbot/guides/pull/320
[#331]: https://github.com/thoughtbot/guides/pull/331
[#332]: https://github.com/thoughtbot/guides/pull/332
[#335]: https://github.com/thoughtbot/guides/pull/335
[#373]: https://github.com/thoughtbot/guides/pull/373
[0d819844]: https://github.com/thoughtbot/guides/commit/0d819844
[36491dbb9]: https://github.com/thoughtbot/guides/commit/36491dbb9
[40090e22]: https://github.com/thoughtbot/guides/commit/40090e22
[class definition example]: /style/ruby/sample.rb#L103

Ruby
====

[Sample](sample.rb)

* Avoid conditional modifiers (lines that end with conditionals).
* Avoid multiple assignments per line (`one, two = 1, 2`).
* Avoid organizational comments (`# Validations`).
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Avoid explicit return statements.
* Avoid using semicolons.
* Avoid bang (!) method names. Prefer descriptive names.
* Don't use `self` explicitly anywhere except class methods (`def self.method`)
  and assignments (`self.attribute =`).
* Prefer `detect` over `find`.
* Prefer `select` over `find_all`.
* Prefer `map` over `collect`.
* Prefer `reduce` over `inject`.
* Prefer double quotes for strings.
* Prefer `&&` and `||` over `and` and `or`.
* Prefer `!` over `not`.
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls.
* Prefer `if` over `unless`.
* Use `_` for unused block parameters.
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `{...}` for single-line blocks. Use `do..end` for multi-line blocks.
* Use `?` suffix for predicate methods.
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def self.method`, not `def Class.method` or `class << self`.
* Use `def` with parentheses when there are arguments.
* Don't use spaces after required keyword arguments. [Example][required kwargs]
* Use `each`, not `for`, for iteration.
* Use a trailing comma after each item in a multi-line list, including the last
  item. [Example][trailing comma example]
* Use heredocs for multi-line strings.
* Prefer `protected` over `private` for non-public `attr_reader`s, `attr_writer`s,
  and `attr_accessor`s.

[trailing comma example]: /style/ruby/sample.rb#L57
[required kwargs]: /style/ruby/sample.rb#L24

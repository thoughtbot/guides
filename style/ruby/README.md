Ruby
====

[Sample](sample.rb)

* Avoid conditional modifiers (lines that end with conditionals). 36491dbb9
* Avoid multiple assignments per line (`one, two = 1, 2`). #109
* Avoid organizational comments (`# Validations`). #63
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches. 36491dbb9
* Avoid explicit return statements. #48
* Avoid using semicolons. #108
* Avoid bang (!) method names. Prefer descriptive names. #122
* Don't use `self` explicitly anywhere except class methods (`def self.method`)
  and assignments (`self.attribute =`). #89
* Prefer nested class and module definitions over the shorthand version
  [Example][class definition example] #332
* Prefer `detect` over `find`. 0d819844
* Prefer `select` over `find_all`. 0d819844
* Prefer `map` over `collect`. 0d819844
* Prefer `reduce` over `inject`. #237
* Prefer double quotes for strings. #174
* Prefer `&&` and `||` over `and` and `or`. #153
* Prefer `!` over `not`. #195
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls. #183
* Prefer `if` over `unless`. #254
* Use `_` for unused block parameters. 0d819844
* Prefix unused variables or parameters with underscore (`_`). #335
* Use a leading underscore when defining instance variables for memoization.
  #373
* Use `%{}` for single-line strings needing interpolation and double-quotes.
  36491dbb9
* Use `{...}` for single-line blocks. Use `do..end` for multi-line blocks.
  0d819844
* Use `?` suffix for predicate methods. 0d819844
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants. 36491dbb9
* Use `def self.method`, not `def Class.method` or `class << self`. 40090e22
* Use `def` with parentheses when there are arguments. 36491dbb9
* Don't use spaces after required keyword arguments. [Example][required kwargs]
  #205
* Use `each`, not `for`, for iteration. 36491dbb9
* Use a trailing comma after each item in a multi-line list, including the last
  item. [Example][trailing comma example] #167
* Use heredocs for multi-line strings. 36491dbb9
* Prefer `private` over `protected` for non-public `attr_reader`s,
  `attr_writer`s, and `attr_accessor`s. #417, #190
* Order class methods above instance methods. #320
* Prefer method invocation over instance variables. #331

[trailing comma example]: /style/ruby/sample.rb#L53
[required kwargs]: /style/ruby/sample.rb#L16
[class definition example]: /style/ruby/sample.rb#L103

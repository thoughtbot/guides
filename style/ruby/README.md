Ruby
====

[Sample](samples/ruby.rb)

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
* Prefer `reduce` over `inject`.
* Prefer `map` over `collect`.
* Prefer `select` over `find_all`.
* Prefer double quotes for strings.
* Prefer `&&` and `||` over `and` and `or`.
* Prefer `!` over `not`.
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls.
* Use `_` for unused block parameters.
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `{...}` for single-line blocks.
* Use `do..end` for multi-line blocks whose return value is not used by
  the caller.

```ruby
(1..10).each do |x|
  puts x**2
end
```

* Use `{...}` for multi-line blocks that return values.

```ruby
values = (1..10).to_a.map { |x|
  some_var = transform(x)
  some_var * 2
}
```

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
* Avoid spaces between braces and key value pairs when nesting hashes.  `{a: {b: 1}}`, not `{ a: { b: 1 } }`

[trailing comma example]: /style/samples/ruby.rb#L49
[required kwargs]: /style/samples/ruby.rb#L16

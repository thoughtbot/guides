# Ruby reference and examples

## [Conditional modifiers](#conditional-modifiers)

Avoid conditional modifiers (lines that end with conditionals):

```ruby
  # unfavorable choice
  user.first_name if user.present?

  # preferred choice
  if user.present?
    user.first_name
  end
```

## [Multiple assignments](#multiple-assignments)

Avoid multiple assignments per line.

- Reading requires scanning back and forth across the line
- Adding more assignments causes modifications instead of additions
- Hides complexity
- Easy to miss when scanning a method

```ruby
  # unfavorable choice
  breakfast, lunch = :pancakes, :spaghetti

  # preferred choice
  breakfast = :pancakes
  lunch = :spaghetti
```

## [Organizational comments](#organizational-comments)

Avoid organizational comments:

```ruby
  # unfavorable choice
    # Validations
    validate_presence_of :user

  # preferred choice
    validate_presence_of :user
```

## [Ternary operators](#ternary-operators)

Avoid ternary operators. Use multi-line `if` instead to emphasize code branches.

```ruby
  # unfavorable choice
  user.present? ? user.first_name : "Unknown user"

  # preferred choice
  if user.present?
    user.first_name
  else
    "Unknown user"
  end
```

## [Bang method names](#bang-method-names)

Avoid bang (!) method names. Prefer descriptive names.

Example: in a method like 'invite!`, it is unclear if the author is going to
modify the user, raise an exception, or do something else.

```ruby
  # unfavorable choice
  def invite!

  # preferred choice
  def send_invitation_email
```

## [Unused block parameters](#unused-block-params)

```ruby
  # unfavorable choice
  hash.map { |key, value| v + 1 }

  # preferred choice
  hash.map { |_, value| value + 1 }
  hash.map { |_key, v| v + 1 }
```

## [Unused variables](#unused-variables)

```ruby
  # unfavorable choice
  user = create(:user)

  # preferred choice
  _user = create(:user)
```




---

* Avoid `%q`, `%Q`, `%x`, `%s`, and `%W`.
* Avoid hashes as optional parameters. Does the method do too much?
* Avoid including code and gems in source control that are specific to your
  development machine or process. Examples: `.rvmrc`, file watchers, debuggers.
* Avoid meta-programming.
* Avoid monkey-patching core classes.
* Avoid `return` unless required.
* Avoid superfluous parentheses when calling methods, but keep them when you
  assign the return value.
        x = Math.sin(y)
        array.delete e
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Define the version of Ruby the project uses in the Gemfile.
* Don't use `unless`.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `detect` over `find` and `select` over `find_all` to avoid confusion
  with ActiveRecord and keep `select`/`reject` symmetry.
* Prefer `map` over `collect` and `reduce` over `inject` due to symmetry and
  familarity with mapping and reducing in other technologies.
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `%w()` over `['', '']` for an array of words.
* Use `&&` and `||` for boolean expressions.
* Use `||=` freely.
* Use `{...}` over `do..end` for single-line blocks.
* Use `!` suffix for dangerous methods (modifies `self`).
* Use `?` suffix for predicate methods (return a boolean).
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def` with parentheses when there are arguments.
* Use `do..end` over `{...}` for multi-line blocks.
* Use `each`, not `for`, for iteration.
* Use heredocs for multi-line strings.
* Use `/(?:first|second)/` over `/(first|second)/` when you don't need the
  captured group.
* Use `private` over `protected` to indicate scope.
* Use `def self.method` over `def Class.method` or `class << self`.
* Use `Set` over `Array` for arrays with unique elements. The lookup is faster.
* Use single-quotes for strings unless interpolating.
* Use `unless boolean?` instead of `if !boolean?`.
* Use [Factory Girl](https://github.com/thoughtbot/factory_girl) for setting up
  complicated test data.

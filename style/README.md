Style
=====

A guide for programming in style.

PR's should be linted for violations of the style guide.

Git
---

* Avoid merge commits by using a [rebase workflow].
* Prefix feature branch names with your initials. e.g. `bf/ship_money`
* Squash multiple trivial commits into a single commit.
* Commits should tell a story of what changed and why.
* Write a [good commit message].

[rebase workflow]: /protocol/git#merge
[good commit message]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

Formatting
----------

* Avoid inline comments.
* Break long lines after 72 characters.
* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't misspell.
* If you break up an argument list, keep the arguments on their own lines and
  closing parenthesis on its own line.
* If you break up a hash, keep the elements on their own lines and closing curly
  brace on its own line.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* If you break up a chain of method invocations, keep each method invocation on
  its own line. Place the `.` at the **end of each line**, except the last.
  [Example][dot guideline example].
* Use 2 space indentation (no tabs).
* Use an empty line between methods.
* Use empty lines around multi-line blocks.
* Use spaces around operators, except for unary operators, such as `!`. e.g. `1 + 1` not `1+1`, but `!incorrect?`
* Use spaces after commas, after colons and semicolons, around `{` and before
  `}`.
* Use [Unix-style line endings] (`\n`). (LF, not CRLF)
* Use [uppercase for SQL key words and lowercase for SQL identifiers].

[dot guideline example]: /style/samples/ruby.rb#L11
[uppercase for SQL key words and lowercase for SQL identifiers]: http://www.postgresql.org/docs/9.2/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
[Unix-style line endings]: http://unix.stackexchange.com/questions/23903/should-i-end-my-text-script-files-with-a-newline

Naming
------

* Avoid abbreviations.
* Avoid object types in names (`user_array`, `email_method` `CalculatorClass`, `ReportModule`).
    * If you find yourself doing this, there's probably a latent object to extract.
* Prefer naming classes after domain concepts rather than patterns they
  implement (e.g. `Guest` vs `NullUser`, `CachedRequest` vs `RequestDecorator`).
* Name the enumeration parameter the singular of the collection.
* Name variables created by a factory after the factory (`user_registrar`
  creates `user`).
* **Name variables, methods, and classes to reveal intent**.
    * Then we can avoid comments lingering around, or spending time on understanding
        the intent of code by mentally compiling first.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).
* Suffix variables holding a factory with `_registrar` (`user_registrar`).

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

Ruby
----

[Sample](samples/ruby.rb)

* Avoid conditional modifiers (lines that end with conditionals).
    * ok: `eat! unless sated?`
    * avoid: `eat_organic_gluten_free_food(hippie)! && clear_table unless waiter.state == 'busy'`
* Avoid multiple assignments per line (`one, two = 1, 2`).
* Avoid organizational comments (`# Validations`).
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Avoid explicit return statements.
* Avoid using semicolons.
* Don't use `self` explicitly anywhere except class methods (`def self.method`)
  and assignments (`self.attribute =`).
* Prefer `detect` over `find`.
* Prefer `map` over `collect`.
* Prefer `inject` over `reduce`, unless it follow a `map`.
* Prefer `select` over `find_all`.
* Prefer double quotes for strings.
* Prefer `&&` and `||` over `and` and `or`.
* Prefer `!` over `not`.
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls. e.g. `user.map(&:name)`
* Use `_` for unused block parameters.
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `{...}` for blocks that return something, e.g. `map`. Use `do..end` when iterating for a side effect, e.g. `each`.
* Use `?` suffix for predicate methods.
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def self.method`, not `def Class.method` or `class << self`.
    * `class << self` can often be a smell of a problem in the code design.
* Use `def` with parentheses when there are arguments. (We're not in Seattle!)
* Don't use spaces after required keyword arguments. [Example][required kwargs]
* Use `each`, not `for`, for iteration.
* Use a trailing comma after each item in a multi-line list, including the last
  item. [Example][trailing comma example]
* Use heredocs for multi-line strings.
    * Indent the heredoc and strip spaces, e.g. `foo = (<<-EOS).strip_heredoc`
* Prefer `protected` over `private` for non-public `attr_reader`s, `attr_writer`s,
  and `attr_accessor`s.

[trailing comma example]: /style/samples/ruby.rb#L49
[required kwargs]: /style/samples/ruby.rb#L16

ERb
---

[Sample](samples/erb.rb)

* When wrapping long lines, keep the method name on the same line as the ERb
  interpolation operator and keep each method argument on its own line.
* Prefer double quotes for attributes.

HTML
----

* Prefer double quotes for attributes.

Rails
-----

* Avoid `member` and `collection` routes.
* Use private instead of protected when defining controller methods.
* Name date columns with `_on` suffixes.
* Name datetime columns with `_at` suffixes.
* Name initializers for their gem name.
* Order ActiveRecord associations alphabetically by attribute name.
* Order ActiveRecord validations alphabetically by attribute name.
* Order ActiveRecord associations above ActiveRecord validations.
* Order controller contents: filters, public methods, private methods.
* Order i18n translations alphabetically by key name.
* Order model contents: constants, macros, public methods, private methods.
* Put application-wide partials in the [`app/views/application`] directory. (not 'shared')
* Use `def self.method`, not the `scope :method` DSL.
* Use the default `render 'partial'` syntax over `render partial: 'partial'`.
* Use `link_to` for GET requests, and `button_to` for other HTTP verbs.

[`app/views/application`]: http://asciicasts.com/episodes/269-template-inheritance

Rails Migrations
----------------

[Sample](samples/migration.rb)

* Set an empty string as the default constraint for non-required string and text
  fields. [Example][default example].
* List timestamps first when creating a new table. [Example][timestamps example].

[timestamps example]: /style/samples/migration.rb
[default example]: /style/samples/migration.rb#L6

Rails Routes
------------

* Avoid the `:except` option in routes.
* Order resourceful routes alphabetically by name.
* Use the `:only` option to explicitly state exposed routes.

Background Jobs
---------------

* Define a `PRIORITY` constant at the top of delayed job classes.
* Define two public methods: `self.enqueue` and `perform`.
* Put delayed job classes in `app/jobs`.

Email
-----

* Use the user's name in the `From` header and email in the `Reply-To` when
  [delivering email on behalf of the app's users].

[delivering email on behalf of the app's users]: http://robots.thoughtbot.com/post/3215611590/recipe-delivering-email-on-behalf-of-users

Testing
-------

* Avoid the `private` keyword in specs.
* Avoid checking boolean equality directly. Instead, write predicate methods and
  use appropriate matchers. [Example][predicate-example].
* Prefer `eq` to `==` in RSpec.
* Separate setup, exercise, verification, and teardown phases with newlines.
* Use RSpec's [`expect` syntax].
* Use RSpec's [`allow` syntax] for method stubs.
* Use `should` shorthand for [one-liners with an implicit subject].
* Use `not_to` instead of `to_not` in RSpec expectations.
* Prefer the `have_css` matcher to the `have_selector` matcher in Capybara assertions.

[`expect` syntax]: http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
[`allow` syntax]: https://github.com/rspec/rspec-mocks#method-stubs
[one-liners with an implicit subject]: https://github.com/rspec/rspec-expectations/blob/master/Should.md#one-liners
[predicate-example]: /style/samples/predicate_tests.rb

#### Acceptance Tests

[Sample](samples/acceptance_test.rb)

* Avoid scenario titles that add no information, such as "successfully."
* Avoid scenario titles that repeat the feature title.
* Place helper methods for feature specs directly in a top-level `Features`
  module.
* Use Capybara's `feature/scenario` DSL.
* Use names like `ROLE_ACTION_spec.rb`, such as
  `user_changes_password_spec.rb`, for feature spec file names.
* Use only one `feature` block per feature spec file.
* Use scenario titles that describe the success and failure paths.
* Use spec/features directory to store feature specs.
* Use spec/support/features for support code related to feature specs.

#### Factories

* Order `factories.rb` contents: sequences, traits, factory definitions.
* Order factory attributes: implicit attributes, explicit attributes,
  child factory definitions. Each section's attributes are alphabetical.
* Order factory definitions alphabetically by factory name.
* Use one factories.rb file per project.

#### Unit Tests

[Sample](samples/testing.rb)

* Don't prefix `it` block descriptions with `should`. Use [Imperative mood]
  instead.
* Put one-liner specs at the beginning of the outer `describe` blocks.
* Use `.method` to describe class methods and `#method` to describe instance
  methods.
* Use `context` to describe testing preconditions.
* Use `describe '#method_name'` to group tests by method-under-test
* Use a single, top-level `describe ClassName` block.
* Order validation, association, and method tests in the same order that they
  appear in the class.
* Tag top level describe blocks by the type of test: unit, controller, feature, js. e.g. `describe User, :type => :unit do`.

[Imperative mood]: http://en.wikipedia.org/wiki/Imperative_mood

Shell
-----

* Break long lines on `|`, `&&`, or `||` and indent the continuations.
* Don't add an extension to executable shell scripts.
* Don't put a line break before `then` or `do`, use `if ...; then` and `while
  ...; do`.
* Use `for x; do`, not `for x in "$@"; do`.
* Use `snake_case` for variable names and `ALLCAPS` for environment variables.
* Use single quotes for strings that don't contain escapes or variables.
* Use two-space indentation.

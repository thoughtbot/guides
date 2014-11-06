Style
=====

A guide for programming in style.

Use [Hound] to automatically review your code and comment on GitHub pull
requests for violations of the Ruby portions of this style guide.

[Hound]: https://houndci.com

Git
---

* Avoid merge commits by using a [rebase workflow].
* Prefix feature branch names with your initials.
* Squash multiple trivial commits into a single commit.
* Write a [good commit message].

[rebase workflow]: /protocol/git#merge
[good commit message]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

Formatting
----------

* Avoid inline comments.
* Break long lines after 80 characters.
* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't misspell.
* Don't vertically align tokens on consecutive lines.
* If you break up an argument list, keep the arguments on their own lines and
  closing parenthesis on its own line.
* If you break up a hash, keep the elements on their own lines and closing curly
  brace on its own line.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* If you break up a chain of method invocations, keep each method invocation on
  its own line. Place the `.` at the end of each line, except the last.
  [Example][dot guideline example].
* Use 2 space indentation (no tabs).
* Use an empty line between methods.
* Use empty lines around multi-line blocks.
* Use spaces around operators, except for unary operators, such as `!`.
* Use spaces after commas, after colons and semicolons, around `{` and before
  `}`.
* Use [Unix-style line endings] (`\n`).
* Use [uppercase for SQL key words and lowercase for SQL identifiers].

[dot guideline example]: /style/samples/ruby.rb#L11
[uppercase for SQL key words and lowercase for SQL identifiers]: http://www.postgresql.org/docs/9.2/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
[Unix-style line endings]: http://unix.stackexchange.com/questions/23903/should-i-end-my-text-script-files-with-a-newline

Naming
------

* Avoid abbreviations.
* Avoid object types in names (`user_array`, `email_method` `CalculatorClass`, `ReportModule`).
* Prefer naming classes after domain concepts rather than patterns they
  implement (e.g. `Guest` vs `NullUser`, `CachedRequest` vs `RequestDecorator`).
* Name the enumeration parameter the singular of the collection.
* Name variables created by a factory after the factory (`user_factory`
  creates `user`).
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).
* Suffix variables holding a factory with `_factory` (`user_factory`).

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

Sass
----

[Sample](samples/sass.scss)

### Formatting

* Use the *Scss* syntax.
* Use hyphens when naming mixins, extends, classes, functions & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above selector that has styles.
* Prefer hex color codes `#000`.
* Use `//` for comment blocks not `/* */`.
* Use a space between selector and `{`.
* Use double quotation marks.
* Use only lowercase, including colors.
* Don't add a unit specification after `0` values, unless required by a mixin.
* Use a leading zero in decimal numbers: `0.5` not `.5`
* Use space around operands: `$variable * 1.5`, not `$variable*1.5`
* Avoid in-line operations in shorthand declarations (Ex. `padding: $variable * 1.5 variable * 2`)
* Use parentheses around individual operations in shorthand declarations: `padding: ($variable * 1.5) ($variable * 2)`

### Order

* Use alphabetical order for declarations.
* Place @extends and @includes at the top of your declaration list.
* Place media queries directly after the declaration list.
* Place concatenated selectors second.
* Place pseudo states and elements third.
* Place nested selectors last.

### Selectors

* Don't use ID's for style.
* Use meaningful names: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use ID and class names that are as short as possible but as long as necessary.
* Avoid using the direct descendant selector `>`.
* Avoid nesting more than 4 selectors deep.
* Don't nest more than 6 selectors deep.
* Use HTML tags on vague classes that need a qualifier like `header.application` not `.main`.
* Avoid using the HTML tag in the class name: `section.news` not `section.news-section`.
* Avoid using HTML tags on classes for generic markup `<div>`, `<span>`: `.widgets` not `div.widgets`.
* Avoid using HTML tags on classes with specific class names like `.featured-articles`.
* Avoid using comma delimited selectors.
* Avoid nesting within a media query.

### Organization

* Use Bourbon for a Sass Library.
* Use Neat for a grid framework.
* Use Bitters / Base folder for style on HTML tags, global variables, global extends and global mixins.
* Use Normalize as a browser reset.
* Use HTML structure for ordering of selectors. Don't just put styles at the bottom of the Sass file.
* Prefer the same file structure that is found in app/views.
* Avoid having files longer than 100 lines.

CoffeeScript
------------

[Sample](samples/coffee.coffee)

* Avoid conditional modifiers (lines that end with conditionals).
* Avoid backticks.
* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Prefer `==` and `!=` to `is` and `isnt`
* Prefer `||` and `&&` to `or` and `and`
* Prefer `!` over `not`
* Prefer `@` over `this` for referencing instance properties.
* Prefer double quotes.
* Use hyphen-separated filenames, such as `coffee-script.coffee`.
* Use `PascalCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Use zero spaces before and one space after the colon in a colon assignment
  (i.e. classes, objects).

Backbone
--------

[Sample](samples/backbone.coffee)

* Organize all objects in one `window.App` namespace.
* Name collections the plural version of the model.
* Name models without a suffix.
* Name the router `App.Router`.
* Name views with a `View` suffix.

Ember
-----
* Don't put a space between the opening handlebars braces and the variable.

Ruby
----

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
* Prefer `inject` over `reduce`.
* Prefer `map` over `collect`.
* Prefer `select` over `find_all`.
* Prefer double quotes for strings.
* Prefer `&&` and `||` over `and` and `or`.
* Prefer `!` over `not`.
* Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls.
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
* Put application-wide partials in the [`app/views/application`] directory.
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

[Imperative mood]: http://en.wikipedia.org/wiki/Imperative_mood

Objective-C
-----------

[Sample](samples/ObjectiveC.m)

* Place `#import`s into the prefix header (`ProjectName-Prefix.pch`) only if
  used in _many_ files.
* Place `.xib` files under `Resources/Nibs` and their associated view files in
  `Classes/Views`.
* Order `#import` statements alphabetically.
* Order `@class` directives alphabetically.
* Order `@property` modifiers: memory management, atomicity, writability.
* Leave out `@property` modifiers unless needed, `nonatomic` is the only one
  needed in most cases except connecting views with IB in which case `weak` may
  also be needed.
* Prefer `@class` to `#import` when referring to external classes in a public
  `@interface`.
* Prefer `@property` to declaring instance variables.
* Prefix class names with a 2 or 3 letter project acronym.
* Prefix string constants being used as keys with 'k'.
* Remove `#import` statements for `Foundation` and `UIKit` in new project
  templates.
* Separate methods by function using `#pragma mark - <Section Name>`
* Separate sections into subsections using `#pragma mark <Subsection Name>`
* Use `@[arrayObject]`, `@{@"key" : value}`, `@(YES or NO)`, and `@5.0`
  literals.
* Use `@interface ClassName ()` to declare private properties.
* Use `lowerCamelCase` for method names.
* Use `NSAssert` in methods that require the presence of certain arguments.
* Write methods using the happy path. Indent the exceptional cases. Keep the
  optimal case in the left-most column.
* Prefer `enumerateObjectsUsingBlock:` when looping through arrays.
* Always use braces with control and loop blocks unless it can easily fit on
  one line.
* Place opening brace for control and loop blocks on same line.
* Prefer `NSInteger`, `CGFloat`, and similar macros over `int`, `float`, and
  other base types.
* Prefer *Auto Layout* for view layouts and constraints.

Swift
-----

[Sample](samples/Swift.swift)

* Keep up with the Objective-C style guide above. Will highlight differences
  here.
* Use `let` whenever possible to make immutable variables
* Name all parameters in functions and enum cases
* Use trailing closures
* Let the compiler infer the type whenever possible

Python
------

* Follow [PEP 8].

[PEP 8]: http://www.python.org/dev/peps/pep-0008/

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

Haskell
-------

[Sample](samples/haskell.hs)

* Break long expressions before operators or keywords.
* Break long type signatures between arguments.
* Order imports in three sections, separating each by a blank line:
  [standard libraries], third-party libraries, application modules.
  Within each section, alphabetize the imports and place qualified
  imports last.
* Use comma-first style exports, records, and lists.
* Use four-space indentation except the `where` keyword which is
  indented two spaces. [Example].

Android
-------

* Properties of views should be alphabetized, with the exception of `id`,
  `layout_width`, and `layout_height` which should be placed first in that
  order.

[standard libraries]: http://www.haskell.org/ghc/docs/latest/html/libraries/index.html
[Example]: /style/samples/haskell.hs#L41

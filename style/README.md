Style
=====

A guide for programming in style.

Git
---

* Prefix feature branch names with your initials.
* Write a [good commit message].

[good commit message]: http://goo.gl/w11us

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
* Use 2 space indentation (no tabs).
* Use an empty line between methods.
* Use newlines around multi-line blocks.
* Use spaces around operators, after commas, after colons and semicolons, around
  `{` and before `}`.
* Use [Unix-style line endings] (`\n`).
* Use [uppercase for SQL key words and lowercase for SQL identifiers].

[uppercase for SQL key words and lowercase for SQL identifiers]: http://goo.gl/0WAIX
[Unix-style line endings]: https://help.github.com/articles/dealing-with-line-endings

Naming
------

* Avoid abbreviations.
* Avoid types in names (`user_array`).
* Name the enumeration parameter the singular of the collection.
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).
* Name variables holding a factory with `_factory` (`user_factory`).
* Name variables created by a factory after the factory (`user_factory`
  creates `user`).

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

Sass
----
### Formatting
* Use the *Scss* syntax.
* Use hyphens when naming mixins, extends, classes & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above selector that has styles.
* Prefer hex color codes `#000`.
* Use `//` for comment blocks not `/* */`.
* Use a space between selector and `{`.
* Use single quotation marks for attribute selectors and property values.
* Use only lowercase, including colors.
* Don't add a unit specification after `0` values, unless required by a mixin.

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
* Append the prefix js- to ID's that are used by Javascript.
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

* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Prefer `is` to `== ` or `===`
* Prefer `or` and `and` to `||` and `&&`

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
* Don't use `self` explicitly anywhere except class methods (`def self.method`)
  and assignments (`self.attribute =`).
* Prefer `detect` over `find`.
* Prefer `inject` over `reduce`.
* Prefer `map` over `collect`.
* Prefer `select` over `find_all`.
* Prefer single quotes for strings.
* Use `_` for unused block parameters.
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `&&` and `||` for Boolean expressions.
* Use `{...}` for single-line blocks. Use `do..end` for multi-line blocks.
* Use `?` suffix for predicate methods.
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def self.method`, not `def Class.method` or `class << self`.
* Use `def` with parentheses when there are arguments.
* Use `each`, not `for`, for iteration.
* Use heredocs for multi-line strings.

ERb
---

[Sample](samples/erb.rb)

* When wrapping long lines, keep the method name on the same line as the ERb
  interpolation operator and keep each method argument on its own line.

Rails
-----

* Avoid `member` and `collection` routes.
* Use private instead of protected when defining controller methods.
* Name date columns with `_on` suffixes.
* Name datetime columns with `_at` suffixes.
* Name initializers for their gem name.
* Order ActiveRecord associations alphabetically by attribute name.
* Order ActiveRecord validations alphabetically by attribute name.
* Order controller contents: filters, public methods, private methods.
* Order model contents: constants, macros, public methods, private methods.
* Put application-wide partials in the [`app/views/application`] directory.
* Use `def self.method`, not the `scope :method` DSL.
* Use the default `render 'partial'` syntax over `render partial: 'partial'`.

[`app/views/application`]: http://goo.gl/5Z8Vv

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

* Use one `ActionMailer` for the app. Name it `Mailer`.
* Use the user's name in the `From` header and email in the `Reply-To` when
  [delivering email on behalf of the app's users].

[delivering email on behalf of the app's users]: http://goo.gl/5w1ck

Testing
-------

[Sample](samples/testing.rb)

* Avoid scenario titles that add no information, such as "successfully."
* Avoid scenario titles that repeat the feature title.
* Avoid the `private` keyword in specs.
* Don't prefix `it` block descriptions with 'should'.
* Include the Features module in RSpec scenarios with `:type => :feature` set.
* Name outer `describe` blocks after the method under test. Use `.method`
  for class methods and `#method` for instance methods.
* Order ActiveRecord association tests alphabetically by attribute name.
* Order ActiveRecord validation tests alphabetically by attribute name.
* Order `factories.rb` contents: sequences, traits, factory definitions.
* Order factory attributes: implicit attributes, explicit attributes,
  child factory definitions. Each section's attributes are alphabetical.
* Order factory definitions alphabetically by factory name.
* Place helper methods for feature specs directly in a top-level `Features`
  module.
* Prefer `eq` to `==` in RSpec.
* Use `not_to` instead of `to_not` in RSpec expectations.
* Separate setup, exercise, verification, and teardown phases with newlines.
* Use one factories.rb file per project.
* Use names like `ROLE_ACTION_spec.rb`, such as
  `user_changes_password_spec.rb`, for feature spec file names.
* Use only one `feature` block per feature spec file.
* Use RSpec's [`expect` syntax].
* Use scenario titles that describe the success and failure paths.
* Use spec/features to store feature specs.
* Use spec/support/features for support code related to feature specs.

[`expect` syntax]: http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax

Objective-C
-----------

[Sample](samples/ObjectiveC.m)

* `#import` linked frameworks in the prefix header (`ProjectName-Prefix.pch`).
* Keep `.xib` files grouped with their associated view class.
* Order `#import` statements alphabetically.
* Order `@class` directives alphabetically.
* Order `@property` modifiers: memory management, atomicity, writability.
* Organize classes into `models`, `views`, `controllers`, `categories`,
  and `services` directories.
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

Python
------

* Follow [PEP 8].

[PEP 8]: http://www.python.org/dev/peps/pep-0008/

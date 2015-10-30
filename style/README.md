Style
=====

A guide for programming in style.

In addition to the general guidelines below, we also have the following more
detailed, language/framework-specific style guides:

* [Backbone](backbone)
* [ERb](erb)
* [Git](git)
* [HTML](html)
* [JavaScript](javascript)
* [Rails](rails)
* [Sass](sass)
* [Shell](shell)
* [Slim](slim)
* [Testing](testing)

Formatting
----------

Ruby
----
See [rubocop.ymp](/dotfiles/.rubocop.yml) - ensure that you either use a plugin with your editor or run rubocop as 
a pre-commit hook. We are informed that a good one is https://gist.github.com/cheba/cfc46820a01db1222f54

Naming
------

* Avoid abbreviations.
* Avoid object types in names (`user_array`, `email_method` `CalculatorClass`, `ReportModule`).
* Prefer naming classes after domain concepts rather than patterns they
  implement (e.g. `Guest` vs `NullUser`, `CachedRequest` vs `RequestDecorator`).
* Name the enumeration parameter the singular of the collection.
  creates `user`).
* Name variables, methods, and classes to reveal intent.

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

Sass
----

* Use the *Scss* syntax.
* Use dashes when naming mixins, extends, classes or IDs: `span-columns` not `span_columns` or `spanColumns`.
* Use descriptive names and write them in full-words: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use space between property and value: `width: 20px` not `width:20px`.
* Order properties within rule sets with @extends and @includes first, then all others in a logical order.
* Leave a blank line between rule sets.

CoffeeScript
------------

* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Prefer `is` to `== ` or `===`
* Prefer `or` and `and` to `||` and `&&`

ERb
---

[Sample](samples/erb.rb)

* When wrapping long lines, keep the method name on the same line as the ERb.
  interpolation operator and keep each method argument on its own line.

Rails
-----

* Avoid `member` and `collection` routes.
* Avoid the `:except` option in routes.
* Don't use protected controller methods.
* Name date columns with `_on` suffixes.
* Name datetime columns with `_at` suffixes.
* Name initializers for their gem name.
* Order ActiveRecord associations alphabetically by attribute name.
* Order ActiveRecord validations alphabetically by attribute name.
* Order controller contents: filters, public methods, private methods.
* Order model contents: constants, macros, public methods, private methods.
* Order resourceful routes alphabetically by name.
* Put application-wide partials in the
  [`app/views/application`](http://goo.gl/5Z8Vv) directory.
* Use `def self.method`, not the `scope :method` DSL.
* Use the default `render 'partial'` syntax over `render partial: 'partial'`.
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
  [delivering email on behalf of the app's users](http://goo.gl/5w1ck).

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
* Separate setup, exercise, verification, and teardown phases with newlines.
* Use one factories.rb file per project.
* Use names like `ROLE_ACTION_spec.rb`, such as
  `user_changes_password_spec.rb`, for feature spec file names.
* Use only one `feature` block per feature spec file.
* Use scenario titles that describe the success and failure paths.
* Use spec/features to store feature specs.
* Use spec/support/features for support code related to feature specs.

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

* Follow [PEP 8](http://www.python.org/dev/peps/pep-0008/).

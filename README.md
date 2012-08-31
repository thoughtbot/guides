Style Guide
===========

A guide for programming in style.

High level guidelines:

* Be consistent.
* Don't violate the conventions without a good reason.
* Don't rewrite existing code to follow this guide.

Heroku
------

* Have Heroku remotes named "staging" and "production."
* Use a Procfile to configure your services.
* Use the [Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

Git
---

* Perform work in a feature branch.
* Prefix feature branch names with your initials.
* Rebase frequently to incorporate upstream changes.
* Write a [good commit message](http://goo.gl/w11us).
* Use a [pull request](http://goo.gl/Kmdee) for code reviews.
* Delete local and remote feature branches after merging.
* Avoid including files in source control that are specific to your
  development machine or process.

Formatting
----------

* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't vertically align tokens on consecutive lines.
* Indent continued lines two spaces.
* If you break up an argument list, keep the parenthesis on its own line.
* If you break up a hash, keep the curly braces on their own lines.
* Indent private methods equal to public methods.
* Use 2 space indentation (no tabs).
* Use an empty line between methods.
* Use spaces around operators, after commas, after colons and semicolons, around `{` and before `}`.
* Break long lines after 80 characters.
* Avoid inline comments.

Naming
------

* Avoid abbreviations.
* Avoid types in names (`user_array`).
* Name the enumeration parameter the singular of the collection.
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).

JavaScript
----------

* Use CoffeeScript.

CoffeeScript
------------

* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for classes, `mixedCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.

Ruby
----

* Avoid conditional modifiers (lines that end with conditionals).
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Define the project's [Ruby version in the
  Gemfile](http://gembundler.com/man/gemfile.5.html#RUBY-ruby-).
* Prefer `detect` over `find`
* Prefer `select` over `find_all`
* Prefer `map` over `collect`
* Prefer `inject` over `reduce`
* Use `_` for unused block parameters
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `&&` and `||` for Boolean expressions.
* Use `{...}` for single-line blocks.
* Use `do..end` for multi-line blocks.
* Use `?` suffix for predicate methods.
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def` with parentheses when there are arguments.
* Use `each`, not `for`, for iteration.
* Use heredocs for multi-line strings.
* Use `def self.method`, not `def Class.method` or `class << self`.
* Prefer single quotes for strings.

Rails
-----

* Avoid the `:except` option in routes.
* Avoid `member` and `collection` routes.
* Don't reference a model class directly from a view.
* Don't use SQL or SQL fragments (`where('inviter_id is not null')`) outside
  of models.
* Keep the `db/schema.rb` under version control.
* Name initializers for their gem name.
* Order controller contents: filters, public methods, private methods.
* Don't use protected controller methods.
* Order model contents: constants, macros, public methods, private methods.
* If there are default values, set them in migrations.
* Use `_path`, not `_url`, for named routes everywhere except mailer views.
* Use `def self.method`, not the `scope :method` DSL.
* Use SQL, not `ActiveRecord` models, in migrations.
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

* Avoid `its`, `let`, `let!`, `specify`, `before`, and `subject`.
* Avoid using instance variables in tests.
* Don't prefix `it` block descriptions with 'should'.
* Name outer `describe` blocks after the method under test. Use `.method` for class methods and `#method` for instance methods.
* Order factories.rb: sequences, traits, factory definitions.
* Order factory attributes: implicit attributes, explicit attributes, child factory definitions. Each section's attributes are alphabetical.
* Order factory definitions alphabetically by factory name.
* Use [stubs and spies](http://goo.gl/EciDJ) (not mocks) in isolated tests.
* Use a newline between the Setup, Exercise, Verify, and Teardown test phases.
* Use an `it` example for each execution path through the method.
* Use one factories.rb file per project.

[Sample](https://github.com/thoughtbot/style-guide/blob/master/rspec-sample.rb)

[Always be learning](http://learn.thoughtbot.com).

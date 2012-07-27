Style Guide
===========

A guide for programming in style.

Git-based workflow
------------------

Start a [Trajectory](https://www.apptrajectory.com) story.

Create a local feature branch based off master.

    git checkout master
    git pull
    git checkout -b feature-xyz

Do work in your branch. Make sure tests pass and commit the changes.

    rake
    git add -A
    git status
    git commit

Write a [good commit message](http://goo.gl/w11us).

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters)
    * More information about commit (under 72 characters)

Share your branch:

    git push origin [branch]

Submit a [Github pull request](http://goo.gl/Kmdee).

Ask for a code review in Campfire. A team member other than the author should
review the code before it is merged.

Rebase frequently to incorporate upstream changes.

    git checkout master
    git pull
    git checkout [branch]
    git rebase master
    <resolve conflicts>

Interactive rebase (squash) your commits (if necessary).

    git rebase -i master

Make sure tests pass. Merge your branch back to master and push your changes.

    rake
    git checkout master
    git diff --stat master [branch]
    git merge [branch] --ff-only
    git push origin master

Delete your remote feature branch.

    git push origin :[branch]

Delete your local feature branch.

    git branch -d [branch]

Merge master into the staging branch:

    git checkout staging
    git reset --hard staging/master
    git log staging..master (view list of new commits)
    git diff --stat origin/master (view changed files)
    git merge master

Deploy to [Heroku](https://devcenter.heroku.com/articles/quickstart):

    git push

Run migrations (if necessary):

    heroku rake db:migrate --app <app>

Restart the dynos if migrations were run:

    heroku restart --app <app>

[Introspect](http://goo.gl/tTgVF) to make sure everything's ok:

    watch heroku ps --app <app>

Smoke test in browser. Write acceptance criteria on the Trajectory story.
Deliver story.

A team member other than the author should review the feature on staging based
on acceptance criteria.

Deploy to production:

    git checkout production
    git reset --hard production/master
    git log production..staging (view list of new commits)
    git diff --stat staging/master (view changed files)
    git merge staging
    git push
    heroku rake db:migrate --app <app>
    heroku restart --app <app>
    watch heroku ps --app <app>

Formatting
----------

* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't vertically align tokens on consecutive lines.
* Include spaces around infix method invocations like `+` and `-`.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* Limit lines to a maximum of 80 characters.
* Order methods and attributes alphabetically where possible.
* Use 2 space indentation (no tabs) unless otherwise noted.
* Use an empty line between methods, blocks and conditionals.
* Use spaces around operators, after commas, colons and semicolons, around `{`
  and before `}`.
* Use Unix-style line endings (`\n`).

Naming
------

* Avoid abbreviations.
* Avoid Hungarian notiation (`szName`).
* Avoid types in names (`user_array`).
* Name the enumeration parameter the singular of the collection.
* Name variables, methods, and classes with intention-revealing names..
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).

Design
------

* Aggressively DRY code during development.
* Avoid comments.
* Avoid global variables.
* Avoid long parameter lists.
* Be consistent.
* Consider extracting `private` methods to their own object.
* Don't duplicate the functionality of a built-in library.
* Don't program defensively.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://rdd.me/yichhgvu).
* [Keep the code simple](http://www.readability.com/articles/ko2aqda2).
* Limit the number of collaborators of an object.
* Prefer composition over inheritance.
* Prefer small methods. One line is best.
* Prefer small objects with a single, well-defined responsibility.
* [Tell, don't ask](http://robots.thoughtbot.com/post/27572137956/tell-dont-ask).

Ruby
----

* Avoid `%q`, `%Q`, `%x`, `%s`, and `%W`.
* Avoid conditional modifiers (lines that end with conditionals).
* Avoid hashes as optional parameters. Does the method do too much?
* Avoid including code and gems in source control that are specific to your
  development machine or process. Examples: `.rvmrc`, file watchers, debuggers.
* Avoid meta-programming.
* Avoid monkey-patching core classes.
* Avoid `return` unless required.
* Avoid superfluous parentheses when calling methods, but keep them when you
  assign the return value: `x = Math.sin(y); array.delete e`
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
* Use `_` for unused block parameters: `hash.map { |_, v| v + 1 }`
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

Rails
-----

* Avoid the `:except` option in routes.
* Avoid `member` and `collection` routes.
* Avoid Single Table Inheritance.
* Deploy to [Heroku](http://heroku.com).
* Don't invoke a model's class directly from a view.
* Don't use SQL or SQL fragments (`where('inviter_id is not null')`) outside of
  models.
* Set `config.action_mailer.raise_delivery_errors = true` in the development
  environment.
* Keep the `db/schema.rb` under version control.
* Limit the number of instance variables shared between controller and view.
* Name initializers for their gem name. Example: `paperclip.rb`
* Order controller contents: filters, public methods, private methods.
* Order model contents: constants, attributes, associations, nested attributes,
  named scopes, validations, callbacks, public methods, private methods.
* Prefer presenters (Ruby objects responsible for presentation) over view
  helpers.
* Put all copy text in models, views, controllers, and mailers in
  `config/locales`.
* Set `config.action_mailer.delivery_method = :test` in the test environment.
* Use `_path` over `_url` for named routes everywhere except mailer views.
* Use `def self.method` over the `named_scope :method` DSL.
* Use [Foreman](https://github.com/ddollar/foreman) to run the development
  server.
* Use `I18n.t 'dot.separated.key'` over
  `I18n.t :key, :scope => [:dot, :separated]`.
* Use [Haml](http://haml-lang.com) for view templates.
* Use `has_and_belongs_to_many` if all you need is a join table. Start simple.
* Use namespaced locale lookup in the views by prefixing a period: `t '.title'`.
* Use nested routes to express `belongs_to` relationships between resources.
* Use one `ActionMailer` for the app. Name it `Mailer`.
* Use [single recipient SMTP](https://gist.github.com/2042496) in the staging
  environment.
* Use the default `render 'partial'` syntax over `render :partial => 'partial'`.
* Use the `:only` option to explicitly state exposed routes.

Database
--------

* Avoid multicolumn indexes in Postgres. It [combines multiple
  indexes](http://goo.gl/pY3Po) efficiently.
* Create [indexes concurrently](https://gist.github.com/3186117) to avoid table
  locks and [reduced performance](http://goo.gl/fi5ER) during deploys.
* Consider a [partial index](http://goo.gl/YC8Jt) for queries on booleans.
* Constrain most columns as [`NOT NULL`](http://goo.gl/0GeBr).
* Create a read-only [Heroku Follower](http://goo.gl/xWDMx) for your
  production database. If a Heroku database outage occurs, Heroku can use the
  follower to get your app back up and running faster.
* Use the Heroku Follower database for analytics to limit reads on the primary
  database.

Javascript
----------

* Define functions that operate on `window` or DOM in scope of `window`.
* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for prototypes, `mixedCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Use `data-` attributes to bind event handlers.
* Use the [module pattern](http://yuiblog.com/blog/2007/06/12/module-pattern)
  to control method visibility.

Testing
-------

* Avoid `its`, `let`, `let!`, `specify`, `subject`, and other DSLs. Prefer
  explicitness and consistency.
* Disable real HTTP requests to external services.
* Don't prefix `it` blocks with 'should'.
* Name outer `describe` blocks after the method under test. Use `.method`
  for class methods and `#method` for instance methods.
* Order factories.rb: sequences, traits, factory definitions.
* Order factory definitions alphabetically by factory name.
* Order factory attributes: implicit attributes, newline, explicit attributes,
  child factory definitions. Each section's attributes are alphabetical.
* Prefix `context` blocks names with 'given' when receiving input. Prefix with
  'when' in most other cases.
* Run specs with `--format documentation`.
* Use a `context` block for each execution path through the method.
* Use a [Fake](http://robots.thoughtbot.com/post/219216005/fake-it) to stub
  requests to external services.
* Use `before` blocks to clearly define the 'setup' phase of the
  [Four Phase Test](http://xunitpatterns.com/Four%20Phase%20Test.html).
* Use integration tests to execute the entire app.
* Use literal strings or non-[SUT](http://xunitpatterns.com/SUT.html) methods
  in test expectations when possible.
* Use one expection per `it` block.
* Use stubs and spies (not mocks) in isolated tests to test only the object
  under test.

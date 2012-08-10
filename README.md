Style Guide
===========

A guide for programming in style.

Laptop setup
------------

Set up your laptop with [this script](https://github.com/thoughtbot/laptop)
and [these dotfiles](https://github.com/thoughtbot/dotfiles).

Project setup
-------------

Get the code.

    git clone git@github.com:organization/project.git

Set up the project's dependencies.

    cd project
    bundle --binstubs
    rake db:create
    rake db:schema:load
    rake db:seed

Add Heroku remotes for staging and production environments.

    git remote add staging git@heroku.com:<app>-staging.git
    git remote add production git@heroku.com:<app>-production.git

Use [Heroku config](https://github.com/ddollar/heroku-config) to get `ENV`
variables.

    heroku config:pull --app <app>-staging

Delete extra lines in `.env`, leaving only those needed for app to function
properly.

    BRAINTREE_MERCHANT_ID
    BRAINTREE_PRIVATE_KEY
    BRAINTREE_PUBLIC_KEY
    S3_KEY
    S3_SECRET

Use [Foreman](http://goo.gl/oy4uw) to run the app locally.

    foreman start

It uses your `.env` file and `Procfile` to run processes just like Heroku's
[Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

Development
-----------

Create a local feature branch based off master.

    git checkout master
    git pull --rebase
    git checkout -b feature-xyz

Rebase frequently to incorporate upstream changes.

    git fetch origin
    git rebase origin/master
    <resolve conflicts>

When feature is complete and tests pass, commit the changes.

    rake
    git add -A
    git status
    git commit -v

Write a [good commit message](http://goo.gl/w11us).

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

Share your branch.

    git push origin [branch]

Submit a [Github pull request](http://goo.gl/Kmdee).

Ask for a code review in [Campfire](http://campfirenow.com).

Deploy
------

If there are multiple commits in the branch, squash them.

    git rebase -i staging/master
    rake

View a list of new commits. View changed files. Merge branch into staging.

    git checkout staging
    git fetch staging
    git reset --hard staging/master
    git log staging..[branch]
    git diff --stat [branch]
    git merge [branch] --ff-only

Deploy to [Heroku](https://devcenter.heroku.com/articles/quickstart).

    git push staging

Run migrations (if necessary).

    heroku run rake db:migrate --app <app>

Restart the dynos if migrations were run.

    heroku restart --app <app>

[Introspect](http://goo.gl/tTgVF) to make sure everything's ok.

    watch heroku ps --app <app>

Test the feature in browser.

Delete your remote feature branch.

    git push origin :[branch]

Delete your local feature branch.

    git branch -d [branch]

Close pull request and comment `Merged.`

Deploy to production.

    git checkout production
    git fetch production
    git reset --hard production/master
    git log production..staging
    git diff --stat staging/master
    git merge staging --ff-only
    git push production
    heroku run rake db:migrate --app <app>
    heroku restart --app <app>
    watch heroku ps --app <app>

Watch logs and metrics dashboards. If the feature is working, merge into master.

    git checkout master
    git fetch origin
    git log production..master
    git merge production --ff-only
    git push origin master

Formatting
----------

* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't vertically align tokens on consecutive lines.
* Include spaces around infix method invocations like `+` and `-`.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* Use 2 space indentation (no tabs) unless otherwise noted.
* Use an empty line between methods, blocks and conditionals.
* Use spaces around operators, after commas, colons and semicolons, around `{`
  and before `}`.

Naming
------

* Avoid abbreviations.
* Avoid Hungarian notiation (`szName`).
* Avoid types in names (`user_array`).
* Name background jobs with a `Job` suffix.
* Name the enumeration parameter the singular of the collection.
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).

Design
------

* Aggressively remove duplication during development.
* Avoid comments.
* Avoid global variables.
* Avoid long parameter lists.
* Be consistent.
* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://rdd.me/yichhgvu).
* [Keep the code simple](http://rdd.me/ko2aqda2).
* Limit the number of collaborators of an object.
* Prefer composition over inheritance.
* Prefer small methods. One line is best.
* Prefer small objects with a single, well-defined responsibility.
* [Tell, don't ask](http://goo.gl/Ztawt).

Javascript
----------

* Define functions that operate on `window` or DOM in scope of `window`.
* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for prototypes, `mixedCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Use `data-` attributes to bind event handlers.
* Use the [module pattern](http://goo.gl/JDtHN) to control method visibility.

Ruby
----

* Avoid conditional modifiers (lines that end with conditionals).
* Avoid hashes as optional parameters. Does the method do too much?
* Avoid including code and gems in source control that are specific to your
  development machine or process. Examples: `.rvmrc`, `.swp`
* Avoid meta-programming.
* Avoid monkey-patching core classes.
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Define the project's [Ruby version in the
  Gemfile](http://gembundler.com/man/gemfile.5.html#RUBY-ruby-).
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `detect`, not `find`, and `select`, not `find_all`, to avoid confusion
  with ActiveRecord and keep `select`/`reject` symmetry.
* Prefer `map`, not `collect`, and `reduce`, not `inject`, due to symmetry and
  familarity with mapping and reducing in other technologies.
* Use `_` for unused block parameters: `hash.map { |_, v| v + 1 }`
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `%w()`, not `['', '']`, for an array of words.
* Use `&&` and `||` for boolean expressions.
* Use `||=` freely.
* Use `{...}`, not `do..end`, for single-line blocks.
* Use `!` suffix for dangerous methods (modifies `self`).
* Use `?` suffix for predicate methods (return a boolean).
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def` with parentheses when there are arguments.
* Use `do..end`, not `{...}`, for multi-line blocks.
* Use `each`, not `for`, for iteration.
* Use heredocs for multi-line strings.
* Use `/(?:first|second)/`, not `/(first|second)/`, when you don't need the
  captured group.
* Use `private`, not `protected`, to indicate scope.
* Use `def self.method`, not `def Class.method` or `class << self`.
* Use `Set`, not `Array`, for arrays with unique elements. The lookup is faster.
* Use single-quotes for strings unless interpolating.

[Sample](https://github.com/thoughtbot/style-guide/blob/master/ruby-sample.rb)

Rails
-----

* Avoid the `:except` option in routes.
* Avoid `member` and `collection` routes.
* Avoid Single Table Inheritance.
* Don't change a migration after it has been committed unless it cannot be
  solved with another migration.
* Don't invoke a model's class directly from a view.
* Don't use SQL or SQL fragments (`where('inviter_id is not null')`) outside of
  models.
* Keep the `db/schema.rb` under version control.
* Limit the number of instance variables shared between controller and view.
* Name initializers for their gem name. Example: `paperclip.rb`
* Order controller contents: filters, public methods, private methods.
* Order model contents: constants, attributes, associations, nested attributes,
  named scopes, validations, callbacks, public methods, private methods.
* Prefer [decorators](http://goo.gl/yeF3X), not view helpers.
* Put all copy text in models, views, controllers, and mailers in
  `config/locales`.
* Set `config.assets.initialize_on_precompile = false` in
  `config/application.rb`.
* Set default values in the database.
* Use `_path`, not `_url`, for named routes everywhere except mailer views.
* Use `def self.method`, not the `named_scope :method` DSL.
* Use `I18n.t 'dot.separated.key'`, not `I18n.t :key,
  :scope => [:dot, :separated]`.
* Use `has_and_belongs_to_many` if all you need is a join table. Do not include
  an `id` or timestamps.
* Use namespaced locale lookup in views by prefixing a period: `t '.title'`.
* Use nested routes to express `belongs_to` relationships between resources.
* Use SQL, not `ActiveRecord` models, in migrations.
* Use the default `render 'partial'` syntax over `render partial: 'partial'`.
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
* Index all foreign keys.
* Use a Heroku Follower database for analytics to limit reads on the primary
  database.

Background Jobs
---------------

* Define a `PRIORITY` constant at the top of the class.
* Define two public methods: `self.enqueue` and `perform`.
* Enqueue the job in `self.enqueue` [like this](http://goo.gl/C7e54).
* Put background jobs in `app/jobs`.
* Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.
* Subclass the job from `Struct.new(:something_id)`.
* Use [`Delayed::Job`](http://goo.gl/sRYju) for background jobs.

Email
-----

* Set `config.action_mailer.raise_delivery_errors = true` in the development
  environment.
* Set `config.action_mailer.delivery_method = :test` in the test environment.
* Use one `ActionMailer` for the app. Name it `Mailer`.
* Use [SendGrid](http://goo.gl/Kxu9W) or [Amazon SES](http://goo.gl/A5jAA) to
  deliver email in staging and production environments.
* Use [single recipient SMTP](http://goo.gl/FWdhG) in staging environment.
* Use the user's name in the `From` header and email in the `Reply-To` when
  [delivering email on behalf of the app's users](http://goo.gl/5w1ck).

Gems
----

* Use [AssetSync](http://goo.gl/m58tF) to serve assets from S3.
* Use [Bourbon](http://goo.gl/wpyee) for Sass mixins.
* Use [Bourne](http://goo.gl/lE7zH) for stubs and spies.
* Use [Braintree](http://goo.gl/mpWTp) for credit card processing.
* Use [Clearance](http://goo.gl/svPGo) for authentication.
* Use [Factory Girl](http://goo.gl/AB8bI) to set up test data.
* Use [Geocoder](http://goo.gl/CKnYF) for geocoding.
* Use [Haml](http://haml.info) for view templates.
* Use [Money](http://goo.gl/2CNfc) for money objects.
* Use [New Relic](http://goo.gl/F7Q56) for performance monitoring.
* Use [Paperclip](http://goo.gl/eSESD) for file uploads.
* Use [Thin](http://goo.gl/5Hlr) for serving web requests.
* Use [WebMock](http://goo.gl/BC1Ac) to disable real HTTP requests.

Testing
-------

* Avoid `its`, `let`, `let!`, `specify`, `subject`, and other DSLs. Prefer
  explicitness and consistency.
* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
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
* Test background jobs with a [`Delayed::Job` matcher](http://goo.gl/bzBlN).
* Use a `context` block for each execution path through the method.
* Use a [Fake](http://goo.gl/YR7Hh) to stub requests to external services.
* Use a `before` block to define phases of [Four Phase
  Test](http://goo.gl/J9FiJ).
* Use integration tests to execute the entire app.
* Use non-[SUT](http://goo.gl/r5Ti2) methods in expectations when possible.
* Use one expectation per `it` block.
* Use [stubs and spies](http://goo.gl/EciDJ) (not mocks) in isolated tests.

[Sample](https://github.com/thoughtbot/style-guide/blob/master/rspec-sample.rb)

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE6.

[Always be learning](http://learn.thoughtbot.com).

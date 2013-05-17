Best Practices
==============

A guide for programming well.

General
-------

* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://rdd.me/yichhgvu).
* [Keep the code simple](http://rdd.me/ko2aqda2).

Object-Oriented Design
----------------------

* Avoid global variables.
* Avoid long parameter lists.
* Limit collaborators of an object (entities an object depends on).
* Limit an object's dependencies (entities that depend on an object).
* Prefer composition over inheritance.
* Prefer small methods. Between one and five lines is best.
* Prefer small objects with a single, well-defined responsibility. When an
  object exceeds 100 lines, it may be doing too many things.
* [Tell, don't ask](http://goo.gl/Ztawt).

Ruby
----

* Avoid optional parameters. Does the method do too much?
* Avoid monkey-patching.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `private` when indicating scope. Use `protected` only with comparison
  methods like `def ==(other)`, `def <(other)`, and `def >(other)`.

Ruby Gems
---------

* Declare dependencies in the `<PROJECT_NAME>.gemspec` file.
* Reference the `gemspec` in the `Gemfile`.
* Use [Appraisal](http://github.com/thoughtbot/appraisal) to test the gem
  against multiple versions of gem dependencies (such as Rails in a Rails
  engine).
* Use [Bundler](http://gembundler.com/) to manage the gem's dependencies.
* Use [Travis CI](http://travisci.org) for Continuous Integration, indicators
  showing whether GitHub pull requests can be merged, and to test against
  multiple Ruby versions.

Rails
-----

* Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
* Avoid instantiating more than one object in controllers.
* Avoid naming methods after database columns in the same class.
* Don't change a migration after it has been merged into master if the desired
  change can be solved with another migration.
* Don't reference a model class directly from a view.
* Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside
  of models.
* If there are default values, set them in migrations.
* Keep `db/schema.rb` or `db/development_structure.sql` under version control.
* Use only one instance variable in each view.
* Use SQL, not `ActiveRecord` models, in migrations.
* Use the [`.ruby-version`](https://gist.github.com/fnichol/1912050) file
  convention to specify the Ruby version and patch level for a project.
* Use `_url` suffixes for named routes in mailer views and
  [redirects](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30).
  Use `_path` suffixes for named routes everywhere else.
* Validate the associated `belongs_to` object (`user`), not the database
  column (`user_id`).

Testing
-------

* Avoid `its`, `let`, `let!`, `specify`, `before`, and `subject` in RSpec.
* Avoid using instance variables in tests.
* Don't test private methods.
* Use [stubs and spies](http://goo.gl/EciDJ) (not mocks) in isolated tests.
* Use a single level of abstraction within scenarios.
* Use an `it` example or test method for each execution path through the method.
* Use [assertions about state] for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.

[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51

Bundler
-------

* Specify the [Ruby version](http://gembundler.com/v1.3/gemfile_ruby.html) to be
  used on the project in the `Gemfile`.
* Use a [pessimistic
  version](http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle#pessimistic-version)
  in the `Gemfile` for gems that follow semantic versioning, such as `rspec`,
  `factory_girl`, and `capybara`.
* Use a
  [versionless](http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle#versionless)
  `Gemfile` declarations for gems that are safe to update often, such as pg, thin,
  and debugger.
* Use an [exact
  version](http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle#exact-version)
  in the `Gemfile` for fragile gems, such as Rails.

Postgres
--------

* Avoid multicolumn indexes in Postgres. It [combines multiple
  indexes](http://goo.gl/pY3Po) efficiently. Optimize later with a [compound
  index if needed](http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html).
* Consider a [partial index](http://goo.gl/YC8Jt) for queries on booleans.
* Constrain most columns as [`NOT NULL`](http://goo.gl/0GeBr).

Background Jobs
---------------

* Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.

Email
-----

* Use [SendGrid](http://goo.gl/Kxu9W) or [Amazon SES](http://goo.gl/A5jAA) to
  deliver email in staging and production environments.
* Use a tool like [mail_view](http://goo.gl/HhX8y) to look at each created or
  updated mailer view before merging.

Testing
-------

* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
* Test background jobs with a [`Delayed::Job` matcher](http://goo.gl/bzBlN).
* Use a [Fake](http://goo.gl/YR7Hh) to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT](http://goo.gl/r5Ti2) methods in expectations when possible.

JavaScript
----------

* Use CoffeeScript.

HTML
----

* Don't use a reset button for forms.
* Prefer cancel links to cancel buttons.

CSS
---

* Use Sass.

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE6 or IE7.

Objective-C
-----------

* Prefer categories on `Foundation` classes to helper methods.
* Prefer string constants to literals when providing keys or key paths to methods.

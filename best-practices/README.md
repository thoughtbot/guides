Best Practices
==============

A guide for programming well.

General
-------

* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional].
* [Keep the code simple].

[Exceptions should be exceptional]: http://www.readability.com/~/yichhgvu
[Keep the code simple]: http://www.readability.com/~/ko2aqda2

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
* [Tell, don't ask].

[Tell, don't ask]: http://robots.thoughtbot.com/post/27572137956/tell-dont-ask

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
* Use [Appraisal] to test the gem against multiple versions of gem dependencies
  (such as Rails in a Rails engine).
* Use [Bundler] to manage the gem's dependencies.
* Use [Travis CI] for Continuous Integration, indicators showing whether GitHub
  pull requests can be merged, and to test against multiple Ruby versions.

[Appraisal]: https://github.com/thoughtbot/appraisal
[Bundler]: http://bundler.io
[Travis CI]: http://travis-ci.org

Rails
-----

* Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
* Avoid instantiating more than one object in controllers.
* Avoid naming methods after database columns in the same class.
* Don't change a migration after it has been merged into master if the desired
  change can be solved with another migration.
* Don't reference a model class directly from a view.
* Don't use instance variables in partials. Pass local variables to partials
  from view templates.
* Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside of
  models.
* If there are default values, set them in migrations.
* Keep `db/schema.rb` or `db/development_structure.sql` under version control.
* Use only one instance variable in each view.
* Use SQL, not `ActiveRecord` models, in migrations.
* Use the [`.ruby-version`] file convention to specify the Ruby version and
  patch level for a project.
* Use `_url` suffixes for named routes in mailer views and [redirects].  Use
  `_path` suffixes for named routes everywhere else.
* Validate the associated `belongs_to` object (`user`), not the database column
  (`user_id`).
* Use ERB for HTML templates.

[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30

Testing
-------

* Avoid `any_instance` in rspec-mocks and mocha. Prefer [dependency injection].
* Avoid `its`, `let`, `let!`, `specify`, `before`, and `subject` in RSpec.
* Avoid using instance variables in tests.
* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
* Don't test private methods.
* Test background jobs with a [`Delayed::Job` matcher].
* Use [stubs and spies] (not mocks) in isolated tests.
* Use a single level of abstraction within scenarios.
* Use an `it` example or test method for each execution path through the method.
* Use [assertions about state] for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.
* Use a [Fake] to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT] methods in expectations when possible.

[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html

Bundler
-------

* Specify the [Ruby version] to be used on the project in the `Gemfile`.
* Use a [pessimistic version] in the `Gemfile` for gems that follow semantic
  versioning, such as `rspec`, `factory_girl`, and `capybara`.
* Use a [versionless] `Gemfile` declarations for gems that are safe to update
  often, such as pg, thin, and debugger.
* Use an [exact version] in the `Gemfile` for fragile gems, such as Rails.

[Ruby version]: http://bundler.io/v1.3/gemfile_ruby.html
[exact version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[pessimistic version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[versionless]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle

Postgres
--------

* Avoid multicolumn indexes in Postgres. It [combines multiple indexes]
  efficiently. Optimize later with a [compound index] if needed.
* Consider a [partial index] for queries on booleans.
* Constrain most columns as [`NOT NULL`].
* [Index foreign keys].

[`NOT NULL`]: http://www.postgresql.org/docs/9.1/static/ddl-constraints.html#AEN2444
[combines multiple indexes]: http://www.postgresql.org/docs/9.1/static/indexes-bitmap-scans.html
[compound index]: http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html
[partial index]: http://www.postgresql.org/docs/9.1/static/indexes-partial.html
[Index foreign keys]: https://tomafro.net/2009/08/using-indexes-in-rails-index-your-associations

Background Jobs
---------------

* Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.

Email
-----

* Use [SendGrid] or [Amazon SES] to deliver email in staging and production
  environments.
* Use a tool like [MailView] to look at each created or updated mailer view
  before merging.

[Amazon SES]: http://robots.thoughtbot.com/post/3105121049/delivering-email-with-amazon-ses-in-a-rails-3-app
[SendGrid]: https://devcenter.heroku.com/articles/sendgrid
[MailView]: https://github.com/37signals/mail_view

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

Sass
----

* Use `image-url` and `font-url`, not `url`, so the asset pipeline will re-write
  the correct paths to assets.

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE6 or IE7.

Objective-C
-----------

* Prefer categories on `Foundation` classes to helper methods.
* Prefer string constants to literals when providing keys or key paths to methods.

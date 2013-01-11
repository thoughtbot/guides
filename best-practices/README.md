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
* Prefer small methods. One line is best.
* Prefer small objects with a single, well-defined responsibility.
* [Tell, don't ask](http://goo.gl/Ztawt).

Ruby
----

* Avoid optional parameters. Does the method do too much?
* Avoid monkey-patching.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `private` when indicating scope. Use `protected` only with comparison
  methods like `def ==(other)`, `def <(other)`, and `def >(other)`.
* Check a .ruby-version file into the repository to indicate the expected ruby
  version to run the project with.  Most version tools (rvm, rbenv, etc) will
  support this file and format.

Rails
-----

* Don't change a migration after it has been merged into master if the desired
  change can be solved with another migration.
* Validate the associated `belongs_to` object (`user`), not the database
  column (`user_id`).
* Avoid exact version numbers in `Gemfile` except for non-framework gems.

Bundler
-------

* Use the project's Gemfile to specify the
  [Ruby version](http://gembundler.com/man/gemfile.5.html#RUBY-ruby-)
* Use an [exact version](http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle#exact-version)
  in the `Gemfile` for fragile gems, such as Rails.
* Use a [pessimistic version](http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle#pessimistic-version)
  in the 'Gemfile' for gems that follow semantic
  versioning, such as rspec, factory_girl, and capybara.
* Use [versionless](http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle#versionless)
  `Gemfile` declarations for gems that are safe to update often, such as pg,
  thin, and debugger.

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

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE6.

Objective-C
-----------

* Prefer categories on `Foundation` classes to helper methods.
* Prefer string constants to literals when providing keys or key paths to methods.

Best Practices
==============

A guide for programming well.

General
-------

* These are not to be blindly followed; strive to understand these and ask
  when in doubt.
* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* Exceptions should be exceptional.
* Keep the code simple.

Object-Oriented Design
----------------------

* Avoid global variables.
* Avoid long parameter lists.
* Limit dependencies of an object (entities an object depends on).
* Limit an object's dependents (entities that depend on an object).
* Prefer composition over inheritance.
* Prefer small methods. Between one and five lines is best.
* Prefer small classes with a single, well-defined responsibility. When a
  class exceeds 100 lines, it may be doing too many things.
* [Tell, don't ask].

[Tell, don't ask]: https://robots.thoughtbot.com/tell-dont-ask

Ruby
----

* Avoid optional parameters. Does the method do too much?
* Avoid monkey-patching.
* Generate necessary [Bundler binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `private` when indicating scope. Use `protected` only with comparison
  methods like `def ==(other)`, `def <(other)`, and `def >(other)`.

[Bundler binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs

Ruby Gems
---------

* Declare dependencies in the `<PROJECT_NAME>.gemspec` file.
* Reference the `gemspec` in the `Gemfile`.
* Use [Appraisal] to test the gem against multiple versions of gem dependencies
  (such as Rails in a Rails engine).
* Use [Bundler] to manage the gem's dependencies.
* Use continuous integration (CI) to show build status within the code review
  process and to test against multiple Ruby versions.

[Appraisal]: https://github.com/thoughtbot/appraisal
[Bundler]: http://bundler.io

Rails
-----

* [Add foreign key constraints][fkey] in migrations.
* Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
* Avoid instantiating more than one object in controllers.
* Avoid naming methods after database columns in the same class.
* Don't change a migration after it has been merged into master if the desired
  change can be solved with another migration.
* Don't reference a model class directly from a view.
* Don't return false from `ActiveModel` callbacks, but instead raise an
  exception.
* Don't use instance variables in partials. Pass local variables to partials
  from view templates.
* Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside of
  models.
* Generate necessary [Spring binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
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
* Use `db/seeds.rb` for data that is required in all environments.
* Use `dev:prime` rake task for development environment seed data.
* Prefer `cookies.signed` over `cookies` to [prevent tampering].
* Prefer `Time.current` over `Time.now`
* Prefer `Date.current` over `Date.today`
* Prefer `Time.zone.parse("2014-07-04 16:05:37")` over `Time.parse("2014-07-04 16:05:37")`
* Use `ENV.fetch` for environment variables instead of `ENV[]`so that unset
  environment variables are detected on deploy.
* [Use blocks][date-block] when declaring date and time attributes in FactoryBot factories.
* Use `touch: true` when declaring `belongs_to` relationships.

[date-block]: /best-practices/samples/ruby.rb#L10
[fkey]: http://robots.thoughtbot.com/referential-integrity-with-foreign-keys
[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30
[Spring binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
[prevent tampering]: http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html
[class constant in association]: https://github.com/thoughtbot/guides/blob/master/style/rails/sample.rb

Testing
-------

* Avoid `any_instance` in rspec-mocks and mocha. Prefer [dependency injection].
* Avoid `its`, `specify`, and `before` in RSpec.
* Avoid `let` (or `let!`) in RSpec. Prefer extracting helper methods,
  but do not re-implement the functionality of `let`. [Example][avoid-let].
* Avoid using `subject` explicitly *inside of an* RSpec `it` block.
  [Example][subject-example].
* Avoid using instance variables in tests.
* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
* Don't test private methods.
* Test background jobs with a [`Delayed::Job` matcher].
* Use [stubs and spies] \(not mocks\) in isolated tests.
* Use a single level of abstraction within scenarios.
* Use an `it` example or test method for each execution path through the method.
* Use [assertions about state] for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.
* Use a [Fake] to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT] methods in expectations when possible.

[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[subject-example]: ../style/testing/unit_test_spec.rb
[avoid-let]: ../style/testing/avoid_let_spec.rb
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html

Bundler
-------

* Specify the [Ruby version] to be used on the project in the `Gemfile`.
* Use a [pessimistic version] in the `Gemfile` for gems that follow semantic
  versioning, such as `rspec`, `factory_bot`, and `capybara`.
* Use a [versionless] `Gemfile` declarations for gems that are safe to update
  often, such as pg, thin, and debugger.
* Use an [exact version] in the `Gemfile` for fragile gems, such as Rails.

[Ruby version]: http://bundler.io/v1.3/gemfile_ruby.html
[exact version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[pessimistic version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[versionless]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle

Relational Databases
--------------------

* [Index foreign keys].
* Constrain most columns as [`NOT NULL`].
* In a SQL view, only select columns you need (i.e., avoid `SELECT table.*`).
* Use an `ORDER BY` clause on queries where the results will be displayed to a
  user, as queries without one may return results in a changing, arbitrary
  order.

[Index foreign keys]: https://tomafro.net/2009/08/using-indexes-in-rails-index-your-associations
[`NOT NULL`]: http://www.postgresql.org/docs/9.1/static/ddl-constraints.html#AEN2444

Postgres
--------

* Avoid multicolumn indexes. Postgres [combines multiple indexes] efficiently.
  Optimize later with a [compound index] if needed.
* Consider a [partial index] for queries on booleans.
* Avoid JSONB columns unless you have a strong reason to store an entire JSON
  document from an external source.

[combines multiple indexes]: http://www.postgresql.org/docs/9.1/static/indexes-bitmap-scans.html
[compound index]: http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html
[partial index]: http://www.postgresql.org/docs/9.1/static/indexes-partial.html

Email
-----

* Use [SendGrid] or [Amazon SES] to deliver email in staging and production
  environments.
* Use a tool like [ActionMailer Preview] to look at each created or updated mailer view
  before merging. Use [MailView] gem unless using Rails version 4.1.0 or later.

[Amazon SES]: http://robots.thoughtbot.com/post/3105121049/delivering-email-with-amazon-ses-in-a-rails-3-app
[SendGrid]: https://devcenter.heroku.com/articles/sendgrid
[MailView]: https://github.com/37signals/mail_view
[ActionMailer Preview]: http://api.rubyonrails.org/v4.1.0/classes/ActionMailer/Base.html#class-ActionMailer::Base-label-Previewing+emails

Web
---

* Avoid rendering delays caused by synchronous loading.
* Use HTTPS instead of HTTP when linking to assets.
* Prefer using a UTF-8 charset

JavaScript
----------

* Use the latest stable JavaScript syntax with a transpiler, such as [babel].
* Include a `to_param` or `href` attribute when serializing ActiveRecord models,
  and use that when constructing URLs client side, rather than the ID.
* Prefer `data-*` attributes over `id` and `class` attributes when targeting
  HTML elements. #462
* Avoid targeting HTML elements using classes intended for styling
  purposes. #462
* Use [Prettier] to ensure consistent formatting across the codebase. Run
  Prettier during CI and, if any files would be changed, fail the build.

[babel]: https://babeljs.io/
[Prettier]: https://prettier.io/

HTML
----

* Use lowercase text for elements and attributes
* Use double quotes to wrap element attributes
* Use closing tags for all [normal elements][normal-elements]
* Prefer a HTML5 doctype
* Ensure elements are scoped properly
  * Elements such as `<title>` and `<meta>` must be placed within the page's 
    `<head>` element
  * Elements such as `<p>`, `<nav>`, `<div>`, etc. should be placed within the 
    page's `<body>` element
* Ensure `id`s are unique
* Prefer appending attribute values instead of declaring redundant attribute names
  * For example, if adding a class of `c-card--featured`, add it to the existing
    class declaration (`class="c-card c-card--featured"`, not 
    `class="c-card" class="c-card--featured"`)
* Avoid using emoji and other exotic characters as values for attributes such as
  `class`, `id`, `data`, and `aria-*`.
* Avoid restricting viewport zooming
* Ensure [parent elements contain no more than 60 child elements][excessive-dom-size]
* Use `<button>` elements instead of `<a>` elements for actions.
  * Use `type="button"` for button elements used outside of forms to prevent the
    browser from trying to submit form data
  * Use a `href` attribute for `<a>` elements with a valid location
* Ensure heading elements are used to section content, and heading levels are 
  not skipped

[excessive-dom-size]: https://developers.google.com/web/tools/lighthouse/audits/dom-size
[normal-elements]: https://html.spec.whatwg.org/multipage/syntax.html#normal-elements

CSS
---

* Document the project's CSS architecture (the README, component library or
  style guide are good places to do this), including things such as:
  * Organization of stylesheet directories and Sass partials
  * Selector naming convention
  * Code linting tools and configuration
  * Browser support
* Use Sass.
* Use [Autoprefixer][autoprefixer] to generate vendor prefixes based on the
  project-specific browser support that is needed.
* Prefer `overflow: auto` to `overflow: scroll`, because `scroll` will always
  display scrollbars outside of macOS, even when content fits in the container.
* [Create breakpoints][breakpoints] when the content "breaks," and is awkward or 
  difficult to read,
  * Avoid creating breakpoints that target specific devices
  * Prefer `em` units instead of `px` for breakpoint values
  * Start with the smallest viewport size and work upwards using 
    `min-width`/`min-height`
* Use [double colon syntax][pseudo-element-syntax] for pseudo-elements

[autoprefixer]: https://github.com/postcss/autoprefixer
[breakpoints]: http://bradfrost.com/blog/post/7-habits-of-highly-effective-media-queries/
[pseudo-element-syntax]: https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements#Syntax

Sass
----

* When using [sass-rails], use the provided [asset-helpers][asset-helpers]
  (e.g. `image-url` and `font-url`), so that Rails' Asset Pipeline will re-write
  the correct paths to assets.
* Prefer mixins to `@extend`.
* Use maps and variables to codify and centralize breakpoint values
  * Prefer abstract names such as `small`, `medium`, `large`, etc. instead of 
    specific devices
  * Nest breakpoints inside of the relevant selector
  * If a component needs a specific breakpoint to work, keep it with the 
    relevant component partial. If other components need the same value, 
    integrate it into the centralized breakpoint list

[sass-rails]: https://github.com/rails/sass-rails
[asset-helpers]: https://github.com/rails/sass-rails#asset-helpers

Browsers
--------

* Avoid supporting versions of Internet Explorer before IE11.

Objective-C
-----------

* Setup new projects using [Liftoff](https://github.com/thoughtbot/liftoff) and
  follow provided directory structure.
* Prefer categories on `Foundation` classes to helper methods.
* Prefer string constants to literals when providing keys or key paths to methods.

Shell
-----

* Don't parse the output of `ls`. See [here][parsingls] for details and
  alternatives.
* Don't use `cat` to provide a file on `stdin` to a process that accepts
  file arguments itself.
* Don't use `echo` with options, escapes, or variables (use `printf` for those
  cases).
* Don't use a `/bin/sh` [shebang][] unless you plan to test and run your
  script on at least: Actual Sh, Dash in POSIX-compatible mode (as it
  will be run on Debian), and Bash in POSIX-compatible mode (as it will
  be run on OSX).
* Don't use any non-POSIX [features][bashisms] when using a `/bin/sh`
  [shebang][].
* If calling `cd`, have code to handle a failure to change directories.
* If calling `rm` with a variable, ensure the variable is not empty.
* Prefer "$@" over "$\*" unless you know exactly what you're doing.
* Prefer `awk '/re/ { ... }'` to `grep re | awk '{ ... }'`.
* Prefer `find -exec {} +` to `find -print0 | xargs -0`.
* Prefer `for` loops over `while read` loops.
* Prefer `grep -c` to `grep | wc -l`.
* Prefer `mktemp` over using `$$` to "uniquely" name a temporary file.
* Prefer `sed '/re/!d; s//.../'` to `grep re | sed 's/re/.../'`.
* Prefer `sed 'cmd; cmd'` to `sed -e 'cmd' -e 'cmd'`.
* Prefer checking exit statuses over output in `if` statements (`if grep
  -q ...; `, not `if [ -n "$(grep ...)" ];`).
* Prefer reading environment variables over process output (`$TTY` not
  `$(tty)`, `$PWD` not `$(pwd)`, etc).
* Use `$( ... )`, not backticks for capturing command output.
* Use `$(( ... ))`, not `expr` for executing arithmetic expressions.
* Use `1` and `0`, not `true` and `false` to represent boolean
  variables.
* Use `find -print0 | xargs -0`, not `find | xargs`.
* Use quotes around every `"$variable"` and `"$( ... )"` expression
  unless you want them to be word-split and/or interpreted as globs.
* Use the `local` keyword with function-scoped variables.
* Identify common problems with [shellcheck][].

[shebang]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[parsingls]: http://mywiki.wooledge.org/ParsingLs
[bashisms]: http://mywiki.wooledge.org/Bashism
[shellcheck]: http://www.shellcheck.net/

Bash
----

In addition to Shell best practices,

* Prefer `${var,,}` and `${var^^}` over `tr` for changing case.
* Prefer `${var//from/to}` over `sed` for simple string replacements.
* Prefer `[[` over `test` or `[`.
* Prefer process substitution over a pipe in `while read` loops.
* Use `((` or `let`, not `$((` when you don't need the result

Haskell
-------

* Avoid partial functions (`head`, `read`, etc).
* Compile code with `-Wall -Werror`.

Elixir
------

* Avoid macros.

Ember
-----

* Avoid using `$` without scoping to `this.$` in views and components.
* Prefer to make model lookup calls in routes instead of controllers (`find`,
  `findAll`, etc.).
* Prefer adding properties to controllers instead of models.
* Don't use jQuery outside of views and components.
* Prefer to use predefined `Ember.computed.*` functions when possible.
* Use `href="#"` for links that have an action.
* Prefer dependency injection through `Ember.inject` over initializers, globals
  on window, or namespaces. ([sample][inject])
* Prefer sub-routes over maintaining state.
* Prefer explicit setting of boolean properties over `toggleProperty`.
* Prefer testing your application with [QUnit][ember-test-guides].

[ember-test-guides]: https://guides.emberjs.com/v2.2.0/testing/

Testing

* Prefer `findWithAssert` over `find` when fetching an element you expect to
  exist

[inject]: samples/ember.js#L1-L11

Angular
-------

* [Avoid manual dependency annotations][annotations]. Disable mangling or use a
  [pre-processor][ngannotate] for annotations.
* Prefer `factory` to `service`. If you desire a singleton, wrap the singleton
  class in a factory function and return a new instance of that class from the
  factory.
* Prefer the `translate` directive to the `translate` filter for [performance
  reasons][angular-translate].
* Don't use the `jQuery` or `$` global. Access jQuery via `angular.element`.

[annotations]: http://robots.thoughtbot.com/avoid-angularjs-dependency-annotation-with-rails
[ngannotate]: https://github.com/kikonen/ngannotate-rails
[angular-translate]: https://github.com/angular-translate/angular-translate/wiki/Getting-Started#using-translate-directive

Ruby JSON APIs
--------------

* Review the recommended practices outlined in Heroku's [HTTP API Design Guide]
  before designing a new API.
* Write integration tests for your API endpoints. When the primary consumer of
  the API is a JavaScript client maintained within the same code base as the
  provider of the API, write [feature specs]. Otherwise write [request specs].

[HTTP API Design Guide]: https://github.com/interagent/http-api-design
[oj]: https://github.com/ohler55/oj
[feature specs]: https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec
[request specs]: https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec

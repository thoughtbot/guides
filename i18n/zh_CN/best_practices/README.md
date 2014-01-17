最佳实践
==============

为了更好的编程。

通用
-------

* 不要重复内建库包含的功能。
* 不要忽视异常或者容忍失败。
* 不要写一些猜测未来功能的代码。
* [异常应该被特殊对待].
* [保持代码的简单].

[异常应该被特殊对待]: http://www.readability.com/~/yichhgvu
[保持代码的简单]: http://www.readability.com/~/ko2aqda2

面向对象设计
----------------------

* 避免全局变量。
* 避免长参数列表。
* 限制一个对象的合作者（这个对象依赖的那些实体）。
* 限制一个对象的依赖（依赖于这个对象的那些实体）。
* 组合优于继承。
* 小方法优于大方法。一到五行最好。
* 单一明确职责的对象优于复杂的对象。当一个对象超过100行，那么可能它做的事就太多了。
* [直接告诉对象要做什么，而不是去询问对象该做什么].

[直接告诉对象要做什么，而不是去询问对象该做什么]: http://robots.thoughtbot.com/post/27572137956/tell-dont-ask

Ruby
----

* 避免可选参数。方法是不是做的太多了？
* 避免猴子补丁（ monkey-patching）。
* 在设计被多个模型中共享的功能时，类优于模块。
* 在标识方法的作用范围的时候， `private`优于`protected`。  `protected`只被用来标识比较方法，类似于：`def ==(other)`, `def <(other)`, 和 `def >(other)`.

Ruby Gems
---------

* 在`<PROJECT_NAME>.gemspec`文件中声明依赖。
* `gemspec`引用放到`Gemfile`里。
* 用[Appraisal]去测试一个gem中依赖的gem的版本（例如Rails引擎中的Rails版本检查）。
* 用[Bundler]去管理gem的依赖。
* 用[Travis CI]做持续集成，指示Github的pull请求是否可以合并，以及对多个Ruby版本的测试。

[Appraisal]: https://github.com/thoughtbot/appraisal
[Bundler]: http://bundler.io
[Travis CI]: http://travis-ci.org

Rails
-----

* 避免绕过一些方法的验证，像`save(validate: false)`,
  `update_attribute`, 和 `toggle`.
* 避免在congtrollers里面实例化多个对象。
* Avoid naming methods after database columns in the same class.
* 在一个数据迁移文件被合并到主分支（master）之后就不要再去改变它了，如果需要改变的话，就用一个新的数据迁移文件去解决。
* 不要直接在view中去引用一个model类。
* 不要在partials里面用实例变量，要从view模板里传递本地变量给partials。
* 不要在models外使用SQL或SQL片段 (`where('inviter_id IS NOT NULL')`)。
* 请把默认值设置在迁移文件中（migrations）。
* 保持`db/schema.rb`或 `db/development_structure.sql`在版本控制下。
* 在每一个view中仅使用一个实例变量。
* 在数据迁移文件中要使用SQL, 而不是用`ActiveRecord` models。
* 使用[`.ruby-version`]文件约定项目的Ruby版本和patch level。
* 在邮件视图里和[跳转请求(redirects)]中使用`_url`后缀的命名路由，在其他任何地方均使用`_path`后缀的命名路由。
* 验证`belongs_to`关联应该使用对象(`user`), 而不是数据库的列名(`user_id`)。
* 使用`db/seeds.rb`去设置整个环境中的通用数据。 
* 使用`dev:prime`rake任务去设置开发环境下的seed数据。

[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[跳转请求(redirects)]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30

Testing
-------

* 在rspec-mocks和mocha中避免`any_instance`的使用，优先使用[依赖注入（dependency injection）].
* 在RSpec中避免使用`its`, `let`, `let!`, `specify`, `before`, 和 `subject`。
* 避免在测试中使用实例变量。
* 使用`WebMock.disable_net_connect!`去禁用真正的外部HTTP请求。
* 不要测试私有方法。
* 使用[`Delayed::Job` matcher]去测试后台任务。
* 在独立的测试中使用[stubs和spies] \(不是mocks\)。
* Use a single level of abstraction within scenarios.
* Use an `it` example or test method for each execution path through the method.
* Use [assertions about state] for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.
* Use a [Fake] to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT] methods in expectations when possible.

[依赖注入（dependency injection）]: http://en.wikipedia.org/wiki/Dependency_injection
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs和spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
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

Shell
-----

* Don't parse the output of `ls`. See [here][parsingls] for details and 
  alternatives.
* Don't use `cat` to provide a file on `stdin` to a process that accepts 
  file arguments itself.
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
* Prefer `printf` over `echo`.
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

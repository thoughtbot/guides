# Ruby

[Sample 1](sample_1.rb) [Sample 2](sample_2.rb)

- Use [standard]
- Avoid conditional modifiers (lines that end with conditionals). [36491dbb9]
- Avoid multiple assignments per line (`one, two = 1, 2`). [#109]
- Avoid organizational comments (`# Validations`). [#63]
- Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches. [36491dbb9]
- Avoid bang (!) method names. Prefer descriptive names. [#122]
- Name variables created by a factory after the factory (`user_factory` creates
  `user`).
- Prefer nested class and module definitions over the shorthand version
  [Example](/ruby/sample_1.rb#L103) [#332]
- Prefer `detect` over `find`. [0d819844]
- Prefer `select` over `find_all`. [0d819844]
- Prefer `map` over `collect`. [0d819844]
- Prefer `reduce` over `inject`. [#237]
- Prefer `&:method_name` to `{ |item| item.method_name }` for simple method
  calls. [#183]
- Use `_` for unused block parameters. [0d819844]
- Prefix unused variables or parameters with underscore (`_`). [#335]
- Suffix variables holding a factory with `_factory` (`user_factory`).
- Use a leading underscore when defining instance variables for memoization.
  [#373]
- Use `%()` for single-line strings containing double-quotes that require
  interpolation. [36491dbb9]
- Use `?` suffix for predicate methods. [0d819844]
- Use `def self.method`, not `class << self`. [40090e22]
- Use `def` with parentheses when there are arguments. [36491dbb9]
- Use heredocs for multi-line strings. [36491dbb9]
- Order class methods above instance methods. [#320]
- Prefer method invocation over instance variables. [#331]
- Avoid optional parameters. Does the method do too much?
- Avoid monkey-patching.
- Generate necessary [Bundler binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
- Prefer classes to modules when designing functionality that is shared by
  multiple models.
- Prefer `private` when indicating scope. Use `protected` only with comparison
  methods like `def ==(other)`, `def <(other)`, and `def >(other)`.

[standard]: https://github.com/testdouble/standard
[#63]: https://github.com/thoughtbot/guides/pull/63
[#109]: https://github.com/thoughtbot/guides/pull/109
[#122]: https://github.com/thoughtbot/guides/pull/122
[#183]: https://github.com/thoughtbot/guides/pull/183
[#237]: https://github.com/thoughtbot/guides/pull/237
[#320]: https://github.com/thoughtbot/guides/pull/320
[#331]: https://github.com/thoughtbot/guides/pull/331
[#332]: https://github.com/thoughtbot/guides/pull/332
[#335]: https://github.com/thoughtbot/guides/pull/335
[#373]: https://github.com/thoughtbot/guides/pull/373
[0d819844]: https://github.com/thoughtbot/guides/commit/0d819844
[36491dbb9]: https://github.com/thoughtbot/guides/commit/36491dbb9
[40090e22]: https://github.com/thoughtbot/guides/commit/40090e22
[bundler binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs

## Bundler

- Specify the [Ruby version] to be used on the project in the `Gemfile`.
- Use a [pessimistic version] in the `Gemfile` for gems that follow semantic
  versioning, such as `rspec`, `factory_bot`, and `capybara`.
- Use a [versionless] `Gemfile` declarations for gems that are safe to update
  often, such as pg, thin, and debugger.
- Use an [exact version] in the `Gemfile` for fragile gems, such as Rails.

[ruby version]: http://bundler.io/v1.3/gemfile_ruby.html
[exact version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[pessimistic version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[versionless]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle

## Ruby Gems

- Declare dependencies in the `<PROJECT_NAME>.gemspec` file.
- Reference the `gemspec` in the `Gemfile`.
- Use [Appraisal] to test the gem against multiple versions of gem dependencies
  (such as Rails in a Rails engine).
- Use [Bundler] to manage the gem's dependencies.
- Use continuous integration (CI) to show build status within the code review
  process and to test against multiple Ruby versions.

[appraisal]: https://github.com/thoughtbot/appraisal
[bundler]: http://bundler.io

## Ruby JSON APIs

- Review the recommended practices outlined in Heroku's [HTTP API Design Guide]
  before designing a new API.
- Write integration tests for your API endpoints. When the primary consumer of
  the API is a JavaScript client maintained within the same code base as the
  provider of the API, write [feature specs]. Otherwise write [request specs].

[http api design guide]: https://github.com/interagent/http-api-design
[oj]: https://github.com/ohler55/oj
[feature specs]: https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec
[request specs]: https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec

## How to...

- [Release a Ruby gem](./how-to/release_a_ruby_gem.md)

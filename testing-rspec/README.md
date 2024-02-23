# Testing with RSpec

- Avoid the `private` keyword in specs.
- Avoid checking boolean equality directly. Instead, write predicate methods and
  use appropriate matchers. [Example](predicate_tests_spec.rb).
- Prefer `eq` to `==` in RSpec.
- Separate setup, exercise, verification, and teardown phases with newlines.
- Use RSpec's [`expect` syntax].
- Use RSpec's [`allow` syntax] for method stubs.
- Use `not_to` instead of `to_not` in RSpec expectations.
- Prefer the `have_css` matcher to the `have_selector` matcher in Capybara
  assertions.
- Avoid `any_instance` in `rspec-mocks` and `mocha`; Prefer [dependency
  injection].
- Avoid `its`, `specify`, and `before` in RSpec.
- Avoid `let` (or `let!`) in RSpec. Prefer extracting helper methods, but do not
  re-implement the functionality of `let`.
  [Example](/testing-rspec/avoid_let_spec.rb).
- Avoid using `subject` explicitly _inside of an_ RSpec `it` block.
  [Example](/testing-rspec/unit_test_spec.rb).
- Avoid using instance variables in tests.
- Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
- Don't test private methods.
- Test background jobs with a [`Delayed::Job` matcher].
- Use [stubs and spies] \(not mocks\) in isolated tests.
- Use a single level of abstraction within `it` examples.
- Use an `it` example or test method for each execution path through the method.
- Use [assertions about state] for incoming messages.
- Use stubs and spies to assert you sent outgoing messages.
- Use a [Fake] to stub requests to external services.
- Use integration tests to execute the entire app.
- Use non-[SUT] methods in expectations when possible.

[`expect` syntax]: http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
[`allow` syntax]: https://github.com/rspec/rspec-mocks#method-stubs
[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[`delayed::job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://thoughtbot.com/blog/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[fake]: http://thoughtbot.com/blog/fake-it
[sut]: http://xunitpatterns.com/SUT.html

## Acceptance Tests

[Sample](acceptance_test_spec.rb)

- Use the most specific [selectors][] available.
- Don't locate elements with CSS selectors or `[id]` attributes.
- Use [accessible names and descriptions][names_and_descriptions] to locate
  elements, to interact with form controls, buttons, and links, or to scope
  blocks of actions and assertions.
- Avoid `it` block descriptions that add no information, such as "successfully."
- Avoid `it` block descriptions that repeat the top-level `describe` block
  description.
- Place helper methods for system specs directly in a top-level `System` module.
- Use names like `ROLE_ACTION_spec.rb`, such as `user_changes_password_spec.rb`,
  for system spec file names.
- Use only one `describe` block per system spec file.
- Use `it` block descriptions that describe the success and failure paths.
- Use spec/system directory to store system specs.
- Use spec/support/system for support code related to system specs.
- Don't assert an element's state with `[class]` or `[data-*]` attributes.
- Use [WAI-ARIA States and Properties][] (i.e. `[role]` or `[aria-*]`
  attributes) when asserting an element's state.
- Prefer assertions about implicit semantics and built-in attributes (e.g. an
  `<input type="checkbox">` element and `[checked]`, an `<option>` element and
  `[selected]`) over WAI-ARIA States and Properties (e.g. a `<button>` element and
  `[aria-checked="true"]`, a `<div>` element and `[aria-selected="true"]`).

> system specs were previously called feature specs and lived in `spec/features`

[selectors]: https://rubydoc.info/github/teamcapybara/capybara/master/Capybara/Selector
[names_and_descriptions]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/
[WAI-ARIA States and Properties]: https://www.w3.org/TR/wai-aria/#states_and_properties

## Factories

- Order `factories.rb` contents: sequences, traits, factory definitions.
- Order factory attributes: implicit attributes, explicit attributes, child
  factory definitions. Each section's attributes are alphabetical.
- Order factory definitions alphabetically by factory name.

## Unit Tests

[Sample](unit_test_spec.rb)

- Don't prefix `it` block descriptions with `should`. Use [Imperative mood]
  instead.
- Use `subject` blocks to define objects for use in one-line specs.
  [Example](unit_test_spec.rb#6).
- Put one-liner specs at the beginning of the outer `describe` blocks.
- Use `.method` to describe class methods and `#method` to describe instance
  methods.
- Use `context` to describe testing preconditions.
- Use `describe '#method_name'` to group tests by method-under-test
- Use a single, top-level `describe ClassName` block.
- Order validation, association, and method tests in the same order that they
  appear in the class.

[imperative mood]: http://en.wikipedia.org/wiki/Imperative_mood

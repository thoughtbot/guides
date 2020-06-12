# Testing with RSpec

- Avoid the `private` keyword in specs.
- Avoid checking boolean equality directly. Instead, write predicate methods and use appropriate matchers.
  [Example][predicate-example].
- Prefer `eq` to `==` in RSpec.
- Separate setup, exercise, verification, and teardown phases with newlines.
- Use RSpec's [`expect` syntax].
- Use RSpec's [`allow` syntax] for method stubs.
- Use `not_to` instead of `to_not` in RSpec expectations.
- Prefer the `have_css` matcher to the `have_selector` matcher in Capybara assertions.
- Avoid `any_instance` in rspec-mocks and mocha. Prefer [dependency injection].
- Avoid `its`, `specify`, and `before` in RSpec.
- Avoid `let` (or `let!`) in RSpec. Prefer extracting helper methods,
  but do not re-implement the functionality of `let`. [Example][avoid-let].
- Avoid using `subject` explicitly *inside of an* RSpec `it` block.
  [Example][subject-example].
- Avoid using instance variables in tests.
- Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
- Don't test private methods.
- Test background jobs with a [`Delayed::Job` matcher].
- Use [stubs and spies] \(not mocks\) in isolated tests.
- Use a single level of abstraction within scenarios.
- Use an `it` example or test method for each execution path through the method.
- Use [assertions about state] for incoming messages.
- Use stubs and spies to assert you sent outgoing messages.
- Use a [Fake] to stub requests to external services.
- Use integration tests to execute the entire app.
- Use non-[SUT] methods in expectations when possible.


[`expect` syntax]: http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
[`allow` syntax]: https://github.com/rspec/rspec-mocks#method-stubs
[predicate-example]: predicate_tests_spec.rb
[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[subject-example]: ../style/testing/unit_test_spec.rb
[avoid-let]: ../style/testing/avoid_let_spec.rb
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html

## Acceptance Tests

[Sample](acceptance_test_spec.rb)

- Avoid scenario titles that add no information, such as "successfully."
- Avoid scenario titles that repeat the feature title.
- Place helper methods for feature specs directly in a top-level `Features` module.
- Use Capybara's `feature/scenario` DSL.
- Use names like `ROLE_ACTION_spec.rb`, such as `user_changes_password_spec.rb`, for feature spec file names.
- Use only one `feature` block per feature spec file.
- Use scenario titles that describe the success and failure paths.
- Use spec/features directory to store feature specs.
- Use spec/support/features for support code related to feature specs.

## Factories

- Order `factories.rb` contents: sequences, traits, factory definitions.
- Order factory attributes: implicit attributes, explicit attributes, child factory definitions. Each section's
  attributes are alphabetical.
- Order factory definitions alphabetically by factory name.
- Use one factories.rb file per project.

## Unit Tests

[Sample](unit_test_spec.rb)

- Don't prefix `it` block descriptions with `should`. Use [Imperative mood] instead.
- Use `subject` blocks to define objects for use in one-line specs. [Example][subject for one-liners example].
- Put one-liner specs at the beginning of the outer `describe` blocks.
- Use `.method` to describe class methods and `#method` to describe instance methods.
- Use `context` to describe testing preconditions.
- Use `describe '#method_name'` to group tests by method-under-test
- Use a single, top-level `describe ClassName` block.
- Order validation, association, and method tests in the same order that they appear in the class.

[imperative mood]: http://en.wikipedia.org/wiki/Imperative_mood
[subject for one-liners example]: unit_test_spec.rb#6

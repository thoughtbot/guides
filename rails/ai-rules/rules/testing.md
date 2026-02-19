# Testing

- Must use TDD. Write tests first and follow red, green, refactor
- Must not use let or before in specs (avoid mystery guests). Do test setup
  within each test.
- Test behaviour, not implementation. Four Phase Test: setup, exercise, verify, teardown.
- Test pyramid: many model/PORO unit specs, some request specs, few system specs.
- Every public method on every model and PORO must have at least one spec.
- Every branch in a conditional must have at least one spec.
- Use `build` / `build_stubbed` over `create` unless persistence is needed.
- Factories: only required attributes with sensible defaults. Start in `spec/factories.rb`.
- Shoulda Matchers for validations and associations.
- WebMock blocks all external HTTP in tests — always stub external requests.
- One `expect` per `it` block. Max 2 levels of context nesting.
- Never test private methods directly. Never stub the system under test.
- Coverage targets: Models 90%, POROs 95%, Controllers 80%, Helpers/Mailers 100%.

# Testing with Jest

See also [Testing](../testing/README.md).

- Use [eslint-plugin-jest] to enforce testing style
- Use [testing-library/jest-dom] and [jest-community/jest-extended] for supplemental expectation matchers
- Use [React Testing Library] for testing [React](../react/README.md) components
- Use [React Hooks Testing Library] for testing [React Hooks]
- Use [User Event] for simulating DOM events on React components under test
- Use [Fishery] for building factories
- Prefer placing test suite files alongside source files (e.g. `Thing.tsx` / `Thing.test.tsx`)
- Prefer writing specific unit tests over [Snapshot Testing]
- Prefer `describe` and `it` blocks over `test` blocks
- Prefer [.resolves/.rejects] over awaiting promises in tests

[eslint-plugin-jest]: https://github.com/jest-community/eslint-plugin-jest
[testing-library/jest-dom]: https://github.com/testing-library/jest-dom
[react testing library]: https://github.com/testing-library/react-testing-library
[react hooks testing library]: https://github.com/testing-library/react-hooks-testing-library
[react hooks]: https://reactjs.org/docs/hooks-overview.html
[user event]: https://github.com/testing-library/user-event
[fishery]: https://github.com/thoughtbot/fishery
[snapshot testing]: https://jestjs.io/docs/en/snapshot-testing
[jest-community/jest-extended]: https://github.com/jest-community/jest-extended
[.resolves/.rejects]: https://jestjs.io/docs/en/asynchronous#resolves--rejects

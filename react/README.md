# React

- Use React in [Strict Mode]
- Use React with [TypeScript](/javascript-typescript/README.md#typescript)
- Avoid nested routing if using [React Router]
- Prefer [Function Components] over [Class Components]
- Prefer keeping a single component in each file
- Use `PascalCase` for component names and their file names
- Use [React Hooks]
- Use pre-built hooks when possible (e.g. [streamich/react-use])
- Use [custom hooks] to encapsulate stateful logic outside a component
- Avoid nesting [Forward Refs]
- Avoid [Higher-Order Components] and [recompose] (see hooks above as an
  alternative)
- Prefer the `children` prop over [render props]
- Prefer using [TypeScript prop interfaces] over [PropTypes]
- Prefer the [short syntax] when using [Fragments]
- Prefer [React Contexts] over [Redux]
- Avoid using indexes as the value for [keys]
- Avoid complex conditionals inside component logic
- Prefer [component composition over component inheritance]

[strict mode]: https://reactjs.org/docs/strict-mode.html
[react hooks]: https://reactjs.org/docs/hooks-overview.html
[custom hooks]: https://reactjs.org/docs/hooks-overview.html#building-your-own-hooks
[streamich/react-use]: https://github.com/streamich/react-use
[function components]: https://reactjs.org/docs/components-and-props.html
[class components]: https://reactjs.org/docs/react-component.html
[forward refs]: https://reactjs.org/docs/forwarding-refs.html
[higher-order components]: https://reactjs.org/docs/higher-order-components.html
[recompose]: https://github.com/acdlite/recompose
[render props]: https://reactjs.org/docs/render-props.html
[typescript prop interfaces]: https://www.typescriptlang.org/docs/handbook/react-&-webpack.html#write-some-code
[proptypes]: https://reactjs.org/docs/typechecking-with-proptypes.html
[short syntax]: https://reactjs.org/docs/fragments.html#short-syntax
[fragments]: https://reactjs.org/docs/fragments.html
[react contexts]: https://reactjs.org/docs/context.html
[redux]: https://react-redux.js.org/
[keys]: https://reactjs.org/docs/lists-and-keys.html#keys
[component composition over component inheritance]: https://reactjs.org/docs/composition-vs-inheritance.html
[react router]: https://reacttraining.com/react-router/

## General Philosophies

- For greenfield React projects we like to use [TypeScript]. TypeScript is a
  typed superset of JavaScript that compiles to plain JavaScript. For a quick
  introduction, check out [TypeScript in 5 minutes].
- When building React apps with TypeScript and Apollo, we've found working in
  [VSCode] to be a mostly-good experience.

[typescript]: https://www.typescriptlang.org/
[typescript in 5 minutes]: https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
[vscode]: https://code.visualstudio.com/

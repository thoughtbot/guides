# JavaScript & TypeScript

## JavaScript

[Sample](sample.js)

- Use [TypeScript](#typescript)
- Use the latest stable JavaScript syntax with a transpiler, such as [babel].
- Use [ESLint] and [Prettier] for auto-formatting and auto-fixing
- Use [Jest] for unit testing
- Prefer ES6 classes over prototypes.
- Use strict equality checks (`===` and `!==`) except when comparing against
  (`null` or `undefined`).
- Prefer [arrow functions] `=>`, over the `function` keyword except when
  defining classes or methods.
- Prefer ES6 [destructuring] over object literal notation.
- Use ES6 [spread] and [rest] operator wherever possible for a cleaner code.
- Use `PascalCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_singleLeadingUnderscore` for private
  variables and functions.
- Prefer [template strings] over string concatenation.
- Prefer promises over callbacks.
- Prefer array functions like `forEach`, `map`, `filter` and `reduce` over `for/while` loops.
- Use `const` for declaring variables that will never be re-assigned, and `let`
  otherwise.
- Avoid `var` to declare variables.
- Prefer [async/await] over traditional promise syntax
- Use the [Nullish coalescing operator] `??`

## TypeScript

- Use TypeScript in [strict mode]
- Prefer [Functions] over [Classes]
- Use `PascalCase` for [Interfaces] and [Type Aliases]
- Use [readonly] properties where applicable
- Use [const Assertions] where applicable to avoid type widening
- Avoid [Mixins]
- Avoid [Decorators]
- Avoid [Overloading Functions]
- Prefer [Optional Properties] in an interface rather than declaring the
  property type as `T | undefined`
- Prefer explicitly defining interfaces over [Extending Interfaces]
- Avoid the use of the [any] type
- Avoid the [Non-null assertion operator]
- Avoid [Type Assertions]
- Prefer the `as`-syntax for [Type Assertions] over the angle-bracket syntax
- Prefer [Type Guards] over [Type Assertions]
- Prefer [Union Types], [Lookup Types], [Mapped Types] and [const Assertions]
  over [Enums]
- Prefer [arrow functions] `=>`, over the `function` keyword except when using
  [Generics]

## Formatting

- Use [Prettier defaults](https://prettier.io/docs/en/options.html) with the following additional configuration (.prettierrc):

  ```json
  {
    "singleQuote": true
  }
  ```
  
  This configuration includes:
  - Use semicolons at the end of each statement ([sample](/javascript/sample.js#L5))
  - Prefer single quotes ([sample](/javascript/sample.js#L11))
  - Use a trailing comma after each item in a multi-line array or object literal, including the last item. ([sample](/javascript/sample.js#L11))

If ESLint is used along with Prettier, the ESLInt plugin [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier) should also be used to turn off all ESLint style rules that are already handled by Prettier.

[babel]: https://babeljs.io/
[eslint]: https://eslint.org/
[prettier]: https://prettier.io/
[jest]: /testing-jest/
[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[destructuring]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
[spread]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
[rest]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters
[functions]: https://www.typescriptlang.org/docs/handbook/2/functions.html
[classes]: https://www.typescriptlang.org/docs/handbook/2/classes.html
[readonly]: https://www.typescriptlang.org/docs/handbook/2/objects.html#readonly-properties
[const Assertions]: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-4.html#const-assertions
[overloading functions]: https://www.typescriptlang.org/docs/handbook/2/functions.html#function-overloads
[async/await]: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Async_await
[optional properties]: https://www.typescriptlang.org/docs/handbook/2/objects.html#optional-properties
[extending interfaces]: https://www.typescriptlang.org/docs/handbook/2/objects.html#extending-types
[any]: https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#any
[non-null assertion operator]: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-0.html#non-null-assertion-operator
[type assertions]: https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#type-assertions
[Nullish coalescing operator]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing
[Type Guards]: https://www.typescriptlang.org/docs/handbook/2/narrowing.html#typeof-type-guards
[generics]: https://www.typescriptlang.org/docs/handbook/2/generics.html
[strict mode]: https://www.typescriptlang.org/tsconfig/#strict
[mixins]: https://www.typescriptlang.org/docs/handbook/mixins.html
[decorators]: https://www.typescriptlang.org/docs/handbook/decorators.html
[union types]: https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#union-types
[lookup types]: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-1.html#keyof-and-lookup-types
[mapped types]: https://www.typescriptlang.org/docs/handbook/2/mapped-types.html
[enums]: https://www.typescriptlang.org/docs/handbook/enums.html
[interfaces]: https://www.typescriptlang.org/docs/handbook/2/objects.html
[type aliases]: https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#type-aliases

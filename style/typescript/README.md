# TypeScript

- Use the guidelines for [JavaScript](../javascript/README.md)
- Use TypeScript in [strict mode]
- Use [ESlint] and [Prettier] for auto-formatting and auto-fixing
- Use [Jest](../testing-jest/README.md) for unit testing
- Prefer [Functions] over [Classes]
- Prefer functional style (map/filter/reduce) over iteration (for/while/.each)
- Prefer [arrow functions] `=>`, over the `function` keyword except when using [Generics]
- Use [Generic Constraints] when possible
- Use `PascalCase` for [Interfaces] and [Type Aliases]
- Use [readonly] properties where applicable
- Use [Const Assertions] where applicable to avoid type widening
- Avoid complex conditionals inside TSX
- Avoid [Mixins]
- Avoid [Decorators]
- Avoid [Overloading Functions]
- Prefer [async/await] over traditional promise syntax
- Prefer [Optional Properties] in an interface rather than declaring the property type as `T | undefined`
- Prefer explicitly defining interfaces over [Extending Interfaces]
- Avoid the use of the [any] type
- Avoid the [Non-null assertion operator]
- Avoid [Type Assertions]
- Prefer the `as`-syntax for [Type Assertions] over the angle-bracket syntax
- Use the [Nullish coalescing operator]
- Prefer [Type Guards] over [Type Assertions]
- Prefer [Union Types], [Lookup Types], [Mapped Types] and [Const Assertions] over [Enums]

[eslint]: https://eslint.org/
[prettier]: https://prettier.io/
[functions]: https://www.typescriptlang.org/docs/handbook/functions.html
[classes]: https://www.typescriptlang.org/docs/handbook/classes.html
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[generics]: https://www.typescriptlang.org/docs/handbook/generics.html
[generic constraints]: https://www.typescriptlang.org/docs/handbook/generics.html#generic-constraints
[readonly]: https://www.typescriptlang.org/docs/handbook/interfaces.html#readonly-properties
[strict mode]: https://www.typescriptlang.org/docs/handbook/compiler-options.html
[non-null assertion operator]:
  https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-0.html#non-null-assertion-operator
[nullish coalescing operator]:
  https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-7.html#nullish-coalescing
[extending interfaces]: https://www.typescriptlang.org/docs/handbook/interfaces.html#extending-interfaces
[optional properties]: https://www.typescriptlang.org/docs/handbook/interfaces.html#optional-properties
[interfaces]: https://www.typescriptlang.org/docs/handbook/interfaces.html
[type aliases]: https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases
[overloading functions]: https://www.typescriptlang.org/docs/handbook/functions.html#overloads
[mixins]: https://www.typescriptlang.org/docs/handbook/mixins.html
[decorators]: https://www.typescriptlang.org/docs/handbook/decorators.html
[async/await]: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Async_await
[any]: https://www.typescriptlang.org/docs/handbook/basic-types.html#any
[type guards]: https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-guards-and-differentiating-types
[type assertions]: https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions
[union types]: https://www.typescriptlang.org/docs/handbook/advanced-types.html#union-types
[lookup types]: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-1.html#keyof-and-lookup-types
[mapped types]: https://www.typescriptlang.org/docs/handbook/advanced-types.html#mapped-types
[const assertions]: https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-4.html#const-assertions
[enums]: https://www.typescriptlang.org/docs/handbook/enums.html

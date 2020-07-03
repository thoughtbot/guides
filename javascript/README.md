# JavaScript

[Sample](sample.js)

- Use the latest stable JavaScript syntax with a transpiler, such as [babel].
- Use [ESlint] and [Prettier] for auto-formatting and auto-fixing
- Use [Jest](/testing-jest/) for unit testing
- Prefer ES6 classes over prototypes.
- Use strict equality checks (`===` and `!==`) except when comparing against (`null` or `undefined`).
- Prefer [arrow functions] `=>`, over the `function` keyword except when defining classes or methods.
- Use semicolons at the end of each statement.
- Prefer single quotes.
- Prefer ES6 [destructuring] over object literal notation.
- Use ES6 [spread] and [rest] operator wherever possible for a cleaner code.
- Use `PascalCase` for classes, `lowerCamelCase` for variables and functions, `SCREAMING_SNAKE_CASE` for constants,
  `_singleLeadingUnderscore` for private variables and functions.
- Prefer [template strings] over string concatenation.
- Prefer promises over callbacks.
- Prefer array functions like `map` and `forEach` over `for` loops.
- Use `const` for declaring variables that will never be re-assigned, and `let` otherwise.
- Avoid `var` to declare variables.
- Use a [trailing comma] after each item in a multi-line array or object literal, including the last item.
- Include a `to_param` or `href` attribute when serializing ActiveRecord models, and use that when constructing URLs
  client side, rather than the ID.
- Prefer `data-*` attributes over `id` and `class` attributes when targeting HTML elements. #462
- Avoid targeting HTML elements using classes intended for styling purposes. #462

[babel]: https://babeljs.io/
[eslint]: https://eslint.org/
[prettier]: https://prettier.io/
[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[destructuring]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
[spread]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
[rest]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters
[trailing comma]: /javascript/sample.js#L11

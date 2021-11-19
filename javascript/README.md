# JavaScript

[Sample](sample.js)

- Use [TypeScript](/typescript/)
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
- Prefer array functions like `map` and `forEach` over `for` loops.
- Use `const` for declaring variables that will never be re-assigned, and `let`
  otherwise.
- Avoid `var` to declare variables.
  
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
 
## Linting

Use [ESLint] for linting JavaScript. If Prettier is used, the ESLint plugin [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier) should also be used. This turns off all ESLint style rules that are already handled by Prettier, which prevents conflicts between ESLint and Prettier rules, simplifies ESLint configuration, and reduces the potential for errors to be reported by both ESLint and Prettier.


[babel]: https://babeljs.io/
[eslint]: https://eslint.org/
[prettier]: https://prettier.io/
[jest]: /testing-jest/
[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[destructuring]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
[spread]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
[rest]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters

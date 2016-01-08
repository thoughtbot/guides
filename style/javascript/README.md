JavaScript
==========

[Sample](sample.js)

* Prefer ES6 classes over prototypes.
* Use strict equality checks (`===` and `!==`) except when comparing against
  (`null` or `undefined`).
* Prefer [arrow functions] `=>`, over the `function` keyword except when
  defining classes or methods.
* Use semicolons at the end of each statement.
* Prefer single quotes.
* Use `PascalCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_singleLeadingUnderscore` for private
  variables and functions.
* Prefer [template strings] over string concatenation.
* Prefer promises over callbacks.
* Prefer array functions like `map` and `forEach` over `for` loops.
* Use `const` for declaring variables that will never be re-assigned, and `let`
  otherwise.
* Avoid `var` to declare variables.
* Use a [trailing comma] after each item in a multi-line array or object
  literal, including the last item.

[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[trailing comma]: /style/javascript/sample.js#L11

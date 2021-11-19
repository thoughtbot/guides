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

### Rules used

Our configuration is set up so linting will fail even on warnings (see
package.json, below). This allows us to set up some rules to be warnings purely
to aid the development experience without impacting the success or failure of
the linting job. Specifically, failures that can be fixed automatically by
tooling or that commonly occur temporarily while developing are set to be
warnings to differentiate to developers that the linting error might not require
an immediate fix and so developers see less unnecessary "red" during their
typical workflow.

Here is some explanation of rules that are configured in the ESLint configurations below:

- `no-unused-vars` is set to "warn" instead of the default "error".

### Recommended ESLint configurations

The following are example `.eslintrc.json` configurations for various types of
projects. These should be treated as bases upon which to further customize
ESLint according to your specific project's needs.

<details>
<summary> <strong>✨ ESLint configuration for basic web project</strong> </summary>

This is a bare-bones configuration that just sets up ESLint to work with Prettier.

Install dependencies with:

```sh
yarn add --dev eslint eslint-config-prettier eslint-plugin-prettier
```

or with npm:

```sh
npm install --save-dev eslint eslint-config-prettier eslint-plugin-prettier
```

```json
{
  "env": {
    "browser": true,
    "node": true,
    "jest": true,
    "es6": true
  },
  "extends": ["eslint:recommended", "prettier"],
  "parserOptions": {
    "sourceType": "module"
  },
  "rules": {
    "no-unused-vars": "warn"
  },
  "plugins": ["prettier"]
}
```

</details>

<details>
<summary><strong>✨ ESLint configuration for React app</strong> </summary>

Install dependencies with:

```sh
> yarn add --dev eslint eslint-config-prettier eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react
```

or with npm:

```sh
> npm install --save-dev eslint eslint-config-prettier eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react
```

```json
{
  "env": {
    "browser": true,
    "node": true,
    "jest": true,
    "es6": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:jsx-a11y/recommended",
    "prettier",
    "prettier/react"
  ],
  "parserOptions": {
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "plugins": ["react", "prettier", "jsx-a11y"],
  "rules": {
    "no-unused-vars": "warn"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
```

</details>

<details>
<summary><strong>✨ ESLint configuration for React Native app</strong> </summary>

Install dependencies with:

```sh
yarn add --dev eslint eslint-config-prettier eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-native-a11y
```

or with npm:

```sh
npm install --save-dev eslint eslint-config-prettier eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-native-a11y
```

```json
{
  "env": {
    "browser": true,
    "node": true,
    "jest": true,
    "es6": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react-native-a11y/all"
    "prettier",
    "prettier/react"
  ],
  "parserOptions": {
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "plugins": ["react", "prettier"],
  "rules": {
    "no-unused-vars": "warn"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
```

</details>

### ESLint with TypeScript

If using TypeScript, you can add support for this into any of the above configurations by adding and configuring TypeScript ESLint ([docs](https://typescript-eslint.io/docs/linting/linting)):

```sh
yarn add --dev @typescript-eslint/eslint-plugin @typescript-eslint/parser
```

or, if using NPM:

```sh
npm install --save-dev @typescript-eslint/eslint-plugin @typescript-eslint/parser
```

Then, update your `.eslintrc.json` to use TypeScript ESLint as the new parser, and to extend and use the new plugin.

The following rules are also recommended (note, this is not a complete config file. Start with one of the other configs above and add these in):

```json
{
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint"],
  "extends": ["eslint:recommended", "plugin:@typescript-eslint/recommended"],
  "rules": {
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/explicit-module-boundary-types": "off",
    "@typescript-eslint/no-inferrable-types": "off",
    "@typescript-eslint/no-var-requires": "warn",
    "@typescript-eslint/no-non-null-assertion": "error",
    "@typescript-eslint/no-floating-promises": "off",
    "@typescript-eslint/no-misused-promises": "off",
    "@typescript-eslint/prefer-regexp-exec": "off",
    "@typescript-eslint/require-await": "off",
    "react/no-unescaped-entities": "warn",
    "react/display-name": "off",
    "react/prop-types": "off",
    "@typescript-eslint/no-unused-vars": [
      "warn",
      {
        "ignoreRestSiblings": true,
        "argsIgnorePattern": "^_"
      }
    ]
  }
}
```

## package.json scripts

Scripts should be added to `package.json` for linting, formatting, and running tests. Continuous integration should be set up to run these checks and fail if any of them are not successful.

```json
{
  "scripts": {
    "test": "jest",
    "test:all": "yarn lint:all && yarn test",
    "lint:all": "yarn tsc && yarn lint && yarn pretty:check",
    "lint": "eslint --max-warnings=0 . --ext .js,.jsx,.ts,.tsx",
    "pretty": "prettier --write .",
    "pretty:check": "prettier --check ."
  }
}
```

In some cases, globs may need to be used to explicitly include/exclude directories or files from ESLint and Prettier checks.

[babel]: https://babeljs.io/
[eslint]: https://eslint.org/
[prettier]: https://prettier.io/
[jest]: /testing-jest/
[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[destructuring]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
[spread]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
[rest]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters

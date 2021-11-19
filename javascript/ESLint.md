# ESLint

Use [ESLint] for linting JavaScript. If Prettier is used, the ESLint plugin [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier) should also be used. This turns off all ESLint style rules that are already handled by Prettier, which prevents conflicts between ESLint and Prettier rules, simplifies ESLint configuration, and reduces the potential for errors to be reported by both ESLint and Prettier.

## Running ESLint

Scripts should be set up in `package.json` to run ESLint. See the example in the [JavaScript Guide](./javascript).

## Rules used

Our configuration is set up so linting will fail even on warnings (see above).
This allows us to set up some rules to be warnings purely to aid the development
experience with no impact on linting passing or failing. Linting failures that
can be fixed automatically by tooling or that commonly occur temporarily while
developing are set to be warnings instead to differentiate to developers that
the linting error might not require an immediate fix and so developers see less
unnecessary "red" during their typical workflow

- `no-unused-vars` is set to "warn" instead of the default "error".

## Recommended configurations

The following are example .eslintrc.json configurations for various types of
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

## Adding TypeScript

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

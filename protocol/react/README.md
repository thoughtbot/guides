React Protocol
==============

A guide for writing great front-end web apps.

General Philosophies
--------------------

* For greenfield React projects we like to use TypeScript. TypeScript is a
  typed superset of JavaScript that compiles to plain JavaScript. For a quick
introduction, check out [TypeScript in 5
minutes](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html).
* We prefer to use [Function
  Components](https://reactjs.org/docs/components-and-props.html#function-and-class-components)
over Class components whenever possible. That means, as a starting point
for state management, we should be using
[react-hooks](https://reactjs.org/docs/hooks-intro.html) specifically
`useState`.
* For side-effects and lifecycle methods, use `useEffect` instead of a class
  component.
* If our app needs to make network requests and hold state outside of a
  component, we like using GraphQL and our preferred library is
[Apollo](https://www.apollographql.com). We have a [section on
`GraphQL`](https://github.com/thoughtbot/guides/blob/master/graphql/README.md)
in our Guides.
* When building React apps with TypeScript and Apollo, we've found working
  in [VSCode](https://code.visualstudio.com/) to be a mostly-good experience.

Set Up Laptop
-------------

Set up your laptop with [this script](https://github.com/thoughtbot/laptop) and
[these dotfiles](https://github.com/thoughtbot/dotfiles).

Create App
----------

In the terminal, initialize the app with
[create-react-app](https://github.com/facebook/create-react-app) and TypeScript.
`create-react-app` is an open source React boilerplate tool similar to
Thoughtbot's own Suspenders for Rails. It creates a basic React app with no
build configuration and a good set of defaults.

    yarn create react-app app-name --typescript

Set Up App
----------

We're huge fans of automatic code formatting and linting.
[Prettier](https://prettier.io) and [ESLint](https://eslint.org/) are both great
libraries to facilitate this.

Add `eslint` to the project

    yarn add eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin --dev

<details>
<summary>Sample <code>.eslintrc.js</code> file with some sensible defaults</summary>

    module.exports = {
      env: {
        node: true,
        es6: true,
      },
      parser: '@typescript-eslint/parser',
      plugins: [],
      extends: [
        'plugin:@typescript-eslint/recommended',
        'prettier/@typescript-eslint',
        'plugin:prettier/recommended',
      ],
      parserOptions: {
        ecmaVersion: 2018,
        sourceType: 'module',
      },
      rules: {
        'no-console': 'error',
        'require-await': 'error',
        'no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
        'no-var': 'error',
        'max-len': [
          'error',
          120,
          {
            ignorePattern: '^import\\s.+\\sfrom\\s.+;$',
          },
        ],
        '@typescript-eslint/consistent-type-assertions': 'off',
        '@typescript-eslint/no-angle-bracket-type-assertion': 'off',
        '@typescript-eslint/no-non-null-assertion': 'error',
        '@typescript-eslint/no-explicit-any': 'error',
        '@typescript-eslint/no-unused-vars': [
          'error',
          {
            ignoreRestSiblings: true,
            argsIgnorePattern: '^_',
          },
        ],
      },
    };
</details>



<details>
<summary>And here's a <code>.prettierrc.js</code> file with some good default code styles.</summary>

    module.exports =  {
      trailingComma:  'all',
      singleQuote:  true,
      printWidth:  80,
    };
</details>

Git Protocol
------------

Follow the normal [Git Protocol](/protocol/git).

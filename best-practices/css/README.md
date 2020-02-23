# CSS Best Practices

## Linting

- Use stylelint to lint CSS & Sass
    - We maintain a [sharable stylelint configuration][stylelint-config]
      which enforces our guides found in this repo

[stylelint-config]: https://github.com/thoughtbot/stylelint-config

## Selectors

### Selector specificity

- Don't use ID selectors.
- Avoid over-qualified selectors, e.g. `h1.page-title`.

<details>

#### Code examples

`h1.page-title` carries a specificity of 2, but can be reduced to 1 by removing
the `h1` type selector:

```diff
-h1.page-title
+.page-title {
   // …
 }
```

#### Motivation

Using an ID in a selector increases its specificity, making it more difficult
to work with alongside class selectors. Furthermore, because IDs must be unique
within an HTML document, using them as CSS selectors limits reusability.

#### Resources

- Learn about [how specificity is calculated][specificity-calculation].

[specificity-calculation]: https://www.w3.org/TR/selectors-3/#specificity

</details>

### Selector naming

- Use lowercase characters and hyphens (sometimes referred to as hyphen-case,
  dash-case, or kebab-case) when naming selectors.
- Be consistent about naming conventions. For instance, if a project is using
  BEM, continue using it, and if it's not, don't introduce it.
- Don't uses Sass parent selectors (`&`) to concatenate selector names.

<details>

#### Code examples

Use lowercase characters and hyphens in selector names:

```scss
.class-name {
  // …
}
```

Don't concatenate selector names:

```scss
.class {
  &__child-class {
    // …
  }
}
```

#### Motivation

Concatenating selector names makes it more difficult to search and find
selectors in the codebase.

</details>

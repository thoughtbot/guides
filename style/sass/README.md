# Sass

- [Sample](sample.scss)
- [Default stylelint configuration](.stylelintrc.json)
  - This configuration aligns with our team-wide guides below. It does _not_,
    however, enforce a particular class naming structure,
    which is a team decision to be made on a per-project basis.

## Formatting

* Use the SCSS syntax.
* Use hyphens when naming mixins, extends, functions & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use one space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above a selector that has styles.
* Prefer hex color codes `#fff` or `#FFF`.
* Avoid using shorthand properties for only one value: `background-color: #ff0000;`, not `background: #ff0000;`
* Use `//` for comment blocks not `/* */`.
* Use one space between selector and `{`.
* Use double quotation marks.
* Use only lowercase, except for hex or string values.
* Don't add a unit specification after `0` values, unless required by a mixin.
* Use a leading zero in decimal numbers: `0.5` not `.5`
* Use space around operands: `$variable * 1.5`, not `$variable*1.5`
* Avoid in-line operations in shorthand declarations (Ex. `padding: $variable * 1.5 variable * 2`)
* Use parentheses around individual operations in shorthand declarations: `padding: ($variable * 1.5) ($variable * 2);`
* Use double colons for pseudo-elements
* Use a `%` unit for the amount/weight when using Sass's color functions: `darken($color, 20%)`, not `darken($color, 20)`
* Use a trailing comma after each item in a map, including the last item.

## Selectors

* Use meaningful names: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use ID and class names that are as short as possible but as long as necessary.
* Avoid nesting more than 3 selectors deep.
* Avoid using comma delimited selectors.
* Avoid nesting within a media query.

## Organization

* Use a `base` directory for styling element selectors, global variables, global extends and global mixins.
* Use HTML structure for ordering of selectors. Don't just put styles at the bottom of the Sass file.
* Avoid having files longer than 100 lines.

---

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

## General syntax and formatting

### Declarations block ordering

- Order declarations alphabetically.
- Order items within the declaration block in the following order:
    1. Sass at-rules, e.g. `@include`
    1. CSS properties
    1. Media queries
    1. Pseudo-classes
    1. Pseudo-elements
    1. Nested elements

<details>

#### Code examples

Alphabetize declarations:

```scss
.class {
  display: block;
  text-align: center;
  width: 100%;
}
```

Alphabetize prefixed properties as if the prefix doesn't exist:

```scss
.class {
  font-family: system-ui;
  -webkit-font-smoothing: antialiased;
  font-weight: $weight-variable;
}
```

Comprehensive example of ordering items within a declaration block:

```scss
.class {
  @include size(10px);

  display: block;
  margin: $spacing-variable;

  @media (min-width: $screen-variable) {
    padding: $spacing-variable;
  }

  &:focus {
    border-color: $color-variable;
  }

  &::before {
    content: "";
  }

  .nested-element {
    margin: $spacing-variable;
  }
}
```

#### Motivation

Alphabetizing is automatable and is commonly a feature built into
code editors (see Resources below).

#### Linting

Alphabetical declaration ordering can be linted using stylelint with the
[stylelint-order][stylelint-order] plugin and its
`order/properties-alphabetical-order` rule.

[stylelint-order]: https://github.com/hudochenkov/stylelint-order

#### Resources

- Atom users can use the [Sort Lines package][sort-lines], which provides
  commands and keybindings for alphabetical sorting.
- Sublime Text users can use the `Edit > Sort Lines` menu item, or press
  <kbd>F5</kbd> to sort lines alphabetically.

[sort-lines]: https://github.com/atom/sort-lines

</details>

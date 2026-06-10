# CSS Best Practices

- Document the project's CSS architecture (the README, component library or
  style guide are good places to do this), including things such as:
  - Organization of stylesheet directories and CSS files
  - Selector naming convention
  - Code linting tools and configuration
  - Browser support
- Prefer native HTML elements over custom implementations, like `<dialog>` for
  modals, `<details>`/`<summary>` for disclosures, and the [Popover API] for
  tooltips and non-modal overlays
- Use [double colon syntax] for pseudo-elements (`::after {}`), single colon for pseudo-classes (`button:hover {}`)
- Vendor prefixes are rarely needed for modern browsers. If a project requires
  legacy browser support, consider automating prefixes via a build tool rather
  than maintaining them by hand
- Prefer native CSS over preprocessors like SCSS

[double colon syntax]: https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements#Syntax
[popover api]: https://developer.mozilla.org/en-US/docs/Web/API/Popover_API

## Getting started

For new projects, consider using [Roux] as a structured starting point. It
provides an organized file structure, CSS custom properties for design tokens,
and sensible base styles without locking you into a framework or visual
opinion.

[roux]: https://github.com/thoughtbot/roux

## File structure

A reasonable default structure:

```text
css/
├── reset/
│   └── _normalize.css          # Browser resets
├── base/
│   ├── _variables.css          # CSS custom properties (colors, spacing, fonts)
│   ├── _fonts.css              # Font-face declarations
│   ├── _animations.css         # Global animations
│   ├── _buttons.css            # Button styles
│   ├── _forms.css              # Form styling
│   ├── _layout.css             # Layout styling
│   ├── _typography.css         # Typography defaults
│   └── _[element].css          # Other element-level styles
├── components/
│   └── _[component].css        # Per-feature/component styles
├── utilities/
│   └── _[utility].css          # Global helper classes
└── app.css                     # Entry point — imports and layer order
```

### Cascade layers

Defining [`@layer`] order explicitly in `app.css` makes cascade precedence
clear and intentional, regardless of import order:

```css
@layer reset, base, components, utilities;

@import "reset/normalize.css" layer(reset);
@import "base/variables.css" layer(base);
@import "base/typography.css" layer(base);
/* … */
@import "components/card.css" layer(components);
@import "utilities/visually-hidden.css" layer(utilities);
```

Styles outside any layer take precedence over all layered styles, which can be
useful for one-off overrides, but use that intentionally.

[`@layer`]: https://developer.mozilla.org/en-US/docs/Web/CSS/@layer

## Compilation

Raw `@import` of CSS will render your CSS, but it's not recommended as a browser will load each `@import` as a separate network request.

Use your preferred build tool to bundle CSS into a single output. Options
may include:

- [Lightning CSS] is fast, modern, and light
- [cssbundling-rails] and [PostCSS] for Rails projects ([Roux has a setup guide])
- [Dart Sass] with `@use` if your project already uses Sass

[lightning css]: https://lightningcss.dev/
[dart sass]: https://sass-lang.com/dart-sass/
[cssbundling-rails]: https://github.com/rails/cssbundling-rails
[PostCSS]: https://github.com/postcss/postcss
[Roux has a setup guide]: https://github.com/thoughtbot/roux/blob/main/guides/rails-setup.md

## Custom properties

[CSS custom properties] are the recommended approach for design tokens. Defining
all tokens in a single `_variables.css` file keeps them easy to find and update. If your system
is complex, you can define tokens in various `:root` declarations across different files.

- A `--property--variant` naming convention works well:
  e.g. `--color--primary`, `--space--large`, `--font-size--small`
- Mapping primitive values to semantic names makes tokens more meaningful at the
  point of use, and easier to theme:

```css
:root {
  /* Primitives */
  --color--blue-100: #57929e;
  --color--blue-900: #164650;

  /* Semantic */
  --color--text: var(--color--blue-900);
  --color--background-base: var(--color--blue-100);
}
```

- Dark mode overrides work naturally inside `:root` using the same semantic
  names, keeping light and dark values co-located:

```css
:root {
  --color--background-base: #f1f1eb;
  --color--text: #164650;

  @media (prefers-color-scheme: dark) {
    --color--background-base: #164650;
    --color--text: #f1f1eb;
  }
}
```

[css custom properties]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_cascading_variables/Using_CSS_custom_properties

## Responsive design

Modern CSS layout tools can often eliminate the need for breakpoints entirely.
Reaching for a media query is reasonable, but it's worth considering whether the
layout could respond naturally first.

### Intrinsic layout (prefer this first)

Flexbox and Grid can adapt to available space without any breakpoints:

```css
/* Wraps into as many rows as needed, each item at least 20ch wide */
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20ch, 1fr));
}

/* Items wrap naturally once they'd shrink below their base size */
.flex-list {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space--medium);
}
```

This approach ties layout behavior to content size rather than viewport size,
which tends to be more resilient.

### Container queries (prefer for components)

[Container queries] let a component respond to the size of its parent rather
than the viewport:

```css
.card-wrapper {
  container-type: inline-size;
}

.card {
  /* default (narrow) styles */
}

@container (min-width: 40ch) {
  .card {
    display: grid;
    grid-template-columns: auto 1fr;
  }
}
```

### Media queries (for larger layout directives)

Media queries can still be the right tool for page-level layout changes: things like large
navigation shifts that also should effect other items in the page.

- Start with the smallest viewport and layer upward with `min-width`
- Prefer `em` units over `px` so breakpoints respect user font size preferences
- Create breakpoints where the content starts to feel awkward, rather than
  targeting specific devices

**Note:** Unfortunately, you can't use a CSS custom property as a value within a media query, so be sure
to keep track of your values here and perhaps scope it per partial.

[container queries]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_containment/Container_queries

## Linting

[Stylelint] is a good option for enforcing CSS conventions. The
[stylelint-order] plugin can handle alphabetical declaration ordering. If
adopting a shared config, it's worth reviewing its rules to make sure they
reflect native CSS rather than Sass-specific conventions.

[stylelint]: https://stylelint.io/
[stylelint-order]: https://github.com/hudochenkov/stylelint-order

## Formatting

- Use hyphens when naming classes and custom properties: `block-name`,
`block-name__element`, `block-name--modifier` instead of `blockName` or
`block_name`
- Avoid shorthand properties when setting a single value: `background-color:
  #ff0000` rather than `background: #ff0000`
- Use `/* */` for comment blocks
- Keeping files under 100 lines makes them easier to scan; split larger files
  into focused partials

### Declaration ordering

[Alphabetical ordering is a reasonable default] because it's predictable and easy to
lint.

Treat vendor-prefixed properties as if the prefix isn't there when
alphabetizing:

```css
.class {
  font-family: system-ui;
  -webkit-font-smoothing: antialiased;
  font-weight: var(--font-weight--normal);
}
```

[Alphabetical ordering is a reasonable default]: https://ericwbailey.website/published/organize-your-css-declarations-alphabetically/

## Selectors

### Specificity

- Avoid ID selectors
- Avoid over-qualifying selectors (e.g. `h1.page-title`) unless the element
  type is semantically meaningful to the rule
- `:where()` is useful for resets and defaults because it carries zero
  specificity, making overrides straightforward:

```css
:where(img, video, picture) {
  display: block;
  max-width: 100%;
}
```

For more on how specificity is calculated, see the [MDN specificity docs].

[mdn specificity docs]: https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity

### Naming

- Use lowercase and hyphens (kebab-case) for class names and custom properties
- [BEM] is a reasonable default for a naming system within your CSS structure
- Regardless, be consistent with whatever naming convention the project is already
  using. Introducing a new system (like BEM) mid-project tends to create
  inconsistency rather than clarity
- Avoid concatenating selector names with `&` (e.g. `&__child`) as it makes
  class names harder to search for in the codebase
  - An exception is using `&` with pseudo-classes (e.g. `&:hover`) and
    pseudo-elements (e.g `&::after`).
- A `.u-` prefix for utility classes helps distinguish them from component
  selectors: e.g. `.u-visually-hidden`

[BEM]: https://getbem.com/

## Modern CSS features

Native CSS has made significant advances. Before reaching for a JavaScript
solution or a complex workaround, it's worth checking whether a native CSS
approach exists.

### Nesting

Native CSS nesting is well-supported in modern browsers. It's useful for keeping
component styles self-contained, though deep nesting (more than 2–3 levels) can
make specificity and readability harder to manage.

```css
.card {
  padding: var(--space--medium);

  &:hover {
    background-color: var(--color--surface-raised);
  }

  .another-component {
    font-size: var(--font-size--large);
  }
}
```

### `:has()`

`:has()` enables styling a parent based on its children, which is particularly
useful for form layouts and state-driven styling:

```css
label:has(input, select, textarea) {
  display: flex;
  flex-direction: column;
  gap: var(--space--x-small);
}
```

### `@scope`

[`@scope`] limits where styles apply, which can help with component isolation
without relying on naming conventions alone:

```css
@scope (.card) {
  .title {
    font-size: var(--font-size--large);
  }
}
```

[`@scope`]: https://developer.mozilla.org/en-US/docs/Web/CSS/@scope

## Accessibility

Wrap animations and transitions in a motion preference check so users who
prefer reduced motion aren't affected. Err on the side of the opt-in approach
where your default is designed for no/little motion and you enhance it with motion
within a `prefers-reduced-motion: no-preference` query:

```css
@media (prefers-reduced-motion: no-preference) {
  html {
    scroll-behavior: smooth;
  }
}
```

Visually hiding content while keeping it accessible to screen readers is a
common need. A utility class works well for this:

```css
.u-visually-hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}
```

You can enhance this if you want the element to be visible on focus
(like a [skip nav link]):

```css
.u-visually-hidden:not(:focus) {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}
```

[skip nav link]: https://webaim.org/techniques/skipnav/

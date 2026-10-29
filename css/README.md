# CSS Best Practices

- Document the project's CSS architecture (the README, component library or
  style guide are good places to do this), including things such as:
  - Organization of stylesheet directories and CSS files
  - Selector naming convention
  - Code linting tools and configuration
  - Browser support
- Use [double colon syntax] for pseudo-elements (`::after`), single colon for pseudo-classes (`:hover`)
- Vendor prefixes are rarely needed for modern browsers. If a project requires
  legacy browser support, consider automating prefixes via a build tool rather
  than maintaining them by hand
- Prefer native CSS over preprocessors like SCSS

[double colon syntax]: https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements#Syntax

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
├── resets/
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

## Typography

### Font loading

Only ship fonts in [`woff2` format] as it's supported by all modern browsers and
there's no need to include `woff`, `ttf`, or other formats as fallbacks.

Always set [`font-display: swap`] on `@font-face` declarations to prevent
invisible text while a web font is loading:

```css
@font-face {
  font-display: swap;
  font-family: "Inter";
  font-style: normal;
  font-weight: 100 900;
  src: url("inter.woff2") format("woff2");
}
```

If the fallback font differs noticeably in size from the web font, use
[`font-size-adjust`] to normalize the x-height across both, which reduces
layout shift when the web font loads:

```css
body {
  font-family: "Inter", system-ui;
  font-size-adjust: from-font;
}
```

For performance-sensitive projects, a system font stack can be a reasonable
alternative to web fonts altogether:

```css
body {
  font-family: system-ui, sans-serif;
}
```

[`woff2` format]: https://caniuse.com/woff2
[`font-display: swap`]: https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face/font-display
[`font-size-adjust`]: https://developer.mozilla.org/en-US/docs/Web/CSS/font-size-adjust

### Fluid type

Use [`clamp()`] for more fluid typography. This is a way to scale type
smoothly between a minimum and maximum size based on viewport width,
without breakpoints.

- You can use fluid typography for larger headings or display type
- Most body and UI copy should normally default to a static size (not fluid)

```css
:root {
  --font-size--heading: clamp(1.5rem, 4vw, 3rem);
}

h2 {
  font-size: var(--font-size--heading);
}
```

The first value is the floor, the second is the preferred fluid value, and the
third is the ceiling.

[`clamp()`]: https://developer.mozilla.org/en-US/docs/Web/CSS/clamp

### Variable fonts

If your project uses a variable font that varies weight, you can define a weight range in
`@font-face` and let the font render any weight within that range:

```css
@font-face {
  font-family: "Inter";
  font-weight: 100 900;
  src: url("inter-variable.woff2") format("woff2");
}
```

Enable [optical sizing] if the font supports an `opsz` axis. Browsers will
adjust letterform details automatically based on the rendered size:

```css
body {
  font-optical-sizing: auto;
}
```

For other variable axes (width, slant, etc.), use [`font-variation-settings`]
when `font-weight` or `font-style` alone aren't enough:

```css
.heading {
  font-variation-settings: "wdth" 110;
}
```

[optical sizing]: https://developer.mozilla.org/en-US/docs/Web/CSS/font-optical-sizing
[`font-variation-settings`]: https://developer.mozilla.org/en-US/docs/Web/CSS/font-variation-settings

### Rendering

`-webkit-font-smoothing: antialiased` renders fonts thinner on macOS and iOS by
using greyscale antialiasing instead of the default subpixel rendering. It can be a stylistic
choice and some designers prefer the lighter appearance, while others
find it reduces legibility at small sizes. If your project uses it, apply it
consistently:

```css
body {
  -webkit-font-smoothing: antialiased;
}
```

If your typeface has them, enable common [ligatures] for more natural text rendering:

```css
body {
  font-variant-ligatures: common-ligatures;
}
```

[ligatures]: https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures

### Minimum font sizes

- Body text should be at least `1rem` (or `16px` equivalent) at its smallest.
- Avoid setting `font-size` in `px` on the `html` or `body` element as it overrides
the user's browser font size preference, which is a common accessibility accommodation.
- When using [`clamp()`] for fluid type, the first argument acts as the floor.
  - Make sure it's never smaller than `1rem` for reading-level text:

```css
/* Good — floor is 1rem */
--font-size--body: clamp(1rem, 2.5vw, 1.25rem);

/* Avoid — floor is below accessible threshold */
--font-size--body: clamp(0.75rem, 2.5vw, 1.25rem);
```

Supporting text like captions or labels can go smaller, but staying at or above
`0.75rem` (12px equivalent) is a reasonable lower bound for anything a user is
expected to read.

### Further readability

Use [`text-wrap`] to improve how text breaks across lines without manual
intervention.

- Prefer `pretty` as a general default for headings because it prevents orphaned words
  at the end of a block and works well at any length.
  - It is still however, not fully supported as of writing this guide.
- `balance` is a fine fallback for browsers that don't support `pretty`.
- The spec gives browsers latitude in how they implement these algorithms, so
  Chrome and Safari may produce slightly different line breaks for the same text.

```css
h1, h2, h3, h4 {
  text-wrap: balance;
  text-wrap: pretty;
}
```

Use a unitless value for [`line-height`] as it scales correctly in nested
elements where `em` or `%` values can compound unexpectedly:

```css
body {
  line-height: 1.5;
}

h1 {
  line-height: 1.2;
}
```

The [`lh` unit] is useful for spacing that should feel proportional to the
current line height. For example, paragraph margins that stay in rhythm with
the text:

```css
p {
  margin-block-end: 1lh;
}
```

[`text-wrap`]: https://developer.mozilla.org/en-US/docs/Web/CSS/text-wrap
[`line-height`]: https://developer.mozilla.org/en-US/docs/Web/CSS/line-height
[`lh` unit]: https://developer.mozilla.org/en-US/docs/Web/CSS/length#lh

## Linting

[Stylelint] is a good option for enforcing CSS conventions. If
adopting a shared config, it's worth reviewing its rules to make sure they
reflect native CSS rather than Sass-specific conventions.

[stylelint]: https://stylelint.io/

## Formatting

- Avoid shorthand properties when setting a single value: `background-color:
  #ff0000` rather than `background: #ff0000`
  - [Shorthand itself can obscure your intentions], so err on the side of longhand for
    most properties.
- Use `/* */` for comment blocks
- Keeping files under 100 lines makes them easier to scan; split larger files
  into focused partials

[Shorthand itself can obscure your intentions]: https://thoughtbot.com/blog/when-to-use-and-not-use-css-shorthand-properties

### Declaration ordering

[Alphabetical ordering is a reasonable default] because it's predictable and easy to
lint. The [stylelint-order] plugin can handle alphabetical declaration ordering.

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
[stylelint-order]: https://github.com/hudochenkov/stylelint-order

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

- Use lowercase and hyphens (kebab-case) for class names and custom properties: `block-name`,
`block-name__element`, `block-name--modifier` instead of `blockName` or
`block_name`.
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
component styles self-contained, though deep nesting can make specificity and
readability harder to manage.

- Keep nesting to a maximum of 3 levels deep when possible.
- Favor nesting for pseudo-classes, pseudo-elements, media queries, and feature queries.
- Err on the side of unnesting elements if they can be specified in other ways (e.g. naming).

```css
.card {
  padding: var(--space--medium);

  &:hover {
    background-color: var(--color--surface-raised);
  }

  @media screen and (min-width: 30em) {
    padding: var(--space--small);
  }
}

.card .another-component {
  font-size: var(--font-size--large);
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

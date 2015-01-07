# Sass

[Sample](sample.scss)

## Formatting

* Use the SCSS syntax.
* Use hyphens when naming mixins, extends, classes, functions & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use one space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above a selector that has styles.
* Prefer hex color codes `#fff`.
* Use `//` for comment blocks not `/* */`.
* Use one space between selector and `{`.
* Use double quotation marks.
* Use only lowercase, including colors.
* Don't add a unit specification after `0` values, unless required by a mixin.
* Use a leading zero in decimal numbers: `0.5` not `.5`
* Use space around operands: `$variable * 1.5`, not `$variable*1.5`
* Avoid in-line operations in shorthand declarations (Ex. `padding: $variable * 1.5 variable * 2`)
* Use parentheses around individual operations in shorthand declarations: `padding: ($variable * 1.5) ($variable * 2);`
* Use double colons for pseudo-elements
* Use a `%` unit for the amount/weight when using Sass's color functions: `darken($color, 20%)`, not `darken($color, 20)`

## Order

* Use alphabetical order for declarations.
* Place `@extends` and `@includes` at the top of your declaration list.
* Place media queries directly after the declaration list.
* Place concatenated selectors second.
* Place pseudo states and elements third.
* Place nested selectors last.

## Selectors

* Don't use ID's for style.
* Use meaningful names: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use ID and class names that are as short as possible but as long as necessary.
* Avoid using the direct descendant selector `>`.
* Avoid nesting more than 4 selectors deep.
* Don't nest more than 6 selectors deep.
* Use HTML tags on vague classes that need a qualifier like `header.application` not `.main`.
* Avoid using the HTML tag in the class name: `section.news` not `section.news-section`.
* Avoid using HTML tags on classes for generic markup `<div>`, `<span>`: `.widgets` not `div.widgets`.
* Avoid using HTML tags on classes with specific class names like `.featured-articles`.
* Avoid using comma delimited selectors.
* Avoid nesting within a media query.

## Organization

* Use Bourbon for a Sass library.
* Use Neat for a grid framework.
* Use Bitters/`base` directory for styling element selectors, global variables, global extends and global mixins.
* Use [Normalize](https://github.com/necolas/normalize.css) for browser rendering consistency, rather than a reset.
* Use HTML structure for ordering of selectors. Don't just put styles at the bottom of the Sass file.
* Avoid having files longer than 100 lines.

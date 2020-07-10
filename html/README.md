# HTML

- Prefer double quotes for attributes.
- Use lowercase text for elements and attributes
- Use double quotes to wrap element attributes
- Use closing tags for all [normal elements]
- Prefer a HTML5 doctype
- Ensure elements are scoped properly
  - Elements such as `<title>` and `<meta>` must be placed within the page's
    `<head>` element
  - Elements such as `<p>`, `<nav>`, `<div>`, etc. should be placed within the
    page's `<body>` element
- Ensure `id`s are unique
- Prefer appending attribute values instead of declaring redundant attribute
  names
  - For example, if adding a class of `c-card--featured`, add it to the existing
    class declaration (`class="c-card c-card--featured"`, not `class="c-card"
    class="c-card--featured"`)
- Avoid using emoji and other exotic characters as values for attributes such as
  `class`, `id`, `data`, and `aria-*`.
- Avoid restricting viewport zooming
- Ensure [parent elements contain no more than 60 child elements]
- Use `<button>` elements instead of `<a>` elements for actions.
  - Use `type="button"` for button elements used outside of forms to prevent the
    browser from trying to submit form data
  - Use a `href` attribute for `<a>` elements with a valid location
- Ensure heading elements are used to section content, and heading levels are
  not skipped

[normal elements]: https://html.spec.whatwg.org/multipage/syntax.html#normal-elements
[parent elements contain no more than 60 child elements]: https://developers.google.com/web/tools/lighthouse/audits/dom-size

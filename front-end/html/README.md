HTML
========

HTML general best practices

* Use html5 Doctype tag.
* Tags and attribute names must be lowercase, except for <!DOCTYPE html>
* Use proper page encoding.
* Make use of semantical elements, don’t Use Divs for Everything we got html5.
* Close all tags. Self-closing tags must be closed with “ />”, including the space.
* Use label fields to label each form field, the for attribute should associate itself with the input field, so users can click the labels.
* Use double quotes for attributes.
* Do not use the size attribute on input fields, use css instead.
* Use an html comment on the closing div tags to indicate what element you're closing. It will help not to get confused, also on haml you will be keeping the indentation order.
* Don't use tables as a page layout, HTML must be used only for content. Presentation must be handled using CSS.
* Use proper indentation, set the tab size to 2 spaces.
* Partial names begin with underscores.
* When using HTML5, make sure to include all the fallbacks and progressive enhancement tools.
* Avoid the use of images to replace text.



Use of elements
-------

* Reserve the <h1> tag for the main title of the page
* Use P elements for paragraph delimiters instead of <br> tags.
* Use dl (definition lists) and blockquote, when appropriate.
* Item lists should always be placed in a <ul>, <ol>, or <dl>, don't usa a set of div's or p's.
* Make use of thead, tbody, and th tags when appropriate.
* Avoid using CSS or Javascript inside the HTML code as inline.
* Use img for elements such as photos, logos, or any other element that should be treated as content or have an important semantic meaning
HTML
========

HTML general best practices

* Use html5 Doctype tag
* Use proper page encoding
* Use P elements for paragraph delimiters instead of <br> tags.
* Use dl (definition lists) and blockquote, when appropriate.
* Make use of semantical elements, don’t Use Divs for Everything we got html5
* Item lists should always be placed in a <ul>, <ol>, or <dl>, don't usa a set of div's or p's.
* Use label fields to label each form field, the for attribute should associate itself with the input field, so users can click the labels.
* Do not use the size attribute on input fields, use css instead.
* Use an html comment on the closing div tags to indicate what element you're closing. It will help not to get confused, also on haml you will be keeping the indentation order.
* Don't use tables as a page layout
* Make use of thead, tbody, and th tags when appropriate.
* Always use title-case for headers and titles. Do not use all caps or all lowercase titles in markup, instead apply the CSS property text-transform:uppercase/lowercase.
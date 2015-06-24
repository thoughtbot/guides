Ember
=====

* Don't put a space between the opening handlebars braces and the variable.
* Use `Ember.computed`, `Ember.observes`, and `Ember.on` instead of the function
  prototype extensions ([sample][prototype extensions])

Ember-Data
----------

* Visually separate relationships from attributes with a newline.
  [Example][relationships]

[relationships]: sample.js#L1-L7

Testing
-------

* Prefer sequential calls to asynchronous helpers ([sample][helpers])
* Prefer nesting assertions within an `andThen` block instead of a chained
  `.then` block ([sample][assertions])

[helpers]: sample.js#L10-L11
[assertions]: sample.js#L13-L17
[prototype extensions]: sample.js#L23-L25

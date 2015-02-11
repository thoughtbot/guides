Ember
=====

* Don't put a space between the opening handlebars braces and the variable.

Ember-Data
----------

* Visually separate relationships from attributes with a newline.
  [Example][relationships]

[relationships]: sample.js#L1-L7

Testing
-------

* Visually separate the setup, exercise and assertion phases by:
  * Preferring sequential calls to asynchronous helpers ([sample][helpers])
  * Nesting assertions within an `andThen` block instead of a chained `.then` block ([sample][assertions])

[helpers]: sample.js#L10-L11
[assertions]: sample.js#L13-L17

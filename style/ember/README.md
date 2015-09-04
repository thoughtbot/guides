Ember
=====

* Don't put a space between the opening handlebars braces and the variable.
* Prefer components over partials.
* Alias local variables to functions from `Ember` and `DS`
([sample][local-Ember-DS])
* Prefer [ember-fetch] over ic-ajax. ([sample][ember-fetch-sample])

[local-Ember-DS]: sample.js#L23-L24
[ember-fetch]: https://github.com/stefanpenner/ember-fetch
[ember-fetch-sample]: sample.js#L20-L29

Ember-Data
----------

* Organize your models with attributes then relationships, separated with a
  newline [Example][relationships]

[relationships]: sample.js#L1-L7

Testing
-------

* Prefer sequential calls to asynchronous helpers ([sample][helpers])
* Prefer nesting assertions within an `andThen` block instead of a chained
  `.then` block ([sample][assertions])

[helpers]: sample.js#L10-L11
[assertions]: sample.js#L13-L17

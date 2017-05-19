Ember
=====

* No coloque un espacio entre los handlebar braces de apertura y la variable.
* Prefieren componentes sobre partiales.
* Nombrar por alias las ​​variables locales a funciones de `Ember` y `DS`
([sample][local-Ember-DS])
* Es preferible [ember-ajax] sobre ic-ajax. ([sample][ember-ajax-sample])

[local-Ember-DS]: sample.js#L23-L24
[ember-ajax]: https://github.com/ember-cli/ember-ajax
[ember-ajax-sample]: sample.js#L31-L38

Ember-Data
----------

* Separar visualmente las relaciones de los atributos con una nueva línea.
  [Example][relationships]

[relationships]: sample.js#L1-L7

Testing
-------

* Preferir llamadas secuenciales a asistentes asincrónicos ([sample][helpers])
* Preferir aserciones de anidación dentro de un bloque `andThen` en vez de un bloque de cadena
  `.then` ([sample][assertions])

[helpers]: sample.js#L10-L11
[assertions]: sample.js#L13-L17

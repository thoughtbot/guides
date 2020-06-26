Angular
-------

* [Avoid manual dependency annotations][annotations]. Disable mangling or use a
  [pre-processor][ngannotate] for annotations.
* Prefer `factory` to `service`. If you desire a singleton, wrap the singleton
  class in a factory function and return a new instance of that class from the
  factory.
* Prefer the `translate` directive to the `translate` filter for [performance
  reasons][angular-translate].
* Don't use the `jQuery` or `$` global. Access jQuery via `angular.element`.

[annotations]: http://robots.thoughtbot.com/avoid-angularjs-dependency-annotation-with-rails
[ngannotate]: https://github.com/kikonen/ngannotate-rails
[angular-translate]: https://github.com/angular-translate/angular-translate/wiki/Getting-Started#using-translate-directive
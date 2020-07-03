Ember
-----

* Avoid using `$` without scoping to `this.$` in views and components.
* Prefer to make model lookup calls in routes instead of controllers (`find`,
  `findAll`, etc.).
* Prefer adding properties to controllers instead of models.
* Don't use jQuery outside of views and components.
* Prefer to use predefined `Ember.computed.*` functions when possible.
* Use `href="#"` for links that have an action.
* Prefer dependency injection through `Ember.inject` over initializers, globals
  on window, or namespaces. ([sample][inject])
* Prefer sub-routes over maintaining state.
* Prefer explicit setting of boolean properties over `toggleProperty`.
* Prefer testing your application with [QUnit][ember-test-guides].

[ember-test-guides]: https://guides.emberjs.com/v2.2.0/testing/

Testing

* Prefer `findWithAssert` over `find` when fetching an element you expect to
  exist

[inject]: ember.js#L1-L11
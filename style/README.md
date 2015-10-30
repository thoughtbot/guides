Style
=====

A guide for programming in style.

In addition to the general guidelines below, we also have the following more
detailed, language/framework-specific style guides:

* [Backbone](backbone)
* [ERb](erb)
* [Git](git)
* [HTML](html)
* [JavaScript](javascript)
* [Rails](rails)
* [Sass](sass)
* [Shell](shell)
* [Slim](slim)
* [Testing](testing)

Formatting
----------
Ruby: See dotfiles/.rubocop.yml - ensure that you either use a plugin with your editor or run rubocop as 
a pre-commit hook. We are informed that a good one is https://gist.github.com/cheba/cfc46820a01db1222f54

Naming
------

* Avoid abbreviations.
* Avoid object types in names (`user_array`, `email_method` `CalculatorClass`, `ReportModule`).
* Prefer naming classes after domain concepts rather than patterns they
  implement (e.g. `Guest` vs `NullUser`, `CachedRequest` vs `RequestDecorator`).
* Name the enumeration parameter the singular of the collection.
  creates `user`).
* Name variables, methods, and classes to reveal intent.

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

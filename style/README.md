Style
=====

A guide for programming in style.

Use [Hound] to automatically review your
GitHub pull requests for
style guide violations.

[Hound]: https://houndci.com

In addition to the general guidelines below, we also have the following more
detailed, language/framework-specific style guides:

* [Android](android)
* [Backbone](backbone)
* [CoffeeScript](coffeescript)
* [Ember.js](ember)
* [ERb](erb)
* [Git](git)
* [Haskell](haskell)
* [HTML](html)
* [JavaScript](javascript)
* [Objective-C](objective_c)
* [Python](python)
* [Rails](rails)
* [Ruby](ruby)
* [Sass](sass)
* [Shell](shell)
* [Swift](swift)
* [Testing](testing)

Formatting
----------

* Avoid inline comments.
* Break long lines after 80 characters.
* Delete trailing whitespace.
* Don't misspell.
  [Example][dot guideline example].
* Use empty lines around multi-line blocks.
* Use spaces around operators, except for unary operators, such as `!`.
* Use [Unix-style line endings][newline explanation] (`\n`).
* Use [uppercase for SQL key words and lowercase for SQL identifiers].


[dot guideline example]: /style/ruby/sample.rb#L11
[uppercase for SQL key words and lowercase for SQL identifiers]: http://www.postgresql.org/docs/9.2/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
[newline explanation]: http://unix.stackexchange.com/questions/23903/should-i-end-my-text-script-files-with-a-newline

Naming
------

* Avoid abbreviations.
* Avoid object types in names (`user_array`, `email_method` `CalculatorClass`, `ReportModule`).
* Prefer naming classes after domain concepts rather than patterns they
  implement (e.g. `Guest` vs `NullUser`, `CachedRequest` vs `RequestDecorator`).
* Name the enumeration parameter the singular of the collection.
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

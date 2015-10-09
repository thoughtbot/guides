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
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't misspell.
* Don't vertically align tokens on consecutive lines.
* If you break up a hash, keep the elements on their own lines and closing curly
  brace on its own line.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* If you break up a chain of method invocations, keep each method invocation on
  its own line. Place the `.` at the end of each line, except the last.
  [Example][dot guideline example].
* Use 2 space indentation (no tabs).
* Use an empty line between methods.
* Use empty lines around multi-line blocks.
* Use spaces around operators, except for unary operators, such as `!`.
* Use spaces after commas, after colons and semicolons, around `{` and before
  `}`.
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
* Name variables created by a factory after the factory (`user_factory`
  creates `user`).
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).
* Suffix variables holding a factory with `_factory` (`user_factory`).

Organization
------------

* Order methods so that caller methods are earlier in the file than the methods
  they call.
* Order methods so that methods are as close as possible to other methods they
  call.

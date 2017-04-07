Elixir
======

[Sample](sample.ex)

* Don't separate multiple declarations of functions of the same name with
  newlines.
* Indent pipes by two spaces when using the match operator (`=`).
* Don't indent pipes when not using the match operator (`=`).
* Prefer pattern matching and guards in function definitions over conditionals
  in the function body.
* When pattern matching use tuples when possible.
* When not defining a function and using pattern matching logic inside a 
  functions context the priority list of first class citizens to call would be.
  Use `with` whenever possible, then use `case` and finally use `if/else`
* When to use `with`
* When to use `case`
* When to use `if/else`
* Prefer tuples when possible for passing messages between function contexts 
  and be sure to use an atom of `:ok`, `:error` or `:errors` in your tuples to 
  validate data. This is a pattern to improve verbosity of data validity and 
  fault tolerance.
* Avoid binding data to a variable when you can wrap it in a function and 
  thoughtfully name it after it's intent.
* Avoid binding data to a variable when not in a tuple, just to pass it to 
  another function, use `with` instead.
* Prefer composing functions off of their module rather than using `import`.


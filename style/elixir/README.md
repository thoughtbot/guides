Elixir
======

[Sample](sample.ex)

* Don't use a space for padding for a tuple with two or less elements. `{1, 2}`
* Don't indent pipes when not using the match operator (`=`).
* Don't separate multiple declarations of functions of the same name with
* Don't use a space for padding for a list with two or less elements. `[1, 2]`
  newlines.
* Don't put spaces around matched pairs like brackets, parentheses, etc.
* Don't use spaces after non-word operators that only take one argument; or 
  around the range operator.
* Don't put a space between a function name and the opening parenthesis.
* Don't use parentheses in macro calls when a do block is passed.
* Don't prefix macros that return boolean for guards with `is_`
* Don't put a blank line after defmodule.
* Don't explicitly set nil for a structs attribute just use a list of atoms.
* Avoid binding data to a variable when you can wrap it in a function and 
  thoughtfully name it after it's intent.
* Avoid binding data to a variable when not in a tuple, just to pass it to 
  another function, use `with` instead.
* Avoid using the pipe operator just once.
* Avoid trailing whitespace.
* Prefer Indent pipes by two spaces when using the match operator (`=`).
* Prefer pattern matching and guards in function definitions over conditionals
  in the function body.
* Prefer composing functions off of their module rather than using `import`.
* Prefer when using the do: syntax with functions and the line that makes up 
  the function body is long, put the do: on a new line indented one level more 
  than the previous line.
* Prefer when you have more than one function clause using the do: syntax, 
  put the do: on a new line for each function clause.
* Prefer no parentheses in function calls (outside a pipeline) when the 
  last argument is a function expression.
* Prefer private functions with the same name as public functions should start 
  with do.
* Prefer heredocs for `@moduledoc` directives.
* Use snake_case for atoms, functions and variables. 
* Use `CamelCase` for modules unless it's an acronym e.g., `HTTP`
* Use two space per indentation level. No hard tabs.
* Use parentheses for calls to functions with zero arity.
* Use Unix-style line endings (BSD/Solaris/Linux/OSX users are covered by 
  default, Windows users have to be extra careful).
* Use `with` whenever possible, then use `case` and finally use `if/else`
* Use spaces around operators, after commas, colons and semicolons.
* Use blank lines between defs to break up a function into logical paragraphs
  unless it's multiple defs using pattern matching.
* Use a newline at the end of every file.
* Use parentheses when a def has arguments, and omit them when it doesn't.
* Use do: for single line if/unless statements.
* Use true as the last condition of the cond special form when you need a 
  clause that always matches.
* Use parentheses in function calls, especially inside a pipeline.
* Use `?` appended to macros used as guards that return a boolean.
* Use one module per file unless the module is only used internally by another 
  module.
* Use snake_case file names for CamelCase module names.
* Use nested directories when scoping modules 
  `NameSpace.Foo.Bar` `/namespace/foo/bar`
* Use the following order of priority for module attributes and directives.
  `@moduledoc` -> `@behavior` -> `use` -> `alias` -> `require` -> 
  `defstruct` -> `@type` -> `@module_attribute` -> `@callback` -> 
  `@macrocallback` -> `@optional_callbacks`
* Use a blank line between each group of attribuets and directives.
* Use `alias MyApp.{Thing, Anotherthing}` when aliasing multiple modules that
  are in the same namespace.
* Use the `__MODULE__` pseudo variable when a module refers to itself.
* Use an alias for `__MODULE__` if you do use it.
* Use `@moduledoc` right after `defmodule` always before any attributes or 
  directives and follow it with a blank line.
* Use `@moduledoc false` if you are not including documentation.
* Use a newline when a struct definitions' length is greater then 80 chars and
  tab to align with the first attribute above.
 
# Questionable Styles
* Prefer if you have more than one multi-line defs do not use single-line defs.
[Single functions defs and multi line](https://github.com/christopheradams/elixir_style_guide#multiple-function-defs)

* Use bare variables in the first part of a function chain.
[Bare Variables](https://github.com/christopheradams/elixir_style_guide#bare-variables)

* Prefer to indent and align successive with clauses. Put the do: argument on a 
  new line, indented normally.
* Prefer when using a multiline do block, or has an else option, use multiline syntax.
[with clauses](https://github.com/christopheradams/elixir_style_guide#with-clauses)

* [Commenting Style](https://github.com/christopheradams/elixir_style_guide#annotations)

* [Are type specs worth putting in this guide?](https://github.com/christopheradams/elixir_style_guide#typedocs)

# Worth Mentioning?
* [Exceptions](https://github.com/christopheradams/elixir_style_guide#exception-names)

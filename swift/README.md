Swift
=====

[Sample](sample.swift)

* Prefer `struct`s over `class`es wherever possible
* Default to marking classes as `final`
* Prefer protocol conformance to class inheritance
* Break long lines after 100 characters
* Use 2 spaces for indentation
* Use `let` whenever possible to make immutable variables
* Name all parameters in functions and enum cases
* Use trailing closures
* Let the compiler infer the type whenever possible
* Group computed properties below stored properties
* Use a blank line above and below computed properties
* Group methods into specific extensions for each level of access control
* When capitalizing acronyms or initialisms, follow the capitalization of the
  first letter.
* When using `Void` in function signatures, prefer `()` for arguments and
  `Void` for return types.
* Prefer strong IBOutlet references.
* Avoid evaluating a weak reference multiple times in the same scope.
  Strongify first, then use the strong reference.
* Prefer to name `IBAction` and target/action methods using a verb describing
  the action it will trigger, instead of the user action
  (e.g., `edit:` instead of `editTapped:`)

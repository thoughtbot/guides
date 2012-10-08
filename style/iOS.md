Style
=====

A guide for programming in style.

High level guidelines:

* Be consistent.
* Don't rewrite existing code to follow this guide.
* Don't violate the conventions without a good reason.

A note on the language:

* "Avoid" means don't do it unless you have good reason.
* "Don't" means there's never a good reason.
* "Prefer" indicates a better option and its alternative to watch out for.
* "Use" is a positive instruction.

Git
---

* Avoid including files in source control that are specific to your
  development machine or process.
* Delete local and remote feature branches after merging.
* Perform work in a feature branch.
* Prefix feature branch names with your initials.
* Rebase frequently to incorporate upstream changes.
* Use a [pull request](http://goo.gl/Kmdee) for code reviews.
* Write a [good commit message](http://goo.gl/w11us).

Formatting
----------

* Avoid inline comments.
* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Drop opening brackets to a new line.
* Don't vertically align tokens on consecutive lines.
* Use an empty line between methods.
* Use spaces around operators, after commas, after colons and semicolons, around
  `{` and before `}`.

Naming
------

* Class names should begin with a project-specific 2 letter prefix.
* Avoid abbreviations except for very common ones (e.g. URL, HTTP, etc.).
* Avoid types in names (`userArray`).
* Name variables, methods, and classes to reveal intent.
* Name methods using camelcase except for the first word (`-setUserName:`).
* Use uppercase acronyms in method names, even when this goes against proper camel case method naming conventions. (`XMLHTTPRequest` instead `xmlHTTPRequest`).
* Declare variables with their type followed by a space then `*` (if it's a pointer to an object) and the variable name. (`NSString *userName;`);

Organization
------------

* Separate methods by function using `#pragma mark - <Section Name>`
* Separate sections into subsections using `#pragma mark <Subsection Name>`

Objective-C
-----------

* Use `@property` instead of declaring instance variables.
* Use an interface extension (`@interface ClassName ()`) to declare private properties.
* Don't use `@synthesize`.
* Use `NSAssert` in methods that require the presence of certain arguments.
* Define string constants like `static NSString *const StringConstant = @"StringConstant"`.
* Use Objective-C literals. (`@[arrayObject]`, `@{@"key" : value}`, `@(YES or NO)`, `@5.0`).

Frameworks
----------
`#import` linked frameworks in the prefix header (`ProjectName-Prefix.pch`).
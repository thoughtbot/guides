Objective-C
===========

[Sample](sample.m)

* Place `#import`s into the prefix header (`ProjectName-Prefix.pch`) only if
  used in _many_ files.
* Place `.xib` files under `Resources/Nibs` and their associated view files in
  `Classes/Views`.
* Order `#import` statements alphabetically.
* Order `@class` directives alphabetically.
* Order `@property` modifiers: memory management, atomicity, writability.
* Leave out `@property` modifiers unless needed, `nonatomic` is the only one
  needed in most cases.
* Prefer strong IBOutlet references.
* Prefer `@class` to `#import` when referring to external classes in a public
  `@interface`.
* Prefer `@property` to declaring instance variables.
* Prefix class names with a 2 or 3 letter project acronym.
* Prefix string constants being used as keys with 'k'.
* Remove `#import` statements for `Foundation` and `UIKit` in new project
  templates.
* Separate methods by function using `#pragma mark - <Section Name>`
* Separate sections into subsections using `#pragma mark <Subsection Name>`
* Use `@[arrayObject]`, `@{@"key" : value}`, `@(YES or NO)`, and `@5.0`
  literals.
* Use `@interface ClassName ()` to declare private properties.
* Use `lowerCamelCase` for method names.
* Use `NSAssert` in methods that require the presence of certain arguments.
* Write methods using the happy path. Indent the exceptional cases. Keep the
  optimal case in the left-most column.
* Prefer `enumerateObjectsUsingBlock:` when looping through arrays.
* Always use braces with control and loop blocks unless it can easily fit on
  one line.
* Place opening brace for control and loop blocks on same line.
* Prefer `NSInteger`, `CGFloat`, and similar macros over `int`, `float`, and
  other base types.
* Prefer *Auto Layout* for view layouts and constraints.

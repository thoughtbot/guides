Best Practices
==============

A guide for programming well.

General
-------

* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://rdd.me/yichhgvu).
* [Keep the code simple](http://rdd.me/ko2aqda2).

Object-Oriented Design
----------------------

* Avoid global variables.
* Avoid long parameter lists.
* Limit collaborators of an object (entities an object depends on).
* Limit an object's dependencies (entities that depend on an object).
* Prefer composition over inheritance.
* Prefer small methods. One line is best.
* Prefer small objects with a single, well-defined responsibility.
* [Tell, don't ask](http://goo.gl/Ztawt).

Xcode
-----
* Keeps files organized by function in the MVC paradigm.
* Keep .xib files grouped with their associated view class.
* Organize `#import` statements alphabetically.
* Organize `@class` directives alphabetically.
* Organize `@property` declarations by function within the class.

Objective-C
-----------

* Write methods using the happy path. Indent the exceptional cases and keep the optimal case in the left-most column.

Foundation
----------

* Create categories on `Foundation` classes instead of repeating yourself in helper methods.
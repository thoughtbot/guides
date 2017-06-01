# Objective-C Style Guide

This document aims to collect widely accepted best practices when it comes to writing Objective-C code. It is a living document and will be updated over time.

## High Level Guidelines
* Be consistent.

* Don't rewrite existing code to follow these guidelines.

* Don't violate the conventions outlined without good reason.

## Xcode Project Settings

* All new projects should be using the Apple LLVM compiler. 

* The Base SDK should be set to 'Latest iOS'.

* The iOS Deployment Target should be set to the lowest version possible that supports the desired devices and feature set.
		
	* As of now (09/11/2012), this should be 5.0 as the current adoption rate of devices still for sale is ~90%.

* Automatic Reference Counting (which shall be referred to as ARC for the rest of this document) should be enabled.

## File Management

### File Naming

* Project-specific files must use a consistent 2 or 3 letter prefix to avoid conflicting with classes in Apple's frameworks and any other frameworks linked to the binary.

* When naming a subclass, use the project prefix and the specific end part of the superclass's name. For instance a `UIViewController` subclass should be named `MALoginViewController`, while a `UIView` subclass would be named `MALoginView`, etc.

* Categories should be named by using the name of the class you are appending the category to, followed by a "+", then a descriptive name including the project prefix. For example an `NSArray` category may look like `NSArray+MARandomizing`.

* Classes should be organized into groups. A well organized project will typically have groups for models, views, controllers, categories and services.

	* In the case of `.xib` files, it is best to keep these grouped with the class that they are correlated with.

### Frameworks

* Frameworks and libraries linked to the target should be coalesced into the Frameworks group.

* Frameworks used throughout the project should be imported in the project's prefix header (`ProjectName-Prefix.pch`).

	* All project templates currently import `Foundation` and `UIKit` in the prefix header. These `#import` statements should be removed from new files.
	
	* Third-party frameworks used in single classes should be listed alphabetically.

## Code Formatting

### Header files and @interface

#### @class and #import

* The `@class` directive should be used in lieu of `#import` when referring to external classes in a public `@interface`. The `#import` statement should be in the implementation file, sorted alphabetically.

* Organize `@class` directives alphabetically.

#### Instance Variables

In current versions of Xcode, instance variables are largely unnecessary. You are encouraged to think of your classes in terms of properties and methods, only exposing ones that are meant to be used outside of the class.

#### Properties

Public properties are declared using the `@property` directive. The Apple LLVM compiler will now automatically generate an underlying instance variable that can be accessed by prepending the property name with an underscore. For instance if you have a table view property named `tableView`, the underlying instance variable will be generated as `_tableView`.

Properties should be sorted and grouped according to use within the class. At the very least properties which make use of the `IBOutlet` keyword should be grouped together. For instance…

		@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
		@property (strong, nonatomic) IBOutlet UITableView *tableView;
		
		@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
		@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

##### Property Modifiers

Property modifiers should be listed in the following order; memory management, atomicity, writability. For example to declare a property that is retained by ARC, not thread safe and readonly, you would write it like so: 

		@property (strong, nonatomic, readonly) MAObject *someObject;

##### Private Properties

Properties used internally by your class should not be exposed in the public interface. Instead, use an `@interface` class extension in the implementation file. See the "Implementation" section below for details on declaring private class extensions.

If necessary, properties can be declared as `readonly` in the public interface and redeclared in the class extension using the `readwrite` modifier.
	
> Note: With ARC, the `retain` modifier has been changed to `strong` and `__unsafe_unretained` has been changed to `weak`. Also note that `assign` is still valid for non-object properties such as structs.

### Implementation files and @implementation

#### @interface class extensions

* As mentioned above, private properties should be declared in `.m` file above the `@implementation`. Class extensions take the following form.

		// Note the parenthesis. This is the special syntax that allows you to create an interface extension.
		// It is effectively similar to creating a category on your class
		
		@interface MAClassName ()
		
		@property (strong, nonatomic) UIView *privateView;
		
		@end
		
#### Property synthesis

* Thanks to advancements in the Apple LLVM compiler, properties are now synthesized automatically.

	* There may be certain instances where the `@synthesize` directive is still required. Synthesized properties should be ordered and grouped in the same manner as where the corresponding properties are declared. The same rule applies to the `@dynamic` directive.
	
	> Note: When using `@synthesize` the appropriate methods are generated at compile time. With `@dynamic`, they are provided at runtime by the Objective-C runtime.	
	
#### Methods 

##### The Happy Path

Logic flow through each method should follow the happy path. This means keeping the desired condition of the method along the left-most column. Exceptions in the conditional flow should be indented meaning that the multiple returns will be necessary.

If conditions that are vital to the execution of the method are not met, early `returns` are advised.

##### Naming

* Method names should use camelcase except for the first word. Well named methods should require very little commenting because of the verbose nature of named arguments in Objective-C. Consider this example `UITableView`.

		// While this method name is very long, it is also very descriptive about exactly what it does.
		- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
		
* Opening brackets for methods belong on the following line.

		- (void)refreshUI
		{
			// Refresh the UI
		}

* It is acceptable to have a semicolon at the end of the method name. This allows for easy copy and pasting between the header and implementation files.

		- (void)refreshUI;
		{
			// Refresh the UI
		}
		
##### Method Organization

* Methods should typically be organized by task or function within the class. 
 
* Use `#pragma mark -` or `#pragma mark` to delineate different sections within the class file. Xcode uses these to visually separate the method names when viewed in the list via the jump bar.

	* It is common practice to name these sections with the class or protocol that they pertain to. For example, you may want to to group all of the `UITableViewDataSource` methods together under a `#pragma` header of the same name. If you do this, you will be able to right-click the name and view the documentation of that class or protocol. Consider the following example.

	<pre><code>#pragma mark - UITableViewDataSource Methods
\- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
</code></pre>

		
##### Exceptions, Assertions and NSLog()

* While exceptions and assertions are certainly invaluable during development and debugging, they are not to be used for control flow in a shipping application.
	
* Logging to the console can be time consuming and because of this, `NSLog()` statements should be stripped from the code before shipping. Alternatively, `NSLog` statements can be wrapped in the `DEBUG` preprocessor defintion so that they will not be compiled into the binary when built using a non-debug scheme.

		
#### Variables

* Variables should use descriptive names. Avoid using one or two letter variable names.

* Variables that are pointers to objects should be declared with the type followed by a space, followed by `*` and the variable name. For example…

		NSMutableArray *deckOfCards = [NSMutableArray arrayWithCapacity:52];
		
##### Constants

When providing keys or key paths to methods, string constants should be used. The use of string constants as opposed to literals guarantees that misspellings will be caught by the compiler. Conventionally, string constants being used as keys are prepended with the letter "k". String constants should be declared with the following syntax. 

		static NSString *const kStringConstant = @"kStringConstant";
		
To make this constant available to other classes, the following declaration should be placed in the header file.

		extern NSString *const kStringConstant;
		
##### Object Literals

The Apple LLVM compiler shipping with Xcode 4.4+ has added a new set of object literals for `NSDictionary`, `NSArray`, `NSNumber` and `BOOL`. The addition of these literals to the language increases your code's readability and saves time. It is recommended that you make full use of these additions. Each of these starts with `@` much like the current string literal uses.

###### NSDictionary Literal

The old way involved clunky methods that required you to list objects and keys alternatively separated by a comma and to terminate with `nil`. It looks like this…

		NSDictionary *themeColors = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], @"kRedColor", [UIColor blueColor], @"kBlueColor", nil];

With the new object literals, this can be shortened by using the new syntax, `@{ key : object, key : object }`.

		NSDictionary *themeColors = @{ kRedColor : [UIColor redColor], kBlueColor : [UIColor blueColor] };
		
Much better. Much more succinct.

###### NSArray Literal

The creation of `NSArray` is similar except the syntax is as follows. `@[ firstObject, secondObject, thirdObject ]`.

		NSArray *robits = @[ @"Ralph", @"Bender", @"The Iron Giant" ];
		
###### NSNumber Literal

`NSNumber` objects can be created with the syntax `@1`. It supports boxing any numerical value, be it integers, longs, doubles or floats. The old way of creating an `NSNumber` like the preceding example is `NSNumber *numeroUno = [NSNumber numberWithInteger:1];`.

###### BOOL Literal

Finally, `BOOL`s can be created by wrapping `YES` or `NO` in `@()`. For example, `@(YES)` or `@(NO)`.
		
##### Booleans

Objective-C uses `YES` and `NO` for `BOOL` comparisons. Objects that return `BOOL`s do not need to be equated to `YES` and `NO`.

		// This is not necessary
		if ([creditCard isValid] == NO)
		{
			//...
		}
		
		// And this is preferred
		if (![creditCard isValid])
		{
			//...
		}

Additionally, `nil` resolves to `NO` making explicit comparisons redundant.

		// This…
		if (object == nil)
		{
			//...
		}
		
		// …can and should be written as…
		if (!object)
		{
			//...
		}	

		
#### if, for and while

`if`, `for` and `while` blocks should be preceded and succeeded by a new line. If the inner body of this block consists of one line, a bracket should not be used. If the inner body of this block consists of more than one line, the rule about opening brackets on the following line still applies.

		NSMutableArray *deckOfCards = [NSMutableArray arrayWithCapacity:52];
		
		for (Card *card in deckOfCards)
			NSLog(@"%@", [card description]);
			
		Card *jokerCard = [Card joker];
		[deckOfCards addObject:jokerCard];
iOS Protocol
============

A guide for making iPhone and iPad apps with aplomb.

Set Up Laptop
-------------

Install the latest version of Xcode from the App Store.

Create App
----------

Get Liftoff.

    brew tap thoughtbot/formulae
    brew install liftoff

Get CocoaPods

    [sudo] gem install cocoapods

Create the app.

    liftoff

* Be sure to set an appropriate 2 or 3 letter class prefix.

Set Up App
----------

Get the code.

    git clone git@github.com:organization/app.git

Install the app's dependencies.

    cd project
    pod install

Git Protocol
------------

Follow the normal [Git protocol](/protocol/git).

Product Review
--------------

Follow the normal [Product Review protocol](/protocol/product-review).

Code Review
-----------

Follow the normal [Code Review guidelines](/code-review). When reviewing
others' iOS work, look in particular for:

* Review that ViewControllers are adhering to SRP
* Watch for CoreData thread boundary violations
* Watch for potential retain cycles with blocks
* Ensure that methods that require parameters are using `NSParameterAssert()`

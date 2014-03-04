iOS Protocol
============

A guide for making iPhone and iPad apps with aplomb.

Set Up Laptop
-------------

Install the latest version of Xcode from the App Store.

Create App
----------

Create a new project in Xcode with these settings:

* Check 'Create local git repository for this project'.
* Check 'Use Automatic Reference Counting'.
* Set an appropriate 2 or 3 letter class prefix.
* Set the Base SDK to 'Latest iOS'.
* Set the iOS Deployment Target to 6.0.
* Use the Apple LLVM compiler.

Get liftoff.

    gem install liftoff

Run liftoff in the project directory.

    liftoff

Git Protocol
------------

Follow the normal [Git Protocol](/protocol/git).

Code Review
-----------

Follow the normal [Code Review guidelines](/code-review).

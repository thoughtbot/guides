Best Practices
==============

A guide for programming well.

General
-------

* Avoid global variables.
* Avoid long parameter lists.
* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://rdd.me/yichhgvu).
* [Keep the code simple](http://rdd.me/ko2aqda2).
* Prefer small methods. One line is best.

Object-Oriented Design
----------------------

* Limit the number of collaborators of an object.
* Prefer composition over inheritance.
* Prefer small objects with a single, well-defined responsibility.
* [Tell, don't ask](http://goo.gl/Ztawt).

Javascript
----------

* Use `data-` attributes to bind event handlers.
* Use the [module pattern](http://goo.gl/JDtHN) to control method visibility.

Ruby
----

* Avoid hashes as optional parameters. Does the method do too much?
* Avoid meta-programming.
* Avoid monkey-patching core classes.
* Prefer classes to modules when designing functionality that is shared by multiple models.
* Use `private`, not `protected`, to indicate scope.
* Use `Set`, not `Array`, for arrays with unique elements. The lookup is faster.

Rails
-----

* Avoid Single Table Inheritance.
* Don't change a migration after it has been committed unless it cannot be
  solved with another migration.
* Limit the number of instance variables shared between controller and view.
* Validate the associated `belongs_to` object (`user`), not the database
  column (`user_id`).

Gems
----

* Use [AssetSync](http://goo.gl/m58tF) to serve assets from S3.
* Use [Bourbon](http://goo.gl/wpyee) for Sass mixins.
* Use [Bourne](http://goo.gl/lE7zH) for stubs and spies.
* Use [Braintree](http://goo.gl/mpWTp) for credit card processing.
* Use [Clearance](http://goo.gl/svPGo) for authentication.
* Use [Factory Girl](http://goo.gl/AB8bI) to set up test data.
* Use [Geocoder](http://goo.gl/CKnYF) for geocoding.
* Use [Haml](http://haml.info) for view templates.
* Use [Money](http://goo.gl/2CNfc) for money objects.
* Use [New Relic](http://goo.gl/F7Q56) for performance monitoring.
* Use [Paperclip](http://goo.gl/eSESD) for file uploads.
* Use [Thin](http://goo.gl/5Hlr) for serving web requests.
* Use [WebMock](http://goo.gl/BC1Ac) to disable real HTTP requests.
Postgres
--------

* Avoid multicolumn indexes in Postgres. It [combines multiple
  indexes](http://goo.gl/pY3Po) efficiently.
* Create [indexes concurrently](https://gist.github.com/3186117) to avoid table
  locks and [reduced performance](http://goo.gl/fi5ER) during deploys.
* Consider a [partial index](http://goo.gl/YC8Jt) for queries on booleans.
* Constrain most columns as [`NOT NULL`](http://goo.gl/0GeBr).
* Index all foreign keys.

Background Jobs
---------------

* Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.

Email
-----

* Use [SendGrid](http://goo.gl/Kxu9W) or [Amazon SES](http://goo.gl/A5jAA) to
  deliver email in staging and production environments.
* Use [single recipient SMTP](http://goo.gl/FWdhG) in staging environment.

Testing
-------

* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
* Test background jobs with a [`Delayed::Job` matcher](http://goo.gl/bzBlN).
* Use a [Fake](http://goo.gl/YR7Hh) to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT](http://goo.gl/r5Ti2) methods in expectations when possible.

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE6.

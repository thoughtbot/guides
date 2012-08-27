This is a list of rules that were taken out of the style guide because they had
wider implications that cosmetic conventions. Please move them to a new home if
you find one.

* Avoid global variables.
* Avoid long parameter lists.
* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://rdd.me/yichhgvu).
* [Keep the code simple](http://rdd.me/ko2aqda2).
* Limit the number of collaborators of an object.
* Prefer composition over inheritance.
* Prefer small methods. One line is best.
* Prefer small objects with a single, well-defined responsibility.
* [Tell, don't ask](http://goo.gl/Ztawt).
* Use `data-` attributes to bind event handlers.
* Use the [module pattern](http://goo.gl/JDtHN) to control method visibility.
* Avoid hashes as optional parameters. Does the method do too much?
* Avoid meta-programming.
* Avoid monkey-patching core classes.
* Define the project's [Ruby version in the
  Gemfile](http://gembundler.com/man/gemfile.5.html#RUBY-ruby-).
* Prefer classes to modules when designing functionality that is shared by multiple models.
* Use `private`, not `protected`, to indicate scope.
* Use `Set`, not `Array`, for arrays with unique elements. The lookup is faster.
* Avoid Single Table Inheritance.
* Don't change a migration after it has been committed unless it cannot be
  solved with another migration.
* Limit the number of instance variables shared between controller and view.
* Avoid multicolumn indexes in Postgres. It [combines multiple
  indexes](http://goo.gl/pY3Po) efficiently.
* Create [indexes concurrently](https://gist.github.com/3186117) to avoid table
  locks and [reduced performance](http://goo.gl/fi5ER) during deploys.
* Consider a [partial index](http://goo.gl/YC8Jt) for queries on booleans.
* Constrain most columns as [`NOT NULL`](http://goo.gl/0GeBr).
* Create a read-only [Heroku Follower](http://goo.gl/xWDMx) for your
  production database. If a Heroku database outage occurs, Heroku can use the
  follower to get your app back up and running faster.
* Index all foreign keys.
* Use a Heroku Follower database for analytics to limit reads on the primary
  database.
* Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.
* Use [SendGrid](http://goo.gl/Kxu9W) or [Amazon SES](http://goo.gl/A5jAA) to
  deliver email in staging and production environments.
* Use [single recipient SMTP](http://goo.gl/FWdhG) in staging environment.
* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
* Test background jobs with a [`Delayed::Job` matcher](http://goo.gl/bzBlN).
* Use a [Fake](http://goo.gl/YR7Hh) to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT](http://goo.gl/r5Ti2) methods in expectations when possible.
* Validate the associated `belongs_to` object (`user`), not the database
  column (`user_id`).

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE6.


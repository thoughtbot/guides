Rails Protocol
==============

A guide for writing great web apps.

Set Up Laptop
-------------

Install as a minimum:

* homebrew
* redis
* nodejs
* mysql
* ruby (with gem bundler)

Set Up App
----------

Get the code.

    git clone git@github.com:organization/app.git

Set up the app's dependencies.

    cd project
    ./bin/setup

Use [Foreman](https://github.com/ddollar/foreman) to run the app locally.

    foreman start


Git Protocol
------------

Follow the normal [Git Protocol](/protocol/git).

Product Review
--------------

Follow the normal [Product Review protocol](/protocol/product-review).

Code Review
-----------

Follow the normal [Code Review guidelines](/code-review). When reviewing others'
Rails work, look in particular for:

* Review data integrity closely, such as migrations that make irreversible
  changes to the data, and whether there is a related todo to make a database
  backup during the staging and production deploys.
* Review SQL queries for potential SQL injection.
* Review whether new database indexes are necessary if new columns or SQL
  queries were added.
* Review whether new scheduler (`cron`) tasks have been added and whether there
  is a related todo in the project management system to add it during the
  staging and production deploys.

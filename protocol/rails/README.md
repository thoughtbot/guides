Rails Protocol
==============

A guide for writing great web apps.

Set Up App
----------

Get the code.

    git clone git@github.com:organization/app.git

Set up the app's dependencies.

    cd project
    ./bin/setup

Delete extra lines in `.env`, leaving only those needed for app to function
properly. For example: `BRAINTREE_MERCHANT_ID` and `S3_SECRET`.

Use [Foreman](https://github.com/ddollar/foreman) to run the app locally.

    foreman start

It uses your `.env` file and `Procfile` to run processes
like Heroku's [Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

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
* Review whether dependency upgrades include a reason in the commit message,
  such as a link to the dependency's `ChangeLog` or `NEWS` file.
  * When bumping up the version for one gem, make sure the commit doesn't include
      version changes for other gems.
* Review whether new **database indexes** are necessary if new columns or SQL
  queries were added.
* Review whether new scheduler (`cron`) tasks have been added and whether there
  is a related todo in the project management system to add it during the
  staging and production deploys.

Deploy
------

View a list of new commits. View changed files.

    git fetch staging
    git log staging/master..master
    git diff --stat staging/master

Test the feature in browser.

Deploy to production.

    git fetch production
    git log production/master..master
    git diff --stat production/master
    TBD

Watch logs and metrics dashboards.

Close pull request and comment `Merged.`

Set Up Production Environment
-----------------------------

* TBD

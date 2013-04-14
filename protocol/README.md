Protocol
========

A guide for getting things done.

Set up laptop
-------------

Install the latest version of Xcode from the App Store.

Set up your laptop with [this script](https://github.com/thoughtbot/laptop)
and [these dotfiles](https://github.com/thoughtbot/dotfiles).

The dotfiles provide aliases such as `g` for `git`, git wrappers such as
`create-branch`, `merge-branch`, and `delete-branch`, and Heroku wrappers
`staging` for `heroku --remote staging` and `production` for `heroku --remote
production`.

Create Rails app
----------------

Get Suspenders.

    gem install suspenders

Create the app.

    suspenders app --heroku true --github organization/app

Create iOS app
--------------

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

Set up Rails app
----------------

Get the code.

    g clone git@github.com:organization/app.git

Set up the app's dependencies.

    cd project
    ./bin/setup

Use [Heroku config](https://github.com/ddollar/heroku-config) to get `ENV`
variables.

    staging config:pull

Delete extra lines in `.env`, leaving only those needed for app to function
properly. For example: `BRAINTREE_MERCHANT_ID` and `S3_SECRET`.

Use [Foreman](http://goo.gl/oy4uw) to run the app locally.

    foreman start

It uses your `.env` file and `Procfile` to run processes just like Heroku's
[Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

Maintain a Rails app
--------------------

* Avoid including files in source control that are specific to your
  development machine or process.
* Delete local and remote feature branches after merging.
* Perform work in a feature branch.
* Rebase frequently to incorporate upstream changes.
* Use a [pull request](http://goo.gl/Kmdee) for code reviews.

Write a feature
---------------

Create a local feature branch based off master.

    g co master
    g pull
    g create-branch [branch-name]

Prefix the branch name with your initials.

Rebase frequently to incorporate upstream changes.

    g rebase-origin

Resolve conflicts. When feature is complete and tests pass, stage the changes.

    rake
    g ap

When you've staged the chunks you want to group together, commit the changes.

    g st
    g ci

Write a [good commit message](http://goo.gl/w11us). Example format:

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

    http://project.management-system.com/ticket/123

Share your branch.

    g push

Submit a [GitHub pull request](http://goo.gl/Kmdee).

Ask for a code review in [Campfire](http://campfirenow.com).

Review code
-----------

A team member other than the author reviews the pull request. They follow
[Code Review](../code-review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the Github
web interface or in Campfire.

For changes which they can make themselves, they check out the branch.

    g co [branch-name]
    rake db:migrate
    rake
    g diff staging/master..HEAD

They make small changes right in the branch, test the feature in browser,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

Merge
-----

Rebase interactively. Squash commits like "Fix whitespace" into one or a
small number of valuable commit(s). Edit commit messages to reveal intent.

    g rebase-origin
    rake

View a list of new commits. View changed files. Merge branch into master.

    g log origin/master..[branch-name]
    g diff --stat origin/master
    g merge-branch
    g push

Delete your remote and local feature branches.

    g delete-branch [branch-name]

Deploy
------

View a list of new commits. View changed files. Deploy to
[Heroku](https://devcenter.heroku.com/articles/quickstart) staging.

    g fetch staging
    g log staging/master..master
    g diff --stat staging/master
    g push staging

Run migrations (if necessary) and restart the dynos.

    staging migrate

[Introspect](http://goo.gl/tTgVF) to make sure everything's ok.

    watch staging ps

Test the feature in browser.

Deploy to production.

    g fetch production
    g log production/master..master
    g diff --stat production/master
    g push production master
    production migrate
    watch production ps

Watch logs and metrics dashboards.

Close pull request and comment `Merged.`

Set Up Production Environment
-----------------------------

* Make sure that your
  [`Procfile`](https://devcenter.heroku.com/articles/procfile)
  is set up to run Unicorn.
* Make sure the PG Backups add-on is enabled.
* Create a read-only [Heroku Follower](http://goo.gl/xWDMx) for your
  production database. If a Heroku database outage occurs, Heroku can use the
  follower to get your app back up and running faster.

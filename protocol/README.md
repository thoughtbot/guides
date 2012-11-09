Protocol
========

A guide for getting things done.

Set up laptop
-------------

Install the latest version of Xcode from the App Store.

Set up your laptop with [this script](/thoughtbot/laptop)
and [these dotfiles](/thoughtbot/dotfiles).

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

Add a `.gitignore` file with contents:

    *~
    *~.nib/
    *.dat
    *.dep
    *.hmap
    *.LinkFileList
    *.mode1
    *.mode1v3
    *.mode2v3
    *.o
    *.pbxuser
    *.perspective
    *.perspectivev3
    *.xcworkspace
    build/
    xcuserdata

Add a `.gitattributes` file with contents:

    *.pbxproj binary merge=union

Set up Rails app
----------------

Get the code.

    git clone git@github.com:organization/app.git

Set up the app's dependencies.

    cd project
    bundle --binstubs=bin/stubs
    rake db:setup

Add Heroku remotes for staging and production environments.

    git remote add staging git@heroku.com:<app>-staging.git
    git remote add production git@heroku.com:<app>-production.git

Use [Heroku config](/ddollar/heroku-config) to get `ENV`
variables.

    heroku config:pull -r staging

Delete extra lines in `.env`, leaving only those needed for app to function
properly. For example: `BRAINTREE_MERCHANT_ID` and `S3_SECRET`.

Use [Foreman](http://goo.gl/oy4uw) to run the app locally.

    foreman start

It uses your `.env` file and `Procfile` to run processes just like Heroku's
[Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

Write a feature
---------------

Create a local feature branch based off master.

    git checkout master
    git pull --rebase
    git checkout -b your-initials-new-feature

Rebase frequently to incorporate upstream changes.

    git fetch origin
    git rebase origin/master
    <resolve conflicts>

When feature is complete and tests pass, commit the changes.

    rake
    git add -A
    git status
    git commit -v

Write a [good commit message](http://goo.gl/w11us).

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

Share your branch.

    git push origin [branch]

Submit a [Github pull request](http://goo.gl/Kmdee).

Ask for a code review in [Campfire](http://campfirenow.com).

Review code
-----------

A team member other than the author reviews the pull request.

They make comments and ask questions directly on lines of code in the Github
web interface or in Campfire.

For changes which they can make themselves, they check out the branch.

    git checkout <branch>
    rake db:migrate
    rake
    git diff staging/master..HEAD

They make small changes right in the branch, test the feature in browser,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

Merge
-----

Rebase interactively. Squash commits like "Fix whitespace" into one or a
small number of valuable commit(s). Edit commit messages to reveal intent.

    git rebase -i origin/master
    rake

View a list of new commits. View changed files. Merge branch into master.

    git log origin/master..[branch]
    git diff --stat origin/master
    git checkout master
    git merge [branch] --ff-only
    git push

Delete your remote feature branch.

    git push origin :[branch]

Delete your local feature branch.

    git branch -d [branch]

Deploy
------

View a list of new commits. View changed files. Deploy to
[Heroku](https://devcenter.heroku.com/articles/quickstart) staging.

    git fetch staging
    git log staging/master..master
    git diff --stat staging/master
    git push staging

Run migrations (if necessary).

    heroku run rake db:migrate -r staging

Restart the dynos if migrations were run.

    heroku restart -r staging

[Introspect](http://goo.gl/tTgVF) to make sure everything's ok.

    watch heroku ps -r staging

Test the feature in browser.

Deploy to production.

    git fetch production
    git log production/master..master
    git diff --stat production/master
    git push production
    heroku run rake db:migrate -r production
    heroku restart -r production
    watch heroku ps -r production

Watch logs and metrics dashboards.

Close pull request and comment `Merged.`

Set Up Production Environment
-----------------------------

* Make sure that your
  [`Procfile`](https://devcenter.heroku.com/articles/procfile)
  is set up to run thin.
* Make sure the PG Backups add-on is enabled.
* Create a read-only [Heroku Follower](http://goo.gl/xWDMx) for your
  production database. If a Heroku database outage occurs, Heroku can use the
  follower to get your app back up and running faster.

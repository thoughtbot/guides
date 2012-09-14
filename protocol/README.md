Protocol
========

A guide for getting things done.

Set up laptop
-------------

Set up your laptop with [this script](/thoughtbot/laptop)
and [these dotfiles](/thoughtbot/dotfiles).

Create Rails app
----------------

Get Suspenders.

    gem install suspenders

Create the app.

    suspenders app-name --heroku true --github organization/app-name

Set up Rails app
----------------

Get the code.

    git clone git@github.com:organization/app.git

Set up the app's dependencies.

    cd project
    bundle --binstubs
    rake db:create
    rake db:schema:load
    rake db:seed

Add Heroku remotes for staging and production environments.

    git remote add staging git@heroku.com:<app>-staging.git
    git checkout -b staging --track staging/master
    git remote add production git@heroku.com:<app>-production.git
    git checkout -b production --track production/master

Use [Heroku config](/ddollar/heroku-config) to get `ENV`
variables.

    heroku config:pull --app <app>-staging

Delete extra lines in `.env`, leaving only those needed for app to function
properly.

    BRAINTREE_MERCHANT_ID
    BRAINTREE_PRIVATE_KEY
    BRAINTREE_PUBLIC_KEY
    S3_KEY
    S3_SECRET

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
    git diff staging..HEAD

They make small changes right in the branch, test the feature in browser,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to squash and merge.`

Deploy
------

If there are multiple commits in the branch, squash them.

    git rebase -i staging/master
    rake

View a list of new commits. View changed files. Merge branch into staging.

    git checkout staging
    git fetch staging
    git reset --hard staging/master
    git log staging..[branch]
    git diff --stat [branch]
    git merge [branch] --ff-only

Deploy to [Heroku](https://devcenter.heroku.com/articles/quickstart).

    git push staging

Run migrations (if necessary).

    heroku run rake db:migrate --app <app>

Restart the dynos if migrations were run.

    heroku restart --app <app>

[Introspect](http://goo.gl/tTgVF) to make sure everything's ok.

    watch heroku ps --app <app>

Test the feature in browser.

Deploy to production.

    git checkout production
    git fetch production
    git reset --hard production/master
    git log production..staging
    git diff --stat staging/master
    git merge staging --ff-only
    git push production
    heroku run rake db:migrate --app <app>
    heroku restart --app <app>
    watch heroku ps --app <app>

Watch logs and metrics dashboards. If the feature is working, merge into master.

    git checkout master
    git fetch origin
    git log production..master
    git merge production --ff-only
    git push origin master

Delete your remote feature branch.

    git push origin :[branch]

Delete your local feature branch.

    git branch -d [branch]

Close pull request and comment `Merged.`

Use scripts from [thoughtbot/dotfiles](/thoughtbot/dotfiles)
to quickly access the Heroku console, backup the production database, and
transfer production data to staging.

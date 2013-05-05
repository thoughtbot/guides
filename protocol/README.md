Protocol
========

A guide for getting things done.

<!--

Set up laptop
-------------

Install the latest version of Xcode from the App Store.

Set up your laptop with [this script](https://github.com/thoughtbot/laptop)
and [these dotfiles](https://github.com/thoughtbot/dotfiles).

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

    git clone git@github.com:organization/app.git

Set up the app's dependencies.

    cd project
    ./bin/setup

Use [Heroku config](https://github.com/ddollar/heroku-config) to get `ENV`
variables.

    heroku config:pull --remote staging

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

-->

Setup Hub
-----------
Install [hub](https://github.com/defunkt/hub)

    brew install hub

Alias git to hub by adding this line to you ``.bash_profile`` or ``.profile``

    alias git='hub'

Add Git Alias'
-------------

Added the following to the ``~/.gitconfig`` file.

    [alias]
      st = status
      pr = pull-request
      create-branch = !sh -c 'git push origin HEAD:refs/heads/$1 && git fetch origin && git branch --track $1 origin/$1 && cd . && git checkout $1' -
      merge-branch = !git checkout master && git merge @{-1}
      delete-branch = !sh -c 'git push origin :refs/heads/$1 && git remote prune origin && git branch -D $1' -
      rebase-origin = !git fetch origin && git rebase origin/master
      irebase-origin = !git fetch origin && git rebase -i origin/master

Write a feature
---------------

Create a local feature branch based off master.

    git create-branch <your-initials>_<feature>_<JIRA-id>

Prefix the branch name with your initials and postfix with JIRA ticket number.

Rebase frequently to incorporate upstream changes and resolve conflicts as needed.

    git rebase-origin

Commit changes regularly.

    git st
    git commit -av

Write a [good commit message](http://goo.gl/w11us). Example format:

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

    http://project.management-system.com/ticket/123

When feature is complete make sure all tests and reports pass.

    rake reports:all

Push your branch.

    git push

Submit a [GitHub pull request](http://goo.gl/Kmdee).

    git pr

Link to the code review in JIRA ticket comment.

    @<Reviewer> Ready for review: http://github.com/organization/project/pull/1

Ask for a code review in [Hipchat](http://hipchat.com).

Review code
-----------

A team member other than the author reviews the pull request. They follow
[Code Review](../code-review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the Github
web interface or in [Hipchat](http://hipchat.com).

When satisfied, they comment on the pull request `Ready to merge.`

The merge master for the project should then be asked to merge the branch.
This can be done on Hipchat or by mentioning them in a JIRA comment.

    `@<merge-master> Ready to merge.`

Merge
-----

Rebase interactively. Squash commits like "Fix whitespace" into one or a
small number of valuable commit(s). Edit commit messages to reveal intent.

    git irebase-origin

Run all tests and validate code quality.

    rake reports:all

View a list of new commits. View changed files. Merge branch into master.

    git log origin/master..<branch-name>
    git diff --stat origin/master
    git merge-branch
    git push

Delete your local and remote feature branch.

    git delete-branch <branch-name>

<!--

Deploy
------

View a list of new commits. View changed files. Deploy to
[Heroku](https://devcenter.heroku.com/articles/quickstart) staging.

    git fetch staging
    git log staging/master..master
    git diff --stat staging/master
    git push staging

If necessary, run migrations and restart the dynos.

    heroku run rake db:migrate --remote staging
    heroku restart --remote staging

[Introspect](http://goo.gl/tTgVF) to make sure everything's ok.

    watch heroku ps --remote staging

Test the feature in browser.

Deploy to production.

    git fetch production
    git log production/master..master
    git diff --stat production/master
    git push production
    heroku run rake db:migrate --remote production
    heroku restart --remote production
    watch heroku ps --remote production

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

-->
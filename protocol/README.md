Protocol
========

A guide for getting things done.

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

Write a feature
---------------

Create a local feature branch based off master.

    git checkout master
    git pull
    git checkout -b <branch-name>

Prefix the branch name with your initials.

Rebase frequently to incorporate upstream changes.

    git fetch origin
    git rebase origin/master

Resolve conflicts. When feature is complete and tests pass, stage the changes.

    rake
    git add --all

When you've staged the changes, commit them.

    git status
    git commit --verbose

Write a [good commit message](http://goo.gl/w11us). Example format:

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

    http://project.management-system.com/ticket/123

Share your branch.

    git push origin <branch-name>

Submit a [GitHub pull request](http://goo.gl/Kmdee).

Ask for a code review in Hipchat.

Review code
-----------

A team member other than the author reviews the pull request. They follow
[Code Review](../code-review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the Github
web interface or in Hipchat.

For changes which they can make themselves, they check out the branch.

    git checkout <branch-name>
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

    git fetch origin
    git rebase -i origin/master
    rake

View a list of new commits. View changed files. Merge branch into master.

    git log origin/master..<branch-name>
    git diff --stat origin/master
    git checkout master
    git merge <branch-name> --ff-only
    git push

Delete your remote feature branch.

    git push origin --delete <branch-name>

Delete your local feature branch.

    git branch --delete <branch-name>


Versioning
------
We follow the [Semantic Versioning](http://semver.org) system. 

	x.y.z
	
* x == major
* y == minor
* z == patch

*What does major/minor/patch mean?*

* major - Seriously changed the software such that it's drastically different from it's previous versions. If this was a paid product, a major version bump would cost money.
* minor - Added a new feature that significantly improves the product. Any changes to the application that introduce new functionality.
* patch - Bug fix to previously deployed code. No new functionality introduced.

*Does every minor change warrant a version bump?*

No, You won't bump the version on every commit to the repository, but when it comes time for a deployment, all of those minor commits will be bundled together into a single minor version bump.


### Web

Follow exactly as outlined above. Nothing specific to web in regards to build numbers. 

### Mobile

On mobile we add a little extra metadata to the version line to denote build numbers.

	x.y.z-[build]
	
*When should I bump the build number?*

Every time you deploy a new build to Testflight. You won't bump the build number before sending to the AppStore/PlayStore because nothing should have changed in the build between the Testflight deployment and the AppStore/PlayStore submission. If something did change, follow development process and bump build and resubmit to Testflight with the bumped build number. 


Deploying iOS to Testflight
------
**Prerequisites:**

* Testflight Desktop Application for Mac

Steps:

Bump build number

Commit and push bumped build number (TODO: Condense using bump version script)

Tag the build with an annotated git tag. Append the beta identifier for all Testflight builds.

	git tag -a v1.2.1-25-beta -m "v1.2.1-25-beta Testflight Release on 4June2013"

Archive the application in Xcode 

When the Testflight desktop app intercepts the build:

* Run `git log --graph --pretty=format:'%h -%d %s (%an)' --abbrev-commit` and copy and paste every commit since the last build into the build notes text field. 
* Select appropriate audience for the build
* Submit

TODO: This can and should be condensed to a single rake command. 

Deploying iOS to AppStore
------

**Prerequisites:**

* Have you opened a pull request to merge the development branch into master?
* Has the release candidate been deployed to Testflight and verified by the product owner and the client?
* Has the app been setup as `Ready For Upload` in iTunes Connect?
* Do we have a RevUnit login for iTunes Connect on the client's iTunes Connect account using the `contact+[appname]@revunit.com` format?
* Has it passed all of the above requirements? 
    
View a list of new commits. View changed files. Know exactly what we're sending into the AppStore. Every team member should be intimate with and accountable for all code that makes it to production.

    git fetch dev
    git log dev..master
    git diff --stat dev

Ask for a final code review in Hipchat for the pull request from dev into master. It is important this is done by someone other than the person initiating a release build. All feature branches should have been code reviewed and pull requested into dev up to this point. This final pull request into master is the last checkpoint and review before AppStore deployment. Redundant, but a final quality control check.

When :thumpsup:, close pull request and comment `Merged.`

Tag the build with an annotated git tag

	git tag -a v1.3.1-102 -m "v1.3.1-102 AppStore Release on 15June2013"
	
Archive in Xcode

Submit to AppStore through Xcode using the RevUnit iTunes connect account created for this specific project under the client's iTunes connect account.

TODO: Next app release, capture screenshots of entire workflow.

Deploying Android to PlayStore
------
TODO

Deploying Rails on Heroku
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


Deploying Rails on EngineYard 
------
TODO


Set Up Production Environment
-----------------------------

* Make sure that your
  [`Procfile`](https://devcenter.heroku.com/articles/procfile)
  is set up to run Unicorn.
* Make sure the PG Backups add-on is enabled.
* Create a read-only [Heroku Follower](http://goo.gl/xWDMx) for your
  production database. If a Heroku database outage occurs, Heroku can use the
  follower to get your app back up and running faster.

Protocol
========

A guide for getting things done.

Maintain a Rails app
--------------------

* Avoid including files in source control that are specific to your
  development machine or process.
* Delete local and remote feature branches after merging.
* Perform work in a feature branch.
* Rebase frequently to incorporate upstream changes.
* Use a [pull request] for code reviews.

[pull request]: http://goo.gl/Kmdee

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

Ask team for a code review.

Review code
-----------

A team member other than the author reviews the pull request. They follow
[Code Review](../code-review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the Github
web interface.

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

Merging is done through the Github pull request interface.

Before merging, make sure commits like "Fix whitespace" are squashed into one
or a small number of valuable commit(s). If necessary, edit commit messages to
reveal intent.

If the pull request can't be merged cleanly through the web interface and
manual intervention is needed, open the branch locally and rebase interactively
against master. Finally, push the now cleanly mergeable branch and merge it
through the web interface.

    git fetch origin
    git checkout feature_branch
    git rebase -i origin/master
    rake
    git push origin feature_branch

After merging, delete your remote feature branch.

    git push origin --delete <branch-name>

Delete your local feature branch.

    git branch --delete <branch-name>

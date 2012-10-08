Protocol
========

A guide for getting things done.

Set up laptop
-------------

Set up your laptop with [this script](/thoughtbot/laptop)
and [these dotfiles](/thoughtbot/dotfiles).

Install the latest version of [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) from the App Store.

Create Xcode app
----------------

1. Choose File > New > Project…  
2. Name the project  
3. Set the Organization Name to that of the client
4. Set the company identifier to 'com.thoughtbot'
5. Set an appropriate 2 or 3 letter class prefix
6. Select the appropriate device for the project
7. Check 'Use Automatic Reference Counting'
8. Check 'Create local git repository for this project'
9. Click 'Create'
10. Set the deployment target to the highest possible version.

Set up iOS app
----------------
1. Add a `.gitingore` file

		# Mac OS X Finder
	  	.DS_Store
	  
	  	# XCode per-user config
	 	*.mode1
	  	*.mode1v3
	  	*.mode2v3
	  	*.perspective
	  	*.perspectivev3
	 	*.pbxuser
	 	*.xcworkspace
	 	xcuserdata
	 	 
	 	# Build products
	 	build/
	 	*.o
	 	*.LinkFileList
	 	*.hmap
	 	 
	 	# Automatic backup files
	 	*~.nib/
	 	*.swp
	 	*~
	 	*.dat
	 	*.dep

2. Add a `.gitattributes` file

		*.pbxproj binary merge=union

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

When feature is complete, commit the changes.

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
    git diff staging/master..HEAD

They make small changes right in the branch, test the feature in Xcode, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

Merge
-----

Rebase interactively. Squash commits like "Fix whitespace" into one or a
small number of valuable commit(s). Edit commit messages to reveal intent.

    git rebase -i origin/master

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

//TODO:

Add section on using Shenzhen to build and deploy an iOS app.

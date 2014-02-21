Open Source Protocol
====================

A guide for releasing and maintaining open source projects.

Releasing a Ruby Gem
--------------------

* Edit the `VERSION` constant.
* Run `bundle install` to update `Gemfile.lock`.
* Run the test suite.
* Edit `NEWS`, `Changelog`, or `README` files if relevant.
* Commit changes like "Bump to 2.1.0".
* Run `rake release`, which tags the release, pushes the tag
  to GitHub, and pushes the gem to Rubygems.org.

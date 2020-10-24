# How to Release a Ruby gem

- Edit the `VERSION` constant.
- Run `bundle install` to update `Gemfile.lock`.
- Run the test suite.
- Edit `NEWS`, `CHANGELOG`, or `README` files if relevant.
- Commit changes. Use the convention "v2.1.0" in your commit message.
- Run `rake release`, which tags the release, pushes the tag to GitHub, and
  pushes the gem to [RubyGems.org].

[rubygems.org]: https://rubygems.org/

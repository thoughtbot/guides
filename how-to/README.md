# How do I ...

## ... start a new Rails app?

Use [Suspenders][suspenders]:

```sh
$ gem install suspenders
$ suspenders the-name-of-your-project-here
$ cd the-name-of-your-project-here/
$ bin/setup
$ rake
```

[suspenders]: https://github.com/thoughtbot/suspenders

## ... feature-test a Rails app's Javascript?

Use [capybara-webkit][capybara-webkit]. In your `Gemfile`:

```ruby
gem "capybara-webkit"
```

In `spec/support/capybara_webkit.rb` (for RSpec):

```ruby
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end
```

When writing a spec, you must set the `:js` flag for that test to make use of
capybara-webkit. For example, in `spec/features/user_signs_in_spec.rb`:

```ruby
feature "Authentication", :js do
  scenario "A user signing in" do
    create(:user, email: "me@example.com", password: "sekrit")

    sign_in_as email: "me@example.com", password: "sekrit"

    expect(page).to have_text("Welcome!")
  end
end
```

[capybara-webkit]: https://github.com/thoughtbot/capybara-webkit

## ... release a Ruby gem

* Edit the `VERSION` constant.
* Run `bundle install` to update `Gemfile.lock`.
* Run the test suite.
* Edit `NEWS`, `CHANGELOG`, or `README` files if relevant.
* Commit changes. Use the convention "v2.1.0" in your commit message.
* Run `rake release`, which tags the release, pushes the tag
  to GitHub, and pushes the gem to [RubyGems.org][rubygems].

[rubygems]: https://rubygems.org/

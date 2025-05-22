# How to Start a New Rails App

We used to use [Suspenders](https://github.com/thoughtbot/suspenders) to start
new Rails apps, but we're currently re-evaluating and upgrading it.

In the meantime, to avoid potential conflicts when creating a new app with
Suspenders, we recommend using the default Rails commands instead:

```sh
  rails new <app_name> -d=postgresql
```

And adding the gems we find useful, like:
factory_bot
rspec-rails
shoulda-matchers

# How to Deploy a Rails App to Heroku

View a list of new commits. View changed files.

```console
git fetch staging
git log staging/master..master
git diff --stat staging/master
```

If necessary, add new environment variables.

```console
heroku config:add NEW_VARIABLE=value --remote staging
```

Deploy to [Heroku] staging.

```console
git push staging
```

If necessary, run migrations and restart the dynos.

```console
heroku run rake db:migrate --remote staging
heroku restart --remote staging
```

[Introspect] to make sure everything's ok.

```console
watch heroku ps --remote staging
```

Test the feature in browser.

Deploy to production.

```console
git fetch production
git log production/master..master
git diff --stat production/master
heroku config:add NEW_VARIABLE=value --remote production
git push production
heroku run rake db:migrate --remote production
heroku restart --remote production
watch heroku ps --remote production
```

Watch logs and metrics dashboards.

Close pull request and comment `Merged.`

[heroku]: https://devcenter.heroku.com/articles/quickstart
[introspect]: http://blog.heroku.com/archives/2011/6/24/the_new_heroku_3_visibility_introspection/

## Set Up Production Environment

- Make sure that your [`Procfile`] is set up to run Unicorn.
- Make sure the PG Backups add-on is enabled.
- Create a read-only [Heroku Follower] for your production database. If a Heroku
  database outage occurs, Heroku can use the follower to get your app back up
  and running faster.

[heroku follower]: https://devcenter.heroku.com/articles/improving-heroku-postgres-availability-with-followers
[`procfile`]: https://devcenter.heroku.com/articles/procfile

---
title: Production Checklist
summary: >
  Running through a short checklist when setting up a production environment or
  preparing for a launch ensures we don't miss an important step.
---

We have found that a short checklist is valuable when setting up a new
production environment or preparing for a launch:

- Are we on the [latest Heroku stack][heroku-stacks]?
- Are we using a concurrent web server?
  See [how to deploy with Puma][deploy-rails-with-puma].
- Are long-running processes such as email delivery being run in background
  jobs?
  See [how to set up background jobs][background-job-setup].
- Are there redundant (at least two) web and background processes running?
- Are we using SSL?
  See "[SSL Certificates]" section below.
- Are API requests being made via a separate subdomain (`api.example.com`)? Even
  if the same app, this gives us architectural flexibility in the future.
- Is the [latest Ruby][latest-ruby] defined in the `Gemfile`?
  See [how to set it up][specify-bundler-ruby].
- Is [config stored in environment variables][12-factor-environment]?
- Are deploys done manually at a scheduled time when teammates are fresh and
  available if something goes wrong?
- Do deploys follow [a well-documented script][deploy-script]?
- Are we sending logs to a remote logging service?
  See "[Log Collection]" section below.
- Are we using a Heroku "Standard" database or higher?
  See [Heroku production databases][heroku-production-databases].
- Are we backing up our production database?
  See [Heroku PGBackups][heroku-postgres-backups].
- Are we monitoring performance and uptime?
  See "[Performance Monitoring]" section below.
- Are we tracking errors?
  See "[Error Tracking]" section below.

[12-factor-environment]: http://12factor.net/config
[error tracking]: ./error-tracking.md
[log collection]: ./log-collection.md
[performance monitoring]: ./performance-monitoring.md
[ssl certificates]: ./ssl-certificates.md
[background-job-setup]: https://tbot.io/background-jobs
[deploy-rails-with-puma]: https://tbot.io/deploy-rails-puma
[deploy-script]: https://github.com/thoughtbot/guides/blob/main/rails/how-to/deploy_a_rails_app_to_heroku.md
[heroku-postgres-backups]: https://tbot.io/heroku-pgbackup
[heroku-production-databases]: https://tbot.io/production-db
[heroku-stacks]: https://devcenter.heroku.com/articles/stack
[latest-ruby]: https://www.ruby-lang.org/en/downloads/
[specify-bundler-ruby]: https://bundler.io/guides/gemfile_ruby.html

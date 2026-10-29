---
title: Transactional Email
summary: >
  We rely on email experts like SendGrid to reliably deliver emails to our
  users without ending up in their junk folder.
---

We use [SendGrid] to have our application deliver email to users, known as
[transactional email].

Examples of transactional email are:

* Confirmations
* Follow ups after the first 3 days of use
* Free trial is expiring
* Message another user in the system

We use SendGrid directly, not via the Heroku add-on, in order to avoid being
lumped under the same IP group as others on Heroku (who might be misbehaving).

[SendGrid]: http://sendgrid.com
[transactional email]: https://tbot.io/transactional-email

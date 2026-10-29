---
title: Log Collection
summary: >
  Helpful information often ends up in our applications' log files, but they're
  discarded by default, so its important to set up a collection service.
---

Most applications write useful debugging information to logs. On Heroku, these
go to standard output by default and are eventually discarded.

We typically use [Logentries] to accept logs from Heroku and other sources. Once
sent to Logentries, you can search previous logs and set up alerts for errors
outside the Rails stack, such as out of memory errors.

If we're adding Logentries to a client project, the best solution is to have
the client set up their own Logentries account and add the relevant thoughtbot
members. If the client doesn't want to set it up or there's too much red tape,
we can create a new project on the thoughtbot Logentries account and then
delete it once our engagement has ended.

We don't use the Heroku Logentries addon, as it will automatically create a
number of alerts and send them to every admin on our Heroku organization.

To set up Logentries for a Heroku application, follow the
[instructions for setting up a syslog drain][logentries-setup-instructions].

[Logentries]: https://logentries.com
[logentries-setup-instructions]: https://logentries.com/doc/heroku/#syslog_drain

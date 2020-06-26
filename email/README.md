Email
-----

* Use [SendGrid] or [Amazon SES] to deliver email in staging and production
  environments.
* Use a tool like [ActionMailer Preview] to look at each created or updated mailer view
  before merging. Use [MailView] gem unless using Rails version 4.1.0 or later.

[Amazon SES]: http://robots.thoughtbot.com/post/3105121049/delivering-email-with-amazon-ses-in-a-rails-3-app
[SendGrid]: https://devcenter.heroku.com/articles/sendgrid
[MailView]: https://github.com/37signals/mail_view
[ActionMailer Preview]: http://api.rubyonrails.org/v4.1.0/classes/ActionMailer/Base.html#class-ActionMailer::Base-label-Previewing+emails
# Email

- Use [SendGrid] or [Amazon SES] to deliver email in staging and production
  environments.
- Use a tool like [ActionMailer Preview] to look at each created or updated
  mailer view before merging. Use [MailView] gem unless using Rails version
  4.1.0 or later.

[amazon ses]: https://thoughtbot.com/blog/deliver-email-with-amazon-ses-in-a-rails-app
[sendgrid]: https://devcenter.heroku.com/articles/sendgrid
[mailview]: https://github.com/37signals/mail_view
[actionmailer preview]: http://api.rubyonrails.org/v4.1.0/classes/ActionMailer/Base.html#class-ActionMailer::Base-label-Previewing+emails

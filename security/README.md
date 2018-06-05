# Security

A guide for practicing safe web.

## Think

Security is important, and you can't practice these guidelines without
understanding them. Make sure you understand each guideline, why it exists, and
how to follow it.

Failing to follow these guidelines will likely put you, your team, and your
deployed services at risk of compromise or loss of privacy.

## Secure Employee Access and Communication

The following guidelines apply to how you as an individual
secure access to your systems (laptop, accounts, etc.)
and communication (email, etc.).

### Using Passwords

* Use a unique password for every account you create.
* Use a tool like [pwgen](https://github.com/jbernard/pwgen) or
  [1password](https://1password.com) to generate random passwords.
* Use a tool like GnuPG to encrypt passwords if you need to share them with
  somebody.

### Encryption

* Ensure [disk encryption][disk] on your laptop.
* Use a PGP signature in an email if you want somebody to trust that you wrote
  it.
* Use PGP to check email signatures if you want to know who wrote it.
* Use PGP to encrypt emails if you want to be sure nobody but the recipient is
  reading it.
* Use ultimate trust for your own keys.
* Use full trust for keys you have verified in person or via a secure video
  chat.
* Don't share your private key with anyone, including services like Keybase.
* Keep at least one backup of your private key and revocation certificate in a
  secure location, such as a thumb drive.

[disk]: https://theintercept.com/2015/04/27/encrypting-laptop-like-mean/

## Physical Security

The following guidelines apply to how we physically secure
our laptops and mobile devices that may contain customer or user data.

* Lock your device when you are away from it.
* Don't leave your devices unattended in an unsecured area.
* Install a device tracking and remote data wipe tool such as [Prey].

[Prey]: https://www.preyproject.com/

## Application Security

The following guidelines apply to how we develop
software on behalf of ourselves and clients.

### Transmitting Information

* Don't accept passwords or session tokens over HTTP.
* Use HTTPS for all web traffic.
* Use HTTPS in the beginning; it's harder to introduce later.
* Use HTTPS redirects for HTTP traffic.
* Use [HSTS](http://tools.ietf.org/html/rfc6797) headers to enforce HTTPS
  traffic.
* Use secure cookies.
* Avoid protocol-relative URLs.

### Storing Information

* Don't log passwords.
* Don't store passwords in plain text.
* Don't hash passwords using a reversible cipher.
* Don't hash passwords using a broken cipher, such as MD5 or SHA1.

### Preventing Vulnerabilities and Regressions

During active development of a codebase,
track security alerts in Continuous Integration builds
with tools such as [Bundler Audit].

[Bundler Audit]: https://robots.thoughtbot.com/handling-security-issues-in-open-source-projects#one-thing-end-users-can-do

## Handling Vulnerabilities

The following guidelines apply to how we handle security incidents.

### Reporting

When someone finds a possible security issue in our software,
we encourage them to report it to our <security@thoughtbot.com> email address.

When an email comes in through this channel,
reply quickly with confirmation
(and CC <security@thoughtbot.com> so others know that it has been handled)
and the information for the thoughtbot PGP key,
which is located at <https://thoughtbot.com/security>.

### Reviewing, Logging and Following Up

When an encrypted message comes in,
post the exchange to a new [Constable] thread in the `security` interest,
and keep the thread updated with new messages as they appear.

[Constable]: https://constable.io

Further discussion of security takes place in the `#security` channel in Slack.

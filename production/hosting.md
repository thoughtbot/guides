---

title: Hosting
summary: >
  We use services like Heroku, Fastly, and Amazon S3 to scale our products from
  prototype to production without hiring an operations team. We use Flightdeck
  for high security and enterprise infrastructure.

---

## Our defaults

We use [Heroku][]. It's a Platform as a Service (PaaS) built on Amazon's cloud
infrastructure. It is simple to use when our app is just a toy and is built to
scale up for high concurrency or high sustained load.

They act as our outsourced operations team, helping us deliver working
software, instead of dealing with already solved problems which we would have
to worry about with a bare-bones hosting provider.

Heroku uses conventions to make decisions for us that are unnecessary for us to
make. Some things like web servers and app servers are solved problems and can
be standardized across applications, regardless of the framework that they're
written in. Heroku has additional features like review apps (which helps in
code review by being able to test behaviour as it is used), pipelines (which
makes handling review, staging and production apps easier) and integrations
with other third-party services.

The cloud promises lower operating costs, especially at the beginning when
capacity can be lower. Forget about sunk costs of expensive servers.

The cloud and the services it enables will empower our clients' businesses to
start and operate in a manner that has never been possible before without
significant upfront investment.

If we offer file uploads for features like user avatars, we upload them to
[Amazon S3][].

We also serve our images, CSS, and JavaScript assets from a CDN such as
[Fastly][] or [Cloudflare][].

Beyond Heroku, we also support and promote the use of Infrastructure as Code
(IaC), especially with [Terraform][] for [AWS][] and [Kubernetes][] deployments.

## Higher security needs

The common [Heroku][] platform will not suffice when a strong level of security
or auditability is required, such as complying with SOC2 or NIST standards.
Typically, financial and healthcare scenarios involve this need, as do public
companies, enterprises, and those that do business with a federal or national
government.

Heroku does offer an [enterprise level][heroku enterprise]. This requires
arranging a negotiated contract with their parent company, Salesforce. Rates are
substantially higher than the common Heroku platform and have to be renewed
annually and needed capacity predicted. This does however offer the same easy to
deploy features as before. The additional cost can be offset by a lower need for
in-house Site Reliability Engineering (SRE) staff, though it is recommended to have someone available that can
periodically manage configuraton and monitor server loads.

A more sophisticated and adaptable solution is to consider Amazon Web Services
([AWS][]). We have created [Flightdeck][] to help manage high-security,
high-availability SOC2-compliant infrastructure. Flightdeck allows us to deploy
and manage our applications on Kubernetes. [Kubernetes][] is an open-source
container orchestration system that automates the deployment, scaling, and
management of containerized applications.

We strongly recommend that when involving a full AWS-based solution, the organization has [hired us to do this](https://thoughtbot.com/services/platform-engineering), has its own SRE or infrastructure management staff, or has hired another service provider.

These cannot be managed well casually and require period
updates and tuning to perform reliability and keep costs contained. We are able
to provide training for using Flightdeck, but any AWS-based solution at this
level will not be install-and-forget.

If a high level of security or auditability are not crucial, then the cost and
complexity introduced by either [Heroku Enterprise][] or Flightdeck is likely
not worth it. For instance, merely wanting to add [Amazon S3][] or
[AWS Cloudfront][] (CDN) will not be worth adopting a full AWS-based solution given
the complexity and cost introduced.

## Technologies

We are well-versed in the technologies we use and when to involve them. We don't
expect our clients to be experts in these technologies, but we do expect them to
trust us to make the right decisions.

We use the following technologies and services:

- Heroku
- Amazon S3
- Fastly
- Flightdeck
- Docker
- Kubernetes
- Terraform

[amazon s3]: http://aws.amazon.com/s3/
[aws]: https://aws.amazon.com/
[cloudflare]: https://www.cloudflare.com
[aws cloudfront]: https://aws.amazon.com/cloudfront/
[fastly]: http://www.fastly.com/
[flightdeck]: https://github.com/thoughtbot/flightdeck
[heroku]: http://heroku.com
[heroku enterprise]: https://www.heroku.com/enterprise
[kubernetes]: https://kubernetes.io/
[terraform]: https://www.terraform.io/

---
title: Domain Names and DNS
summary: >
    We use Porkbun to buy domain names, and Cloudflare to host DNS.
---

Use [Instant Domain Search][instant-domain-search] to see what's available.

Use [Porkbun][porkbun] to buy and maintain domain names.

Once your domain has been purchased, point its name servers to
[Cloudflare][cloudflare]. We like Cloudflare because it supports `CNAME
Flattening`, which is required in order for a root domain to work with Heroku.

Follow the [Custom Domains][custom-domains] tutorial to set up root and
subdomains on Heroku.

[cloudflare]: https://www.cloudflare.com
[custom-domains]: https://devcenter.heroku.com/articles/custom-domains
[instant-domain-search]: https://instantdomainsearch.com
[porkbun]: https://porkbun.com

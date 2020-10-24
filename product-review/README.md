# Product Review

Cut down cycle time and focus on the user by getting a teammate to review your
changes to the product before you get a code review or deploy to staging.

For each change, choose one of four techniques:

- In-person
- Screencast
- SSH tunnel
- Video chat and screen-share

## In-person

If they are sitting next to you, have them review the changes in person.

## Screencast

Use [Licecap] to share a screencast gif in the project's [Basecamp].

[licecap]: http://www.cockos.com/licecap/
[basecamp]: https://basecamp.com/

## SSH tunnel

Use [ngrok] to set up an SSH tunnel to your work in progress on your laptop:

```console
ngrok -subdomain=feature-branch-name 3000
```

Then, share the ngrok URL in the project's Basecamp.

[ngrok]: https://ngrok.com/

## Video chat and screenshare

Start a Google Hangout in the project's Basecamp:

```text
/hangout
```

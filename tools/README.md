Tools
========

A guide for finding the right tools.


Remote APIs
-----------
Install [httpie](https://github.com/jkbr/httpie).

Most requests can be done as follows:

    http [HTTP METHOD] [URL] < [JSON FILE WITH PARAMS]

Example:

    http POST https://some-cool-api.io < create.json

If you need to send files that are nested you can try to use vanilla curl:

    curl -i -F [parameter] -F [parameter] [url]

Example:
    curl -i -F 'user_profile[name]=robo' -F 'user_profile[avatar]=@avatar.png' https://some-cool-api.io/user_profile

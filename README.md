# postfix_redis

A Chef cookbook which installs a mail server (postfix) and a redis server.
All emails the mail server receives are stored in a redis server.
We are able to query this redis server using "rcpt to" address and get all the emails for that recipient.

Cookbook is kitchen testable.

Use /opt/postfix_redis/get.py for getting emails.

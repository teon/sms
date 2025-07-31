I've looked for such a tool in bunch of places, have not found one so wrote-up a dirty quick bash tool for handling SMS messages by Modem Manager.
Usage:

```
sms <option> [arg] [argX]...

send [number] [text]    - send message
ls                      - show messages
read [number]           - read sms num X
del [number X]          - delete sms X, if not given ALL!
all                     - show ALL smseses
```

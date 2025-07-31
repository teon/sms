I've looked for such a tool in bunch of places, have not found one so wrote-up a dirty quick bash tool for handling SMS messages by Modem Manager.
I have a failover setup of my main internet provider with LTE modem, but also found very usfull to have a mobile number to send SMS messages when errors on the server occur, like:
- no internet connection and sending status about failover
- when my main internet conetion brakes, am sending status messages about modem restarts
- etc...

Usage:

```
sms <option> [arg] [argX]...

send [number] [text]    - send message
ls                      - show messages
read [number]           - read sms num X
del [number X]          - delete sms X, if not given ALL!
all                     - show ALL smseses
```

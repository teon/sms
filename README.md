I've searched in many places for such a tool but couldn't find one, so I wrote a quick and dirty Bash script to handle SMS messages using ModemManager.
I have a failover setup for my main internet provider using an LTE modem. I've also found it very useful to have a mobile number available for sending SMS alerts when server errors occur, such as:

- no internet connection — sending status updates about the failover
- main internet connection failure — sending messages about modem restarts
- and so on...

Usage:

```
sms <option> [arg] [argX]...

send [number] [text]    - send message
ls                      - show messages
read [number]           - read sms num X
del [number X]          - delete sms X, if not given ALL!
all                     - show ALL smseses
```

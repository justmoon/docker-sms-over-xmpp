# What is sms-over-xmpp

sms-over-xmpp is an XMPP component (XEP-0114) that acts as a gateway between an XMPP network and the SMS network. It allows you to send and receive SMS messages as if they were XMPP messages, using your favorite XMPP client.

You send an XMPP message and your friend receives an SMS. When she responds by SMS, you receive an XMPP message.

For more information, please see: https://github.com/mndrix/sms-over-xmpp

# How to use this image

```
$ docker run \
-e XMPP_HOST=127.0.0.1 \
-e XMPP_PORT=5347 \
-e XMPP_NAME=sms.example.com \
-e XMPP_SECRET="shared secret from your XMPP server config" \
-e TWILIO_ACCOUNT_SID="AC..." \
-e TWILIO_KEY_SID="SK..." \
-e TWILIO_KEY_SECRET="..." \
-e USERS='[{"username":"john@example.com","number":"+13075551212"}]' \
--name my-sms-gateway \
-d \
justmoon/sms-over-xmpp
```

# Environment variables

### `XMPP_HOST`

IP or hostname of your XMPP server.

### `XMPP_PORT`

Port where sms-over-xmpp should connect to your XMPP server. Optional, default: `5437`.

### `XMPP_NAME`

XMPP domain used by the server. E.g. `sms.example.com`.

### `XMPP_SECRET`

Shared secret from your XMPP server config.

### `TWILIO_ACCOUNT_SID`<br>`TWILIO_KEY_SID`<br>`TWILIO_KEY_SECRET`

Your Twilio API credentials.

### `USERS`

Use this to map XMPP usernames to E.164 phone numbers. JSON format, e.g.

``` json
[
  {
    "username": "john@sms.example.com",
    "number": "+13075551212"
  }
]
```

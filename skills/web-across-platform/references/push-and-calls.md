# Web Push, call notifications, delivery receipts

The templates are `templates/web/push-sw.js` (service worker side) and `templates/web/push.js`
(subscribe and sync).

## Subscribe (push.js)
- **VAPID:** get the public key from the backend and call
  `registration.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey })`.
- **Register it:** POST the subscription to the backend with the app key (several apps can share
  one backend), e.g. `{ app: "nsoro" }`.
- **Resync it after every login/dashboard refresh** (`syncPushSubscription()`), so the device stays
  linked to the current account. On logout, consider unsubscribing or unlinking it.
- **Prompt from a tap**, never on page load. iOS requires it, and Chrome punishes the other way.

## Backend send (web-push)
- **TTL:** set one per type. Calls get **35 s**, so a phone that was offline never rings for a
  finished call.
- **Urgency:** `urgency: 'high'` for calls and DMs, so FCM wakes a dozing phone.
- **Tags:** use `<app>-call-<callId>` so the SW can find and close the notification later.
- **Payload:** `{ title, body, url, tag, icon, badge, app, ack?, call? }`, where
  `call = { callId, kind }`.

## Service worker (push-sw.js)
- **Delivery receipt:** if the payload has `ack.url`, POST the short-lived signed token. This is
  what gives the second grey tick, and "Ringing…" instead of "Calling…" on the caller's screen.
- **App focused** (`clients.matchAll().some(w => w.focused)`): skip the call notification, because
  the in-app call screen is already ringing. Post `{type:'push'}` to the windows.
- **Calls:** `requireInteraction`, a long `vibrate` pattern, and **Answer/Decline actions**. The
  Android app's DelegationService matches the "Answer" title.
- **Ring in the background.** A web app can't loop a ringtone, so `ringUntilAnswered()` re-shows
  the notification every 4 s (`renotify`) for up to 35 s. Each time it:
  - asks `POST /push/call-status` whether the call is still ringing;
  - stops if the notification was swiped away, the app came to the front, or the call was
    answered, declined or ended.
  It then closes the incoming-call notification; the missed-call one stays.
- **On Android this isn't enough:** see the DelegationService fix in `android.md`.
- **notificationclick:**
  - Decline → POST `/push/call-decline`.
  - Answer or tap → focus an open window and `postMessage({type:'call-answer', callId})`, or open
    `/messages/<caller>?answer=<callId>`, which answers as soon as the call rings in the app.
- **Close the call notification from the page** too, once a call is answered, declined or over
  (`registration.getNotifications({tag}).forEach(n => n.close())`).

## Calls themselves (WebRTC)
- **Signaling** goes over socket.io: invite → incoming → accept/decline → signal → end. Ring for
  35 s, then save a `type:'call'` chat message (kind, status, duration) and a missed-call
  notification with a call-back button.
- **Public STUN only works for most networks.** Strict NATs and mobile carriers need a **TURN**
  server (env `VITE_TURN_URL/USERNAME/CREDENTIAL`).
- **Tones:** synthesize the ringback and the ring with WebAudio, as original sounds. Don't copy
  another app's tones.

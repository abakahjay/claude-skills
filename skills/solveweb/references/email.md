# Transactional email that works on free hosting and avoids spam

Templates: `templates/backend/utils/mailTransport.js`, `templates/backend/scripts/gmailRelay.gs`,
`templates/backend/utils/cleanbridgeMail.js` (app mailer with unsubscribe + layout).

## The trap
Render's free plan (and many free hosts) **block outbound SMTP**. Gmail SMTP works on the laptop and
then fails in production with `Connection timeout` - silently if errors are swallowed. Check the host's
logs for "email failed" before assuming delivery works.

## Transport (utils/mailTransport.js) - picked by env
1. `MAIL_RELAY_URL` + `MAIL_RELAY_SECRET`: Google Apps Script web app (`gmailRelay.gs`) that sends from the
   owner's Gmail over HTTPS. Free, Google-signed (lands in inbox), ~100 mails/day.
   Setup (the owner must do the authorisation and paste secrets - never type secrets for them):
   script.google.com -> New project -> paste -> Script properties `RELAY_SECRET` -> Deploy as Web app
   (Execute as: Me, Access: Anyone) -> copy /exec URL -> set both env vars on the host.
2. `BREVO_API_KEY` (+ `BREVO_SENDER_EMAIL` verified in Brevo): HTTPS API, 300/day free.
3. `EMAIL_USER` + `EMAIL_PASS` (Gmail app password): SMTP, fine locally.
`deliver({ fromName, to, replyTo, subject, text, html, headers })` throws on failure; callers catch and log.

## Deliverability rules
- Send as the real account (From = EMAIL_USER). Never spoof another domain.
- Always a plain-text part plus simple HTML; no images, no link shorteners, calm wording.
- RFC 8058 headers: `List-Unsubscribe: <https://api/.../unsubscribe?token=>, <mailto:...>` and
  `List-Unsubscribe-Post: List-Unsubscribe=One-Click`, plus a visible unsubscribe link. Unsubscribe token =
  JWT with `purpose: "<app>-unsubscribe"`.
- Respect `user.emailNotifications === false` except for `force: true` mails (password reset).

## Links inside emails
Emails are opened on other devices, so links must never be `localhost`. `emailUrl(path)` uses
`<APP>_PUBLIC_URL`, else the client URL unless it is local, else the live site. Unsubscribe links keep
pointing at the server (and database) that sent the mail.

## One helper for notifications
`notify(userId, title, message, { pickupId, email, kind, ctaPath })` = save in-app notification + optional
email + live push (SSE). Use it for every user-facing event so channels stay consistent.

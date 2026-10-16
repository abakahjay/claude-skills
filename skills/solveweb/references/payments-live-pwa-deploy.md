# Payments, live updates, installable app, deploy

## Paystack (Ghana/Nigeria/Kenya/SA)
- Hosted checkout: `POST https://api.paystack.co/transaction/initialize` with
  `channels: ["mobile_money", "card", "bank", "bank_transfer", "ussd", "qr", "apple_pay"]`, amount in pesewas
  (`Math.round(cedis * 100)`), `callback_url` = frontend `/payment/callback`. Store the reference on the order.
- Verify server-side (`GET /transaction/verify/:reference`) before marking paid - never trust the redirect:
  check status, amount and currency match the order; idempotent; then send the receipt email. The frontend
  callback page calls the verify endpoint.
- Webhooks: raw body + `x-paystack-signature` HMAC-SHA512 with the secret key; mount before JSON parser.
- Test keys work immediately; live mode needs the owner to finish compliance in the dashboard. You may view
  the dashboard in the browser only after the user signs in themselves - never type their password.
- Money breakdown shown to users: subtotal lines + tax lines (Ghana: VAT 15, NHIL 2.5, GETFund 2.5, COVID 0;
  admin-editable) + total; worker share computed on the pre-tax subtotal. Cash jobs: worker owes the platform
  share (balance = earned - cash collected - payouts).

## Live updates (Server-Sent Events)
- Backend: `utils/cleanbridgeEvents.js` keeps `userId -> Set(res)`; `routes/cleanbridgeEvents.js`
  authenticates with `?token=` (EventSource can't send headers), heartbeats every ~25 s, and must be excluded
  from request logging (token in URL). `notify()` publishes to the user's streams.
- Frontend: `lib/live.js` one EventSource per session -> `window` event `cb:live`; `useApi(path, { live: true })`
  refetches on it; toast + chime + `Notification` when the tab is hidden; service worker `notificationclick`
  focuses/opens the app.
- New orders: alert matching, available workers instantly (in-app + push, no email spam).

## Installable app without store fees
- PWA: `manifest.webmanifest` (icons 192/512 + maskable, screenshots, `start_url: "/?source=app"`),
  `sw.js` (network-first navigations with offline fallback, cache-first hashed `/assets/*`, never cache the
  API). Bump the cache VERSION when changing it.
- Android APK/AAB via PWABuilder (Trusted Web Activity); host the APK on the site (`/download` page) and
  publish `/.well-known/assetlinks.json` with the package name + signing cert SHA-256 so it opens without
  the URL bar. iOS: "Add to Home Screen" instructions (App Store needs a paid account).
- Store accounts (Play $25, Apple $99/yr) require the user's payment - you can't create them.

## Deploy on Render
- Static frontend via Blueprint `render.yaml` (build `pnpm install && pnpm run build`, publish `dist`,
  SPA rewrite `/* -> /index.html`, `VITE_API_URL`). Don't run `corepack enable` (read-only FS).
- Backend web service: set env vars in the dashboard (secrets are entered by the user). Free instances
  sleep (~50 s cold start) and block SMTP (see email.md).
- After pushing, check the deploy logs and hit a health route before telling the user it's live.

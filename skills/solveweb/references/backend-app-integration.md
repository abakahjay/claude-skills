# Adding an app to a shared Express + MongoDB backend

The pattern used for CleanBridge GH inside FullBackendd (one Express server hosting several apps).

## Layout
- Namespace everything: `/api/v1/<app>/*` (auth, domain routes, geo, payments, events...).
- Own user collection per app: `<App>User` model (name, email lowercase+unique, phone unique+sparse,
  password optional when `googleId` is set, role enum, `isActive`, `emailNotifications`,
  `resetPasswordToken`, `resetPasswordExpires`). Never reuse another app's `User`.
- JWTs carry an app claim: `{ userId, role, app: "<app>" }`. The app's auth middleware
  (`templates/backend/middleware/cleanbridgeAuth.js`) rejects tokens without it, so one app's token
  can't be used on another app.
- `requireRole(...roles)` guard; it sets `guard.roles` so the API docs can show roles.
- DTO functions (`toUserDTO`, `toXDTO`) - return `id` not `_id`, never the password hash.
  Include derived flags the frontend needs, e.g. `profileComplete: Boolean(user.phone)`.

## Rules that save debugging time
- Validation / wrong-password errors are **400, not 401**. Frontends treat 401 as "session expired"
  and log the user out. Only the auth middleware sends 401.
- `express-async-errors` must be required first; `require('./utils/keepOriginalHandlers')` right after
  it if you use the live API docs.
- Mount raw-body routes (payment webhooks with HMAC signatures) BEFORE `bodyParser.json()`.
- Never log `MONGO_URI` (it contains the password) - log the host only.
- Never echo passwords (or hashes) in responses or error messages.
- Money is computed on the server only (quotes, taxes, splits). The client never sends a price.
- Mongoose 5 + a Windows dev box: files may be CRLF - edit with the Edit tool or normalise line endings
  in scripts, otherwise string replacements silently miss.

## Admin bootstrap
- `<APP>_ADMIN_EMAILS` (comma list): those emails become admin **only through Google sign-in** (proves
  ownership). If the account had a password but no Google link, clear the password when promoting.
- `<APP>_ADMIN_SIGNUP_KEY`: optional key that allows `role: "admin"` on email signup.

## Google sign-in (shared passport strategy)
- One Google OAuth client for the whole backend. Start: `GET /api/v1/auth/google?app=<app>&role=&redirect_uri=`.
  The app key and redirect travel in `state`; the shared callback dispatches to the app's `googleCallback`.
- Re-check `redirect_uri` against an allowlist (`utils/oauthRedirect.js`: ALLOWED_REDIRECT_DOMAINS plus the
  host of `<APP>_CLIENT_URL`) before redirecting with `?token=`.
- Keep the Google photo fresh unless the user uploaded their own (`avatarSource: "google" | "upload"`).
- Google-only users have no phone: frontend sends them to finish their profile (`profileComplete`).

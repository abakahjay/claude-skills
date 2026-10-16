# Forgot / reset password for any app (automatic)

Template: `templates/backend/utils/passwordReset.js` + `templates/backend/middleware/passwordResetLimiter.js`,
frontend `templates/frontend/pages/PasswordReset.jsx`.

## Wire it up (per user collection)
1. Model: add `resetPasswordToken: String` and `resetPasswordExpires: Date`.
2. Controller:
   ```js
   const { forgotPassword, resetPassword } = createPasswordReset({
       Model: MyAppUser, appKey: "myapp", appName: "MyApp",
       send: ({ user, email, subject, text, html }) => sendEmail({ to: email, subject, text, html }),
       // optional: displayName, isAllowedRedirect, defaultRedirect: () => clientUrl("/reset-password"), beforeReset
   });
   ```
3. Routes:
   ```js
   router.post("/forgot-password", forgotLimiter, forgotPassword);
   router.post("/reset-password/:token", resetLimiter, resetPassword);
   router.post("/reset-password", resetLimiter, resetPassword);
   ```

## Behaviour (keep it)
- Same answer whether or not the email exists (no account enumeration); email sent in `setImmediate`
  so timing doesn't leak either.
- Token: 32 random bytes, stored only as a SHA-256 hash, 30-minute expiry, single use.
- `redirect_uri` from the client must pass the allowlist (the link carries a secret). The link is
  `redirect_uri?token=&email=`. Without one it falls back to a hosted page `/resetPassword?app=<key>`.
- Errors are 400. Rate limits per IP per app: 5 forgot / 20 reset per 15 min (a second test run inside
  15 minutes will hit the limit - that's expected).

## Frontend
- `/forgot-password`: posts `{ email, redirect_uri: appUrl('reset-password') }`, then "check your email".
- `/reset-password?token=&email=`: two password fields, posts `/auth/reset-password/:token?email=`.
- Link "Forgot password?" from the login form. Google-only users can use it to add a password.

## Test checklist
signup -> unknown email gets generic 200 -> disallowed redirect 400 -> token stored hashed -> wrong token 400
-> short password 400 -> valid reset 200 -> token single-use -> old password fails -> new password works.

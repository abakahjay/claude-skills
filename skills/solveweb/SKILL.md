---
name: solveweb
description: "Playbook and working code templates for building and shipping full-stack web apps (React + Vite frontend, Express + MongoDB backend shared by several apps) - distilled from CleanBridge GH / FullBackendd. Use when starting a new web app or adding to one: plugging a new app into a shared Express backend, Google sign-in, automatic forgot/reset password for any app, transactional email that works on free hosting (Render blocks SMTP), live API docs listing every route with examples, free maps with good place search and place photos (no Google key), Paystack/MoMo payments, live updates (SSE), installable PWA/Android APK download, and Render deploys. Triggers: solveweb, new web app, full-stack app, add app to backend, forgot password, reset password, emails not arriving, SMTP timeout, API docs, swagger, map, location picker, place search, Google Maps alternative, Paystack, mobile money, live notifications, PWA, APK, deploy to Render."
---

# solveweb

A tested template for building a real web app end-to-end and shipping it. Everything here was built,
debugged and deployed on CleanBridge GH (waste-collection app for Ghana) and its shared backend FullBackendd.
Reuse the code in `templates/` - adapt names (`cleanbridge` -> your app key, `CleanBridge` -> your app name,
Ghana-specific bits -> your country) rather than rewriting from scratch.

## Stack assumed
- Frontend: React 19 + Vite, plain JS (`.jsx`), wouter routing, lucide-react icons, Tailwind v4 tokens +
  a component stylesheet, react-leaflet maps. pnpm.
- Backend: one Express 4 + Mongoose server hosting several apps under `/api/v1/<app>/*`,
  `express-async-errors`, JWT auth, passport Google OAuth, swagger-ui-express.
- Hosting: Render (static site + web service), MongoDB Atlas, GitHub.

If the project uses something else, keep the patterns and translate the code.

## Pick the module(s) you need

| Need | Read | Code in `templates/` |
|---|---|---|
| New app inside a shared backend (own users, JWT app claim, roles, admin bootstrap, Google sign-in, 400-not-401) | `references/backend-app-integration.md` | `backend/middleware/cleanbridgeAuth.js`, `backend/utils/oauthRedirect.js`, `frontend/lib/api.js`, `frontend/lib/auth.jsx` |
| Forgot / reset password for any app | `references/password-reset.md` | `backend/utils/passwordReset.js`, `backend/middleware/passwordResetLimiter.js`, `frontend/pages/PasswordReset.jsx` |
| Email that arrives (and works on Render) | `references/email.md` | `backend/utils/mailTransport.js`, `backend/scripts/gmailRelay.gs`, `backend/utils/cleanbridgeMail.js` |
| API docs for every route, with labels and examples | `references/api-docs.md` | `backend/utils/apiDocs.js`, `backend/utils/keepOriginalHandlers.js`, `backend/docs/apiAnnotations.js`, `backend/scripts/captureApiExamples.js` |
| Maps, GPS, place search that finds businesses, place photos | `references/maps-and-places.md` | `frontend/components/{MapView,LocationPicker,PlacePreview}.jsx`, `frontend/lib/hooks.js`, `backend/controllers/cleanbridgeGeo.js`, `backend/utils/ghanaPlaces.js`, `backend/scripts/buildGhanaPlaces.js` |
| Payments, live updates, installable app, deploy | `references/payments-live-pwa-deploy.md` | `backend/utils/cleanbridgeEvents.js`, `backend/routes/cleanbridgeEvents.js`, `frontend/lib/live.js`, `frontend/public/{sw.js,manifest.webmanifest}`, `frontend/render.yaml` |

Read only the reference(s) for the task at hand; each is short and self-contained.

## Workflow that worked
1. **Understand before editing**: read the repo's CLAUDE.md, the route table (`app.js`), and the models.
   On Windows, files may be CRLF - use the Edit tool, or normalise `\r\n` in edit scripts. Write long edit
   scripts to a scratch file instead of heredocs (quotes/backticks break heredocs).
2. **Server owns the truth**: prices, taxes, permissions and status transitions live on the backend; the
   frontend only displays. Validation errors are 400 (401 logs users out).
3. **Build in small verified steps**: after each backend change restart the server and hit the route with
   curl; after frontend changes run `pnpm run build`. For UI you can't reach while signed out, mount a
   temporary dev route, check it in the browser, then remove it.
4. **Test flows end-to-end with throwaway data** (temporary `@example.com` users, a `*_docs_tmp` database)
   and clean up after. Never let real users' data into docs, examples or logs.
5. **Ship**: commit with a clear message, push, let Render deploy, then check the live logs/route. Say
   plainly what was verified live and what was only verified locally.
6. **Update CLAUDE.md** in each repo with the non-obvious rules you just learned.

## Boundaries (don't cross these, even if asked)
- Don't type passwords, API keys, tokens or card details into websites, and don't create accounts or accept
  OAuth consent for the user. Do everything around it, then hand the user the exact step (e.g. "paste this
  secret into Render -> Environment").
- Google Maps / Play Store / App Store need the user's payment method - offer the free alternatives here.
- Don't print secrets (MONGO_URI, JWTs) to logs or the chat.

## Hard-won lessons (quick list)
- Render free: SMTP blocked -> use the HTTPS relay; instances sleep (~50 s cold start).
- `express-async-errors` hides handler names -> `keepOriginalHandlers.js` before routers.
- Auto-recorded swagger (express-oas-generator) is always incomplete -> build the spec from the router.
- OSM search misses many African businesses -> merge Overture Maps places; bias to the main city when the
  user's position is unknown.
- Leaflet maps hijack page scroll -> ScrollGuard; don't let taps move the pin -> "Adjust pin" mode.
- Email links must never point at localhost; unsubscribe links must hit the sending server.
- Profile-completion redirects must depend on the user record, not a URL flag.
- Rate limiters will fail your second test run within the window - that's the limiter working.

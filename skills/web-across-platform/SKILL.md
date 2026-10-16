---
name: web-across-platform
description: "Take one React/Vite website to every platform and keep it working there: Android app (Trusted Web Activity APK built with Bubblewrap, signed with apksigner, assetlinks), Android TV (leanback launcher, banner, arrow-key remote navigation), Windows desktop app (Electron + NSIS installer on GitHub Releases), iPhone/iPad/Mac/ChromeOS (installable PWA, install button, Home Screen push), a device-aware download page, Web Push with incoming calls that really ring on Android, and testing it all in BlueStacks and Chrome. Distilled from Nsoro. Triggers: web-across-platform, web-accros-platform, web across platform, cross-platform, make an app from my website, APK, TWA, bubblewrap, sign APK, apksigner, assetlinks, Android TV, TV remote, leanback, Electron, Windows app, exe installer, PWA, add to home screen, install button, download page, push notifications, call doesn't ring, notification only, BlueStacks, adb error closed, logout error on phone, works on desktop not on phone."
---

# web-across-platform

One website, every device. The website stays the single source of truth. Each platform is a thin
shell that loads the live site, so **one deploy updates the web, Android, Windows and PWA at
once**. Rebuild a shell only when the shell itself changes (name, icon, version, manifest, native
code).

Everything here was built, debugged and shipped on **Nsoro** (React 18 + Vite + Chakra + Zustand;
Express/MongoDB backend FullBackendd; Render static site). The code in `templates/` is the real,
working code. Adapt names (Nsoro/nsoro → your app, the package id, the site host, brand colours)
rather than rewriting it.

## Pick what you need

| Platform / task | Read | Code in `templates/` |
|---|---|---|
| Android app (TWA APK): create, version, build, **sign without Bubblewrap overwriting hand edits**, assetlinks | `references/android.md` | `android/build-and-sign.sh`, `android/twa-manifest.example.json`, `android/assetlinks.example.json` |
| Android TV: launcher, banner, no-touch | `references/android.md` (TV) | `android/AndroidManifest-additions.xml`, `web/generate-icons.mjs` (banner) |
| **Incoming calls only show a notification and don't ring** (Android app) | `references/android.md` (calls) | `android/DelegationService.java` |
| TV remote / keyboard navigation of the website | `references/tv.md` | `web/tvRemote.js` |
| Windows (also Mac/Linux) desktop app | `references/windows.md` | `desktop/main.js`, `desktop/package.json` |
| iPhone/iPad/Mac: PWA, install button, Home Screen push | `references/apple-pwa.md` | `web/vite.config.pwa.js`, `web/install.js`, `web/generate-icons.mjs` |
| Download / "Get the app" page | `references/apple-pwa.md` (download page) | `web/Download.jsx` |
| Web Push, call notifications, delivery receipts | `references/push-and-calls.md` | `web/push-sw.js`, `web/push.js` |
| Testing on Android (BlueStacks), in Chrome, verifying deploys; **logout errors on phones**; clipped menus | `references/testing.md` | `testing/bluestacks.sh` |

## Release checklist (in this order)
1. **Website first.**
   - Fix and lint (`npx eslint <changed files>`; ignore the old prop-types noise), then run
     `npm run build`.
   - Commit and push. The host deploys it, and every platform gets it.
2. **Test the logged-out paths and every breakpoint.** That means phone (bottom bar), tablet
   (72px rail) and desktop (sidebar), plus `?tv=1` with only the arrow keys. Most "error only on my
   phone" reports come from the logged-out crash or phone-only UI (`testing.md`).
3. **Android, only if the shell changed:**
   - Bump `versionCode` in `app/build.gradle`.
   - Run `build-and-sign.sh`.
   - Check that the SHA-256 equals `assetlinks.json`.
   - Run `adb install -r` in BlueStacks and expect "Success".
   - Copy the APK to `public/downloads/` and update the size label.
4. **Windows, only if the shell changed:**
   - Bump `desktop/package.json` and run `npm run dist`.
   - Publish with `gh release create`. The page links to `releases/latest/download/<App>-Setup.exe`.
5. **Icons, if the logo changed:** `node scripts/generate-icons.mjs`. Rebuild the APK if its icon or
   TV banner changed.
6. **Verify live.**
   - Grep the deployed JS bundle for your change.
   - Poll the APK's `content-length` until it equals the new file's size.
7. **Update the project's CLAUDE.md** with new versions and any new hand edits.

## Rules that save hours
- **Never run `bubblewrap update`** on a project with hand edits (TV, call ringing). It regenerates
  the manifest and Java files. Build with Gradle and sign with `apksigner` instead.
- **Never change the Android package id or signing key after release.** Installed apps stop
  updating, and the app falls back to showing a URL bar. Keep the keystore and
  `signing-key-info.txt` off git, and read the passwords from that file through env vars without
  ever printing them.
- **Android ignores the sound and vibration a website asks for.** Ringing calls need the native
  `DelegationService` override; a service-worker re-notify loop alone gets throttled.
- **Logout is local.** Clear the device first, then tell the server in the background. Hooks on
  public pages must cope with `authUser === null`.
- **Links on the download page come from the public site address constant**, never
  `window.location`.
- **Google sign-in in Electron** needs the "Electron" token stripped from the user agent.
- **iPhone push** works only after the user adds the app to the Home Screen.
- **Ask before you restart BlueStacks** (or anything else the user has open) to change settings.
- **Don't copy another product's branding** (names, icons, gradients, tones) into any platform
  shell. Each shell carries the app's own brand.

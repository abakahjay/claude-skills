# Android: Trusted Web Activity APK (+ Android TV, + ringing calls)

The Android app is a **Trusted Web Activity (TWA)**: a tiny native shell that opens the live site
full screen in Chrome. A website deploy updates the app, so you only rebuild the APK when the *shell*
changes (name, icon, version, manifest, native code).

## One-time setup (Windows)
- **Tools.** Use Java 17 (Temurin) and the Android SDK (cmdline-tools, build-tools, platform-tools),
  for example under `C:\Users\<you>\android-tools\{jdk-17…, sdk}`. Bubblewrap stores their paths in
  `~/.bubblewrap/config.json` (`jdkPath`, `androidSdkPath`).
- **Before running `bubblewrap`:** unset `NoDefaultCurrentDirectoryInExePath` and put the JDK's
  `bin` on PATH.
- **Create the project.** Run `npm i -g @bubblewrap/cli`, then
  `bubblewrap init --manifest https://<site>/manifest.webmanifest`. That writes `twa-manifest.json`
  (see `templates/android/twa-manifest.example.json`) and generates the Gradle project.
- **Signing key.** Bubblewrap creates `signing.keystore` plus `signing-key-info.txt` (it holds the
  passwords and the alias).
  - Keep both off git, in a folder on the owner's PC.
  - **Never lose the key.** An APK signed with a different key can't update installed apps, and
    `assetlinks.json` stops matching.
- **Digital Asset Links.**
  - Serve `public/.well-known/assetlinks.json` (`templates/android/assetlinks.example.json`) with
    the key's SHA-256 fingerprint.
  - If it doesn't match, the app opens with a browser URL bar instead of full screen.
  - List *every* host the app opens. When the site moves, keep the old host's `assetlinks.json`
    working too.
- **Package id.** Never change it after release, because installed apps would break. Even if the
  product is renamed, keep the old id (Nsoro keeps `com.instagrammmm.app`).

## Build and sign
- **First build:** `bubblewrap build`, with `BUBBLEWRAP_KEYSTORE_PASSWORD` and
  `BUBBLEWRAP_KEY_PASSWORD` set.
- **Once the project has hand edits** (TV, call ringing): **don't run `bubblewrap update`**. It
  regenerates `AndroidManifest.xml` and the Java files and silently drops the edits. Bumping
  `twa-manifest.json` also makes `bubblewrap build` want to regenerate. Instead:
  1. Bump `versionCode` (+1, required for an update to install) and `versionName` in
     `app/build.gradle`.
  2. Run `templates/android/build-and-sign.sh`. It runs `gradlew assembleRelease`, then
     `zipalign -p 4`, then `apksigner sign`, with the passwords read from `signing-key-info.txt`
     through env vars so they're never printed. It then verifies the SHA-256 and copies the APK to
     `public/downloads/`.
- **Gradle error "SDK location not found":** set `ANDROID_HOME`.
- **Check the result:**
  - `apksigner verify --print-certs`: the SHA-256 equals `assetlinks.json`.
  - `aapt dump badging`: shows `versionCode` and the features.
  - Installing over the old version with `adb install -r` gives "Success" (see `testing.md`).
- **Ship:** copy the APK to `public/downloads/<App>.apk`, update the size label on the download
  page, commit, and push. Keep the previous APK as `<App>-<old version>.apk` next to the key.
- **Don't let the service worker cache the APK.** Exclude `/downloads/` from the runtime caching
  (see `vite.config.pwa.js`).

## Android TV
- Make three manifest edits, in `templates/android/AndroidManifest-additions.xml`:
  1. Touchscreen and leanback marked `required="false"`.
  2. `android:banner` on the application.
  3. The `LEANBACK_LAUNCHER` category.
- **Banner:** 640×360 PNG in `res/drawable-xhdpi/tv_banner.png`, rendered by `generate-icons.mjs`
  (logo + wordmark on the brand background, edge to edge).
- **The website must work with a remote** (see `tv.md`). Without that, the app opens on a TV but
  can't be used.

## Incoming calls that actually ring
**Problem.**
- A web push becomes a delegated notification. android-browser-helper posts it on one generic
  channel at IMPORTANCE_DEFAULT.
- Since Android 8 the per-notification `vibrate` and sound that the site asks for are ignored.
- The result is one short "ding" and a call sitting quietly in the tray. Re-showing it every few
  seconds from the service worker gets throttled (Android 15 adds notification cooldown).

**Fix** (`templates/android/DelegationService.java`): override `onNotifyNotificationWithChannel`.
- **Detect** the incoming-call notification. It has an action titled "Answer…" (or the tag
  contains `<app>-call-`). Keep those action titles in `push-sw.js` in sync.
- **Re-post it** with `Notification.Builder.recoverBuilder(...)`:
  - its own channel: IMPORTANCE_HIGH, `TYPE_RINGTONE` sound with `USAGE_NOTIFICATION_RINGTONE`,
    a vibration pattern and public lock-screen visibility;
  - `CATEGORY_CALL`, `setOnlyAlertOnce(true)` (the SW's re-shows don't restart the ring), and
    `setTimeoutAfter(45s)` as a safety net;
  - `flags |= FLAG_INSISTENT`, so the sound and vibration loop until cancelled.
- **Ringing stops** when the service worker closes the notification (answered, declined or over)
  or after the timeout.
- **Missed-call notifications** share the tag but have no buttons, so they stay normal.
- Channel settings are fixed once created. To change them, use a new channel id.
- Notes:
  - It respects silent mode and Do Not Disturb, like a real call.
  - Browser-only users (not the APK) keep the plain notification; a website can't do better.
  - A full-screen call UI (`setFullScreenIntent`) needs `USE_FULL_SCREEN_INTENT`, which Android 14+
    limits. It was skipped on purpose.

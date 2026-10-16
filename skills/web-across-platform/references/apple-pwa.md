# iPhone / iPad / Mac / ChromeOS: the installable PWA, plus the download page

## PWA basics (vite-plugin-pwa), from `templates/web/vite.config.pwa.js`
- **Manifest:**
  - `id`, `name`, `short_name`, `start_url: '/?source=app'`, `display: standalone`,
    `display_override: ['window-controls-overlay','standalone']`, `theme_color`,
    `background_color`;
  - icons: 192, 512 and a **maskable** 512;
  - `shortcuts` (long-press on Android, taskbar right-click on Windows).
- **Never serve a stale app:** `skipWaiting`, `clientsClaim`, `cleanupOutdatedCaches`, and
  `navigateFallback: null`. Pages use NetworkFirst with a 4 s timeout. Without this, the old bundle
  kept running after deploys.
- **Push handlers** live in `public/push-sw.js`, loaded through `workbox.importScripts`.
- **Exclude `/downloads/`** (APK) from runtime caching.
- **iOS needs tags in `index.html`:** `apple-touch-icon` (180×180, no transparency),
  `apple-mobile-web-app-capable`, `apple-mobile-web-app-status-bar-style` and
  `apple-mobile-web-app-title`.
- **Icons:** `templates/web/generate-icons.mjs` renders every icon with headless Chrome from an
  HTML/SVG mark: PWA, maskable (logo inside the 80% safe zone), apple-touch, favicons, the desktop
  `icon.png`, the TV banner and the wordmark. Re-run it whenever the logo changes.

## Install button (`templates/web/install.js`)
- **Chrome/Edge** (Android, Windows, Mac, ChromeOS) fire `beforeinstallprompt` **once, early**.
  Import install.js at the top of `main.jsx`, store the event, and replay it from your own Install
  button (`usePwaInstall()`).
- **Safari (iPhone/iPad/Mac)** has no prompt API. Show steps instead:
  - iPhone/iPad: Share → Add to Home Screen.
  - Mac Safari: File → Add to Dock.
- `detectDevice()` tells iPadOS apart from Mac (iPad claims to be a Mac; check `maxTouchPoints > 1`).
- `isInstalled()` uses `display-mode: standalone` or `navigator.standalone`. Hide "Get the app"
  links inside the installed app.

## Push on Apple devices
- **iPhone/iPad:** Web Push works only after the app is **added to the Home Screen** (iOS 16.4+),
  and the permission prompt must come from a tap. Show a "Add to Home Screen to get
  notifications" hint to iOS users in Safari.
- **Mac:** Safari 16+ and Chrome both support push.

## Download page (`templates/web/Download.jsx`)
- **Detect the device and put its option first:**
  - Android: Install (WebAPK) as the main button, with the APK as a fallback;
  - Windows: the Setup.exe from GitHub Releases, plus Install from the browser;
  - iPhone/iPad/Mac: PWA steps for the browser in use.
- **Build every link from the public site address constant, never `window.location`** (that
  showed localhost in local runs).
- **Label each file with its size and version** (update them at release).
- **Explain the warnings:** the APK's "unknown sources" and the .exe's SmartScreen.
- **"Get the app" entry points:** the sidebar/More menu, a phone feed banner, the auth page and the
  footer, all hidden when `isInstalled()`.

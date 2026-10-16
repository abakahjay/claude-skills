# Windows (and Mac/Linux) desktop app: Electron shell around the live site

The templates are `templates/desktop/main.js` and `templates/desktop/package.json`, in a `desktop/`
folder in the repo.

## What main.js does
- **Loads the live site** (`SITE`). There's no bundled frontend, so a website deploy updates the
  app.
- **Single instance:** `app.requestSingleInstanceLock()`. A second launch focuses the existing
  window.
- **Window size from the screen.** `screen.getPrimaryDisplay().workAreaSize` gives 90% of the
  screen, capped at 1600×1000. It maximizes when the width is 2400px or more (TVs and huge
  monitors). The min size is clamped to the screen.
- **Starts hidden**, then `show()` on `ready-to-show` (no white flash), with `backgroundColor` set
  to the brand's dark colour.
- **Plain Chrome user agent.** Google blocks OAuth sign-in from user agents that contain
  "Electron", so strip the Electron and app tokens before any window opens:
  `app.userAgentFallback = app.userAgentFallback.replace(/\s(Electron|<App>|<app>-desktop)\/\S+/gi, "")`.
- **Links:** hosts in `IN_APP_HOSTS` (the site, the API host, `accounts.google.com`) stay in the
  window, and everything else opens in the real browser (`shell.openExternal`, through both
  `setWindowOpenHandler` and `will-navigate`).
- **Offline page:** `did-fail-load` shows a small offline page with a Try again button in brand
  colours, never another product's.
- **Security:** `contextIsolation: true` and `sandbox: true`, with no preload and no Node in the
  page.

## Build the installer
- **Build:** `cd desktop && npm i && npm run dist`, which runs `electron-builder --win nsis --x64`
  and produces `release/<App>-Setup.exe`.
- **NSIS options:** `oneClick`, per-user (no admin), desktop and Start menu shortcuts,
  `runAfterFinish`.
- **Icon:** `build/icon.png`, 512×512, rendered by `generate-icons.mjs`.
- **Bump `version`** in `desktop/package.json` for every release.
- **Known Windows error:** electron-builder fails while unpacking `winCodeSign` (macOS symlinks
  need admin). Fix it by extracting the downloaded `winCodeSign-2.6.0.7z` yourself into
  `%LOCALAPPDATA%\electron-builder\Cache\winCodeSign\winCodeSign-2.6.0` (ignore the symlink errors)
  and re-running.
- **Publish:** add it as a GitHub Release asset with `gh release create vX.Y.Z release/<App>-Setup.exe`.
  - Link to it as `https://github.com/<owner>/<repo>/releases/latest/download/<App>-Setup.exe`,
    which always points at the newest release.
  - Don't commit the .exe to the site: it's large, and Render/GitHub limits apply.
- **SmartScreen:** unsigned installers show a "Windows protected your PC" warning. Mention "More
  info → Run anyway" on the download page. A code-signing certificate is the only real fix.

## Mac / Linux
- The same main.js works. Add `mac: { target: 'dmg' }` and `linux: { target: 'AppImage' }` to the
  build config.
- Building a Mac app needs a Mac (or CI), and signing and notarizing it needs a paid Apple
  developer account. For Mac users the PWA (`apple-pwa.md`) is usually enough.

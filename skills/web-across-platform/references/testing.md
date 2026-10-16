# Testing on every platform, and the bugs that only show up there

## Android in BlueStacks (`templates/testing/bluestacks.sh`)
- **Switch ADB on.** BlueStacks needs Settings → Advanced → Android Debug Bridge **ON**. With it
  off, `adb connect` still "works", but shells die with `error: closed` and installs fail with
  `Connect error for write: closed`.
- **Turning it on from a script** means editing `bst.enable_adb_access="1"` in
  `C:\ProgramData\BlueStacks_nxt\bluestacks.conf` and restarting
  `HD-Player.exe --instance Tiramisu64` (Android 13).
  - **Ask the user first**, because it kills whatever they're watching.
  - Back up the conf first.
- **adb:** use `C:\Program Files\BlueStacks_nxt\HD-Adb.exe` at `127.0.0.1:5555` (the port is
  `bst.instance.<name>.adb_port`).
- **Install as an update:** `adb install -r new.apk` giving "Success" over the old version proves
  the signing key matches. Check `dumpsys package <pkg>` for versionCode/versionName.
- **Drive it:**
  - `screencap -p` gives a 1600×900 landscape screen, so BlueStacks shows the **tablet layout**.
    Phone-only UI (base breakpoint) won't appear there.
  - `input tap x y` for touches.
  - `input keyevent DPAD_*` as a TV remote.
- **First screenshots can be black** while Chrome's Custom Tab starts up. Wait about 10 s and check
  `dumpsys activity activities | grep topResumedActivity`; it should be Chrome's
  `TranslucentCustomTabActivity` for a TWA.
- **Test calls:** log in, close the app, and call that account from another device or browser. It
  should ring continuously until answered or declined. Inspect with `dumpsys notification
  --noredact`.

## Browser (Claude in Chrome)
- **Local dev:** each origin has its own localStorage, so localhost has its own login.
- **Logged-out pages:** to test them, open a public page (a profile or post link) in a logged-out
  origin.
- **Read the error:** the console and page text show React Router's "Unexpected Application Error"
  with the stack trace.
- **Prove a fix:** swap the old file back in (`git show HEAD:path > path`), reproduce, restore the
  fix, and re-check.
- **Vite HMR reloads** while you edit can blank the page mid-test. Reload before trusting a result.
- **Check backends:** a local `.env` often points at a local backend (`VITE_API_URL=http://localhost:…`).
  If profiles say "not found", start the backend or point the env at production.

## Bugs that bite cross-platform apps
- **Logged-out crash.** Code like `authUser.user ? … : authUser` throws once `authUser` is null.
  - **Where it shows:** public routes (profiles, shared posts) render while logged out, and phones
    often log out *from a page that stays on screen* (the profile), so the page crashes right
    after logout. Desktop logs out from Home, which redirects, so the bug hides there.
  - **Fix:** use `authUser?.user ?? authUser` in every hook used on a public page, and guard
    actions ("You must be logged in…").
- **Logout must be local.** JWTs live on the device, so clear the store and storage, close the
  socket, and *then* tell the server (fire and forget). If you await the server first, a Render
  cold start or a weak phone signal leaves the user "Logout failed" and still signed in.
- **Menus clipped on tablets.** A Chakra `Menu` inside a scrolling sidebar (`overflowY:auto`) gets
  cut to the rail width. Wrap the `MenuList` in `<Portal>`.
- **Breakpoints:** phone (base) uses a bottom tab bar; tablet (md–lg) a 72px icon rail; desktop
  (xl+) a labelled sidebar. Test all three. Phone-only buttons (e.g. a profile Log out) need a
  desktop or tablet counterpart.
- **Video on phones:** start videos through a helper that falls back to muted autoplay and shows
  "Unmute". A bare `video.play().catch(()=>{})` freezes on Android.
- **Every platform loads the live site**, so a deploy fixes web, APK, desktop and PWA at once.
  Rebuild the shells only when the shell itself changes.

## Verify a deploy (Render static site)
- **Website:** fetch `/`, find `assets/index-*.js`, and grep the bundle for a string from your
  change. Hashes differ from the local build when the env differs, so grep content, don't compare
  hashes.
- **APK:** poll `curl -sI <site>/downloads/<App>.apk` until `content-length` equals the new
  file's size (about 1–2 minutes).
- **Security headers:** check them in the host's dashboard (CSP `connect-src` must include the API,
  socket and media hosts).

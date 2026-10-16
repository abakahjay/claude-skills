# TVs: make the website usable with a remote

A TV browser or Android TV app has no mouse and no touch, only **arrow keys, OK (Enter) and Back**.
Most React apps can't be used with that until you add spatial navigation.

## `templates/web/tvRemote.js` (import once in main.jsx)
- **TV detection:**
  - the user agent matches `Android TV|GoogleTV|BRAVIA|AFT*|SMART-TV|Tizen|Web0S|webOS|HbbTV|CrKey`;
  - or `(pointer: none)` matches;
  - or `?tv=1` is in the URL (for testing on a laptop).
  On phones and computers it does nothing.
- **Arrow keys:** focus the nearest focusable element in that direction. The score is
  distance-ahead + 2× sideways offset, so straight ahead beats diagonal. If nothing is that way,
  the page scrolls normally.
- **Dialogs:** inside an open `[role=dialog]` or `[role=menu]`, only its own controls count.
- **Text fields:** Left/Right stay in the field (to move the caret); Up/Down still leave it.
- **OK** clicks `role="button"` elements that aren't real buttons.
- **Back** is left to the browser (history back).
- **Focus outline:** `html.tv` gets a visible ring. In Chakra's global styles:
  `"html.tv :focus": { outline: "3px solid <accent>", outlineOffset: "2px" }`.

## Make clickable things reachable
- Every clickable `Box`/`Flex`/`Text`/`div` needs **`role="button"` and `tabIndex={0}`**: post
  tiles, "View all comments", Create, the auth-page toggles, the Google sign-in button and so on.
  Real `<button>`/`<a href>` elements are already fine.
- Find candidates with a search for `onClick=` on non-button elements: `grep -rn "onClick" src |
  grep -v "<Button\|<button\|<a \|IconButton\|MenuItem"`.
- This also fixes keyboard accessibility on desktop.

## Test
- **On a laptop:** open `http://localhost:<port>/?tv=1` and drive it with only the arrow keys and
  Enter.
- **In an emulator:** in BlueStacks or an Android TV emulator, send `adb shell input keyevent
  DPAD_DOWN` / `DPAD_CENTER` / `BACK` (see `testing.md`).
- **Android TV app:** see the TV section in `android.md`. The Electron app maximizes on huge
  screens (`windows.md`).

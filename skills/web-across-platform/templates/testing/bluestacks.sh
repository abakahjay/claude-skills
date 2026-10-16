#!/usr/bin/env bash
# Drive BlueStacks 5 (Android 13 "Tiramisu64" instance) from Git Bash to test an APK.
#   source bluestacks.sh; bs_install app.apk; bs_launch com.example.app; bs_shot out.png; bs_tap 54 500
#
# BlueStacks' "Android Debug Bridge" switch (Settings > Advanced) must be ON. With it off,
# adb connects but most commands fail with "error: closed" and installs fail with
# "Connect error for write: closed". Turning it on from outside needs a restart:
#   close HD-Player, set bst.enable_adb_access="1" in C:\ProgramData\BlueStacks_nxt\bluestacks.conf,
#   start "C:\Program Files\BlueStacks_nxt\HD-Player.exe" --instance Tiramisu64
# Ask the user first - the restart kills whatever they are doing in BlueStacks.
# Use BlueStacks' own HD-Adb.exe; the SDK's adb also works once ADB access is on.

BS_ADB="${BS_ADB:-/c/Program Files/BlueStacks_nxt/HD-Adb.exe}"
BS_DEV="${BS_DEV:-127.0.0.1:5555}"   # bst.instance.<name>.adb_port in bluestacks.conf

bs() { "$BS_ADB" -s "$BS_DEV" "$@"; }
bs_connect() {
	"$BS_ADB" connect "$BS_DEV" >/dev/null 2>&1
	for _ in $(seq 1 60); do
		[ "$(bs shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" = "1" ] && return 0
		sleep 3; "$BS_ADB" connect "$BS_DEV" >/dev/null 2>&1
	done
	echo "BlueStacks did not finish booting" >&2; return 1
}
# Install as an update (-r). "Success" over the old version proves the signing key matches.
bs_install() { bs_connect && bs install -r "$1"; }
bs_version() { bs shell dumpsys package "$1" | grep -m2 "versionName\|versionCode"; }
bs_launch() { bs shell monkey -p "$1" -c android.intent.category.LAUNCHER 1 >/dev/null; }
bs_front() { bs shell dumpsys activity activities | grep -m1 topResumedActivity; }
bs_shot() { bs exec-out screencap -p > "$1"; }      # 1600x900 landscape = tablet layout
bs_tap() { bs shell input tap "$1" "$2"; }
bs_key() { bs shell input keyevent "$1"; }          # DPAD_UP/DOWN/LEFT/RIGHT, DPAD_CENTER, BACK - TV remote
bs_notifications() { bs shell dumpsys notification --noredact | grep -A3 "NotificationRecord"; }

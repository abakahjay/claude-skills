#!/usr/bin/env bash
# Build and sign the Android (TWA) app WITHOUT `bubblewrap update`, so hand edits to
# AndroidManifest.xml / DelegationService.java survive. Run from Git Bash on Windows.
#
#   PROJECT=/path/to/twa-project \
#   KEYSTORE="/path/to/signing.keystore" \
#   KEYINFO="/path/to/signing-key-info.txt" \
#   OUT="/path/to/web/public/downloads/App.apk" \
#   bash build-and-sign.sh
#
# Bump versionCode/versionName in app/build.gradle first. KEYINFO is the file Bubblewrap
# wrote when it made the key ("Key store password: ...", "Key alias: ...", "Key password: ...").
# The passwords go straight into apksigner via env vars and are never printed.
set -euo pipefail
: "${PROJECT:?}" "${KEYSTORE:?}" "${KEYINFO:?}" "${OUT:?}"
TOOLS=${TOOLS:-/path/to/android-tools}
export JAVA_HOME=${JAVA_HOME:-$(ls -d "$TOOLS"/jdk-17* | head -1)}
export ANDROID_HOME=${ANDROID_HOME:-$TOOLS/sdk}
export PATH="$JAVA_HOME/bin:$PATH"
BT=$(ls -d "$ANDROID_HOME"/build-tools/*/ | tail -1)

cd "$PROJECT"
./gradlew assembleRelease -q

get() { grep -m1 "^$1:" "$KEYINFO" | sed -E "s/^$1:[[:space:]]*//" | tr -d '\r'; }
export KS_PASS KEY_PASS
KS_PASS="$(get 'Key store password')"
KEY_PASS="$(get 'Key password')"
ALIAS="$(get 'Key alias')"

"$BT/zipalign.exe" -f -p 4 app/build/outputs/apk/release/app-release-unsigned.apk app-release-unsigned-aligned.apk
"$BT/apksigner.bat" sign --ks "$KEYSTORE" --ks-key-alias "$ALIAS" \
	--ks-pass env:KS_PASS --key-pass env:KEY_PASS \
	--out app-release-signed.apk app-release-unsigned-aligned.apk
unset KS_PASS KEY_PASS

echo "--- signer (must match public/.well-known/assetlinks.json):"
"$BT/apksigner.bat" verify --print-certs app-release-signed.apk | grep -i "SHA-256"
echo "--- package:"
"$BT/aapt.exe" dump badging app-release-signed.apk | grep -E "^package:|leanback|banner|uses-feature-not-required"
cp app-release-signed.apk "$OUT"
echo "Copied to $OUT ($(stat -c %s "$OUT") bytes) - update the size label on the download page."

package com.instagrammmm.app;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.media.AudioAttributes;
import android.media.RingtoneManager;
import android.os.Build;

import androidx.core.app.NotificationManagerCompat;

public class DelegationService extends
        com.google.androidbrowserhelper.trusted.DelegationService {

    // Incoming calls get their own channel so they ring like a phone call: the
    // phone's ringtone at ringer volume, heads-up, looping until the call is
    // answered, declined or over. The site's service worker (public/push-sw.js)
    // closes the notification then, which stops the ring. Android ignores the
    // sound and vibration a website asks for, so this can only be done here.
    private static final String CALL_CHANNEL = "nsoro_incoming_calls";
    // Safety net in case the notification is never closed: a call rings for 35 s.
    private static final long CALL_TIMEOUT_MS = 45_000;

    @Override
    public void onCreate() {
        super.onCreate();


    }

    @Override
    public boolean onNotifyNotificationWithChannel(String platformTag, int platformId,
            Notification notification, String channelName) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O || !isIncomingCall(platformTag, notification)) {
            return super.onNotifyNotificationWithChannel(platformTag, platformId, notification, channelName);
        }
        if (!NotificationManagerCompat.from(this).areNotificationsEnabled()) return false;

        NotificationManager manager = getSystemService(NotificationManager.class);
        ensureCallChannel(manager);
        Notification ringing = Notification.Builder.recoverBuilder(this, notification)
                .setChannelId(CALL_CHANNEL)
                .setCategory(Notification.CATEGORY_CALL)
                .setVisibility(Notification.VISIBILITY_PUBLIC)
                // the service worker re-shows the notification every few seconds;
                // keep the one ring going instead of restarting it each time
                .setOnlyAlertOnce(true)
                .setTimeoutAfter(CALL_TIMEOUT_MS)
                .build();
        ringing.flags |= Notification.FLAG_INSISTENT; // repeat ringtone and vibration
        manager.notify(platformTag, platformId, ringing);
        return true;
    }

    // The incoming-call notification (tag ig-call-<id>) has Answer / Decline buttons;
    // the "Missed call" one shares the tag but has no buttons and must not ring.
    private static boolean isIncomingCall(String platformTag, Notification notification) {
        if (notification.actions == null) return false;
        boolean callTag = platformTag != null && platformTag.contains("ig-call-");
        for (Notification.Action action : notification.actions) {
            CharSequence title = action.title;
            if (title != null && title.toString().startsWith("Answer")) return true;
        }
        return callTag && notification.actions.length >= 2;
    }

    private void ensureCallChannel(NotificationManager manager) {
        if (manager.getNotificationChannel(CALL_CHANNEL) != null) return;
        NotificationChannel channel = new NotificationChannel(
                CALL_CHANNEL, "Incoming calls", NotificationManager.IMPORTANCE_HIGH);
        channel.setDescription("Rings when someone calls you on Nsoro");
        channel.setSound(
                RingtoneManager.getDefaultUri(RingtoneManager.TYPE_RINGTONE),
                new AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_NOTIFICATION_RINGTONE)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                        .build());
        channel.enableVibration(true);
        channel.setVibrationPattern(new long[] {0, 1000, 800, 1000, 800});
        channel.setLockscreenVisibility(Notification.VISIBILITY_PUBLIC);
        manager.createNotificationChannel(channel);
    }
}

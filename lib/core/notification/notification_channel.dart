// ignore_for_file: lines_longer_than_80_chars

import 'package:platform_notification/platform_notification_channel_model.dart';

mixin NotificationImportance {
  /// A notification with no importance: does not show in the shade.
  static const int importanceNone = 0;

  /// Min notification importance: only shows in the shade, below the fold.  This should
  /// not be used with {@link Service#startForeground(int, Notification) Service.startForeground}
  /// since a foreground service is supposed to be something the user cares about so it does
  /// not make semantic sense to mark its notification as minimum importance.  If you do this
  /// as of Android version {@link android.os.Build.VERSION_CODES#O}, the system will show
  /// a higher-priority notification about your app running in the background.
  static const int importanceMin = 1;

  /// Low notification importance: Shows in the shade, and potentially in the status bar
  /// (see {@link #shouldHideSilentStatusBarIcons()}), but is not audibly intrusive.
  static const int importanceLow = 2;

  /// Default notification importance: shows everywhere, makes noise, but does not visually
  /// intrude.
  static const int importanceDefault = 3;

  /// Higher notification importance: shows everywhere, makes noise and peeks. May use full screen
  /// intents.
  static const int importanceHigh = 4;

  /// Unused.
  static const int importanceMax = 5;
}

sealed class NotificationChannel {
  String get id;

  String get name;

  String get description;

  int get importance;

  PlatformNotificationChannelModel createPlatformNotificationChannel() {
    return PlatformNotificationChannelModel(
      id: AiredNotificationChannel().id,
      name: AiredNotificationChannel().name,
      description: AiredNotificationChannel().description,
      importance: importance,
    );
  }
}

class AiredNotificationChannel extends NotificationChannel {
  @override
  String get id => 'MediaUpdateNotificationChannel';

  @override
  String get name => 'Airing';

  @override
  String get description => "Media contents update";

  @override
  int get importance => NotificationImportance.importanceDefault;
}

class NewFollowerNotificationChannel extends NotificationChannel {
  @override
  String get id => 'NewFollowerNotificationChannel';

  @override
  String get name => 'Followers';

  @override
  String get description => "New follower";

  @override
  int get importance => NotificationImportance.importanceDefault;
}

class ActivityNotificationChannel extends NotificationChannel {
  @override
  String get id => 'ActivityNotificationChannel';

  @override
  String get name => 'Activity';

  @override
  String get description => "Activity related";

  @override
  int get importance => NotificationImportance.importanceDefault;
}

class MediaNotificationChannel extends NotificationChannel {
  @override
  String get id => 'MediaNotificationChannel';

  @override
  String get name => 'Media';

  @override
  String get description => "Media related";

  @override
  int get importance => NotificationImportance.importanceDefault;
}


import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

class AppVersion implements Comparable<AppVersion> {
  final int major;
  final int minor;
  final int patch;

  AppVersion(this.major, this.minor, this.patch);

  factory AppVersion.parse(String version) {
    final parts = version.split('.');
    if (parts.length != 3) {
      throw FormatException('Invalid version string: $version');
    }
    return AppVersion(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  @override
  int compareTo(AppVersion other) {
    if (major != other.major) {
      return major.compareTo(other.major);
    }
    if (minor != other.minor) {
      return minor.compareTo(other.minor);
    }
    return patch.compareTo(other.patch);
  }
}

mixin AppVersionUtil {
  static Future<AppVersion?> get currentVersion => PackageInfo.fromPlatform()
      .then((package) => package.version)
      .then((version) => mapToVersion(version));

  static AppVersion? mapToVersion(String version) {
    try {
      return AppVersion.parse(version);
    } catch (e) {
      return null;
    }
  }
}

import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

class AppVersion implements Comparable<AppVersion> {
  final int major;
  final int minor;
  final int patch;

  AppVersion(this.major, this.minor, this.patch);

  factory AppVersion.parse(String version) {
    version = version.replaceAll('v', '');
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

  @override
  String toString() {
    return '$major.$minor.$patch';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppVersion &&
        other.major == major &&
        other.minor == minor &&
        other.patch == patch;
  }

  @override
  int get hashCode => Object.hash(major, minor, patch);
}

mixin AppVersionUtil {
  static Future<AppVersion?> get currentVersion => PackageInfo.fromPlatform()
      .then((package) => package.version)
      .then((version) => mapToVersion(version));

  static AppVersion? mapToVersion(String version) {
    String trimmedString = version;
    if (version.contains('-')) {
      trimmedString = version.split('-').first;
    }
    try {
      return AppVersion.parse(trimmedString);
    } catch (e) {
      return null;
    }
  }
}

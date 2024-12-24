import 'dart:io';

import 'package:aniflow/core/common/environment/flavor.dart';

mixin BuildEnvironment {
  static Flavor get androidFlavor =>
      Flavor.fromJson(const String.fromEnvironment('FLUTTER_APP_FLAVOR'));

  static bool get isFeatureLimited {
    if (Platform.isAndroid) {
      return switch(androidFlavor) {
        Flavor.limitedFeature => true,
        Flavor.fullFeature => false,
      };
    } else {
      return true;
    }
  }
}

import 'package:aniflow/core/common/environment/flavor.dart';

mixin BuildEnvironment {
  static Flavor get flavor =>
      Flavor.fromJson(const String.fromEnvironment('FLUTTER_APP_FLAVOR'));

  static bool get isFeatureLimited => switch(flavor) {
    Flavor.limitedFeature => true,
    Flavor.fullFeature => false,
  };
}

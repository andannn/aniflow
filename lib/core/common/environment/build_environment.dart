import 'package:aniflow/core/common/environment/flavor.dart';

mixin BuildEnvironment {
  static Flavor get _flavor =>
      Flavor.fromJson(const String.fromEnvironment('FLUTTER_APP_FLAVOR'));

  static bool get isFeatureLimited => switch(_flavor) {
    Flavor.limitedFeature => true,
    Flavor.fullFeature => false,
  };
}

import 'package:flutter/services.dart';

class PlatformMethod {
  static PlatformMethod? _instance;

  factory PlatformMethod() => _instance ??= PlatformMethod._();

  PlatformMethod._();

  final MethodChannel _channel =
      const MethodChannel('com.andannn.animetracker/platform_method');

  Future<void> installPackage(String path) async {
    await _channel.invokeMethod<String>('installPackage', {'path': path});
  }
}

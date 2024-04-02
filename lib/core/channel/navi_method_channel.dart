import 'package:flutter/services.dart';

class NaviMethodChannel {
  static NaviMethodChannel? _instance;

  factory NaviMethodChannel() => _instance ??= NaviMethodChannel._();

  NaviMethodChannel._();

  final MethodChannel methodChannel =
      const MethodChannel('com.andannn.animetracker/navi');

  Future startPlayerActivity(String link) {
    return methodChannel.invokeListMethod('startPlayerActivity', [link]);
  }
}

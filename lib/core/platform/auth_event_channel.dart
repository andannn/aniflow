import 'dart:async';

import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter/services.dart';

class AuthResult {
  AuthResult({required this.token, required this.expiresInTime});

  final String token;
  final int expiresInTime;
}

class AuthEventChannel {
  static AuthEventChannel? _instance;

  factory AuthEventChannel() => _instance ??= AuthEventChannel._();

  AuthEventChannel._();

  final EventChannel _authChannel =
      const EventChannel('com.andannn.animetracker/auth');

  /// Call this method to wait auth result.
  /// Do not call this method again when last call is not completed.
  Future<AuthResult> awaitAuthResult() async {
    logger.d('start await auth result');
    dynamic resultString = await _authChannel.receiveBroadcastStream().first;
    final queryParameters = Uri.parse(resultString).queryParameters;
    final token = queryParameters['access_token'] ?? '';
    if (token.isEmpty) {
      throw Exception('no token');
    }
    final expiresInTime =
        int.tryParse(queryParameters['expires_in'] ?? '') ?? -1;
    if (expiresInTime == -1) {
      throw Exception('result error');
    }

    logger.d('login success and token will be expired in'
        // ignore: lines_longer_than_80_chars
        ' ${DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + expiresInTime)}');
    return AuthResult(token: token, expiresInTime: expiresInTime);
  }
}

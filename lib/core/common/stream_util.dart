import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin StreamUtil {
  static Stream<T> createStream<T>(
      ChangeNotifier changeSource, Future<T> Function() getEventData) {
    late StreamController<T> controller;

    _listener() async {
      controller.add(await getEventData());
    }

    controller = StreamController(onListen: () {
      _listener();
      changeSource.addListener(_listener);
    }, onCancel: () {
      changeSource.removeListener(_listener);
    });
    return controller.stream;
  }
}

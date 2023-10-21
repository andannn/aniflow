import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin StreamUtil {
  static Stream<T> createStream<T>(
      ChangeNotifier changeSource, Future<T> Function() getEventData) {
    late StreamController<T> controller;

    void listener() async {
      final data = await getEventData();
      if (!controller.isClosed) {
        controller.add(data);
      }
    }

    controller = StreamController(onListen: () {
      listener();
      changeSource.addListener(listener);
    }, onCancel: () {
      changeSource.removeListener(listener);
      controller.close();
    });
    return controller.stream;
  }
}

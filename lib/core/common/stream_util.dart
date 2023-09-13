import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin StreamUtil {
  static Stream<T> createStream<T>(
      ChangeNotifier changeSource, Future<T> Function() getEventData) {
    late StreamController<T> controller;

    void listener() async {
      controller.add(await getEventData());
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

import 'dart:async';

import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocEx<Event, State> on Bloc<Event, State> {
  void safeAdd(Event event) {
    if (!isClosed) {
      add(event);
    } else {
      logger.d('BlocEx: $runtimeType is closed when add event: $event.');
    }
  }
}

mixin AutoCancelMixin<Event, State> on Bloc<Event, State> {
  List<StreamSubscription> subscriptionList = [];

  StreamSubscription<T> autoCancel<T>(
      StreamSubscription<T> Function() createSub) {
    final sub = createSub();
    subscriptionList.add(sub);
    return sub;
  }

  @override
  Future<void> close() {
    for (var sub in subscriptionList) {
      sub.cancel();
    }
    logger.d('Auto cancel StreamSubscription $runtimeType');
    return super.close();
  }
}

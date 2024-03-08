import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:flutter/widgets.dart';

mixin DbChangedNotifierMixin<KEY> {
  /// userId to notifiers dict.
  final Map<KEY, ValueNotifier<int>> _notifiers = {};
  final ValueNotifier<int> _tableChangedNotifier = ValueNotifier(0);

  void notifyChanged([List<KEY> keys = const []]) {
    /// notify database table changed.
    _tableChangedNotifier.notifyChanged();

    /// notify database table column item.
    for (final key in keys) {
      final notifier = _notifiers[key];
      if (notifier != null) {
        notifier.notifyChanged();
      }
    }
  }

  Stream<T> createStreamWithKey<T>(KEY key, Future<T> Function() onGetData) {
    final changeSource = _notifiers.putIfAbsent(key, () => ValueNotifier(0));
    return StreamUtil.createStream(
      changeSource,
      onGetData,
    );
  }

  Stream<T> createStream<T>(Future<T> Function() onGetData) {
    return StreamUtil.createStream(
      _tableChangedNotifier,
      onGetData,
    );
  }
}

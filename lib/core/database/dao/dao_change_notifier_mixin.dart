import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:flutter/widgets.dart';

mixin DbChangedNotifierMixin {
  final Map<String, ValueNotifier<int>> _tablesNotifiers = {};

  void notifyChanged([List<String> tableNames = const []]) {
    for (final table in tableNames) {
      final notifier = _tablesNotifiers[table];
      if (notifier != null) {
        notifier.notifyChanged();
      }
    }
  }

  Stream<T> createStream<T>(
    List<String> tableNames,
    Future<T> Function() onGetData,
  ) {
    final changeSources = tableNames
        .map((table) =>
            _tablesNotifiers.putIfAbsent(table, () => ValueNotifier(0)))
        .toList();

    return StreamUtil.createStream(
      CombinedValueChangeNotifier(changeSources),
      onGetData,
    );
  }
}

class CombinedValueChangeNotifier extends ValueNotifier<int> {
  CombinedValueChangeNotifier(this.notifiers) : super(0);

  final List<ValueNotifier> notifiers;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    for (var notifier in notifiers) {
      notifier.addListener(notifyChanged);
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);

    for (var notifier in notifiers) {
      notifier.removeListener(notifyChanged);
    }
  }
}

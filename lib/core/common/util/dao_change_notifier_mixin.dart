import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DatabaseTablesKey extends Equatable {
  const DatabaseTablesKey(this.tableNames);

  final Set<String> tableNames;

  @override
  List<Object?> get props => [...tableNames];

  bool haveTableIn(List<String> tables) =>
      tableNames.firstWhereOrNull((table) => tables.contains(table)) !=
      null;
}

mixin DbChangedNotifierMixin {
  final Map<DatabaseTablesKey, ValueNotifier<int>> _tablesNotifiers = {};

  void notifyChanged([List<String> changedTableNames = const []]) {
    _tablesNotifiers.forEach((key, notifier) {
      if (key.haveTableIn(changedTableNames)) {
        notifier.notifyChanged();
      }
    });
  }

  Stream<T> createStream<T>(
    List<String> tableNames,
    Future<T> Function() onGetData,
  ) {
    final changeSources = _tablesNotifiers.putIfAbsent(
        DatabaseTablesKey({...tableNames}), () => ValueNotifier(0));

    return StreamUtil.createStream(
      changeSources,
      onGetData,
    );
  }
}

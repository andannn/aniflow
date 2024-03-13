import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DbTablesKey extends Equatable {
  const DbTablesKey(this.tableNames);

  final Set<String> tableNames;

  @override
  List<Object?> get props => [...tableNames];

  bool hasTableIn(List<String> tables) =>
      tableNames.firstWhereOrNull((table) => tables.contains(table)) !=
      null;
}

mixin DbChangedNotifierMixin {
  final Map<DbTablesKey, ValueNotifier<int>> _tablesNotifiers = {};

  void notifyChanged([List<String> tableNames = const []]) {
    _tablesNotifiers.forEach((key, notifier) {
      if (key.hasTableIn(tableNames)) {
        notifier.notifyChanged();
      }
    });
  }

  Stream<T> createStream<T>(
    List<String> tableNames,
    Future<T> Function() onGetData,
  ) {
    final changeSources = _tablesNotifiers.putIfAbsent(
        DbTablesKey({...tableNames}), () => ValueNotifier(0));

    return StreamUtil.createStream(
      changeSources,
      onGetData,
    );
  }
}

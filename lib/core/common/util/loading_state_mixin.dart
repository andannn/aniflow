import 'dart:convert';

import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _tag = 'LoadingControllerMixin';

abstract class LoadingStateRepository {
  bool get isLoading;

  void notifyLoadingStart(String type);

  void notifyLoadingStop(String type, LoadResult loadResult);
}

mixin LoadingControllerMixin<Event, State> on Bloc<Event, State>
    implements LoadingStateRepository {
  final Map<String, LoadResult?> _loadingStateMap = {};

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  @override
  void notifyLoadingStart(String type) {
    _loadingStateMap[type] = null;
    final isLoading = _loadingStateMap.entries.any((e) => e.value == null);
    if (_isLoading != isLoading) {
      _isLoading = isLoading;

      onLoadingStateChanged(isLoading);
    }

    logger.d('$_tag startLoading $type , loadingStateMap $_loadingStateMap');
  }

  @override
  void notifyLoadingStop(String type, LoadResult loadResult) {
    _loadingStateMap[type] = loadResult;
    final isLoading = _loadingStateMap.entries.any((e) => e.value == null);

    if (_isLoading != isLoading) {
      _isLoading = isLoading;

      onLoadingStateChanged(isLoading);

      if (!isLoading &&
          _loadingStateMap.values.whereType<LoadError>().isNotEmpty) {
        onLoadingFinished(
          _loadingStateMap.values.whereType<LoadError>().toList(),
        );
      }
    }

    logger.d('$_tag finishLoading $type , loadingStateMap $_loadingStateMap');
  }

  void onLoadingFinished(List<LoadError> errors);

  void onLoadingStateChanged(bool isLoading);
}

extension LoadingControllerMixinEx on LoadingStateRepository {
  Future doRefresh(String key, Future<LoadResult> Function() doRefresh) async {
    notifyLoadingStart(jsonEncode(key));
    final result = await doRefresh();
    notifyLoadingStop(jsonEncode(key), result);
  }

  Future doRefreshOrRejected(UserDataRepository repo, RefreshTimeKey key,
      Future<LoadResult> Function() doRefresh,
      [bool isForce = false]) async {
    if (!repo.canRefresh(key) && !isForce) {
      logger.d("can't refresh $key");
      return;
    }

    notifyLoadingStart(jsonEncode(key.toJson()));
    final result = await doRefresh();
    notifyLoadingStop(jsonEncode(key.toJson()), result);

    if (result is LoadSuccess) {
      await repo.setLastSuccessRefreshTime(key, DateTime.now());
    }
  }
}

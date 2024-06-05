import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';

const _tag = 'LoadingControllerMixin';

abstract class LoadingStateRepository {
  bool get isLoading;

  void onLoadingFinished(List<LoadError> errors);

  void onLoadingStateChanged(bool isLoading);
}

mixin LoadingControllerMixin<Event, State> implements LoadingStateRepository {
  final Map<String, LoadResult?> _loadingStateMap = {};

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  void startLoading(String type) {
    _loadingStateMap[type] = null;
    final isLoading = _loadingStateMap.entries.any((e) => e.value == null);
    if (_isLoading != isLoading) {
      _isLoading = isLoading;

      onLoadingStateChanged(isLoading);
    }

    logger.d('$_tag startLoading $type , loadingStateMap $_loadingStateMap');
  }

  void finishLoading(String type, LoadResult loadResult) {
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

    logger.d(
        '$_tag finishLoading $type , loadingStateMap $_loadingStateMap');
  }
}

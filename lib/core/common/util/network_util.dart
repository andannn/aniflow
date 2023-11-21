import 'package:aniflow/core/data/load_result.dart';

mixin NetworkUtil {
  /// Post network request to sync data change with network.
  /// Local data source will be applied immediately, and when local data source
  /// can be reset when network error happened.
  static Future<LoadResult> postMutationAndRevertWhenException<T>({
    required T model,
    required T Function(T) onModifyModel,
    required Future Function(T) onSaveLocal,
    required Future<T> Function(T) onSyncWithRemote,
  }) async {
    final oldModel = model;
    final newModel = onModifyModel(model);

    try {
      /// save local cache first.
      await onSaveLocal(newModel);

      /// sync with remote repository.
      final networkResult = await onSyncWithRemote(newModel);

      /// update local again after network motion success.
      await onSaveLocal(networkResult);
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      /// revert changed when network error.
      await onSaveLocal(oldModel);
      return LoadError(exception);
    }
  }

}
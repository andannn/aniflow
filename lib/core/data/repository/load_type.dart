part of 'ani_list_repository.dart';

enum LoadType { refresh, append }

sealed class LoadResult<T> {}

class LoadError<T> extends LoadResult<T> {
  LoadError(this.exception);

  final Exception exception;
}

class LoadSuccess<T> extends LoadResult<T> {
  LoadSuccess({required this.data, required this.page});

  final List<T> data;
  final int page;
}

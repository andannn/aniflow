import 'package:aniflow/core/common/util/global_static_constants.dart';

sealed class LoadType {
  const LoadType();
}

class Refresh extends LoadType {
  final int perPage;
  const Refresh([this.perPage = AfConfig.defaultPerPageCount]);
}

class Append extends LoadType {
  const Append({required this.page, required this.perPage});

  final int page;
  final int perPage;
}

sealed class LoadResult<T> {}

class LoadError<T> extends LoadResult<T> {
  LoadError(this.exception);

  final Exception exception;
}

class LoadSuccess<T> extends LoadResult<T> {
  LoadSuccess({required this.data});

  final T data;
}

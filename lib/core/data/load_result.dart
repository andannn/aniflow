sealed class LoadType {
  const LoadType();
}

class Refresh extends LoadType {
  const Refresh();
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

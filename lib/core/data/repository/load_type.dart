enum LoadType { refresh, append }

sealed class LoadResult<T> {}

class LoadError<T> extends LoadResult<T> {
  LoadError(this.exception);

  final Exception exception;
}

class LoadSuccess<T> extends LoadResult<T> {
  LoadSuccess(this.data);

  final List<T> data;
}

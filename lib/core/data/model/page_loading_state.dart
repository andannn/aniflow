import 'package:equatable/equatable.dart';

sealed class PagingState<T> extends Equatable {
  final T data;
  final int page;

  const PagingState({required this.data, required this.page});

  @override
  List<Object?> get props => [data, page];
}

/// page is loading.
class PageLoading<T> extends PagingState<T> {
  const PageLoading({required super.data, required super.page});
}

/// page is ready and can load more content.
class PageReady<T> extends PagingState<T> {
  const PageReady({required super.data, required super.page});
}

/// all page is loaded.
class PageLoadReachEnd<T> extends PagingState<T> {
  const PageLoadReachEnd({required super.data, required super.page});
}

/// having error when load page.
class PageLoadingError<T> extends PagingState<T> {
  const PageLoadingError(this.exception, {required super.data, required super.page});

  final Exception exception;

  @override
  List<Object?> get props => [...super.props, exception];
}

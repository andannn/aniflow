import 'package:equatable/equatable.dart';

sealed class PagingState<T> extends Equatable {
  final T data;
  final int page;

  const PagingState({required this.data, required this.page});

  PagingState<T> updateWith(T Function(T) updater) {
    final newData = updater.call(data);

    if (this is PageInit) {
      return PageInit(data: newData);
    } else if (this is PageLoading) {
      return PageLoading(data: newData, page: page);
    } else if (this is PageReady) {
      return PageReady(data: newData, page: page);
    } else if (this is PageLoadReachEnd) {
      return PageLoadReachEnd(data: newData, page: page);
    } else {
      final state = (this as PageLoadingError);
      return PageLoadingError(state.exception, data: newData, page: page);
    }
  }

  @override
  List<Object?> get props => [data, page];

  PageLoading<T> toLoading() => PageLoading(data: data, page: page);

  PageLoadReachEnd<T> toReachEnd() => PageLoadReachEnd(data: data, page: page);

  PageLoadingError<T> toError(Exception e) =>
      PageLoadingError(e, data: data, page: page);
}

class PageInit<T> extends PagingState<T> {
  const PageInit({required super.data}): super(page: 0);
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
  const  PageLoadingError(this.exception,
      {required super.data, required super.page});

  final Exception exception;

  @override
  List<Object?> get props => [...super.props, exception];
}

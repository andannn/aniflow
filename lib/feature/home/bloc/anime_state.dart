import 'package:equatable/equatable.dart';

sealed class AnimeState<T> extends Equatable {
  final List<T> animeList;
  const AnimeState(this.animeList);


  @override
  List<Object?> get props => [animeList];
}

class AnimeReady<T> extends AnimeState<T> {
  const AnimeReady(super.animeList);
}

class AnimeLoading<T> extends AnimeState<T> {
  const AnimeLoading(super.animeList);
}

class AnimeLoadingError<T> extends AnimeState<T> {
  const AnimeLoadingError(super.animeList);
}

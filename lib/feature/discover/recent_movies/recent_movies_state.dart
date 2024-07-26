import 'package:aniflow/core/data/model/media_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_movies_state.freezed.dart';

@freezed
class RecentMoviesState with _$RecentMoviesState {
  const factory RecentMoviesState({
    @Default([]) List<MediaModel> movies,
  }) = _RecentMoviesState;
}

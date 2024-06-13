import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_to_watch_state.freezed.dart';

@freezed
class NextToWatchState with _$NextToWatchState {
  const factory NextToWatchState({
    @Default([]) List<MediaWithListModel> nextToWatchMediaList,
  }) = _NextToWatchState;
}

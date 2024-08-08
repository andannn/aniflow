import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_media_list_state.freezed.dart';

@freezed
class ProfileMediaListState with _$ProfileMediaListState {
  const factory ProfileMediaListState({
    @Default({}) Map<MediaListSectorParam, List<MediaWithListModel>> sector/Map,
}) = _ProfileMediaListState;
}

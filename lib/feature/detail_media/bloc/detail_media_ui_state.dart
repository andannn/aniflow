import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_media_ui_state.freezed.dart';

@freezed
class DetailMediaUiState with _$DetailMediaUiState {
  factory DetailMediaUiState({
    @Default(false) bool isLoading,
    MediaModel? detailAnimeModel,
    MediaListItemModel? mediaListItem,
    @Default(UserTitleLanguage.native) UserTitleLanguage userTitleLanguage,
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage userStaffNameLanguage,
    @Default(ScoreFormat.point3) ScoreFormat scoreFormat,
    @Default(None<Episode>()) LoadingState<Episode> episode,
  }) = _DetailMediaUiState;
}

import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_studio_state.freezed.dart';

@freezed
class DetailStudioState with _$DetailStudioState {
  factory DetailStudioState({
    @Default(false) bool isLoading,
    StudioModel? studioModel,
    @Default(UserTitleLanguage.native) UserTitleLanguage userTitleLanguage,
  }) = _DetailStudioState;
}

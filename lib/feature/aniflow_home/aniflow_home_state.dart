import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aniflow_home_state.freezed.dart';


@freezed
class AniflowHomeState with _$AniflowHomeState {
  const factory AniflowHomeState({
    @Default(false) bool isSocialFeatureEnabled,
    UserModel? userModel,
  }) = _AniflowHomeState;
}

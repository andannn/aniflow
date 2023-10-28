import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    UserData? userData,
    @Default(false) bool isFavoriteLoading,
    @Default(false) bool isMediaListPageLoading,
  }) = _ProfileState;
}

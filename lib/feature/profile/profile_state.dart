import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    UserModel? userData,
    @Default(true) bool isLoading,
  }) = _ProfileState;
}

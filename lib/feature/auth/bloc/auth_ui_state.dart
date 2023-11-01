import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_ui_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
     UserModel? userData,
  }) = _AuthState;
}

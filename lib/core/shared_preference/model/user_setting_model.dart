
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting_model.freezed.dart';

@freezed
class UserSettingModel with _$UserSettingModel {
  factory UserSettingModel({
    @Default(false) bool displayAdultContent
  }) = _UserSettingModel;
}
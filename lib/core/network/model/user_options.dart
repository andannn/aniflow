import 'package:aniflow/core/common/model/user_title_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_options.freezed.dart';
part 'user_options.g.dart';

@freezed
class UserOptions with _$UserOptions {
  factory UserOptions({
  @JsonKey(name: 'titleLanguage') UserTitleLanguage? titleLanguage,
  @Default(false) @JsonKey(name: 'displayAdultContent') bool displayAdultContent,
  @Default(false) @JsonKey(name: 'airingNotifications') bool airingNotifications,
  @JsonKey(name: 'profileColor') String? profileColor,
  @JsonKey(name: 'activityMergeTime') int? activityMergeTime,
  }) = _UserOptions;

  factory UserOptions.fromJson(Map<String, dynamic> json) =>
      _$$_UserOptionsFromJson(json);
}

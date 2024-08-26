import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user_model.freezed.dart';

part 'github_user_model.g.dart';

@freezed
class GithubUserModel with _$GithubUserModel {
  const factory GithubUserModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'login') String? login,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'bio') String? bio,
  }) = _GithubUserModel;

  factory GithubUserModel.fromJson(Map<String, dynamic> json) =>
      _$GithubUserModelFromJson(json);
}

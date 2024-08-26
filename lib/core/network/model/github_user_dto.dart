import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user_dto.freezed.dart';

part 'github_user_dto.g.dart';

@freezed
class GithubUserDto with _$GithubUserDto {
  const factory GithubUserDto({
    @JsonKey(name: 'login') String? login,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'bio') String? bio,
  }) = _GithubUserDto;

  factory GithubUserDto.fromJson(Map<String, dynamic> json) =>
      _$GithubUserDtoFromJson(json);
}

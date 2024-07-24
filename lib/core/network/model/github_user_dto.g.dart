// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubUserDtoImpl _$$GithubUserDtoImplFromJson(Map<String, dynamic> json) =>
    _$GithubUserDtoImpl(
      login: json['login'] as String?,
      id: (json['id'] as num?)?.toInt(),
      avatarUrl: json['avatar_url'] as String?,
      url: json['url'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$GithubUserDtoImplToJson(_$GithubUserDtoImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'url': instance.url,
      'bio': instance.bio,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubUserModelImpl _$$GithubUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubUserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      login: json['login'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$GithubUserModelImplToJson(
        _$GithubUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
    };

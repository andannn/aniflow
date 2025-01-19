import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_released_dto.freezed.dart';

part 'github_released_dto.g.dart';

@freezed
class GithubReleaseDto with _$GithubReleaseDto {
  factory GithubReleaseDto({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'assets_url') String? assetsUrl,
    @JsonKey(name: 'upload_url') String? uploadUrl,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'author') UploaderDto? author,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'tag_name') required String tagName,
    @JsonKey(name: 'target_commitish') String? targetCommitish,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'draft') bool? draft,
    @JsonKey(name: 'prerelease') bool? prerelease,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'assets') @Default([]) List<AssetDto> assets,
    @JsonKey(name: 'tarball_url') String? tarballUrl,
    @JsonKey(name: 'zipball_url') String? zipballUrl,
    @JsonKey(name: 'body') String? body,
  }) = _GithubReleaseDto;

  factory GithubReleaseDto.fromJson(Map<String, dynamic> json) =>
      _$GithubReleaseDtoFromJson(json);
}

@freezed
class UploaderDto with _$UploaderDto {
  factory UploaderDto({
    @JsonKey(name: 'login') String? login,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'gravatar_id') String? gravatarId,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'followers_url') String? followersUrl,
    @JsonKey(name: 'following_url') String? followingUrl,
    @JsonKey(name: 'gists_url') String? gistsUrl,
    @JsonKey(name: 'starred_url') String? starredUrl,
    @JsonKey(name: 'subscriptions_url') String? subscriptionsUrl,
    @JsonKey(name: 'organizations_url') String? organizationsUrl,
    @JsonKey(name: 'repos_url') String? reposUrl,
    @JsonKey(name: 'eventsUrl') String? eventsUrl,
    @JsonKey(name: 'received_events_url') String? receivedEventsUrl,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'user_view_type') String? userViewType,
    @JsonKey(name: 'site_admin') bool? siteAdmin,
  }) = _UploaderDto;

  factory UploaderDto.fromJson(Map<String, dynamic> json) =>
      _$UploaderDtoFromJson(json);
}

@freezed
class AssetDto with _$AssetDto {
  factory AssetDto({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'uploader') UploaderDto? uploader,
    @JsonKey(name: 'content_type') String? contentType,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'size') int? size,
    @JsonKey(name: 'download_count') int? downloadCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'browser_download_url') required String browserDownloadUrl,
  }) = _AssetDto;

  factory AssetDto.fromJson(Map<String, dynamic> json) =>
      _$AssetDtoFromJson(json);
}

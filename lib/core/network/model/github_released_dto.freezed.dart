// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_released_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubReleaseDto _$GithubReleaseDtoFromJson(Map<String, dynamic> json) {
  return _GithubReleaseDto.fromJson(json);
}

/// @nodoc
mixin _$GithubReleaseDto {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'assets_url')
  String? get assetsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'upload_url')
  String? get uploadUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  UploaderDto? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String? get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_name')
  String get tagName => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_commitish')
  String? get targetCommitish => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'draft')
  bool? get draft => throw _privateConstructorUsedError;
  @JsonKey(name: 'prerelease')
  bool? get prerelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'assets')
  List<AssetDto> get assets => throw _privateConstructorUsedError;
  @JsonKey(name: 'tarball_url')
  String? get tarballUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'zipball_url')
  String? get zipballUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;

  /// Serializes this GithubReleaseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubReleaseDtoCopyWith<GithubReleaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubReleaseDtoCopyWith<$Res> {
  factory $GithubReleaseDtoCopyWith(
          GithubReleaseDto value, $Res Function(GithubReleaseDto) then) =
      _$GithubReleaseDtoCopyWithImpl<$Res, GithubReleaseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'assets_url') String? assetsUrl,
      @JsonKey(name: 'upload_url') String? uploadUrl,
      @JsonKey(name: 'html_url') String? htmlUrl,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'author') UploaderDto? author,
      @JsonKey(name: 'node_id') String? nodeId,
      @JsonKey(name: 'tag_name') String tagName,
      @JsonKey(name: 'target_commitish') String? targetCommitish,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'draft') bool? draft,
      @JsonKey(name: 'prerelease') bool? prerelease,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'published_at') DateTime? publishedAt,
      @JsonKey(name: 'assets') List<AssetDto> assets,
      @JsonKey(name: 'tarball_url') String? tarballUrl,
      @JsonKey(name: 'zipball_url') String? zipballUrl,
      @JsonKey(name: 'body') String? body});

  $UploaderDtoCopyWith<$Res>? get author;
}

/// @nodoc
class _$GithubReleaseDtoCopyWithImpl<$Res, $Val extends GithubReleaseDto>
    implements $GithubReleaseDtoCopyWith<$Res> {
  _$GithubReleaseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? assetsUrl = freezed,
    Object? uploadUrl = freezed,
    Object? htmlUrl = freezed,
    Object? id = freezed,
    Object? author = freezed,
    Object? nodeId = freezed,
    Object? tagName = null,
    Object? targetCommitish = freezed,
    Object? name = freezed,
    Object? draft = freezed,
    Object? prerelease = freezed,
    Object? createdAt = freezed,
    Object? publishedAt = freezed,
    Object? assets = null,
    Object? tarballUrl = freezed,
    Object? zipballUrl = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      assetsUrl: freezed == assetsUrl
          ? _value.assetsUrl
          : assetsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadUrl: freezed == uploadUrl
          ? _value.uploadUrl
          : uploadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UploaderDto?,
      nodeId: freezed == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      targetCommitish: freezed == targetCommitish
          ? _value.targetCommitish
          : targetCommitish // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      draft: freezed == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool?,
      prerelease: freezed == prerelease
          ? _value.prerelease
          : prerelease // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      tarballUrl: freezed == tarballUrl
          ? _value.tarballUrl
          : tarballUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      zipballUrl: freezed == zipballUrl
          ? _value.zipballUrl
          : zipballUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GithubReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploaderDtoCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $UploaderDtoCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubReleaseDtoImplCopyWith<$Res>
    implements $GithubReleaseDtoCopyWith<$Res> {
  factory _$$GithubReleaseDtoImplCopyWith(_$GithubReleaseDtoImpl value,
          $Res Function(_$GithubReleaseDtoImpl) then) =
      __$$GithubReleaseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'assets_url') String? assetsUrl,
      @JsonKey(name: 'upload_url') String? uploadUrl,
      @JsonKey(name: 'html_url') String? htmlUrl,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'author') UploaderDto? author,
      @JsonKey(name: 'node_id') String? nodeId,
      @JsonKey(name: 'tag_name') String tagName,
      @JsonKey(name: 'target_commitish') String? targetCommitish,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'draft') bool? draft,
      @JsonKey(name: 'prerelease') bool? prerelease,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'published_at') DateTime? publishedAt,
      @JsonKey(name: 'assets') List<AssetDto> assets,
      @JsonKey(name: 'tarball_url') String? tarballUrl,
      @JsonKey(name: 'zipball_url') String? zipballUrl,
      @JsonKey(name: 'body') String? body});

  @override
  $UploaderDtoCopyWith<$Res>? get author;
}

/// @nodoc
class __$$GithubReleaseDtoImplCopyWithImpl<$Res>
    extends _$GithubReleaseDtoCopyWithImpl<$Res, _$GithubReleaseDtoImpl>
    implements _$$GithubReleaseDtoImplCopyWith<$Res> {
  __$$GithubReleaseDtoImplCopyWithImpl(_$GithubReleaseDtoImpl _value,
      $Res Function(_$GithubReleaseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? assetsUrl = freezed,
    Object? uploadUrl = freezed,
    Object? htmlUrl = freezed,
    Object? id = freezed,
    Object? author = freezed,
    Object? nodeId = freezed,
    Object? tagName = null,
    Object? targetCommitish = freezed,
    Object? name = freezed,
    Object? draft = freezed,
    Object? prerelease = freezed,
    Object? createdAt = freezed,
    Object? publishedAt = freezed,
    Object? assets = null,
    Object? tarballUrl = freezed,
    Object? zipballUrl = freezed,
    Object? body = freezed,
  }) {
    return _then(_$GithubReleaseDtoImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      assetsUrl: freezed == assetsUrl
          ? _value.assetsUrl
          : assetsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadUrl: freezed == uploadUrl
          ? _value.uploadUrl
          : uploadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UploaderDto?,
      nodeId: freezed == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      targetCommitish: freezed == targetCommitish
          ? _value.targetCommitish
          : targetCommitish // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      draft: freezed == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool?,
      prerelease: freezed == prerelease
          ? _value.prerelease
          : prerelease // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetDto>,
      tarballUrl: freezed == tarballUrl
          ? _value.tarballUrl
          : tarballUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      zipballUrl: freezed == zipballUrl
          ? _value.zipballUrl
          : zipballUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubReleaseDtoImpl implements _GithubReleaseDto {
  _$GithubReleaseDtoImpl(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'assets_url') this.assetsUrl,
      @JsonKey(name: 'upload_url') this.uploadUrl,
      @JsonKey(name: 'html_url') this.htmlUrl,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'node_id') this.nodeId,
      @JsonKey(name: 'tag_name') required this.tagName,
      @JsonKey(name: 'target_commitish') this.targetCommitish,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'draft') this.draft,
      @JsonKey(name: 'prerelease') this.prerelease,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'published_at') this.publishedAt,
      @JsonKey(name: 'assets') final List<AssetDto> assets = const [],
      @JsonKey(name: 'tarball_url') this.tarballUrl,
      @JsonKey(name: 'zipball_url') this.zipballUrl,
      @JsonKey(name: 'body') this.body})
      : _assets = assets;

  factory _$GithubReleaseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubReleaseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'assets_url')
  final String? assetsUrl;
  @override
  @JsonKey(name: 'upload_url')
  final String? uploadUrl;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'author')
  final UploaderDto? author;
  @override
  @JsonKey(name: 'node_id')
  final String? nodeId;
  @override
  @JsonKey(name: 'tag_name')
  final String tagName;
  @override
  @JsonKey(name: 'target_commitish')
  final String? targetCommitish;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'draft')
  final bool? draft;
  @override
  @JsonKey(name: 'prerelease')
  final bool? prerelease;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  final List<AssetDto> _assets;
  @override
  @JsonKey(name: 'assets')
  List<AssetDto> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  @JsonKey(name: 'tarball_url')
  final String? tarballUrl;
  @override
  @JsonKey(name: 'zipball_url')
  final String? zipballUrl;
  @override
  @JsonKey(name: 'body')
  final String? body;

  @override
  String toString() {
    return 'GithubReleaseDto(url: $url, assetsUrl: $assetsUrl, uploadUrl: $uploadUrl, htmlUrl: $htmlUrl, id: $id, author: $author, nodeId: $nodeId, tagName: $tagName, targetCommitish: $targetCommitish, name: $name, draft: $draft, prerelease: $prerelease, createdAt: $createdAt, publishedAt: $publishedAt, assets: $assets, tarballUrl: $tarballUrl, zipballUrl: $zipballUrl, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubReleaseDtoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.assetsUrl, assetsUrl) ||
                other.assetsUrl == assetsUrl) &&
            (identical(other.uploadUrl, uploadUrl) ||
                other.uploadUrl == uploadUrl) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.targetCommitish, targetCommitish) ||
                other.targetCommitish == targetCommitish) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.prerelease, prerelease) ||
                other.prerelease == prerelease) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.tarballUrl, tarballUrl) ||
                other.tarballUrl == tarballUrl) &&
            (identical(other.zipballUrl, zipballUrl) ||
                other.zipballUrl == zipballUrl) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      assetsUrl,
      uploadUrl,
      htmlUrl,
      id,
      author,
      nodeId,
      tagName,
      targetCommitish,
      name,
      draft,
      prerelease,
      createdAt,
      publishedAt,
      const DeepCollectionEquality().hash(_assets),
      tarballUrl,
      zipballUrl,
      body);

  /// Create a copy of GithubReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubReleaseDtoImplCopyWith<_$GithubReleaseDtoImpl> get copyWith =>
      __$$GithubReleaseDtoImplCopyWithImpl<_$GithubReleaseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubReleaseDtoImplToJson(
      this,
    );
  }
}

abstract class _GithubReleaseDto implements GithubReleaseDto {
  factory _GithubReleaseDto(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'assets_url') final String? assetsUrl,
      @JsonKey(name: 'upload_url') final String? uploadUrl,
      @JsonKey(name: 'html_url') final String? htmlUrl,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'author') final UploaderDto? author,
      @JsonKey(name: 'node_id') final String? nodeId,
      @JsonKey(name: 'tag_name') required final String tagName,
      @JsonKey(name: 'target_commitish') final String? targetCommitish,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'draft') final bool? draft,
      @JsonKey(name: 'prerelease') final bool? prerelease,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'published_at') final DateTime? publishedAt,
      @JsonKey(name: 'assets') final List<AssetDto> assets,
      @JsonKey(name: 'tarball_url') final String? tarballUrl,
      @JsonKey(name: 'zipball_url') final String? zipballUrl,
      @JsonKey(name: 'body') final String? body}) = _$GithubReleaseDtoImpl;

  factory _GithubReleaseDto.fromJson(Map<String, dynamic> json) =
      _$GithubReleaseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'assets_url')
  String? get assetsUrl;
  @override
  @JsonKey(name: 'upload_url')
  String? get uploadUrl;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'author')
  UploaderDto? get author;
  @override
  @JsonKey(name: 'node_id')
  String? get nodeId;
  @override
  @JsonKey(name: 'tag_name')
  String get tagName;
  @override
  @JsonKey(name: 'target_commitish')
  String? get targetCommitish;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'draft')
  bool? get draft;
  @override
  @JsonKey(name: 'prerelease')
  bool? get prerelease;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  @JsonKey(name: 'assets')
  List<AssetDto> get assets;
  @override
  @JsonKey(name: 'tarball_url')
  String? get tarballUrl;
  @override
  @JsonKey(name: 'zipball_url')
  String? get zipballUrl;
  @override
  @JsonKey(name: 'body')
  String? get body;

  /// Create a copy of GithubReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubReleaseDtoImplCopyWith<_$GithubReleaseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploaderDto _$UploaderDtoFromJson(Map<String, dynamic> json) {
  return _UploaderDto.fromJson(json);
}

/// @nodoc
mixin _$UploaderDto {
  @JsonKey(name: 'login')
  String? get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String? get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gravatar_id')
  String? get gravatarId => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_url')
  String? get followersUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_url')
  String? get followingUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gists_url')
  String? get gistsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'starred_url')
  String? get starredUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriptions_url')
  String? get subscriptionsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizations_url')
  String? get organizationsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'repos_url')
  String? get reposUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventsUrl')
  String? get eventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_events_url')
  String? get receivedEventsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_view_type')
  String? get userViewType => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_admin')
  bool? get siteAdmin => throw _privateConstructorUsedError;

  /// Serializes this UploaderDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploaderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploaderDtoCopyWith<UploaderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploaderDtoCopyWith<$Res> {
  factory $UploaderDtoCopyWith(
          UploaderDto value, $Res Function(UploaderDto) then) =
      _$UploaderDtoCopyWithImpl<$Res, UploaderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String? login,
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
      @JsonKey(name: 'site_admin') bool? siteAdmin});
}

/// @nodoc
class _$UploaderDtoCopyWithImpl<$Res, $Val extends UploaderDto>
    implements $UploaderDtoCopyWith<$Res> {
  _$UploaderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploaderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? id = freezed,
    Object? nodeId = freezed,
    Object? avatarUrl = freezed,
    Object? gravatarId = freezed,
    Object? url = freezed,
    Object? htmlUrl = freezed,
    Object? followersUrl = freezed,
    Object? followingUrl = freezed,
    Object? gistsUrl = freezed,
    Object? starredUrl = freezed,
    Object? subscriptionsUrl = freezed,
    Object? organizationsUrl = freezed,
    Object? reposUrl = freezed,
    Object? eventsUrl = freezed,
    Object? receivedEventsUrl = freezed,
    Object? type = freezed,
    Object? userViewType = freezed,
    Object? siteAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nodeId: freezed == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gravatarId: freezed == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      followersUrl: freezed == followersUrl
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      followingUrl: freezed == followingUrl
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gistsUrl: freezed == gistsUrl
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      starredUrl: freezed == starredUrl
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionsUrl: freezed == subscriptionsUrl
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationsUrl: freezed == organizationsUrl
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reposUrl: freezed == reposUrl
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventsUrl: freezed == eventsUrl
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedEventsUrl: freezed == receivedEventsUrl
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userViewType: freezed == userViewType
          ? _value.userViewType
          : userViewType // ignore: cast_nullable_to_non_nullable
              as String?,
      siteAdmin: freezed == siteAdmin
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploaderDtoImplCopyWith<$Res>
    implements $UploaderDtoCopyWith<$Res> {
  factory _$$UploaderDtoImplCopyWith(
          _$UploaderDtoImpl value, $Res Function(_$UploaderDtoImpl) then) =
      __$$UploaderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'login') String? login,
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
      @JsonKey(name: 'site_admin') bool? siteAdmin});
}

/// @nodoc
class __$$UploaderDtoImplCopyWithImpl<$Res>
    extends _$UploaderDtoCopyWithImpl<$Res, _$UploaderDtoImpl>
    implements _$$UploaderDtoImplCopyWith<$Res> {
  __$$UploaderDtoImplCopyWithImpl(
      _$UploaderDtoImpl _value, $Res Function(_$UploaderDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploaderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? id = freezed,
    Object? nodeId = freezed,
    Object? avatarUrl = freezed,
    Object? gravatarId = freezed,
    Object? url = freezed,
    Object? htmlUrl = freezed,
    Object? followersUrl = freezed,
    Object? followingUrl = freezed,
    Object? gistsUrl = freezed,
    Object? starredUrl = freezed,
    Object? subscriptionsUrl = freezed,
    Object? organizationsUrl = freezed,
    Object? reposUrl = freezed,
    Object? eventsUrl = freezed,
    Object? receivedEventsUrl = freezed,
    Object? type = freezed,
    Object? userViewType = freezed,
    Object? siteAdmin = freezed,
  }) {
    return _then(_$UploaderDtoImpl(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nodeId: freezed == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gravatarId: freezed == gravatarId
          ? _value.gravatarId
          : gravatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: freezed == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      followersUrl: freezed == followersUrl
          ? _value.followersUrl
          : followersUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      followingUrl: freezed == followingUrl
          ? _value.followingUrl
          : followingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gistsUrl: freezed == gistsUrl
          ? _value.gistsUrl
          : gistsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      starredUrl: freezed == starredUrl
          ? _value.starredUrl
          : starredUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionsUrl: freezed == subscriptionsUrl
          ? _value.subscriptionsUrl
          : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationsUrl: freezed == organizationsUrl
          ? _value.organizationsUrl
          : organizationsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reposUrl: freezed == reposUrl
          ? _value.reposUrl
          : reposUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventsUrl: freezed == eventsUrl
          ? _value.eventsUrl
          : eventsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedEventsUrl: freezed == receivedEventsUrl
          ? _value.receivedEventsUrl
          : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userViewType: freezed == userViewType
          ? _value.userViewType
          : userViewType // ignore: cast_nullable_to_non_nullable
              as String?,
      siteAdmin: freezed == siteAdmin
          ? _value.siteAdmin
          : siteAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploaderDtoImpl implements _UploaderDto {
  _$UploaderDtoImpl(
      {@JsonKey(name: 'login') this.login,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'node_id') this.nodeId,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'gravatar_id') this.gravatarId,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'html_url') this.htmlUrl,
      @JsonKey(name: 'followers_url') this.followersUrl,
      @JsonKey(name: 'following_url') this.followingUrl,
      @JsonKey(name: 'gists_url') this.gistsUrl,
      @JsonKey(name: 'starred_url') this.starredUrl,
      @JsonKey(name: 'subscriptions_url') this.subscriptionsUrl,
      @JsonKey(name: 'organizations_url') this.organizationsUrl,
      @JsonKey(name: 'repos_url') this.reposUrl,
      @JsonKey(name: 'eventsUrl') this.eventsUrl,
      @JsonKey(name: 'received_events_url') this.receivedEventsUrl,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'user_view_type') this.userViewType,
      @JsonKey(name: 'site_admin') this.siteAdmin});

  factory _$UploaderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploaderDtoImplFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String? login;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'node_id')
  final String? nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  final String? gravatarId;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  final String? followersUrl;
  @override
  @JsonKey(name: 'following_url')
  final String? followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  final String? gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  final String? starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  final String? subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  final String? organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  final String? reposUrl;
  @override
  @JsonKey(name: 'eventsUrl')
  final String? eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  final String? receivedEventsUrl;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'user_view_type')
  final String? userViewType;
  @override
  @JsonKey(name: 'site_admin')
  final bool? siteAdmin;

  @override
  String toString() {
    return 'UploaderDto(login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, userViewType: $userViewType, siteAdmin: $siteAdmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploaderDtoImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.gravatarId, gravatarId) ||
                other.gravatarId == gravatarId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.followersUrl, followersUrl) ||
                other.followersUrl == followersUrl) &&
            (identical(other.followingUrl, followingUrl) ||
                other.followingUrl == followingUrl) &&
            (identical(other.gistsUrl, gistsUrl) ||
                other.gistsUrl == gistsUrl) &&
            (identical(other.starredUrl, starredUrl) ||
                other.starredUrl == starredUrl) &&
            (identical(other.subscriptionsUrl, subscriptionsUrl) ||
                other.subscriptionsUrl == subscriptionsUrl) &&
            (identical(other.organizationsUrl, organizationsUrl) ||
                other.organizationsUrl == organizationsUrl) &&
            (identical(other.reposUrl, reposUrl) ||
                other.reposUrl == reposUrl) &&
            (identical(other.eventsUrl, eventsUrl) ||
                other.eventsUrl == eventsUrl) &&
            (identical(other.receivedEventsUrl, receivedEventsUrl) ||
                other.receivedEventsUrl == receivedEventsUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userViewType, userViewType) ||
                other.userViewType == userViewType) &&
            (identical(other.siteAdmin, siteAdmin) ||
                other.siteAdmin == siteAdmin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        login,
        id,
        nodeId,
        avatarUrl,
        gravatarId,
        url,
        htmlUrl,
        followersUrl,
        followingUrl,
        gistsUrl,
        starredUrl,
        subscriptionsUrl,
        organizationsUrl,
        reposUrl,
        eventsUrl,
        receivedEventsUrl,
        type,
        userViewType,
        siteAdmin
      ]);

  /// Create a copy of UploaderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploaderDtoImplCopyWith<_$UploaderDtoImpl> get copyWith =>
      __$$UploaderDtoImplCopyWithImpl<_$UploaderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploaderDtoImplToJson(
      this,
    );
  }
}

abstract class _UploaderDto implements UploaderDto {
  factory _UploaderDto(
      {@JsonKey(name: 'login') final String? login,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'node_id') final String? nodeId,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'gravatar_id') final String? gravatarId,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'html_url') final String? htmlUrl,
      @JsonKey(name: 'followers_url') final String? followersUrl,
      @JsonKey(name: 'following_url') final String? followingUrl,
      @JsonKey(name: 'gists_url') final String? gistsUrl,
      @JsonKey(name: 'starred_url') final String? starredUrl,
      @JsonKey(name: 'subscriptions_url') final String? subscriptionsUrl,
      @JsonKey(name: 'organizations_url') final String? organizationsUrl,
      @JsonKey(name: 'repos_url') final String? reposUrl,
      @JsonKey(name: 'eventsUrl') final String? eventsUrl,
      @JsonKey(name: 'received_events_url') final String? receivedEventsUrl,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'user_view_type') final String? userViewType,
      @JsonKey(name: 'site_admin') final bool? siteAdmin}) = _$UploaderDtoImpl;

  factory _UploaderDto.fromJson(Map<String, dynamic> json) =
      _$UploaderDtoImpl.fromJson;

  @override
  @JsonKey(name: 'login')
  String? get login;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'node_id')
  String? get nodeId;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'gravatar_id')
  String? get gravatarId;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;
  @override
  @JsonKey(name: 'followers_url')
  String? get followersUrl;
  @override
  @JsonKey(name: 'following_url')
  String? get followingUrl;
  @override
  @JsonKey(name: 'gists_url')
  String? get gistsUrl;
  @override
  @JsonKey(name: 'starred_url')
  String? get starredUrl;
  @override
  @JsonKey(name: 'subscriptions_url')
  String? get subscriptionsUrl;
  @override
  @JsonKey(name: 'organizations_url')
  String? get organizationsUrl;
  @override
  @JsonKey(name: 'repos_url')
  String? get reposUrl;
  @override
  @JsonKey(name: 'eventsUrl')
  String? get eventsUrl;
  @override
  @JsonKey(name: 'received_events_url')
  String? get receivedEventsUrl;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'user_view_type')
  String? get userViewType;
  @override
  @JsonKey(name: 'site_admin')
  bool? get siteAdmin;

  /// Create a copy of UploaderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploaderDtoImplCopyWith<_$UploaderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetDto _$AssetDtoFromJson(Map<String, dynamic> json) {
  return _AssetDto.fromJson(json);
}

/// @nodoc
mixin _$AssetDto {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'node_id')
  String? get nodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploader')
  UploaderDto? get uploader => throw _privateConstructorUsedError;
  @JsonKey(name: 'contentType')
  String? get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'downloadCount')
  int? get downloadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'browser_download_url')
  String get browserDownloadUrl => throw _privateConstructorUsedError;

  /// Serializes this AssetDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetDtoCopyWith<AssetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetDtoCopyWith<$Res> {
  factory $AssetDtoCopyWith(AssetDto value, $Res Function(AssetDto) then) =
      _$AssetDtoCopyWithImpl<$Res, AssetDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'node_id') String? nodeId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'uploader') UploaderDto? uploader,
      @JsonKey(name: 'contentType') String? contentType,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'size') int? size,
      @JsonKey(name: 'downloadCount') int? downloadCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'browser_download_url') String browserDownloadUrl});

  $UploaderDtoCopyWith<$Res>? get uploader;
}

/// @nodoc
class _$AssetDtoCopyWithImpl<$Res, $Val extends AssetDto>
    implements $AssetDtoCopyWith<$Res> {
  _$AssetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? id = freezed,
    Object? nodeId = freezed,
    Object? name = freezed,
    Object? label = freezed,
    Object? uploader = freezed,
    Object? contentType = freezed,
    Object? state = freezed,
    Object? size = freezed,
    Object? downloadCount = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? browserDownloadUrl = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nodeId: freezed == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      uploader: freezed == uploader
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploaderDto?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadCount: freezed == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      browserDownloadUrl: null == browserDownloadUrl
          ? _value.browserDownloadUrl
          : browserDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploaderDtoCopyWith<$Res>? get uploader {
    if (_value.uploader == null) {
      return null;
    }

    return $UploaderDtoCopyWith<$Res>(_value.uploader!, (value) {
      return _then(_value.copyWith(uploader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssetDtoImplCopyWith<$Res>
    implements $AssetDtoCopyWith<$Res> {
  factory _$$AssetDtoImplCopyWith(
          _$AssetDtoImpl value, $Res Function(_$AssetDtoImpl) then) =
      __$$AssetDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'node_id') String? nodeId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'label') String? label,
      @JsonKey(name: 'uploader') UploaderDto? uploader,
      @JsonKey(name: 'contentType') String? contentType,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'size') int? size,
      @JsonKey(name: 'downloadCount') int? downloadCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'browser_download_url') String browserDownloadUrl});

  @override
  $UploaderDtoCopyWith<$Res>? get uploader;
}

/// @nodoc
class __$$AssetDtoImplCopyWithImpl<$Res>
    extends _$AssetDtoCopyWithImpl<$Res, _$AssetDtoImpl>
    implements _$$AssetDtoImplCopyWith<$Res> {
  __$$AssetDtoImplCopyWithImpl(
      _$AssetDtoImpl _value, $Res Function(_$AssetDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? id = freezed,
    Object? nodeId = freezed,
    Object? name = freezed,
    Object? label = freezed,
    Object? uploader = freezed,
    Object? contentType = freezed,
    Object? state = freezed,
    Object? size = freezed,
    Object? downloadCount = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? browserDownloadUrl = null,
  }) {
    return _then(_$AssetDtoImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nodeId: freezed == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      uploader: freezed == uploader
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploaderDto?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      downloadCount: freezed == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      browserDownloadUrl: null == browserDownloadUrl
          ? _value.browserDownloadUrl
          : browserDownloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetDtoImpl implements _AssetDto {
  _$AssetDtoImpl(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'node_id') this.nodeId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'label') this.label,
      @JsonKey(name: 'uploader') this.uploader,
      @JsonKey(name: 'contentType') this.contentType,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'size') this.size,
      @JsonKey(name: 'downloadCount') this.downloadCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'browser_download_url') required this.browserDownloadUrl});

  factory _$AssetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDtoImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'node_id')
  final String? nodeId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'label')
  final String? label;
  @override
  @JsonKey(name: 'uploader')
  final UploaderDto? uploader;
  @override
  @JsonKey(name: 'contentType')
  final String? contentType;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'size')
  final int? size;
  @override
  @JsonKey(name: 'downloadCount')
  final int? downloadCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'browser_download_url')
  final String browserDownloadUrl;

  @override
  String toString() {
    return 'AssetDto(url: $url, id: $id, nodeId: $nodeId, name: $name, label: $label, uploader: $uploader, contentType: $contentType, state: $state, size: $size, downloadCount: $downloadCount, createdAt: $createdAt, updatedAt: $updatedAt, browserDownloadUrl: $browserDownloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDtoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.browserDownloadUrl, browserDownloadUrl) ||
                other.browserDownloadUrl == browserDownloadUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      url,
      id,
      nodeId,
      name,
      label,
      uploader,
      contentType,
      state,
      size,
      downloadCount,
      createdAt,
      updatedAt,
      browserDownloadUrl);

  /// Create a copy of AssetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      __$$AssetDtoImplCopyWithImpl<_$AssetDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetDtoImplToJson(
      this,
    );
  }
}

abstract class _AssetDto implements AssetDto {
  factory _AssetDto(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'node_id') final String? nodeId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'label') final String? label,
      @JsonKey(name: 'uploader') final UploaderDto? uploader,
      @JsonKey(name: 'contentType') final String? contentType,
      @JsonKey(name: 'state') final String? state,
      @JsonKey(name: 'size') final int? size,
      @JsonKey(name: 'downloadCount') final int? downloadCount,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'browser_download_url')
      required final String browserDownloadUrl}) = _$AssetDtoImpl;

  factory _AssetDto.fromJson(Map<String, dynamic> json) =
      _$AssetDtoImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'node_id')
  String? get nodeId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'label')
  String? get label;
  @override
  @JsonKey(name: 'uploader')
  UploaderDto? get uploader;
  @override
  @JsonKey(name: 'contentType')
  String? get contentType;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'size')
  int? get size;
  @override
  @JsonKey(name: 'downloadCount')
  int? get downloadCount;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'browser_download_url')
  String get browserDownloadUrl;

  /// Create a copy of AssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

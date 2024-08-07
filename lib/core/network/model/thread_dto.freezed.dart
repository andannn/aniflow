// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThreadDto _$ThreadDtoFromJson(Map<String, dynamic> json) {
  return _ThreadDto.fromJson(json);
}

/// @nodoc
mixin _$ThreadDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDto? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'replyCommentId')
  int? get replyCommentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'replyCount')
  int? get replyCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'viewCount')
  int? get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'likeCount')
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLiked')
  int? get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'repliedAt')
  int? get repliedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLocked')
  bool? get isLocked => throw _privateConstructorUsedError;

  /// Serializes this ThreadDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadDtoCopyWith<ThreadDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadDtoCopyWith<$Res> {
  factory $ThreadDtoCopyWith(ThreadDto value, $Res Function(ThreadDto) then) =
      _$ThreadDtoCopyWithImpl<$Res, ThreadDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'replyCommentId') int? replyCommentId,
      @JsonKey(name: 'replyCount') int? replyCount,
      @JsonKey(name: 'viewCount') int? viewCount,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'isLiked') int? isLiked,
      @JsonKey(name: 'repliedAt') int? repliedAt,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'updatedAt') int? updatedAt,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'isLocked') bool? isLocked});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$ThreadDtoCopyWithImpl<$Res, $Val extends ThreadDto>
    implements $ThreadDtoCopyWith<$Res> {
  _$ThreadDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? body = freezed,
    Object? replyCommentId = freezed,
    Object? replyCount = freezed,
    Object? viewCount = freezed,
    Object? likeCount = freezed,
    Object? isLiked = freezed,
    Object? repliedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? siteUrl = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCommentId: freezed == replyCommentId
          ? _value.replyCommentId
          : replyCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      replyCount: freezed == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as int?,
      repliedAt: freezed == repliedAt
          ? _value.repliedAt
          : repliedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThreadDtoImplCopyWith<$Res>
    implements $ThreadDtoCopyWith<$Res> {
  factory _$$ThreadDtoImplCopyWith(
          _$ThreadDtoImpl value, $Res Function(_$ThreadDtoImpl) then) =
      __$$ThreadDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user') UserDto? user,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'replyCommentId') int? replyCommentId,
      @JsonKey(name: 'replyCount') int? replyCount,
      @JsonKey(name: 'viewCount') int? viewCount,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'isLiked') int? isLiked,
      @JsonKey(name: 'repliedAt') int? repliedAt,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'updatedAt') int? updatedAt,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'isLocked') bool? isLocked});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ThreadDtoImplCopyWithImpl<$Res>
    extends _$ThreadDtoCopyWithImpl<$Res, _$ThreadDtoImpl>
    implements _$$ThreadDtoImplCopyWith<$Res> {
  __$$ThreadDtoImplCopyWithImpl(
      _$ThreadDtoImpl _value, $Res Function(_$ThreadDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? body = freezed,
    Object? replyCommentId = freezed,
    Object? replyCount = freezed,
    Object? viewCount = freezed,
    Object? likeCount = freezed,
    Object? isLiked = freezed,
    Object? repliedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? siteUrl = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_$ThreadDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      replyCommentId: freezed == replyCommentId
          ? _value.replyCommentId
          : replyCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      replyCount: freezed == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as int?,
      repliedAt: freezed == repliedAt
          ? _value.repliedAt
          : repliedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadDtoImpl implements _ThreadDto {
  _$ThreadDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'body') this.body,
      @JsonKey(name: 'replyCommentId') this.replyCommentId,
      @JsonKey(name: 'replyCount') this.replyCount,
      @JsonKey(name: 'viewCount') this.viewCount,
      @JsonKey(name: 'likeCount') this.likeCount,
      @JsonKey(name: 'isLiked') this.isLiked,
      @JsonKey(name: 'repliedAt') this.repliedAt,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'isLocked') this.isLocked});

  factory _$ThreadDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user')
  final UserDto? user;
  @override
  @JsonKey(name: 'body')
  final String? body;
  @override
  @JsonKey(name: 'replyCommentId')
  final int? replyCommentId;
  @override
  @JsonKey(name: 'replyCount')
  final int? replyCount;
  @override
  @JsonKey(name: 'viewCount')
  final int? viewCount;
  @override
  @JsonKey(name: 'likeCount')
  final int? likeCount;
  @override
  @JsonKey(name: 'isLiked')
  final int? isLiked;
  @override
  @JsonKey(name: 'repliedAt')
  final int? repliedAt;
  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final int? updatedAt;
  @override
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'isLocked')
  final bool? isLocked;

  @override
  String toString() {
    return 'ThreadDto(id: $id, user: $user, body: $body, replyCommentId: $replyCommentId, replyCount: $replyCount, viewCount: $viewCount, likeCount: $likeCount, isLiked: $isLiked, repliedAt: $repliedAt, createdAt: $createdAt, updatedAt: $updatedAt, siteUrl: $siteUrl, isLocked: $isLocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.replyCommentId, replyCommentId) ||
                other.replyCommentId == replyCommentId) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.repliedAt, repliedAt) ||
                other.repliedAt == repliedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      body,
      replyCommentId,
      replyCount,
      viewCount,
      likeCount,
      isLiked,
      repliedAt,
      createdAt,
      updatedAt,
      siteUrl,
      isLocked);

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadDtoImplCopyWith<_$ThreadDtoImpl> get copyWith =>
      __$$ThreadDtoImplCopyWithImpl<_$ThreadDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadDtoImplToJson(
      this,
    );
  }
}

abstract class _ThreadDto implements ThreadDto {
  factory _ThreadDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'user') final UserDto? user,
      @JsonKey(name: 'body') final String? body,
      @JsonKey(name: 'replyCommentId') final int? replyCommentId,
      @JsonKey(name: 'replyCount') final int? replyCount,
      @JsonKey(name: 'viewCount') final int? viewCount,
      @JsonKey(name: 'likeCount') final int? likeCount,
      @JsonKey(name: 'isLiked') final int? isLiked,
      @JsonKey(name: 'repliedAt') final int? repliedAt,
      @JsonKey(name: 'createdAt') final int? createdAt,
      @JsonKey(name: 'updatedAt') final int? updatedAt,
      @JsonKey(name: 'siteUrl') final String? siteUrl,
      @JsonKey(name: 'isLocked') final bool? isLocked}) = _$ThreadDtoImpl;

  factory _ThreadDto.fromJson(Map<String, dynamic> json) =
      _$ThreadDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user')
  UserDto? get user;
  @override
  @JsonKey(name: 'body')
  String? get body;
  @override
  @JsonKey(name: 'replyCommentId')
  int? get replyCommentId;
  @override
  @JsonKey(name: 'replyCount')
  int? get replyCount;
  @override
  @JsonKey(name: 'viewCount')
  int? get viewCount;
  @override
  @JsonKey(name: 'likeCount')
  int? get likeCount;
  @override
  @JsonKey(name: 'isLiked')
  int? get isLiked;
  @override
  @JsonKey(name: 'repliedAt')
  int? get repliedAt;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  int? get updatedAt;
  @override
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'isLocked')
  bool? get isLocked;

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadDtoImplCopyWith<_$ThreadDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_activity_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextActivityDto _$TextActivityDtoFromJson(Map<String, dynamic> json) {
  return _TextActivityDto.fromJson(json);
}

/// @nodoc
mixin _$TextActivityDto {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  ActivityType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'replyCount')
  int? get replyCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLocked')
  bool? get isLocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLiked')
  bool? get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'likeCount')
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPinned')
  bool? get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDataDto? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextActivityDtoCopyWith<TextActivityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextActivityDtoCopyWith<$Res> {
  factory $TextActivityDtoCopyWith(
          TextActivityDto value, $Res Function(TextActivityDto) then) =
      _$TextActivityDtoCopyWithImpl<$Res, TextActivityDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'type') ActivityType? type,
      @JsonKey(name: 'replyCount') int? replyCount,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'isLocked') bool? isLocked,
      @JsonKey(name: 'isLiked') bool? isLiked,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'isPinned') bool? isPinned,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDataDto? user});

  $UserDataDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$TextActivityDtoCopyWithImpl<$Res, $Val extends TextActivityDto>
    implements $TextActivityDtoCopyWith<$Res> {
  _$TextActivityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? userId = freezed,
    Object? type = freezed,
    Object? replyCount = freezed,
    Object? siteUrl = freezed,
    Object? isLocked = freezed,
    Object? isLiked = freezed,
    Object? likeCount = freezed,
    Object? isPinned = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType?,
      replyCount: freezed == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPinned: freezed == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataDtoCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataDtoCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TextActivityDtoCopyWith<$Res>
    implements $TextActivityDtoCopyWith<$Res> {
  factory _$$_TextActivityDtoCopyWith(
          _$_TextActivityDto value, $Res Function(_$_TextActivityDto) then) =
      __$$_TextActivityDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'type') ActivityType? type,
      @JsonKey(name: 'replyCount') int? replyCount,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'isLocked') bool? isLocked,
      @JsonKey(name: 'isLiked') bool? isLiked,
      @JsonKey(name: 'likeCount') int? likeCount,
      @JsonKey(name: 'isPinned') bool? isPinned,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'user') UserDataDto? user});

  @override
  $UserDataDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_TextActivityDtoCopyWithImpl<$Res>
    extends _$TextActivityDtoCopyWithImpl<$Res, _$_TextActivityDto>
    implements _$$_TextActivityDtoCopyWith<$Res> {
  __$$_TextActivityDtoCopyWithImpl(
      _$_TextActivityDto _value, $Res Function(_$_TextActivityDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? userId = freezed,
    Object? type = freezed,
    Object? replyCount = freezed,
    Object? siteUrl = freezed,
    Object? isLocked = freezed,
    Object? isLiked = freezed,
    Object? likeCount = freezed,
    Object? isPinned = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_TextActivityDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType?,
      replyCount: freezed == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isPinned: freezed == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TextActivityDto implements _TextActivityDto {
  _$_TextActivityDto(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'replyCount') this.replyCount,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'isLocked') this.isLocked,
      @JsonKey(name: 'isLiked') this.isLiked,
      @JsonKey(name: 'likeCount') this.likeCount,
      @JsonKey(name: 'isPinned') this.isPinned,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'user') this.user});

  factory _$_TextActivityDto.fromJson(Map<String, dynamic> json) =>
      _$$_TextActivityDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'userId')
  final int? userId;
  @override
  @JsonKey(name: 'type')
  final ActivityType? type;
  @override
  @JsonKey(name: 'replyCount')
  final int? replyCount;
  @override
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'isLocked')
  final bool? isLocked;
  @override
  @JsonKey(name: 'isLiked')
  final bool? isLiked;
  @override
  @JsonKey(name: 'likeCount')
  final int? likeCount;
  @override
  @JsonKey(name: 'isPinned')
  final bool? isPinned;
  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'user')
  final UserDataDto? user;

  @override
  String toString() {
    return 'TextActivityDto(id: $id, text: $text, userId: $userId, type: $type, replyCount: $replyCount, siteUrl: $siteUrl, isLocked: $isLocked, isLiked: $isLiked, likeCount: $likeCount, isPinned: $isPinned, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextActivityDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      userId,
      type,
      replyCount,
      siteUrl,
      isLocked,
      isLiked,
      likeCount,
      isPinned,
      createdAt,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextActivityDtoCopyWith<_$_TextActivityDto> get copyWith =>
      __$$_TextActivityDtoCopyWithImpl<_$_TextActivityDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextActivityDtoToJson(
      this,
    );
  }
}

abstract class _TextActivityDto implements TextActivityDto {
  factory _TextActivityDto(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'text') final String? text,
      @JsonKey(name: 'userId') final int? userId,
      @JsonKey(name: 'type') final ActivityType? type,
      @JsonKey(name: 'replyCount') final int? replyCount,
      @JsonKey(name: 'siteUrl') final String? siteUrl,
      @JsonKey(name: 'isLocked') final bool? isLocked,
      @JsonKey(name: 'isLiked') final bool? isLiked,
      @JsonKey(name: 'likeCount') final int? likeCount,
      @JsonKey(name: 'isPinned') final bool? isPinned,
      @JsonKey(name: 'createdAt') final int? createdAt,
      @JsonKey(name: 'user') final UserDataDto? user}) = _$_TextActivityDto;

  factory _TextActivityDto.fromJson(Map<String, dynamic> json) =
      _$_TextActivityDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'type')
  ActivityType? get type;
  @override
  @JsonKey(name: 'replyCount')
  int? get replyCount;
  @override
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'isLocked')
  bool? get isLocked;
  @override
  @JsonKey(name: 'isLiked')
  bool? get isLiked;
  @override
  @JsonKey(name: 'likeCount')
  int? get likeCount;
  @override
  @JsonKey(name: 'isPinned')
  bool? get isPinned;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'user')
  UserDataDto? get user;
  @override
  @JsonKey(ignore: true)
  _$$_TextActivityDtoCopyWith<_$_TextActivityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_anime_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAnimeListEntity _$UserAnimeListEntityFromJson(Map<String, dynamic> json) {
  return _UserAnimeListEntity.fromJson(json);
}

/// @nodoc
mixin _$UserAnimeListEntity {
  @JsonKey(name: UserAnimeListTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: UserAnimeListTableColumns.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: UserAnimeListTableColumns.animeId)
  String? get animeId => throw _privateConstructorUsedError;
  @JsonKey(name: UserAnimeListTableColumns.status)
  AnimeListStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: UserAnimeListTableColumns.score)
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: UserAnimeListTableColumns.updatedAt)
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAnimeListEntityCopyWith<UserAnimeListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnimeListEntityCopyWith<$Res> {
  factory $UserAnimeListEntityCopyWith(
          UserAnimeListEntity value, $Res Function(UserAnimeListEntity) then) =
      _$UserAnimeListEntityCopyWithImpl<$Res, UserAnimeListEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: UserAnimeListTableColumns.id) String id,
      @JsonKey(name: UserAnimeListTableColumns.userId) String? userId,
      @JsonKey(name: UserAnimeListTableColumns.animeId) String? animeId,
      @JsonKey(name: UserAnimeListTableColumns.status) AnimeListStatus? status,
      @JsonKey(name: UserAnimeListTableColumns.score) int? score,
      @JsonKey(name: UserAnimeListTableColumns.updatedAt) int? updatedAt});
}

/// @nodoc
class _$UserAnimeListEntityCopyWithImpl<$Res, $Val extends UserAnimeListEntity>
    implements $UserAnimeListEntityCopyWith<$Res> {
  _$UserAnimeListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? animeId = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      animeId: freezed == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeListStatus?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAnimeListEntityCopyWith<$Res>
    implements $UserAnimeListEntityCopyWith<$Res> {
  factory _$$_UserAnimeListEntityCopyWith(_$_UserAnimeListEntity value,
          $Res Function(_$_UserAnimeListEntity) then) =
      __$$_UserAnimeListEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: UserAnimeListTableColumns.id) String id,
      @JsonKey(name: UserAnimeListTableColumns.userId) String? userId,
      @JsonKey(name: UserAnimeListTableColumns.animeId) String? animeId,
      @JsonKey(name: UserAnimeListTableColumns.status) AnimeListStatus? status,
      @JsonKey(name: UserAnimeListTableColumns.score) int? score,
      @JsonKey(name: UserAnimeListTableColumns.updatedAt) int? updatedAt});
}

/// @nodoc
class __$$_UserAnimeListEntityCopyWithImpl<$Res>
    extends _$UserAnimeListEntityCopyWithImpl<$Res, _$_UserAnimeListEntity>
    implements _$$_UserAnimeListEntityCopyWith<$Res> {
  __$$_UserAnimeListEntityCopyWithImpl(_$_UserAnimeListEntity _value,
      $Res Function(_$_UserAnimeListEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? animeId = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserAnimeListEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      animeId: freezed == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeListStatus?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAnimeListEntity implements _UserAnimeListEntity {
  _$_UserAnimeListEntity(
      {@JsonKey(name: UserAnimeListTableColumns.id) this.id = '',
      @JsonKey(name: UserAnimeListTableColumns.userId) this.userId,
      @JsonKey(name: UserAnimeListTableColumns.animeId) this.animeId,
      @JsonKey(name: UserAnimeListTableColumns.status) this.status,
      @JsonKey(name: UserAnimeListTableColumns.score) this.score,
      @JsonKey(name: UserAnimeListTableColumns.updatedAt) this.updatedAt});

  factory _$_UserAnimeListEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserAnimeListEntityFromJson(json);

  @override
  @JsonKey(name: UserAnimeListTableColumns.id)
  final String id;
  @override
  @JsonKey(name: UserAnimeListTableColumns.userId)
  final String? userId;
  @override
  @JsonKey(name: UserAnimeListTableColumns.animeId)
  final String? animeId;
  @override
  @JsonKey(name: UserAnimeListTableColumns.status)
  final AnimeListStatus? status;
  @override
  @JsonKey(name: UserAnimeListTableColumns.score)
  final int? score;
  @override
  @JsonKey(name: UserAnimeListTableColumns.updatedAt)
  final int? updatedAt;

  @override
  String toString() {
    return 'UserAnimeListEntity(id: $id, userId: $userId, animeId: $animeId, status: $status, score: $score, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAnimeListEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.animeId, animeId) || other.animeId == animeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, animeId, status, score, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAnimeListEntityCopyWith<_$_UserAnimeListEntity> get copyWith =>
      __$$_UserAnimeListEntityCopyWithImpl<_$_UserAnimeListEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAnimeListEntityToJson(
      this,
    );
  }
}

abstract class _UserAnimeListEntity implements UserAnimeListEntity {
  factory _UserAnimeListEntity(
      {@JsonKey(name: UserAnimeListTableColumns.id) final String id,
      @JsonKey(name: UserAnimeListTableColumns.userId) final String? userId,
      @JsonKey(name: UserAnimeListTableColumns.animeId) final String? animeId,
      @JsonKey(name: UserAnimeListTableColumns.status)
      final AnimeListStatus? status,
      @JsonKey(name: UserAnimeListTableColumns.score) final int? score,
      @JsonKey(name: UserAnimeListTableColumns.updatedAt)
      final int? updatedAt}) = _$_UserAnimeListEntity;

  factory _UserAnimeListEntity.fromJson(Map<String, dynamic> json) =
      _$_UserAnimeListEntity.fromJson;

  @override
  @JsonKey(name: UserAnimeListTableColumns.id)
  String get id;
  @override
  @JsonKey(name: UserAnimeListTableColumns.userId)
  String? get userId;
  @override
  @JsonKey(name: UserAnimeListTableColumns.animeId)
  String? get animeId;
  @override
  @JsonKey(name: UserAnimeListTableColumns.status)
  AnimeListStatus? get status;
  @override
  @JsonKey(name: UserAnimeListTableColumns.score)
  int? get score;
  @override
  @JsonKey(name: UserAnimeListTableColumns.updatedAt)
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserAnimeListEntityCopyWith<_$_UserAnimeListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

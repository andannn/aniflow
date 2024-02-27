// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airing_schedules_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiringSchedulesEntity _$AiringSchedulesEntityFromJson(
    Map<String, dynamic> json) {
  return _AiringSchedulesEntity.fromJson(json);
}

/// @nodoc
mixin _$AiringSchedulesEntity {
  @JsonKey(name: AiringSchedulesColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: AiringSchedulesColumns.mediaId)
  String get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: AiringSchedulesColumns.airingAt)
  int? get airingAt => throw _privateConstructorUsedError;
  @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  @JsonKey(name: AiringSchedulesColumns.episode)
  int? get episode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiringSchedulesEntityCopyWith<AiringSchedulesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiringSchedulesEntityCopyWith<$Res> {
  factory $AiringSchedulesEntityCopyWith(AiringSchedulesEntity value,
          $Res Function(AiringSchedulesEntity) then) =
      _$AiringSchedulesEntityCopyWithImpl<$Res, AiringSchedulesEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: AiringSchedulesColumns.id) String id,
      @JsonKey(name: AiringSchedulesColumns.mediaId) String mediaId,
      @JsonKey(name: AiringSchedulesColumns.airingAt) int? airingAt,
      @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
      int? timeUntilAiring,
      @JsonKey(name: AiringSchedulesColumns.episode) int? episode});
}

/// @nodoc
class _$AiringSchedulesEntityCopyWithImpl<$Res,
        $Val extends AiringSchedulesEntity>
    implements $AiringSchedulesEntityCopyWith<$Res> {
  _$AiringSchedulesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = null,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: null == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String,
      airingAt: freezed == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiringSchedulesEntityImplCopyWith<$Res>
    implements $AiringSchedulesEntityCopyWith<$Res> {
  factory _$$AiringSchedulesEntityImplCopyWith(
          _$AiringSchedulesEntityImpl value,
          $Res Function(_$AiringSchedulesEntityImpl) then) =
      __$$AiringSchedulesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AiringSchedulesColumns.id) String id,
      @JsonKey(name: AiringSchedulesColumns.mediaId) String mediaId,
      @JsonKey(name: AiringSchedulesColumns.airingAt) int? airingAt,
      @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
      int? timeUntilAiring,
      @JsonKey(name: AiringSchedulesColumns.episode) int? episode});
}

/// @nodoc
class __$$AiringSchedulesEntityImplCopyWithImpl<$Res>
    extends _$AiringSchedulesEntityCopyWithImpl<$Res,
        _$AiringSchedulesEntityImpl>
    implements _$$AiringSchedulesEntityImplCopyWith<$Res> {
  __$$AiringSchedulesEntityImplCopyWithImpl(_$AiringSchedulesEntityImpl _value,
      $Res Function(_$AiringSchedulesEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = null,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$AiringSchedulesEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: null == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String,
      airingAt: freezed == airingAt
          ? _value.airingAt
          : airingAt // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiringSchedulesEntityImpl implements _AiringSchedulesEntity {
  _$AiringSchedulesEntityImpl(
      {@JsonKey(name: AiringSchedulesColumns.id) this.id = '',
      @JsonKey(name: AiringSchedulesColumns.mediaId) this.mediaId = '',
      @JsonKey(name: AiringSchedulesColumns.airingAt) this.airingAt,
      @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
      this.timeUntilAiring,
      @JsonKey(name: AiringSchedulesColumns.episode) this.episode});

  factory _$AiringSchedulesEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiringSchedulesEntityImplFromJson(json);

  @override
  @JsonKey(name: AiringSchedulesColumns.id)
  final String id;
  @override
  @JsonKey(name: AiringSchedulesColumns.mediaId)
  final String mediaId;
  @override
  @JsonKey(name: AiringSchedulesColumns.airingAt)
  final int? airingAt;
  @override
  @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
  final int? timeUntilAiring;
  @override
  @JsonKey(name: AiringSchedulesColumns.episode)
  final int? episode;

  @override
  String toString() {
    return 'AiringSchedulesEntity(id: $id, mediaId: $mediaId, airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiringSchedulesEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.airingAt, airingAt) ||
                other.airingAt == airingAt) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mediaId, airingAt, timeUntilAiring, episode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AiringSchedulesEntityImplCopyWith<_$AiringSchedulesEntityImpl>
      get copyWith => __$$AiringSchedulesEntityImplCopyWithImpl<
          _$AiringSchedulesEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiringSchedulesEntityImplToJson(
      this,
    );
  }
}

abstract class _AiringSchedulesEntity implements AiringSchedulesEntity {
  factory _AiringSchedulesEntity(
          {@JsonKey(name: AiringSchedulesColumns.id) final String id,
          @JsonKey(name: AiringSchedulesColumns.mediaId) final String mediaId,
          @JsonKey(name: AiringSchedulesColumns.airingAt) final int? airingAt,
          @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
          final int? timeUntilAiring,
          @JsonKey(name: AiringSchedulesColumns.episode) final int? episode}) =
      _$AiringSchedulesEntityImpl;

  factory _AiringSchedulesEntity.fromJson(Map<String, dynamic> json) =
      _$AiringSchedulesEntityImpl.fromJson;

  @override
  @JsonKey(name: AiringSchedulesColumns.id)
  String get id;
  @override
  @JsonKey(name: AiringSchedulesColumns.mediaId)
  String get mediaId;
  @override
  @JsonKey(name: AiringSchedulesColumns.airingAt)
  int? get airingAt;
  @override
  @JsonKey(name: AiringSchedulesColumns.timeUntilAiring)
  int? get timeUntilAiring;
  @override
  @JsonKey(name: AiringSchedulesColumns.episode)
  int? get episode;
  @override
  @JsonKey(ignore: true)
  _$$AiringSchedulesEntityImplCopyWith<_$AiringSchedulesEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

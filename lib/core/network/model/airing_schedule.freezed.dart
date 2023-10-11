// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airing_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AiringSchedule _$AiringScheduleFromJson(Map<String, dynamic> json) {
  return _AiringSchedule.fromJson(json);
}

/// @nodoc
mixin _$AiringSchedule {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaId')
  int? get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'airingAt')
  int? get airingAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeUntilAiring')
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode')
  int? get episode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiringScheduleCopyWith<AiringSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiringScheduleCopyWith<$Res> {
  factory $AiringScheduleCopyWith(
          AiringSchedule value, $Res Function(AiringSchedule) then) =
      _$AiringScheduleCopyWithImpl<$Res, AiringSchedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'airingAt') int? airingAt,
      @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
      @JsonKey(name: 'episode') int? episode});
}

/// @nodoc
class _$AiringScheduleCopyWithImpl<$Res, $Val extends AiringSchedule>
    implements $AiringScheduleCopyWith<$Res> {
  _$AiringScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = freezed,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_AiringScheduleCopyWith<$Res>
    implements $AiringScheduleCopyWith<$Res> {
  factory _$$_AiringScheduleCopyWith(
          _$_AiringSchedule value, $Res Function(_$_AiringSchedule) then) =
      __$$_AiringScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'airingAt') int? airingAt,
      @JsonKey(name: 'timeUntilAiring') int? timeUntilAiring,
      @JsonKey(name: 'episode') int? episode});
}

/// @nodoc
class __$$_AiringScheduleCopyWithImpl<$Res>
    extends _$AiringScheduleCopyWithImpl<$Res, _$_AiringSchedule>
    implements _$$_AiringScheduleCopyWith<$Res> {
  __$$_AiringScheduleCopyWithImpl(
      _$_AiringSchedule _value, $Res Function(_$_AiringSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaId = freezed,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$_AiringSchedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_AiringSchedule implements _AiringSchedule {
  _$_AiringSchedule(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'airingAt') this.airingAt,
      @JsonKey(name: 'timeUntilAiring') this.timeUntilAiring,
      @JsonKey(name: 'episode') this.episode});

  factory _$_AiringSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_AiringScheduleFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'mediaId')
  final int? mediaId;
  @override
  @JsonKey(name: 'airingAt')
  final int? airingAt;
  @override
  @JsonKey(name: 'timeUntilAiring')
  final int? timeUntilAiring;
  @override
  @JsonKey(name: 'episode')
  final int? episode;

  @override
  String toString() {
    return 'AiringSchedule(id: $id, mediaId: $mediaId, airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiringSchedule &&
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
  _$$_AiringScheduleCopyWith<_$_AiringSchedule> get copyWith =>
      __$$_AiringScheduleCopyWithImpl<_$_AiringSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AiringScheduleToJson(
      this,
    );
  }
}

abstract class _AiringSchedule implements AiringSchedule {
  factory _AiringSchedule(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'mediaId') final int? mediaId,
      @JsonKey(name: 'airingAt') final int? airingAt,
      @JsonKey(name: 'timeUntilAiring') final int? timeUntilAiring,
      @JsonKey(name: 'episode') final int? episode}) = _$_AiringSchedule;

  factory _AiringSchedule.fromJson(Map<String, dynamic> json) =
      _$_AiringSchedule.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'mediaId')
  int? get mediaId;
  @override
  @JsonKey(name: 'airingAt')
  int? get airingAt;
  @override
  @JsonKey(name: 'timeUntilAiring')
  int? get timeUntilAiring;
  @override
  @JsonKey(name: 'episode')
  int? get episode;
  @override
  @JsonKey(ignore: true)
  _$$_AiringScheduleCopyWith<_$_AiringSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

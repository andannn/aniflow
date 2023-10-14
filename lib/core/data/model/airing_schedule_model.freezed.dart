// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airing_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AiringScheduleModel {
  String get id => throw _privateConstructorUsedError;
  int? get airingAt => throw _privateConstructorUsedError;
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  int? get episode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AiringScheduleModelCopyWith<AiringScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiringScheduleModelCopyWith<$Res> {
  factory $AiringScheduleModelCopyWith(
          AiringScheduleModel value, $Res Function(AiringScheduleModel) then) =
      _$AiringScheduleModelCopyWithImpl<$Res, AiringScheduleModel>;
  @useResult
  $Res call({String id, int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class _$AiringScheduleModelCopyWithImpl<$Res, $Val extends AiringScheduleModel>
    implements $AiringScheduleModelCopyWith<$Res> {
  _$AiringScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_AiringScheduleModelCopyWith<$Res>
    implements $AiringScheduleModelCopyWith<$Res> {
  factory _$$_AiringScheduleModelCopyWith(_$_AiringScheduleModel value,
          $Res Function(_$_AiringScheduleModel) then) =
      __$$_AiringScheduleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class __$$_AiringScheduleModelCopyWithImpl<$Res>
    extends _$AiringScheduleModelCopyWithImpl<$Res, _$_AiringScheduleModel>
    implements _$$_AiringScheduleModelCopyWith<$Res> {
  __$$_AiringScheduleModelCopyWithImpl(_$_AiringScheduleModel _value,
      $Res Function(_$_AiringScheduleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$_AiringScheduleModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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

class _$_AiringScheduleModel implements _AiringScheduleModel {
  _$_AiringScheduleModel(
      {this.id = '', this.airingAt, this.timeUntilAiring, this.episode});

  @override
  @JsonKey()
  final String id;
  @override
  final int? airingAt;
  @override
  final int? timeUntilAiring;
  @override
  final int? episode;

  @override
  String toString() {
    return 'AiringScheduleModel(id: $id, airingAt: $airingAt, timeUntilAiring: $timeUntilAiring, episode: $episode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiringScheduleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.airingAt, airingAt) ||
                other.airingAt == airingAt) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, airingAt, timeUntilAiring, episode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AiringScheduleModelCopyWith<_$_AiringScheduleModel> get copyWith =>
      __$$_AiringScheduleModelCopyWithImpl<_$_AiringScheduleModel>(
          this, _$identity);
}

abstract class _AiringScheduleModel implements AiringScheduleModel {
  factory _AiringScheduleModel(
      {final String id,
      final int? airingAt,
      final int? timeUntilAiring,
      final int? episode}) = _$_AiringScheduleModel;

  @override
  String get id;
  @override
  int? get airingAt;
  @override
  int? get timeUntilAiring;
  @override
  int? get episode;
  @override
  @JsonKey(ignore: true)
  _$$_AiringScheduleModelCopyWith<_$_AiringScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AiringScheduleModel {
  String get id => throw _privateConstructorUsedError;
  int? get airingAt => throw _privateConstructorUsedError;
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  int? get episode => throw _privateConstructorUsedError;

  /// Create a copy of AiringScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of AiringScheduleModel
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$AiringScheduleModelImplCopyWith<$Res>
    implements $AiringScheduleModelCopyWith<$Res> {
  factory _$$AiringScheduleModelImplCopyWith(_$AiringScheduleModelImpl value,
          $Res Function(_$AiringScheduleModelImpl) then) =
      __$$AiringScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int? airingAt, int? timeUntilAiring, int? episode});
}

/// @nodoc
class __$$AiringScheduleModelImplCopyWithImpl<$Res>
    extends _$AiringScheduleModelCopyWithImpl<$Res, _$AiringScheduleModelImpl>
    implements _$$AiringScheduleModelImplCopyWith<$Res> {
  __$$AiringScheduleModelImplCopyWithImpl(_$AiringScheduleModelImpl _value,
      $Res Function(_$AiringScheduleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiringScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airingAt = freezed,
    Object? timeUntilAiring = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$AiringScheduleModelImpl(
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

class _$AiringScheduleModelImpl implements _AiringScheduleModel {
  _$AiringScheduleModelImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiringScheduleModelImpl &&
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

  /// Create a copy of AiringScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiringScheduleModelImplCopyWith<_$AiringScheduleModelImpl> get copyWith =>
      __$$AiringScheduleModelImplCopyWithImpl<_$AiringScheduleModelImpl>(
          this, _$identity);
}

abstract class _AiringScheduleModel implements AiringScheduleModel {
  factory _AiringScheduleModel(
      {final String id,
      final int? airingAt,
      final int? timeUntilAiring,
      final int? episode}) = _$AiringScheduleModelImpl;

  @override
  String get id;
  @override
  int? get airingAt;
  @override
  int? get timeUntilAiring;
  @override
  int? get episode;

  /// Create a copy of AiringScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiringScheduleModelImplCopyWith<_$AiringScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_voice_actor_statics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserVoiceActorStaticsDto _$UserVoiceActorStaticsDtoFromJson(
    Map<String, dynamic> json) {
  return _UserVoiceActorStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserVoiceActorStaticsDto {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanScore')
  double? get meanScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutesWatched')
  int? get minutesWatched => throw _privateConstructorUsedError;
  @JsonKey(name: 'chaptersRead')
  int? get chaptersRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaIds')
  List<int> get mediaIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'characterIds')
  List<int> get characterIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'voiceActor')
  StaffDto? get voiceActor => throw _privateConstructorUsedError;

  /// Serializes this UserVoiceActorStaticsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserVoiceActorStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserVoiceActorStaticsDtoCopyWith<UserVoiceActorStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVoiceActorStaticsDtoCopyWith<$Res> {
  factory $UserVoiceActorStaticsDtoCopyWith(UserVoiceActorStaticsDto value,
          $Res Function(UserVoiceActorStaticsDto) then) =
      _$UserVoiceActorStaticsDtoCopyWithImpl<$Res, UserVoiceActorStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'characterIds') List<int> characterIds,
      @JsonKey(name: 'voiceActor') StaffDto? voiceActor});

  $StaffDtoCopyWith<$Res>? get voiceActor;
}

/// @nodoc
class _$UserVoiceActorStaticsDtoCopyWithImpl<$Res,
        $Val extends UserVoiceActorStaticsDto>
    implements $UserVoiceActorStaticsDtoCopyWith<$Res> {
  _$UserVoiceActorStaticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserVoiceActorStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? characterIds = null,
    Object? voiceActor = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      meanScore: freezed == meanScore
          ? _value.meanScore
          : meanScore // ignore: cast_nullable_to_non_nullable
              as double?,
      minutesWatched: freezed == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersRead: freezed == chaptersRead
          ? _value.chaptersRead
          : chaptersRead // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaIds: null == mediaIds
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      characterIds: null == characterIds
          ? _value.characterIds
          : characterIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      voiceActor: freezed == voiceActor
          ? _value.voiceActor
          : voiceActor // ignore: cast_nullable_to_non_nullable
              as StaffDto?,
    ) as $Val);
  }

  /// Create a copy of UserVoiceActorStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffDtoCopyWith<$Res>? get voiceActor {
    if (_value.voiceActor == null) {
      return null;
    }

    return $StaffDtoCopyWith<$Res>(_value.voiceActor!, (value) {
      return _then(_value.copyWith(voiceActor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserVoiceActorStaticsDtoImplCopyWith<$Res>
    implements $UserVoiceActorStaticsDtoCopyWith<$Res> {
  factory _$$UserVoiceActorStaticsDtoImplCopyWith(
          _$UserVoiceActorStaticsDtoImpl value,
          $Res Function(_$UserVoiceActorStaticsDtoImpl) then) =
      __$$UserVoiceActorStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'characterIds') List<int> characterIds,
      @JsonKey(name: 'voiceActor') StaffDto? voiceActor});

  @override
  $StaffDtoCopyWith<$Res>? get voiceActor;
}

/// @nodoc
class __$$UserVoiceActorStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserVoiceActorStaticsDtoCopyWithImpl<$Res,
        _$UserVoiceActorStaticsDtoImpl>
    implements _$$UserVoiceActorStaticsDtoImplCopyWith<$Res> {
  __$$UserVoiceActorStaticsDtoImplCopyWithImpl(
      _$UserVoiceActorStaticsDtoImpl _value,
      $Res Function(_$UserVoiceActorStaticsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserVoiceActorStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? characterIds = null,
    Object? voiceActor = freezed,
  }) {
    return _then(_$UserVoiceActorStaticsDtoImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      meanScore: freezed == meanScore
          ? _value.meanScore
          : meanScore // ignore: cast_nullable_to_non_nullable
              as double?,
      minutesWatched: freezed == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersRead: freezed == chaptersRead
          ? _value.chaptersRead
          : chaptersRead // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaIds: null == mediaIds
          ? _value._mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      characterIds: null == characterIds
          ? _value._characterIds
          : characterIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      voiceActor: freezed == voiceActor
          ? _value.voiceActor
          : voiceActor // ignore: cast_nullable_to_non_nullable
              as StaffDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserVoiceActorStaticsDtoImpl implements _UserVoiceActorStaticsDto {
  const _$UserVoiceActorStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds = const [],
      @JsonKey(name: 'characterIds') final List<int> characterIds = const [],
      @JsonKey(name: 'voiceActor') this.voiceActor})
      : _mediaIds = mediaIds,
        _characterIds = characterIds;

  factory _$UserVoiceActorStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserVoiceActorStaticsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'meanScore')
  final double? meanScore;
  @override
  @JsonKey(name: 'minutesWatched')
  final int? minutesWatched;
  @override
  @JsonKey(name: 'chaptersRead')
  final int? chaptersRead;
  final List<int> _mediaIds;
  @override
  @JsonKey(name: 'mediaIds')
  List<int> get mediaIds {
    if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaIds);
  }

  final List<int> _characterIds;
  @override
  @JsonKey(name: 'characterIds')
  List<int> get characterIds {
    if (_characterIds is EqualUnmodifiableListView) return _characterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterIds);
  }

  @override
  @JsonKey(name: 'voiceActor')
  final StaffDto? voiceActor;

  @override
  String toString() {
    return 'UserVoiceActorStaticsDto(count: $count, meanScore: $meanScore, minutesWatched: $minutesWatched, chaptersRead: $chaptersRead, mediaIds: $mediaIds, characterIds: $characterIds, voiceActor: $voiceActor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVoiceActorStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            const DeepCollectionEquality()
                .equals(other._characterIds, _characterIds) &&
            (identical(other.voiceActor, voiceActor) ||
                other.voiceActor == voiceActor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      meanScore,
      minutesWatched,
      chaptersRead,
      const DeepCollectionEquality().hash(_mediaIds),
      const DeepCollectionEquality().hash(_characterIds),
      voiceActor);

  /// Create a copy of UserVoiceActorStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserVoiceActorStaticsDtoImplCopyWith<_$UserVoiceActorStaticsDtoImpl>
      get copyWith => __$$UserVoiceActorStaticsDtoImplCopyWithImpl<
          _$UserVoiceActorStaticsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserVoiceActorStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserVoiceActorStaticsDto implements UserVoiceActorStaticsDto {
  const factory _UserVoiceActorStaticsDto(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'meanScore') final double? meanScore,
          @JsonKey(name: 'minutesWatched') final int? minutesWatched,
          @JsonKey(name: 'chaptersRead') final int? chaptersRead,
          @JsonKey(name: 'mediaIds') final List<int> mediaIds,
          @JsonKey(name: 'characterIds') final List<int> characterIds,
          @JsonKey(name: 'voiceActor') final StaffDto? voiceActor}) =
      _$UserVoiceActorStaticsDtoImpl;

  factory _UserVoiceActorStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserVoiceActorStaticsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'meanScore')
  double? get meanScore;
  @override
  @JsonKey(name: 'minutesWatched')
  int? get minutesWatched;
  @override
  @JsonKey(name: 'chaptersRead')
  int? get chaptersRead;
  @override
  @JsonKey(name: 'mediaIds')
  List<int> get mediaIds;
  @override
  @JsonKey(name: 'characterIds')
  List<int> get characterIds;
  @override
  @JsonKey(name: 'voiceActor')
  StaffDto? get voiceActor;

  /// Create a copy of UserVoiceActorStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserVoiceActorStaticsDtoImplCopyWith<_$UserVoiceActorStaticsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

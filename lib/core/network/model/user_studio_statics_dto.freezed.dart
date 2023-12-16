// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_studio_statics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserStudioStaticsDto _$UserStudioStaticsDtoFromJson(Map<String, dynamic> json) {
  return _UserStudioStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserStudioStaticsDto {
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
  @JsonKey(name: 'studio')
  StudioDto? get studio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStudioStaticsDtoCopyWith<UserStudioStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStudioStaticsDtoCopyWith<$Res> {
  factory $UserStudioStaticsDtoCopyWith(UserStudioStaticsDto value,
          $Res Function(UserStudioStaticsDto) then) =
      _$UserStudioStaticsDtoCopyWithImpl<$Res, UserStudioStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'studio') StudioDto? studio});

  $StudioDtoCopyWith<$Res>? get studio;
}

/// @nodoc
class _$UserStudioStaticsDtoCopyWithImpl<$Res,
        $Val extends UserStudioStaticsDto>
    implements $UserStudioStaticsDtoCopyWith<$Res> {
  _$UserStudioStaticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? studio = freezed,
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
      studio: freezed == studio
          ? _value.studio
          : studio // ignore: cast_nullable_to_non_nullable
              as StudioDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudioDtoCopyWith<$Res>? get studio {
    if (_value.studio == null) {
      return null;
    }

    return $StudioDtoCopyWith<$Res>(_value.studio!, (value) {
      return _then(_value.copyWith(studio: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStudioStaticsDtoImplCopyWith<$Res>
    implements $UserStudioStaticsDtoCopyWith<$Res> {
  factory _$$UserStudioStaticsDtoImplCopyWith(_$UserStudioStaticsDtoImpl value,
          $Res Function(_$UserStudioStaticsDtoImpl) then) =
      __$$UserStudioStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'studio') StudioDto? studio});

  @override
  $StudioDtoCopyWith<$Res>? get studio;
}

/// @nodoc
class __$$UserStudioStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserStudioStaticsDtoCopyWithImpl<$Res, _$UserStudioStaticsDtoImpl>
    implements _$$UserStudioStaticsDtoImplCopyWith<$Res> {
  __$$UserStudioStaticsDtoImplCopyWithImpl(_$UserStudioStaticsDtoImpl _value,
      $Res Function(_$UserStudioStaticsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? studio = freezed,
  }) {
    return _then(_$UserStudioStaticsDtoImpl(
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
      studio: freezed == studio
          ? _value.studio
          : studio // ignore: cast_nullable_to_non_nullable
              as StudioDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStudioStaticsDtoImpl implements _UserStudioStaticsDto {
  const _$UserStudioStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds = const [],
      @JsonKey(name: 'studio') this.studio})
      : _mediaIds = mediaIds;

  factory _$UserStudioStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStudioStaticsDtoImplFromJson(json);

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

  @override
  @JsonKey(name: 'studio')
  final StudioDto? studio;

  @override
  String toString() {
    return 'UserStudioStaticsDto(count: $count, meanScore: $meanScore, minutesWatched: $minutesWatched, chaptersRead: $chaptersRead, mediaIds: $mediaIds, studio: $studio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStudioStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.studio, studio) || other.studio == studio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, meanScore, minutesWatched,
      chaptersRead, const DeepCollectionEquality().hash(_mediaIds), studio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStudioStaticsDtoImplCopyWith<_$UserStudioStaticsDtoImpl>
      get copyWith =>
          __$$UserStudioStaticsDtoImplCopyWithImpl<_$UserStudioStaticsDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStudioStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserStudioStaticsDto implements UserStudioStaticsDto {
  const factory _UserStudioStaticsDto(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'meanScore') final double? meanScore,
          @JsonKey(name: 'minutesWatched') final int? minutesWatched,
          @JsonKey(name: 'chaptersRead') final int? chaptersRead,
          @JsonKey(name: 'mediaIds') final List<int> mediaIds,
          @JsonKey(name: 'studio') final StudioDto? studio}) =
      _$UserStudioStaticsDtoImpl;

  factory _UserStudioStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserStudioStaticsDtoImpl.fromJson;

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
  @JsonKey(name: 'studio')
  StudioDto? get studio;
  @override
  @JsonKey(ignore: true)
  _$$UserStudioStaticsDtoImplCopyWith<_$UserStudioStaticsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

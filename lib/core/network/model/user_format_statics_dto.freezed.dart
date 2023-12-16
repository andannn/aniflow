// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_format_statics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFormatStaticsDto _$UserFormatStaticsDtoFromJson(Map<String, dynamic> json) {
  return _UserFormatStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserFormatStaticsDto {
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
  @JsonKey(name: 'status')
  MediaListStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFormatStaticsDtoCopyWith<UserFormatStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFormatStaticsDtoCopyWith<$Res> {
  factory $UserFormatStaticsDtoCopyWith(UserFormatStaticsDto value,
          $Res Function(UserFormatStaticsDto) then) =
      _$UserFormatStaticsDtoCopyWithImpl<$Res, UserFormatStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'status') MediaListStatus? status});
}

/// @nodoc
class _$UserFormatStaticsDtoCopyWithImpl<$Res,
        $Val extends UserFormatStaticsDto>
    implements $UserFormatStaticsDtoCopyWith<$Res> {
  _$UserFormatStaticsDtoCopyWithImpl(this._value, this._then);

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
    Object? status = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFormatStaticsDtoImplCopyWith<$Res>
    implements $UserFormatStaticsDtoCopyWith<$Res> {
  factory _$$UserFormatStaticsDtoImplCopyWith(_$UserFormatStaticsDtoImpl value,
          $Res Function(_$UserFormatStaticsDtoImpl) then) =
      __$$UserFormatStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'status') MediaListStatus? status});
}

/// @nodoc
class __$$UserFormatStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserFormatStaticsDtoCopyWithImpl<$Res, _$UserFormatStaticsDtoImpl>
    implements _$$UserFormatStaticsDtoImplCopyWith<$Res> {
  __$$UserFormatStaticsDtoImplCopyWithImpl(_$UserFormatStaticsDtoImpl _value,
      $Res Function(_$UserFormatStaticsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? status = freezed,
  }) {
    return _then(_$UserFormatStaticsDtoImpl(
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFormatStaticsDtoImpl implements _UserFormatStaticsDto {
  const _$UserFormatStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds = const [],
      @JsonKey(name: 'status') this.status})
      : _mediaIds = mediaIds;

  factory _$UserFormatStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFormatStaticsDtoImplFromJson(json);

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
  @JsonKey(name: 'status')
  final MediaListStatus? status;

  @override
  String toString() {
    return 'UserFormatStaticsDto(count: $count, meanScore: $meanScore, minutesWatched: $minutesWatched, chaptersRead: $chaptersRead, mediaIds: $mediaIds, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFormatStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, meanScore, minutesWatched,
      chaptersRead, const DeepCollectionEquality().hash(_mediaIds), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFormatStaticsDtoImplCopyWith<_$UserFormatStaticsDtoImpl>
      get copyWith =>
          __$$UserFormatStaticsDtoImplCopyWithImpl<_$UserFormatStaticsDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFormatStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserFormatStaticsDto implements UserFormatStaticsDto {
  const factory _UserFormatStaticsDto(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'meanScore') final double? meanScore,
          @JsonKey(name: 'minutesWatched') final int? minutesWatched,
          @JsonKey(name: 'chaptersRead') final int? chaptersRead,
          @JsonKey(name: 'mediaIds') final List<int> mediaIds,
          @JsonKey(name: 'status') final MediaListStatus? status}) =
      _$UserFormatStaticsDtoImpl;

  factory _UserFormatStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserFormatStaticsDtoImpl.fromJson;

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
  @JsonKey(name: 'status')
  MediaListStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$UserFormatStaticsDtoImplCopyWith<_$UserFormatStaticsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

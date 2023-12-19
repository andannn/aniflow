// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tag_statics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTagStaticsDto _$UserTagStaticsDtoFromJson(Map<String, dynamic> json) {
  return _UserTagStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserTagStaticsDto {
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
  @JsonKey(name: 'tag')
  MediaTagDto? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTagStaticsDtoCopyWith<UserTagStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTagStaticsDtoCopyWith<$Res> {
  factory $UserTagStaticsDtoCopyWith(
          UserTagStaticsDto value, $Res Function(UserTagStaticsDto) then) =
      _$UserTagStaticsDtoCopyWithImpl<$Res, UserTagStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'tag') MediaTagDto? tag});

  $MediaTagDtoCopyWith<$Res>? get tag;
}

/// @nodoc
class _$UserTagStaticsDtoCopyWithImpl<$Res, $Val extends UserTagStaticsDto>
    implements $UserTagStaticsDtoCopyWith<$Res> {
  _$UserTagStaticsDtoCopyWithImpl(this._value, this._then);

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
    Object? tag = freezed,
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
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as MediaTagDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaTagDtoCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $MediaTagDtoCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserTagStaticsDtoImplCopyWith<$Res>
    implements $UserTagStaticsDtoCopyWith<$Res> {
  factory _$$UserTagStaticsDtoImplCopyWith(_$UserTagStaticsDtoImpl value,
          $Res Function(_$UserTagStaticsDtoImpl) then) =
      __$$UserTagStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'tag') MediaTagDto? tag});

  @override
  $MediaTagDtoCopyWith<$Res>? get tag;
}

/// @nodoc
class __$$UserTagStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserTagStaticsDtoCopyWithImpl<$Res, _$UserTagStaticsDtoImpl>
    implements _$$UserTagStaticsDtoImplCopyWith<$Res> {
  __$$UserTagStaticsDtoImplCopyWithImpl(_$UserTagStaticsDtoImpl _value,
      $Res Function(_$UserTagStaticsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? tag = freezed,
  }) {
    return _then(_$UserTagStaticsDtoImpl(
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
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as MediaTagDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTagStaticsDtoImpl implements _UserTagStaticsDto {
  const _$UserTagStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds = const [],
      @JsonKey(name: 'tag') this.tag})
      : _mediaIds = mediaIds;

  factory _$UserTagStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTagStaticsDtoImplFromJson(json);

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
  @JsonKey(name: 'tag')
  final MediaTagDto? tag;

  @override
  String toString() {
    return 'UserTagStaticsDto(count: $count, meanScore: $meanScore, minutesWatched: $minutesWatched, chaptersRead: $chaptersRead, mediaIds: $mediaIds, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTagStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, meanScore, minutesWatched,
      chaptersRead, const DeepCollectionEquality().hash(_mediaIds), tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTagStaticsDtoImplCopyWith<_$UserTagStaticsDtoImpl> get copyWith =>
      __$$UserTagStaticsDtoImplCopyWithImpl<_$UserTagStaticsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTagStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserTagStaticsDto implements UserTagStaticsDto {
  const factory _UserTagStaticsDto(
      {@JsonKey(name: 'count') final int? count,
      @JsonKey(name: 'meanScore') final double? meanScore,
      @JsonKey(name: 'minutesWatched') final int? minutesWatched,
      @JsonKey(name: 'chaptersRead') final int? chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds,
      @JsonKey(name: 'tag') final MediaTagDto? tag}) = _$UserTagStaticsDtoImpl;

  factory _UserTagStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserTagStaticsDtoImpl.fromJson;

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
  @JsonKey(name: 'tag')
  MediaTagDto? get tag;
  @override
  @JsonKey(ignore: true)
  _$$UserTagStaticsDtoImplCopyWith<_$UserTagStaticsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

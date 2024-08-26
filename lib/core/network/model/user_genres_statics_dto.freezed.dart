// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_genres_statics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserGenreStaticsDto _$UserGenreStaticsDtoFromJson(Map<String, dynamic> json) {
  return _UserGenreStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserGenreStaticsDto {
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
  @JsonKey(name: 'genre')
  String? get genre => throw _privateConstructorUsedError;

  /// Serializes this UserGenreStaticsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserGenreStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGenreStaticsDtoCopyWith<UserGenreStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGenreStaticsDtoCopyWith<$Res> {
  factory $UserGenreStaticsDtoCopyWith(
          UserGenreStaticsDto value, $Res Function(UserGenreStaticsDto) then) =
      _$UserGenreStaticsDtoCopyWithImpl<$Res, UserGenreStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'genre') String? genre});
}

/// @nodoc
class _$UserGenreStaticsDtoCopyWithImpl<$Res, $Val extends UserGenreStaticsDto>
    implements $UserGenreStaticsDtoCopyWith<$Res> {
  _$UserGenreStaticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGenreStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? genre = freezed,
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
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserGenreStaticsDtoImplCopyWith<$Res>
    implements $UserGenreStaticsDtoCopyWith<$Res> {
  factory _$$UserGenreStaticsDtoImplCopyWith(_$UserGenreStaticsDtoImpl value,
          $Res Function(_$UserGenreStaticsDtoImpl) then) =
      __$$UserGenreStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'genre') String? genre});
}

/// @nodoc
class __$$UserGenreStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserGenreStaticsDtoCopyWithImpl<$Res, _$UserGenreStaticsDtoImpl>
    implements _$$UserGenreStaticsDtoImplCopyWith<$Res> {
  __$$UserGenreStaticsDtoImplCopyWithImpl(_$UserGenreStaticsDtoImpl _value,
      $Res Function(_$UserGenreStaticsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserGenreStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? genre = freezed,
  }) {
    return _then(_$UserGenreStaticsDtoImpl(
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
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGenreStaticsDtoImpl implements _UserGenreStaticsDto {
  const _$UserGenreStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds = const [],
      @JsonKey(name: 'genre') this.genre})
      : _mediaIds = mediaIds;

  factory _$UserGenreStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGenreStaticsDtoImplFromJson(json);

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
  @JsonKey(name: 'genre')
  final String? genre;

  @override
  String toString() {
    return 'UserGenreStaticsDto(count: $count, meanScore: $meanScore, minutesWatched: $minutesWatched, chaptersRead: $chaptersRead, mediaIds: $mediaIds, genre: $genre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGenreStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, meanScore, minutesWatched,
      chaptersRead, const DeepCollectionEquality().hash(_mediaIds), genre);

  /// Create a copy of UserGenreStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGenreStaticsDtoImplCopyWith<_$UserGenreStaticsDtoImpl> get copyWith =>
      __$$UserGenreStaticsDtoImplCopyWithImpl<_$UserGenreStaticsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGenreStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserGenreStaticsDto implements UserGenreStaticsDto {
  const factory _UserGenreStaticsDto(
      {@JsonKey(name: 'count') final int? count,
      @JsonKey(name: 'meanScore') final double? meanScore,
      @JsonKey(name: 'minutesWatched') final int? minutesWatched,
      @JsonKey(name: 'chaptersRead') final int? chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds,
      @JsonKey(name: 'genre') final String? genre}) = _$UserGenreStaticsDtoImpl;

  factory _UserGenreStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserGenreStaticsDtoImpl.fromJson;

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
  @JsonKey(name: 'genre')
  String? get genre;

  /// Create a copy of UserGenreStaticsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGenreStaticsDtoImplCopyWith<_$UserGenreStaticsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

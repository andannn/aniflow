// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStaticsDto _$UserStaticsDtoFromJson(Map<String, dynamic> json) {
  return _UserStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserStaticsDto {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanScore')
  double? get meanScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'standardDeviation')
  int? get standardDeviation => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutesWatched')
  int? get minutesWatched => throw _privateConstructorUsedError;
  @JsonKey(name: 'episodesWatched')
  int? get episodesWatched => throw _privateConstructorUsedError;
  @JsonKey(name: 'chaptersRead')
  int? get chaptersRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'volumesRead')
  int? get volumesRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'formats')
  List<UserFormatStaticsDto> get formats => throw _privateConstructorUsedError;
  @JsonKey(name: 'statuses')
  List<UserStatusStaticsDto> get statuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'scores')
  List<UserScoreStaticsDto> get scores => throw _privateConstructorUsedError;
  @JsonKey(name: 'lengths')
  List<UserLengthStaticsDto> get lengths => throw _privateConstructorUsedError;
  @JsonKey(name: 'releaseYears')
  List<UserReleaseYearStaticsDto> get releaseYears =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<UserGenreStaticsDto> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'countries')
  List<UserCountryStaticsDto> get countries =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'staff')
  List<UserStaffStaticsDto> get staff => throw _privateConstructorUsedError;
  @JsonKey(name: 'studios')
  List<UserStudioStaticsDto> get studios => throw _privateConstructorUsedError;
  @JsonKey(name: 'voiceActors')
  List<UserVoiceActorStaticsDto> get voiceActors =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<UserTagStaticsDto> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStaticsDtoCopyWith<UserStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStaticsDtoCopyWith<$Res> {
  factory $UserStaticsDtoCopyWith(
          UserStaticsDto value, $Res Function(UserStaticsDto) then) =
      _$UserStaticsDtoCopyWithImpl<$Res, UserStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'standardDeviation') int? standardDeviation,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'episodesWatched') int? episodesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'volumesRead') int? volumesRead,
      @JsonKey(name: 'formats') List<UserFormatStaticsDto> formats,
      @JsonKey(name: 'statuses') List<UserStatusStaticsDto> statuses,
      @JsonKey(name: 'scores') List<UserScoreStaticsDto> scores,
      @JsonKey(name: 'lengths') List<UserLengthStaticsDto> lengths,
      @JsonKey(name: 'releaseYears')
      List<UserReleaseYearStaticsDto> releaseYears,
      @JsonKey(name: 'genres') List<UserGenreStaticsDto> genres,
      @JsonKey(name: 'countries') List<UserCountryStaticsDto> countries,
      @JsonKey(name: 'staff') List<UserStaffStaticsDto> staff,
      @JsonKey(name: 'studios') List<UserStudioStaticsDto> studios,
      @JsonKey(name: 'voiceActors') List<UserVoiceActorStaticsDto> voiceActors,
      @JsonKey(name: 'tags') List<UserTagStaticsDto> tags});
}

/// @nodoc
class _$UserStaticsDtoCopyWithImpl<$Res, $Val extends UserStaticsDto>
    implements $UserStaticsDtoCopyWith<$Res> {
  _$UserStaticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? standardDeviation = freezed,
    Object? minutesWatched = freezed,
    Object? episodesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? volumesRead = freezed,
    Object? formats = null,
    Object? statuses = null,
    Object? scores = null,
    Object? lengths = null,
    Object? releaseYears = null,
    Object? genres = null,
    Object? countries = null,
    Object? staff = null,
    Object? studios = null,
    Object? voiceActors = null,
    Object? tags = null,
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
      standardDeviation: freezed == standardDeviation
          ? _value.standardDeviation
          : standardDeviation // ignore: cast_nullable_to_non_nullable
              as int?,
      minutesWatched: freezed == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      episodesWatched: freezed == episodesWatched
          ? _value.episodesWatched
          : episodesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersRead: freezed == chaptersRead
          ? _value.chaptersRead
          : chaptersRead // ignore: cast_nullable_to_non_nullable
              as int?,
      volumesRead: freezed == volumesRead
          ? _value.volumesRead
          : volumesRead // ignore: cast_nullable_to_non_nullable
              as int?,
      formats: null == formats
          ? _value.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as List<UserFormatStaticsDto>,
      statuses: null == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UserStatusStaticsDto>,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as List<UserScoreStaticsDto>,
      lengths: null == lengths
          ? _value.lengths
          : lengths // ignore: cast_nullable_to_non_nullable
              as List<UserLengthStaticsDto>,
      releaseYears: null == releaseYears
          ? _value.releaseYears
          : releaseYears // ignore: cast_nullable_to_non_nullable
              as List<UserReleaseYearStaticsDto>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<UserGenreStaticsDto>,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<UserCountryStaticsDto>,
      staff: null == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as List<UserStaffStaticsDto>,
      studios: null == studios
          ? _value.studios
          : studios // ignore: cast_nullable_to_non_nullable
              as List<UserStudioStaticsDto>,
      voiceActors: null == voiceActors
          ? _value.voiceActors
          : voiceActors // ignore: cast_nullable_to_non_nullable
              as List<UserVoiceActorStaticsDto>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UserTagStaticsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStaticsDtoImplCopyWith<$Res>
    implements $UserStaticsDtoCopyWith<$Res> {
  factory _$$UserStaticsDtoImplCopyWith(_$UserStaticsDtoImpl value,
          $Res Function(_$UserStaticsDtoImpl) then) =
      __$$UserStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'standardDeviation') int? standardDeviation,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'episodesWatched') int? episodesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'volumesRead') int? volumesRead,
      @JsonKey(name: 'formats') List<UserFormatStaticsDto> formats,
      @JsonKey(name: 'statuses') List<UserStatusStaticsDto> statuses,
      @JsonKey(name: 'scores') List<UserScoreStaticsDto> scores,
      @JsonKey(name: 'lengths') List<UserLengthStaticsDto> lengths,
      @JsonKey(name: 'releaseYears')
      List<UserReleaseYearStaticsDto> releaseYears,
      @JsonKey(name: 'genres') List<UserGenreStaticsDto> genres,
      @JsonKey(name: 'countries') List<UserCountryStaticsDto> countries,
      @JsonKey(name: 'staff') List<UserStaffStaticsDto> staff,
      @JsonKey(name: 'studios') List<UserStudioStaticsDto> studios,
      @JsonKey(name: 'voiceActors') List<UserVoiceActorStaticsDto> voiceActors,
      @JsonKey(name: 'tags') List<UserTagStaticsDto> tags});
}

/// @nodoc
class __$$UserStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserStaticsDtoCopyWithImpl<$Res, _$UserStaticsDtoImpl>
    implements _$$UserStaticsDtoImplCopyWith<$Res> {
  __$$UserStaticsDtoImplCopyWithImpl(
      _$UserStaticsDtoImpl _value, $Res Function(_$UserStaticsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? standardDeviation = freezed,
    Object? minutesWatched = freezed,
    Object? episodesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? volumesRead = freezed,
    Object? formats = null,
    Object? statuses = null,
    Object? scores = null,
    Object? lengths = null,
    Object? releaseYears = null,
    Object? genres = null,
    Object? countries = null,
    Object? staff = null,
    Object? studios = null,
    Object? voiceActors = null,
    Object? tags = null,
  }) {
    return _then(_$UserStaticsDtoImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      meanScore: freezed == meanScore
          ? _value.meanScore
          : meanScore // ignore: cast_nullable_to_non_nullable
              as double?,
      standardDeviation: freezed == standardDeviation
          ? _value.standardDeviation
          : standardDeviation // ignore: cast_nullable_to_non_nullable
              as int?,
      minutesWatched: freezed == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      episodesWatched: freezed == episodesWatched
          ? _value.episodesWatched
          : episodesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersRead: freezed == chaptersRead
          ? _value.chaptersRead
          : chaptersRead // ignore: cast_nullable_to_non_nullable
              as int?,
      volumesRead: freezed == volumesRead
          ? _value.volumesRead
          : volumesRead // ignore: cast_nullable_to_non_nullable
              as int?,
      formats: null == formats
          ? _value._formats
          : formats // ignore: cast_nullable_to_non_nullable
              as List<UserFormatStaticsDto>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UserStatusStaticsDto>,
      scores: null == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as List<UserScoreStaticsDto>,
      lengths: null == lengths
          ? _value._lengths
          : lengths // ignore: cast_nullable_to_non_nullable
              as List<UserLengthStaticsDto>,
      releaseYears: null == releaseYears
          ? _value._releaseYears
          : releaseYears // ignore: cast_nullable_to_non_nullable
              as List<UserReleaseYearStaticsDto>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<UserGenreStaticsDto>,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<UserCountryStaticsDto>,
      staff: null == staff
          ? _value._staff
          : staff // ignore: cast_nullable_to_non_nullable
              as List<UserStaffStaticsDto>,
      studios: null == studios
          ? _value._studios
          : studios // ignore: cast_nullable_to_non_nullable
              as List<UserStudioStaticsDto>,
      voiceActors: null == voiceActors
          ? _value._voiceActors
          : voiceActors // ignore: cast_nullable_to_non_nullable
              as List<UserVoiceActorStaticsDto>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UserTagStaticsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStaticsDtoImpl implements _UserStaticsDto {
  const _$UserStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'standardDeviation') this.standardDeviation,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'episodesWatched') this.episodesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'volumesRead') this.volumesRead,
      @JsonKey(name: 'formats')
      final List<UserFormatStaticsDto> formats = const [],
      @JsonKey(name: 'statuses')
      final List<UserStatusStaticsDto> statuses = const [],
      @JsonKey(name: 'scores')
      final List<UserScoreStaticsDto> scores = const [],
      @JsonKey(name: 'lengths')
      final List<UserLengthStaticsDto> lengths = const [],
      @JsonKey(name: 'releaseYears')
      final List<UserReleaseYearStaticsDto> releaseYears = const [],
      @JsonKey(name: 'genres')
      final List<UserGenreStaticsDto> genres = const [],
      @JsonKey(name: 'countries')
      final List<UserCountryStaticsDto> countries = const [],
      @JsonKey(name: 'staff') final List<UserStaffStaticsDto> staff = const [],
      @JsonKey(name: 'studios')
      final List<UserStudioStaticsDto> studios = const [],
      @JsonKey(name: 'voiceActors')
      final List<UserVoiceActorStaticsDto> voiceActors = const [],
      @JsonKey(name: 'tags') final List<UserTagStaticsDto> tags = const []})
      : _formats = formats,
        _statuses = statuses,
        _scores = scores,
        _lengths = lengths,
        _releaseYears = releaseYears,
        _genres = genres,
        _countries = countries,
        _staff = staff,
        _studios = studios,
        _voiceActors = voiceActors,
        _tags = tags;

  factory _$UserStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStaticsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'meanScore')
  final double? meanScore;
  @override
  @JsonKey(name: 'standardDeviation')
  final int? standardDeviation;
  @override
  @JsonKey(name: 'minutesWatched')
  final int? minutesWatched;
  @override
  @JsonKey(name: 'episodesWatched')
  final int? episodesWatched;
  @override
  @JsonKey(name: 'chaptersRead')
  final int? chaptersRead;
  @override
  @JsonKey(name: 'volumesRead')
  final int? volumesRead;
  final List<UserFormatStaticsDto> _formats;
  @override
  @JsonKey(name: 'formats')
  List<UserFormatStaticsDto> get formats {
    if (_formats is EqualUnmodifiableListView) return _formats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formats);
  }

  final List<UserStatusStaticsDto> _statuses;
  @override
  @JsonKey(name: 'statuses')
  List<UserStatusStaticsDto> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  final List<UserScoreStaticsDto> _scores;
  @override
  @JsonKey(name: 'scores')
  List<UserScoreStaticsDto> get scores {
    if (_scores is EqualUnmodifiableListView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scores);
  }

  final List<UserLengthStaticsDto> _lengths;
  @override
  @JsonKey(name: 'lengths')
  List<UserLengthStaticsDto> get lengths {
    if (_lengths is EqualUnmodifiableListView) return _lengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lengths);
  }

  final List<UserReleaseYearStaticsDto> _releaseYears;
  @override
  @JsonKey(name: 'releaseYears')
  List<UserReleaseYearStaticsDto> get releaseYears {
    if (_releaseYears is EqualUnmodifiableListView) return _releaseYears;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releaseYears);
  }

  final List<UserGenreStaticsDto> _genres;
  @override
  @JsonKey(name: 'genres')
  List<UserGenreStaticsDto> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<UserCountryStaticsDto> _countries;
  @override
  @JsonKey(name: 'countries')
  List<UserCountryStaticsDto> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<UserStaffStaticsDto> _staff;
  @override
  @JsonKey(name: 'staff')
  List<UserStaffStaticsDto> get staff {
    if (_staff is EqualUnmodifiableListView) return _staff;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staff);
  }

  final List<UserStudioStaticsDto> _studios;
  @override
  @JsonKey(name: 'studios')
  List<UserStudioStaticsDto> get studios {
    if (_studios is EqualUnmodifiableListView) return _studios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studios);
  }

  final List<UserVoiceActorStaticsDto> _voiceActors;
  @override
  @JsonKey(name: 'voiceActors')
  List<UserVoiceActorStaticsDto> get voiceActors {
    if (_voiceActors is EqualUnmodifiableListView) return _voiceActors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voiceActors);
  }

  final List<UserTagStaticsDto> _tags;
  @override
  @JsonKey(name: 'tags')
  List<UserTagStaticsDto> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'UserStaticsDto(count: $count, meanScore: $meanScore, standardDeviation: $standardDeviation, minutesWatched: $minutesWatched, episodesWatched: $episodesWatched, chaptersRead: $chaptersRead, volumesRead: $volumesRead, formats: $formats, statuses: $statuses, scores: $scores, lengths: $lengths, releaseYears: $releaseYears, genres: $genres, countries: $countries, staff: $staff, studios: $studios, voiceActors: $voiceActors, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.standardDeviation, standardDeviation) ||
                other.standardDeviation == standardDeviation) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.episodesWatched, episodesWatched) ||
                other.episodesWatched == episodesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            (identical(other.volumesRead, volumesRead) ||
                other.volumesRead == volumesRead) &&
            const DeepCollectionEquality().equals(other._formats, _formats) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality().equals(other._lengths, _lengths) &&
            const DeepCollectionEquality()
                .equals(other._releaseYears, _releaseYears) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(other._staff, _staff) &&
            const DeepCollectionEquality().equals(other._studios, _studios) &&
            const DeepCollectionEquality()
                .equals(other._voiceActors, _voiceActors) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      meanScore,
      standardDeviation,
      minutesWatched,
      episodesWatched,
      chaptersRead,
      volumesRead,
      const DeepCollectionEquality().hash(_formats),
      const DeepCollectionEquality().hash(_statuses),
      const DeepCollectionEquality().hash(_scores),
      const DeepCollectionEquality().hash(_lengths),
      const DeepCollectionEquality().hash(_releaseYears),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_staff),
      const DeepCollectionEquality().hash(_studios),
      const DeepCollectionEquality().hash(_voiceActors),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStaticsDtoImplCopyWith<_$UserStaticsDtoImpl> get copyWith =>
      __$$UserStaticsDtoImplCopyWithImpl<_$UserStaticsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserStaticsDto implements UserStaticsDto {
  const factory _UserStaticsDto(
      {@JsonKey(name: 'count') final int? count,
      @JsonKey(name: 'meanScore') final double? meanScore,
      @JsonKey(name: 'standardDeviation') final int? standardDeviation,
      @JsonKey(name: 'minutesWatched') final int? minutesWatched,
      @JsonKey(name: 'episodesWatched') final int? episodesWatched,
      @JsonKey(name: 'chaptersRead') final int? chaptersRead,
      @JsonKey(name: 'volumesRead') final int? volumesRead,
      @JsonKey(name: 'formats') final List<UserFormatStaticsDto> formats,
      @JsonKey(name: 'statuses') final List<UserStatusStaticsDto> statuses,
      @JsonKey(name: 'scores') final List<UserScoreStaticsDto> scores,
      @JsonKey(name: 'lengths') final List<UserLengthStaticsDto> lengths,
      @JsonKey(name: 'releaseYears')
      final List<UserReleaseYearStaticsDto> releaseYears,
      @JsonKey(name: 'genres') final List<UserGenreStaticsDto> genres,
      @JsonKey(name: 'countries') final List<UserCountryStaticsDto> countries,
      @JsonKey(name: 'staff') final List<UserStaffStaticsDto> staff,
      @JsonKey(name: 'studios') final List<UserStudioStaticsDto> studios,
      @JsonKey(name: 'voiceActors')
      final List<UserVoiceActorStaticsDto> voiceActors,
      @JsonKey(name: 'tags')
      final List<UserTagStaticsDto> tags}) = _$UserStaticsDtoImpl;

  factory _UserStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserStaticsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'meanScore')
  double? get meanScore;
  @override
  @JsonKey(name: 'standardDeviation')
  int? get standardDeviation;
  @override
  @JsonKey(name: 'minutesWatched')
  int? get minutesWatched;
  @override
  @JsonKey(name: 'episodesWatched')
  int? get episodesWatched;
  @override
  @JsonKey(name: 'chaptersRead')
  int? get chaptersRead;
  @override
  @JsonKey(name: 'volumesRead')
  int? get volumesRead;
  @override
  @JsonKey(name: 'formats')
  List<UserFormatStaticsDto> get formats;
  @override
  @JsonKey(name: 'statuses')
  List<UserStatusStaticsDto> get statuses;
  @override
  @JsonKey(name: 'scores')
  List<UserScoreStaticsDto> get scores;
  @override
  @JsonKey(name: 'lengths')
  List<UserLengthStaticsDto> get lengths;
  @override
  @JsonKey(name: 'releaseYears')
  List<UserReleaseYearStaticsDto> get releaseYears;
  @override
  @JsonKey(name: 'genres')
  List<UserGenreStaticsDto> get genres;
  @override
  @JsonKey(name: 'countries')
  List<UserCountryStaticsDto> get countries;
  @override
  @JsonKey(name: 'staff')
  List<UserStaffStaticsDto> get staff;
  @override
  @JsonKey(name: 'studios')
  List<UserStudioStaticsDto> get studios;
  @override
  @JsonKey(name: 'voiceActors')
  List<UserVoiceActorStaticsDto> get voiceActors;
  @override
  @JsonKey(name: 'tags')
  List<UserTagStaticsDto> get tags;
  @override
  @JsonKey(ignore: true)
  _$$UserStaticsDtoImplCopyWith<_$UserStaticsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

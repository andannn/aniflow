// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimeEntity _$AnimeEntityFromJson(Map<String, dynamic> json) {
  return _AnimeEntity.fromJson(json);
}

/// @nodoc
mixin _$AnimeEntity {
  @JsonKey(name: AnimeTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.englishTitle)
  String get englishTitle => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.romajiTitle)
  String get romajiTitle => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.nativeTitle)
  String get nativeTitle => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.coverImage)
  String get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.coverImageColor)
  String get coverImageColor => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.source)
  AnimeSource get source => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.bannerImage)
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.averageScore)
  int? get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.trending)
  int? get trending => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.favourites)
  int? get favourites => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.trailerId)
  String? get trailerId => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.trailerSite)
  String? get trailerSite => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.episodes)
  int? get episodes => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.seasonYear)
  int? get seasonYear => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.season)
  AnimeSeason? get season => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.genres)
  String? get genres => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.trailerThumbnail)
  String? get trailerThumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeEntityCopyWith<AnimeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeEntityCopyWith<$Res> {
  factory $AnimeEntityCopyWith(
          AnimeEntity value, $Res Function(AnimeEntity) then) =
      _$AnimeEntityCopyWithImpl<$Res, AnimeEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: AnimeTableColumns.id) String id,
      @JsonKey(name: AnimeTableColumns.englishTitle) String englishTitle,
      @JsonKey(name: AnimeTableColumns.romajiTitle) String romajiTitle,
      @JsonKey(name: AnimeTableColumns.nativeTitle) String nativeTitle,
      @JsonKey(name: AnimeTableColumns.coverImage) String coverImage,
      @JsonKey(name: AnimeTableColumns.coverImageColor) String coverImageColor,
      @JsonKey(name: AnimeTableColumns.description) String? description,
      @JsonKey(name: AnimeTableColumns.source) AnimeSource source,
      @JsonKey(name: AnimeTableColumns.bannerImage) String? bannerImage,
      @JsonKey(name: AnimeTableColumns.averageScore) int? averageScore,
      @JsonKey(name: AnimeTableColumns.trending) int? trending,
      @JsonKey(name: AnimeTableColumns.favourites) int? favourites,
      @JsonKey(name: AnimeTableColumns.trailerId) String? trailerId,
      @JsonKey(name: AnimeTableColumns.trailerSite) String? trailerSite,
      @JsonKey(name: AnimeTableColumns.episodes) int? episodes,
      @JsonKey(name: AnimeTableColumns.seasonYear) int? seasonYear,
      @JsonKey(name: AnimeTableColumns.season) AnimeSeason? season,
      @JsonKey(name: AnimeTableColumns.genres) String? genres,
      @JsonKey(name: AnimeTableColumns.trailerThumbnail)
      String? trailerThumbnail});
}

/// @nodoc
class _$AnimeEntityCopyWithImpl<$Res, $Val extends AnimeEntity>
    implements $AnimeEntityCopyWith<$Res> {
  _$AnimeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? englishTitle = null,
    Object? romajiTitle = null,
    Object? nativeTitle = null,
    Object? coverImage = null,
    Object? coverImageColor = null,
    Object? description = freezed,
    Object? source = null,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? trending = freezed,
    Object? favourites = freezed,
    Object? trailerId = freezed,
    Object? trailerSite = freezed,
    Object? episodes = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? genres = freezed,
    Object? trailerThumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      englishTitle: null == englishTitle
          ? _value.englishTitle
          : englishTitle // ignore: cast_nullable_to_non_nullable
              as String,
      romajiTitle: null == romajiTitle
          ? _value.romajiTitle
          : romajiTitle // ignore: cast_nullable_to_non_nullable
              as String,
      nativeTitle: null == nativeTitle
          ? _value.nativeTitle
          : nativeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageColor: null == coverImageColor
          ? _value.coverImageColor
          : coverImageColor // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AnimeSource,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      trending: freezed == trending
          ? _value.trending
          : trending // ignore: cast_nullable_to_non_nullable
              as int?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as int?,
      trailerId: freezed == trailerId
          ? _value.trailerId
          : trailerId // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerSite: freezed == trailerSite
          ? _value.trailerSite
          : trailerSite // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as AnimeSeason?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerThumbnail: freezed == trailerThumbnail
          ? _value.trailerThumbnail
          : trailerThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimeEntityCopyWith<$Res>
    implements $AnimeEntityCopyWith<$Res> {
  factory _$$_AnimeEntityCopyWith(
          _$_AnimeEntity value, $Res Function(_$_AnimeEntity) then) =
      __$$_AnimeEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AnimeTableColumns.id) String id,
      @JsonKey(name: AnimeTableColumns.englishTitle) String englishTitle,
      @JsonKey(name: AnimeTableColumns.romajiTitle) String romajiTitle,
      @JsonKey(name: AnimeTableColumns.nativeTitle) String nativeTitle,
      @JsonKey(name: AnimeTableColumns.coverImage) String coverImage,
      @JsonKey(name: AnimeTableColumns.coverImageColor) String coverImageColor,
      @JsonKey(name: AnimeTableColumns.description) String? description,
      @JsonKey(name: AnimeTableColumns.source) AnimeSource source,
      @JsonKey(name: AnimeTableColumns.bannerImage) String? bannerImage,
      @JsonKey(name: AnimeTableColumns.averageScore) int? averageScore,
      @JsonKey(name: AnimeTableColumns.trending) int? trending,
      @JsonKey(name: AnimeTableColumns.favourites) int? favourites,
      @JsonKey(name: AnimeTableColumns.trailerId) String? trailerId,
      @JsonKey(name: AnimeTableColumns.trailerSite) String? trailerSite,
      @JsonKey(name: AnimeTableColumns.episodes) int? episodes,
      @JsonKey(name: AnimeTableColumns.seasonYear) int? seasonYear,
      @JsonKey(name: AnimeTableColumns.season) AnimeSeason? season,
      @JsonKey(name: AnimeTableColumns.genres) String? genres,
      @JsonKey(name: AnimeTableColumns.trailerThumbnail)
      String? trailerThumbnail});
}

/// @nodoc
class __$$_AnimeEntityCopyWithImpl<$Res>
    extends _$AnimeEntityCopyWithImpl<$Res, _$_AnimeEntity>
    implements _$$_AnimeEntityCopyWith<$Res> {
  __$$_AnimeEntityCopyWithImpl(
      _$_AnimeEntity _value, $Res Function(_$_AnimeEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? englishTitle = null,
    Object? romajiTitle = null,
    Object? nativeTitle = null,
    Object? coverImage = null,
    Object? coverImageColor = null,
    Object? description = freezed,
    Object? source = null,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? trending = freezed,
    Object? favourites = freezed,
    Object? trailerId = freezed,
    Object? trailerSite = freezed,
    Object? episodes = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? genres = freezed,
    Object? trailerThumbnail = freezed,
  }) {
    return _then(_$_AnimeEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      englishTitle: null == englishTitle
          ? _value.englishTitle
          : englishTitle // ignore: cast_nullable_to_non_nullable
              as String,
      romajiTitle: null == romajiTitle
          ? _value.romajiTitle
          : romajiTitle // ignore: cast_nullable_to_non_nullable
              as String,
      nativeTitle: null == nativeTitle
          ? _value.nativeTitle
          : nativeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageColor: null == coverImageColor
          ? _value.coverImageColor
          : coverImageColor // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AnimeSource,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      trending: freezed == trending
          ? _value.trending
          : trending // ignore: cast_nullable_to_non_nullable
              as int?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as int?,
      trailerId: freezed == trailerId
          ? _value.trailerId
          : trailerId // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerSite: freezed == trailerSite
          ? _value.trailerSite
          : trailerSite // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as AnimeSeason?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerThumbnail: freezed == trailerThumbnail
          ? _value.trailerThumbnail
          : trailerThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnimeEntity implements _AnimeEntity {
  _$_AnimeEntity(
      {@JsonKey(name: AnimeTableColumns.id) this.id = '',
      @JsonKey(name: AnimeTableColumns.englishTitle) this.englishTitle = '',
      @JsonKey(name: AnimeTableColumns.romajiTitle) this.romajiTitle = '',
      @JsonKey(name: AnimeTableColumns.nativeTitle) this.nativeTitle = '',
      @JsonKey(name: AnimeTableColumns.coverImage) this.coverImage = '',
      @JsonKey(name: AnimeTableColumns.coverImageColor)
      this.coverImageColor = '',
      @JsonKey(name: AnimeTableColumns.description) this.description,
      @JsonKey(name: AnimeTableColumns.source) this.source = AnimeSource.other,
      @JsonKey(name: AnimeTableColumns.bannerImage) this.bannerImage,
      @JsonKey(name: AnimeTableColumns.averageScore) this.averageScore,
      @JsonKey(name: AnimeTableColumns.trending) this.trending,
      @JsonKey(name: AnimeTableColumns.favourites) this.favourites,
      @JsonKey(name: AnimeTableColumns.trailerId) this.trailerId,
      @JsonKey(name: AnimeTableColumns.trailerSite) this.trailerSite,
      @JsonKey(name: AnimeTableColumns.episodes) this.episodes,
      @JsonKey(name: AnimeTableColumns.seasonYear) this.seasonYear,
      @JsonKey(name: AnimeTableColumns.season) this.season,
      @JsonKey(name: AnimeTableColumns.genres) this.genres,
      @JsonKey(name: AnimeTableColumns.trailerThumbnail)
      this.trailerThumbnail});

  factory _$_AnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeEntityFromJson(json);

  @override
  @JsonKey(name: AnimeTableColumns.id)
  final String id;
  @override
  @JsonKey(name: AnimeTableColumns.englishTitle)
  final String englishTitle;
  @override
  @JsonKey(name: AnimeTableColumns.romajiTitle)
  final String romajiTitle;
  @override
  @JsonKey(name: AnimeTableColumns.nativeTitle)
  final String nativeTitle;
  @override
  @JsonKey(name: AnimeTableColumns.coverImage)
  final String coverImage;
  @override
  @JsonKey(name: AnimeTableColumns.coverImageColor)
  final String coverImageColor;
  @override
  @JsonKey(name: AnimeTableColumns.description)
  final String? description;
  @override
  @JsonKey(name: AnimeTableColumns.source)
  final AnimeSource source;
  @override
  @JsonKey(name: AnimeTableColumns.bannerImage)
  final String? bannerImage;
  @override
  @JsonKey(name: AnimeTableColumns.averageScore)
  final int? averageScore;
  @override
  @JsonKey(name: AnimeTableColumns.trending)
  final int? trending;
  @override
  @JsonKey(name: AnimeTableColumns.favourites)
  final int? favourites;
  @override
  @JsonKey(name: AnimeTableColumns.trailerId)
  final String? trailerId;
  @override
  @JsonKey(name: AnimeTableColumns.trailerSite)
  final String? trailerSite;
  @override
  @JsonKey(name: AnimeTableColumns.episodes)
  final int? episodes;
  @override
  @JsonKey(name: AnimeTableColumns.seasonYear)
  final int? seasonYear;
  @override
  @JsonKey(name: AnimeTableColumns.season)
  final AnimeSeason? season;
  @override
  @JsonKey(name: AnimeTableColumns.genres)
  final String? genres;
  @override
  @JsonKey(name: AnimeTableColumns.trailerThumbnail)
  final String? trailerThumbnail;

  @override
  String toString() {
    return 'AnimeEntity(id: $id, englishTitle: $englishTitle, romajiTitle: $romajiTitle, nativeTitle: $nativeTitle, coverImage: $coverImage, coverImageColor: $coverImageColor, description: $description, source: $source, bannerImage: $bannerImage, averageScore: $averageScore, trending: $trending, favourites: $favourites, trailerId: $trailerId, trailerSite: $trailerSite, episodes: $episodes, seasonYear: $seasonYear, season: $season, genres: $genres, trailerThumbnail: $trailerThumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.englishTitle, englishTitle) ||
                other.englishTitle == englishTitle) &&
            (identical(other.romajiTitle, romajiTitle) ||
                other.romajiTitle == romajiTitle) &&
            (identical(other.nativeTitle, nativeTitle) ||
                other.nativeTitle == nativeTitle) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.coverImageColor, coverImageColor) ||
                other.coverImageColor == coverImageColor) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            (identical(other.favourites, favourites) ||
                other.favourites == favourites) &&
            (identical(other.trailerId, trailerId) ||
                other.trailerId == trailerId) &&
            (identical(other.trailerSite, trailerSite) ||
                other.trailerSite == trailerSite) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.seasonYear, seasonYear) ||
                other.seasonYear == seasonYear) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.genres, genres) || other.genres == genres) &&
            (identical(other.trailerThumbnail, trailerThumbnail) ||
                other.trailerThumbnail == trailerThumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        englishTitle,
        romajiTitle,
        nativeTitle,
        coverImage,
        coverImageColor,
        description,
        source,
        bannerImage,
        averageScore,
        trending,
        favourites,
        trailerId,
        trailerSite,
        episodes,
        seasonYear,
        season,
        genres,
        trailerThumbnail
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeEntityCopyWith<_$_AnimeEntity> get copyWith =>
      __$$_AnimeEntityCopyWithImpl<_$_AnimeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimeEntityToJson(
      this,
    );
  }
}

abstract class _AnimeEntity implements AnimeEntity {
  factory _AnimeEntity(
      {@JsonKey(name: AnimeTableColumns.id) final String id,
      @JsonKey(name: AnimeTableColumns.englishTitle) final String englishTitle,
      @JsonKey(name: AnimeTableColumns.romajiTitle) final String romajiTitle,
      @JsonKey(name: AnimeTableColumns.nativeTitle) final String nativeTitle,
      @JsonKey(name: AnimeTableColumns.coverImage) final String coverImage,
      @JsonKey(name: AnimeTableColumns.coverImageColor)
      final String coverImageColor,
      @JsonKey(name: AnimeTableColumns.description) final String? description,
      @JsonKey(name: AnimeTableColumns.source) final AnimeSource source,
      @JsonKey(name: AnimeTableColumns.bannerImage) final String? bannerImage,
      @JsonKey(name: AnimeTableColumns.averageScore) final int? averageScore,
      @JsonKey(name: AnimeTableColumns.trending) final int? trending,
      @JsonKey(name: AnimeTableColumns.favourites) final int? favourites,
      @JsonKey(name: AnimeTableColumns.trailerId) final String? trailerId,
      @JsonKey(name: AnimeTableColumns.trailerSite) final String? trailerSite,
      @JsonKey(name: AnimeTableColumns.episodes) final int? episodes,
      @JsonKey(name: AnimeTableColumns.seasonYear) final int? seasonYear,
      @JsonKey(name: AnimeTableColumns.season) final AnimeSeason? season,
      @JsonKey(name: AnimeTableColumns.genres) final String? genres,
      @JsonKey(name: AnimeTableColumns.trailerThumbnail)
      final String? trailerThumbnail}) = _$_AnimeEntity;

  factory _AnimeEntity.fromJson(Map<String, dynamic> json) =
      _$_AnimeEntity.fromJson;

  @override
  @JsonKey(name: AnimeTableColumns.id)
  String get id;
  @override
  @JsonKey(name: AnimeTableColumns.englishTitle)
  String get englishTitle;
  @override
  @JsonKey(name: AnimeTableColumns.romajiTitle)
  String get romajiTitle;
  @override
  @JsonKey(name: AnimeTableColumns.nativeTitle)
  String get nativeTitle;
  @override
  @JsonKey(name: AnimeTableColumns.coverImage)
  String get coverImage;
  @override
  @JsonKey(name: AnimeTableColumns.coverImageColor)
  String get coverImageColor;
  @override
  @JsonKey(name: AnimeTableColumns.description)
  String? get description;
  @override
  @JsonKey(name: AnimeTableColumns.source)
  AnimeSource get source;
  @override
  @JsonKey(name: AnimeTableColumns.bannerImage)
  String? get bannerImage;
  @override
  @JsonKey(name: AnimeTableColumns.averageScore)
  int? get averageScore;
  @override
  @JsonKey(name: AnimeTableColumns.trending)
  int? get trending;
  @override
  @JsonKey(name: AnimeTableColumns.favourites)
  int? get favourites;
  @override
  @JsonKey(name: AnimeTableColumns.trailerId)
  String? get trailerId;
  @override
  @JsonKey(name: AnimeTableColumns.trailerSite)
  String? get trailerSite;
  @override
  @JsonKey(name: AnimeTableColumns.episodes)
  int? get episodes;
  @override
  @JsonKey(name: AnimeTableColumns.seasonYear)
  int? get seasonYear;
  @override
  @JsonKey(name: AnimeTableColumns.season)
  AnimeSeason? get season;
  @override
  @JsonKey(name: AnimeTableColumns.genres)
  String? get genres;
  @override
  @JsonKey(name: AnimeTableColumns.trailerThumbnail)
  String? get trailerThumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeEntityCopyWith<_$_AnimeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

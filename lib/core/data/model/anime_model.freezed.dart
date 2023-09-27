// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimeModel {
  String get id => throw _privateConstructorUsedError;
  AnimeTitle? get title => throw _privateConstructorUsedError;
  String get coverImage => throw _privateConstructorUsedError;
  String get coverImageColor => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  AnimeSource? get source => throw _privateConstructorUsedError;
  String? get bannerImage => throw _privateConstructorUsedError;
  int? get averageScore => throw _privateConstructorUsedError;
  int? get favourites => throw _privateConstructorUsedError;
  TrailerModel? get trailerModel => throw _privateConstructorUsedError;
  int? get seasonYear => throw _privateConstructorUsedError;
  AnimeSeason? get season => throw _privateConstructorUsedError;
  AnimeStatus? get status => throw _privateConstructorUsedError;
  int? get ratedRank => throw _privateConstructorUsedError;
  int? get popularRank => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  int? get episodes => throw _privateConstructorUsedError;
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  int? get nextAiringEpisode => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  List<CharacterAndVoiceActorModel> get characterAndVoiceActors =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeModelCopyWith<AnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeModelCopyWith<$Res> {
  factory $AnimeModelCopyWith(
          AnimeModel value, $Res Function(AnimeModel) then) =
      _$AnimeModelCopyWithImpl<$Res, AnimeModel>;
  @useResult
  $Res call(
      {String id,
      AnimeTitle? title,
      String coverImage,
      String coverImageColor,
      String? description,
      AnimeSource? source,
      String? bannerImage,
      int? averageScore,
      int? favourites,
      TrailerModel? trailerModel,
      int? seasonYear,
      AnimeSeason? season,
      AnimeStatus? status,
      int? ratedRank,
      int? popularRank,
      List<String> genres,
      int? episodes,
      int? timeUntilAiring,
      int? nextAiringEpisode,
      bool isFollowing,
      List<CharacterAndVoiceActorModel> characterAndVoiceActors});

  $AnimeTitleCopyWith<$Res>? get title;
  $TrailerModelCopyWith<$Res>? get trailerModel;
}

/// @nodoc
class _$AnimeModelCopyWithImpl<$Res, $Val extends AnimeModel>
    implements $AnimeModelCopyWith<$Res> {
  _$AnimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? coverImage = null,
    Object? coverImageColor = null,
    Object? description = freezed,
    Object? source = freezed,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? favourites = freezed,
    Object? trailerModel = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? status = freezed,
    Object? ratedRank = freezed,
    Object? popularRank = freezed,
    Object? genres = null,
    Object? episodes = freezed,
    Object? timeUntilAiring = freezed,
    Object? nextAiringEpisode = freezed,
    Object? isFollowing = null,
    Object? characterAndVoiceActors = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
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
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AnimeSource?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as int?,
      trailerModel: freezed == trailerModel
          ? _value.trailerModel
          : trailerModel // ignore: cast_nullable_to_non_nullable
              as TrailerModel?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as AnimeSeason?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeStatus?,
      ratedRank: freezed == ratedRank
          ? _value.ratedRank
          : ratedRank // ignore: cast_nullable_to_non_nullable
              as int?,
      popularRank: freezed == popularRank
          ? _value.popularRank
          : popularRank // ignore: cast_nullable_to_non_nullable
              as int?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      characterAndVoiceActors: null == characterAndVoiceActors
          ? _value.characterAndVoiceActors
          : characterAndVoiceActors // ignore: cast_nullable_to_non_nullable
              as List<CharacterAndVoiceActorModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeTitleCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $AnimeTitleCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TrailerModelCopyWith<$Res>? get trailerModel {
    if (_value.trailerModel == null) {
      return null;
    }

    return $TrailerModelCopyWith<$Res>(_value.trailerModel!, (value) {
      return _then(_value.copyWith(trailerModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailAnimeModelCopyWith<$Res>
    implements $AnimeModelCopyWith<$Res> {
  factory _$$_DetailAnimeModelCopyWith(
          _$_DetailAnimeModel value, $Res Function(_$_DetailAnimeModel) then) =
      __$$_DetailAnimeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnimeTitle? title,
      String coverImage,
      String coverImageColor,
      String? description,
      AnimeSource? source,
      String? bannerImage,
      int? averageScore,
      int? favourites,
      TrailerModel? trailerModel,
      int? seasonYear,
      AnimeSeason? season,
      AnimeStatus? status,
      int? ratedRank,
      int? popularRank,
      List<String> genres,
      int? episodes,
      int? timeUntilAiring,
      int? nextAiringEpisode,
      bool isFollowing,
      List<CharacterAndVoiceActorModel> characterAndVoiceActors});

  @override
  $AnimeTitleCopyWith<$Res>? get title;
  @override
  $TrailerModelCopyWith<$Res>? get trailerModel;
}

/// @nodoc
class __$$_DetailAnimeModelCopyWithImpl<$Res>
    extends _$AnimeModelCopyWithImpl<$Res, _$_DetailAnimeModel>
    implements _$$_DetailAnimeModelCopyWith<$Res> {
  __$$_DetailAnimeModelCopyWithImpl(
      _$_DetailAnimeModel _value, $Res Function(_$_DetailAnimeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? coverImage = null,
    Object? coverImageColor = null,
    Object? description = freezed,
    Object? source = freezed,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? favourites = freezed,
    Object? trailerModel = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? status = freezed,
    Object? ratedRank = freezed,
    Object? popularRank = freezed,
    Object? genres = null,
    Object? episodes = freezed,
    Object? timeUntilAiring = freezed,
    Object? nextAiringEpisode = freezed,
    Object? isFollowing = null,
    Object? characterAndVoiceActors = null,
  }) {
    return _then(_$_DetailAnimeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
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
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AnimeSource?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as int?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as int?,
      trailerModel: freezed == trailerModel
          ? _value.trailerModel
          : trailerModel // ignore: cast_nullable_to_non_nullable
              as TrailerModel?,
      seasonYear: freezed == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int?,
      season: freezed == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as AnimeSeason?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeStatus?,
      ratedRank: freezed == ratedRank
          ? _value.ratedRank
          : ratedRank // ignore: cast_nullable_to_non_nullable
              as int?,
      popularRank: freezed == popularRank
          ? _value.popularRank
          : popularRank // ignore: cast_nullable_to_non_nullable
              as int?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as int?,
      timeUntilAiring: freezed == timeUntilAiring
          ? _value.timeUntilAiring
          : timeUntilAiring // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      characterAndVoiceActors: null == characterAndVoiceActors
          ? _value._characterAndVoiceActors
          : characterAndVoiceActors // ignore: cast_nullable_to_non_nullable
              as List<CharacterAndVoiceActorModel>,
    ));
  }
}

/// @nodoc

class _$_DetailAnimeModel implements _DetailAnimeModel {
  _$_DetailAnimeModel(
      {this.id = '',
      this.title,
      this.coverImage = '',
      this.coverImageColor = '',
      this.description,
      this.source,
      this.bannerImage,
      this.averageScore,
      this.favourites,
      this.trailerModel,
      this.seasonYear,
      this.season,
      this.status,
      this.ratedRank,
      this.popularRank,
      final List<String> genres = const [],
      this.episodes,
      this.timeUntilAiring,
      this.nextAiringEpisode,
      this.isFollowing = false,
      final List<CharacterAndVoiceActorModel> characterAndVoiceActors =
          const []})
      : _genres = genres,
        _characterAndVoiceActors = characterAndVoiceActors;

  @override
  @JsonKey()
  final String id;
  @override
  final AnimeTitle? title;
  @override
  @JsonKey()
  final String coverImage;
  @override
  @JsonKey()
  final String coverImageColor;
  @override
  final String? description;
  @override
  final AnimeSource? source;
  @override
  final String? bannerImage;
  @override
  final int? averageScore;
  @override
  final int? favourites;
  @override
  final TrailerModel? trailerModel;
  @override
  final int? seasonYear;
  @override
  final AnimeSeason? season;
  @override
  final AnimeStatus? status;
  @override
  final int? ratedRank;
  @override
  final int? popularRank;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final int? episodes;
  @override
  final int? timeUntilAiring;
  @override
  final int? nextAiringEpisode;
  @override
  @JsonKey()
  final bool isFollowing;
  final List<CharacterAndVoiceActorModel> _characterAndVoiceActors;
  @override
  @JsonKey()
  List<CharacterAndVoiceActorModel> get characterAndVoiceActors {
    if (_characterAndVoiceActors is EqualUnmodifiableListView)
      return _characterAndVoiceActors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterAndVoiceActors);
  }

  @override
  String toString() {
    return 'AnimeModel(id: $id, title: $title, coverImage: $coverImage, coverImageColor: $coverImageColor, description: $description, source: $source, bannerImage: $bannerImage, averageScore: $averageScore, favourites: $favourites, trailerModel: $trailerModel, seasonYear: $seasonYear, season: $season, status: $status, ratedRank: $ratedRank, popularRank: $popularRank, genres: $genres, episodes: $episodes, timeUntilAiring: $timeUntilAiring, nextAiringEpisode: $nextAiringEpisode, isFollowing: $isFollowing, characterAndVoiceActors: $characterAndVoiceActors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailAnimeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
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
            (identical(other.favourites, favourites) ||
                other.favourites == favourites) &&
            (identical(other.trailerModel, trailerModel) ||
                other.trailerModel == trailerModel) &&
            (identical(other.seasonYear, seasonYear) ||
                other.seasonYear == seasonYear) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ratedRank, ratedRank) ||
                other.ratedRank == ratedRank) &&
            (identical(other.popularRank, popularRank) ||
                other.popularRank == popularRank) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.nextAiringEpisode, nextAiringEpisode) ||
                other.nextAiringEpisode == nextAiringEpisode) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            const DeepCollectionEquality().equals(
                other._characterAndVoiceActors, _characterAndVoiceActors));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        coverImage,
        coverImageColor,
        description,
        source,
        bannerImage,
        averageScore,
        favourites,
        trailerModel,
        seasonYear,
        season,
        status,
        ratedRank,
        popularRank,
        const DeepCollectionEquality().hash(_genres),
        episodes,
        timeUntilAiring,
        nextAiringEpisode,
        isFollowing,
        const DeepCollectionEquality().hash(_characterAndVoiceActors)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailAnimeModelCopyWith<_$_DetailAnimeModel> get copyWith =>
      __$$_DetailAnimeModelCopyWithImpl<_$_DetailAnimeModel>(this, _$identity);
}

abstract class _DetailAnimeModel implements AnimeModel {
  factory _DetailAnimeModel(
          {final String id,
          final AnimeTitle? title,
          final String coverImage,
          final String coverImageColor,
          final String? description,
          final AnimeSource? source,
          final String? bannerImage,
          final int? averageScore,
          final int? favourites,
          final TrailerModel? trailerModel,
          final int? seasonYear,
          final AnimeSeason? season,
          final AnimeStatus? status,
          final int? ratedRank,
          final int? popularRank,
          final List<String> genres,
          final int? episodes,
          final int? timeUntilAiring,
          final int? nextAiringEpisode,
          final bool isFollowing,
          final List<CharacterAndVoiceActorModel> characterAndVoiceActors}) =
      _$_DetailAnimeModel;

  @override
  String get id;
  @override
  AnimeTitle? get title;
  @override
  String get coverImage;
  @override
  String get coverImageColor;
  @override
  String? get description;
  @override
  AnimeSource? get source;
  @override
  String? get bannerImage;
  @override
  int? get averageScore;
  @override
  int? get favourites;
  @override
  TrailerModel? get trailerModel;
  @override
  int? get seasonYear;
  @override
  AnimeSeason? get season;
  @override
  AnimeStatus? get status;
  @override
  int? get ratedRank;
  @override
  int? get popularRank;
  @override
  List<String> get genres;
  @override
  int? get episodes;
  @override
  int? get timeUntilAiring;
  @override
  int? get nextAiringEpisode;
  @override
  bool get isFollowing;
  @override
  List<CharacterAndVoiceActorModel> get characterAndVoiceActors;
  @override
  @JsonKey(ignore: true)
  _$$_DetailAnimeModelCopyWith<_$_DetailAnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
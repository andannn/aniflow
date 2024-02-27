// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaModel {
  String get id => throw _privateConstructorUsedError;
  MediaTitle? get title => throw _privateConstructorUsedError;
  MediaType get type => throw _privateConstructorUsedError;
  MediaCoverImageModel? get coverImage => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  AnimeSource? get source => throw _privateConstructorUsedError;
  String? get bannerImage => throw _privateConstructorUsedError;
  int? get averageScore => throw _privateConstructorUsedError;
  int? get favourites => throw _privateConstructorUsedError;
  TrailerModel? get trailerModel => throw _privateConstructorUsedError;
  int? get seasonYear => throw _privateConstructorUsedError;
  AnimeSeason? get season => throw _privateConstructorUsedError;
  MediaStatus? get status => throw _privateConstructorUsedError;
  int? get ratedRank => throw _privateConstructorUsedError;
  int? get popularRank => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  int? get episodes => throw _privateConstructorUsedError;
  int? get timeUntilAiring => throw _privateConstructorUsedError;
  bool? get isFavourite => throw _privateConstructorUsedError;
  int? get nextAiringEpisode => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<CharacterAndVoiceActorModel> get characterAndVoiceActors =>
      throw _privateConstructorUsedError;
  List<StaffAndRoleModel> get staffs => throw _privateConstructorUsedError;
  List<MediaExternalLinkModel> get externalLinks =>
      throw _privateConstructorUsedError;
  List<MediaRelationModel> get relations => throw _privateConstructorUsedError;
  List<StudioModel> get studios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaModelCopyWith<MediaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaModelCopyWith<$Res> {
  factory $MediaModelCopyWith(
          MediaModel value, $Res Function(MediaModel) then) =
      _$MediaModelCopyWithImpl<$Res, MediaModel>;
  @useResult
  $Res call(
      {String id,
      MediaTitle? title,
      MediaType type,
      MediaCoverImageModel? coverImage,
      String? description,
      AnimeSource? source,
      String? bannerImage,
      int? averageScore,
      int? favourites,
      TrailerModel? trailerModel,
      int? seasonYear,
      AnimeSeason? season,
      MediaStatus? status,
      int? ratedRank,
      int? popularRank,
      List<String> hashtags,
      List<String> genres,
      int? episodes,
      int? timeUntilAiring,
      bool? isFavourite,
      int? nextAiringEpisode,
      bool isFollowing,
      DateTime? startDate,
      DateTime? endDate,
      List<CharacterAndVoiceActorModel> characterAndVoiceActors,
      List<StaffAndRoleModel> staffs,
      List<MediaExternalLinkModel> externalLinks,
      List<MediaRelationModel> relations,
      List<StudioModel> studios});

  $MediaTitleCopyWith<$Res>? get title;
  $MediaCoverImageModelCopyWith<$Res>? get coverImage;
  $TrailerModelCopyWith<$Res>? get trailerModel;
}

/// @nodoc
class _$MediaModelCopyWithImpl<$Res, $Val extends MediaModel>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? type = null,
    Object? coverImage = freezed,
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
    Object? hashtags = null,
    Object? genres = null,
    Object? episodes = freezed,
    Object? timeUntilAiring = freezed,
    Object? isFavourite = freezed,
    Object? nextAiringEpisode = freezed,
    Object? isFollowing = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? characterAndVoiceActors = null,
    Object? staffs = null,
    Object? externalLinks = null,
    Object? relations = null,
    Object? studios = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as MediaTitle?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as MediaCoverImageModel?,
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
              as MediaStatus?,
      ratedRank: freezed == ratedRank
          ? _value.ratedRank
          : ratedRank // ignore: cast_nullable_to_non_nullable
              as int?,
      popularRank: freezed == popularRank
          ? _value.popularRank
          : popularRank // ignore: cast_nullable_to_non_nullable
              as int?,
      hashtags: null == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      characterAndVoiceActors: null == characterAndVoiceActors
          ? _value.characterAndVoiceActors
          : characterAndVoiceActors // ignore: cast_nullable_to_non_nullable
              as List<CharacterAndVoiceActorModel>,
      staffs: null == staffs
          ? _value.staffs
          : staffs // ignore: cast_nullable_to_non_nullable
              as List<StaffAndRoleModel>,
      externalLinks: null == externalLinks
          ? _value.externalLinks
          : externalLinks // ignore: cast_nullable_to_non_nullable
              as List<MediaExternalLinkModel>,
      relations: null == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as List<MediaRelationModel>,
      studios: null == studios
          ? _value.studios
          : studios // ignore: cast_nullable_to_non_nullable
              as List<StudioModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaTitleCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $MediaTitleCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaCoverImageModelCopyWith<$Res>? get coverImage {
    if (_value.coverImage == null) {
      return null;
    }

    return $MediaCoverImageModelCopyWith<$Res>(_value.coverImage!, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
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
abstract class _$$MediaModelImplCopyWith<$Res>
    implements $MediaModelCopyWith<$Res> {
  factory _$$MediaModelImplCopyWith(
          _$MediaModelImpl value, $Res Function(_$MediaModelImpl) then) =
      __$$MediaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MediaTitle? title,
      MediaType type,
      MediaCoverImageModel? coverImage,
      String? description,
      AnimeSource? source,
      String? bannerImage,
      int? averageScore,
      int? favourites,
      TrailerModel? trailerModel,
      int? seasonYear,
      AnimeSeason? season,
      MediaStatus? status,
      int? ratedRank,
      int? popularRank,
      List<String> hashtags,
      List<String> genres,
      int? episodes,
      int? timeUntilAiring,
      bool? isFavourite,
      int? nextAiringEpisode,
      bool isFollowing,
      DateTime? startDate,
      DateTime? endDate,
      List<CharacterAndVoiceActorModel> characterAndVoiceActors,
      List<StaffAndRoleModel> staffs,
      List<MediaExternalLinkModel> externalLinks,
      List<MediaRelationModel> relations,
      List<StudioModel> studios});

  @override
  $MediaTitleCopyWith<$Res>? get title;
  @override
  $MediaCoverImageModelCopyWith<$Res>? get coverImage;
  @override
  $TrailerModelCopyWith<$Res>? get trailerModel;
}

/// @nodoc
class __$$MediaModelImplCopyWithImpl<$Res>
    extends _$MediaModelCopyWithImpl<$Res, _$MediaModelImpl>
    implements _$$MediaModelImplCopyWith<$Res> {
  __$$MediaModelImplCopyWithImpl(
      _$MediaModelImpl _value, $Res Function(_$MediaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? type = null,
    Object? coverImage = freezed,
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
    Object? hashtags = null,
    Object? genres = null,
    Object? episodes = freezed,
    Object? timeUntilAiring = freezed,
    Object? isFavourite = freezed,
    Object? nextAiringEpisode = freezed,
    Object? isFollowing = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? characterAndVoiceActors = null,
    Object? staffs = null,
    Object? externalLinks = null,
    Object? relations = null,
    Object? studios = null,
  }) {
    return _then(_$MediaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as MediaTitle?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as MediaCoverImageModel?,
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
              as MediaStatus?,
      ratedRank: freezed == ratedRank
          ? _value.ratedRank
          : ratedRank // ignore: cast_nullable_to_non_nullable
              as int?,
      popularRank: freezed == popularRank
          ? _value.popularRank
          : popularRank // ignore: cast_nullable_to_non_nullable
              as int?,
      hashtags: null == hashtags
          ? _value._hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      characterAndVoiceActors: null == characterAndVoiceActors
          ? _value._characterAndVoiceActors
          : characterAndVoiceActors // ignore: cast_nullable_to_non_nullable
              as List<CharacterAndVoiceActorModel>,
      staffs: null == staffs
          ? _value._staffs
          : staffs // ignore: cast_nullable_to_non_nullable
              as List<StaffAndRoleModel>,
      externalLinks: null == externalLinks
          ? _value._externalLinks
          : externalLinks // ignore: cast_nullable_to_non_nullable
              as List<MediaExternalLinkModel>,
      relations: null == relations
          ? _value._relations
          : relations // ignore: cast_nullable_to_non_nullable
              as List<MediaRelationModel>,
      studios: null == studios
          ? _value._studios
          : studios // ignore: cast_nullable_to_non_nullable
              as List<StudioModel>,
    ));
  }
}

/// @nodoc

class _$MediaModelImpl implements _MediaModel {
  _$MediaModelImpl(
      {this.id = '',
      this.title,
      this.type = MediaType.anime,
      this.coverImage,
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
      final List<String> hashtags = const [],
      final List<String> genres = const [],
      this.episodes,
      this.timeUntilAiring,
      this.isFavourite,
      this.nextAiringEpisode,
      this.isFollowing = false,
      this.startDate,
      this.endDate,
      final List<CharacterAndVoiceActorModel> characterAndVoiceActors =
          const [],
      final List<StaffAndRoleModel> staffs = const [],
      final List<MediaExternalLinkModel> externalLinks = const [],
      final List<MediaRelationModel> relations = const [],
      final List<StudioModel> studios = const []})
      : _hashtags = hashtags,
        _genres = genres,
        _characterAndVoiceActors = characterAndVoiceActors,
        _staffs = staffs,
        _externalLinks = externalLinks,
        _relations = relations,
        _studios = studios;

  @override
  @JsonKey()
  final String id;
  @override
  final MediaTitle? title;
  @override
  @JsonKey()
  final MediaType type;
  @override
  final MediaCoverImageModel? coverImage;
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
  final MediaStatus? status;
  @override
  final int? ratedRank;
  @override
  final int? popularRank;
  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

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
  final bool? isFavourite;
  @override
  final int? nextAiringEpisode;
  @override
  @JsonKey()
  final bool isFollowing;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<CharacterAndVoiceActorModel> _characterAndVoiceActors;
  @override
  @JsonKey()
  List<CharacterAndVoiceActorModel> get characterAndVoiceActors {
    if (_characterAndVoiceActors is EqualUnmodifiableListView)
      return _characterAndVoiceActors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterAndVoiceActors);
  }

  final List<StaffAndRoleModel> _staffs;
  @override
  @JsonKey()
  List<StaffAndRoleModel> get staffs {
    if (_staffs is EqualUnmodifiableListView) return _staffs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffs);
  }

  final List<MediaExternalLinkModel> _externalLinks;
  @override
  @JsonKey()
  List<MediaExternalLinkModel> get externalLinks {
    if (_externalLinks is EqualUnmodifiableListView) return _externalLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_externalLinks);
  }

  final List<MediaRelationModel> _relations;
  @override
  @JsonKey()
  List<MediaRelationModel> get relations {
    if (_relations is EqualUnmodifiableListView) return _relations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relations);
  }

  final List<StudioModel> _studios;
  @override
  @JsonKey()
  List<StudioModel> get studios {
    if (_studios is EqualUnmodifiableListView) return _studios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studios);
  }

  @override
  String toString() {
    return 'MediaModel(id: $id, title: $title, type: $type, coverImage: $coverImage, description: $description, source: $source, bannerImage: $bannerImage, averageScore: $averageScore, favourites: $favourites, trailerModel: $trailerModel, seasonYear: $seasonYear, season: $season, status: $status, ratedRank: $ratedRank, popularRank: $popularRank, hashtags: $hashtags, genres: $genres, episodes: $episodes, timeUntilAiring: $timeUntilAiring, isFavourite: $isFavourite, nextAiringEpisode: $nextAiringEpisode, isFollowing: $isFollowing, startDate: $startDate, endDate: $endDate, characterAndVoiceActors: $characterAndVoiceActors, staffs: $staffs, externalLinks: $externalLinks, relations: $relations, studios: $studios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
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
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.timeUntilAiring, timeUntilAiring) ||
                other.timeUntilAiring == timeUntilAiring) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.nextAiringEpisode, nextAiringEpisode) ||
                other.nextAiringEpisode == nextAiringEpisode) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(
                other._characterAndVoiceActors, _characterAndVoiceActors) &&
            const DeepCollectionEquality().equals(other._staffs, _staffs) &&
            const DeepCollectionEquality()
                .equals(other._externalLinks, _externalLinks) &&
            const DeepCollectionEquality()
                .equals(other._relations, _relations) &&
            const DeepCollectionEquality().equals(other._studios, _studios));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        type,
        coverImage,
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
        const DeepCollectionEquality().hash(_hashtags),
        const DeepCollectionEquality().hash(_genres),
        episodes,
        timeUntilAiring,
        isFavourite,
        nextAiringEpisode,
        isFollowing,
        startDate,
        endDate,
        const DeepCollectionEquality().hash(_characterAndVoiceActors),
        const DeepCollectionEquality().hash(_staffs),
        const DeepCollectionEquality().hash(_externalLinks),
        const DeepCollectionEquality().hash(_relations),
        const DeepCollectionEquality().hash(_studios)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaModelImplCopyWith<_$MediaModelImpl> get copyWith =>
      __$$MediaModelImplCopyWithImpl<_$MediaModelImpl>(this, _$identity);
}

abstract class _MediaModel implements MediaModel {
  factory _MediaModel(
      {final String id,
      final MediaTitle? title,
      final MediaType type,
      final MediaCoverImageModel? coverImage,
      final String? description,
      final AnimeSource? source,
      final String? bannerImage,
      final int? averageScore,
      final int? favourites,
      final TrailerModel? trailerModel,
      final int? seasonYear,
      final AnimeSeason? season,
      final MediaStatus? status,
      final int? ratedRank,
      final int? popularRank,
      final List<String> hashtags,
      final List<String> genres,
      final int? episodes,
      final int? timeUntilAiring,
      final bool? isFavourite,
      final int? nextAiringEpisode,
      final bool isFollowing,
      final DateTime? startDate,
      final DateTime? endDate,
      final List<CharacterAndVoiceActorModel> characterAndVoiceActors,
      final List<StaffAndRoleModel> staffs,
      final List<MediaExternalLinkModel> externalLinks,
      final List<MediaRelationModel> relations,
      final List<StudioModel> studios}) = _$MediaModelImpl;

  @override
  String get id;
  @override
  MediaTitle? get title;
  @override
  MediaType get type;
  @override
  MediaCoverImageModel? get coverImage;
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
  MediaStatus? get status;
  @override
  int? get ratedRank;
  @override
  int? get popularRank;
  @override
  List<String> get hashtags;
  @override
  List<String> get genres;
  @override
  int? get episodes;
  @override
  int? get timeUntilAiring;
  @override
  bool? get isFavourite;
  @override
  int? get nextAiringEpisode;
  @override
  bool get isFollowing;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  List<CharacterAndVoiceActorModel> get characterAndVoiceActors;
  @override
  List<StaffAndRoleModel> get staffs;
  @override
  List<MediaExternalLinkModel> get externalLinks;
  @override
  List<MediaRelationModel> get relations;
  @override
  List<StudioModel> get studios;
  @override
  @JsonKey(ignore: true)
  _$$MediaModelImplCopyWith<_$MediaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

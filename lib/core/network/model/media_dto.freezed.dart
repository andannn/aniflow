// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) {
  return _MediaDto.fromJson(json);
}

/// @nodoc
mixin _$MediaDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  MediaTitle? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImage')
  MediaCoverImageDto? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  MediaStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  AnimeSource? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'episodes')
  int? get episodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'seasonYear')
  int? get seasonYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'season')
  AnimeSeason? get season => throw _privateConstructorUsedError;
  @JsonKey(name: 'hashtag')
  String? get hashtag => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'bannerImage')
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageScore')
  int? get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'trending')
  int? get trending => throw _privateConstructorUsedError;
  @JsonKey(name: 'favourites')
  int? get favourites => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate')
  FuzzyDateDto? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'format')
  MediaFormat? get format => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  FuzzyDateDto? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<dynamic> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'trailer')
  TrailerDto? get trailer => throw _privateConstructorUsedError;
  @JsonKey(name: 'nextAiringEpisode')
  AiringScheduleDto? get nextAiringEpisode =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'rankings')
  List<AnimeRank?> get rankings => throw _privateConstructorUsedError;
  @JsonKey(name: 'characters')
  CharacterConnection? get characters => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff')
  StaffConnection? get staff => throw _privateConstructorUsedError;
  @JsonKey(name: 'studios')
  StudioConnection? get studios => throw _privateConstructorUsedError;
  @JsonKey(name: 'relations')
  MediaConnection? get relations => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavourite')
  bool? get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'externalLinks')
  List<MediaExternalLinkDto> get externalLinks =>
      throw _privateConstructorUsedError;

  /// Serializes this MediaDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaDtoCopyWith<MediaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDtoCopyWith<$Res> {
  factory $MediaDtoCopyWith(MediaDto value, $Res Function(MediaDto) then) =
      _$MediaDtoCopyWithImpl<$Res, MediaDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') MediaTitle? title,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'coverImage') MediaCoverImageDto? coverImage,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') MediaStatus? status,
      @JsonKey(name: 'source') AnimeSource? source,
      @JsonKey(name: 'episodes') int? episodes,
      @JsonKey(name: 'seasonYear') int? seasonYear,
      @JsonKey(name: 'season') AnimeSeason? season,
      @JsonKey(name: 'hashtag') String? hashtag,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'bannerImage') String? bannerImage,
      @JsonKey(name: 'averageScore') int? averageScore,
      @JsonKey(name: 'trending') int? trending,
      @JsonKey(name: 'favourites') int? favourites,
      @JsonKey(name: 'startDate') FuzzyDateDto? startDate,
      @JsonKey(name: 'format') MediaFormat? format,
      @JsonKey(name: 'endDate') FuzzyDateDto? endDate,
      @JsonKey(name: 'genres') List<dynamic> genres,
      @JsonKey(name: 'trailer') TrailerDto? trailer,
      @JsonKey(name: 'nextAiringEpisode') AiringScheduleDto? nextAiringEpisode,
      @JsonKey(name: 'rankings') List<AnimeRank?> rankings,
      @JsonKey(name: 'characters') CharacterConnection? characters,
      @JsonKey(name: 'staff') StaffConnection? staff,
      @JsonKey(name: 'studios') StudioConnection? studios,
      @JsonKey(name: 'relations') MediaConnection? relations,
      @JsonKey(name: 'isFavourite') bool? isFavourite,
      @JsonKey(name: 'externalLinks')
      List<MediaExternalLinkDto> externalLinks});

  $MediaTitleCopyWith<$Res>? get title;
  $MediaCoverImageDtoCopyWith<$Res>? get coverImage;
  $FuzzyDateDtoCopyWith<$Res>? get startDate;
  $FuzzyDateDtoCopyWith<$Res>? get endDate;
  $TrailerDtoCopyWith<$Res>? get trailer;
  $AiringScheduleDtoCopyWith<$Res>? get nextAiringEpisode;
  $CharacterConnectionCopyWith<$Res>? get characters;
  $StaffConnectionCopyWith<$Res>? get staff;
  $StudioConnectionCopyWith<$Res>? get studios;
  $MediaConnectionCopyWith<$Res>? get relations;
}

/// @nodoc
class _$MediaDtoCopyWithImpl<$Res, $Val extends MediaDto>
    implements $MediaDtoCopyWith<$Res> {
  _$MediaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? type = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? source = freezed,
    Object? episodes = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? hashtag = freezed,
    Object? siteUrl = freezed,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? trending = freezed,
    Object? favourites = freezed,
    Object? startDate = freezed,
    Object? format = freezed,
    Object? endDate = freezed,
    Object? genres = null,
    Object? trailer = freezed,
    Object? nextAiringEpisode = freezed,
    Object? rankings = null,
    Object? characters = freezed,
    Object? staff = freezed,
    Object? studios = freezed,
    Object? relations = freezed,
    Object? isFavourite = freezed,
    Object? externalLinks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as MediaTitle?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as MediaCoverImageDto?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaStatus?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AnimeSource?,
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
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as MediaFormat?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as TrailerDto?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as AiringScheduleDto?,
      rankings: null == rankings
          ? _value.rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<AnimeRank?>,
      characters: freezed == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as CharacterConnection?,
      staff: freezed == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as StaffConnection?,
      studios: freezed == studios
          ? _value.studios
          : studios // ignore: cast_nullable_to_non_nullable
              as StudioConnection?,
      relations: freezed == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as MediaConnection?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      externalLinks: null == externalLinks
          ? _value.externalLinks
          : externalLinks // ignore: cast_nullable_to_non_nullable
              as List<MediaExternalLinkDto>,
    ) as $Val);
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaCoverImageDtoCopyWith<$Res>? get coverImage {
    if (_value.coverImage == null) {
      return null;
    }

    return $MediaCoverImageDtoCopyWith<$Res>(_value.coverImage!, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FuzzyDateDtoCopyWith<$Res>? get startDate {
    if (_value.startDate == null) {
      return null;
    }

    return $FuzzyDateDtoCopyWith<$Res>(_value.startDate!, (value) {
      return _then(_value.copyWith(startDate: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FuzzyDateDtoCopyWith<$Res>? get endDate {
    if (_value.endDate == null) {
      return null;
    }

    return $FuzzyDateDtoCopyWith<$Res>(_value.endDate!, (value) {
      return _then(_value.copyWith(endDate: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrailerDtoCopyWith<$Res>? get trailer {
    if (_value.trailer == null) {
      return null;
    }

    return $TrailerDtoCopyWith<$Res>(_value.trailer!, (value) {
      return _then(_value.copyWith(trailer: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiringScheduleDtoCopyWith<$Res>? get nextAiringEpisode {
    if (_value.nextAiringEpisode == null) {
      return null;
    }

    return $AiringScheduleDtoCopyWith<$Res>(_value.nextAiringEpisode!, (value) {
      return _then(_value.copyWith(nextAiringEpisode: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterConnectionCopyWith<$Res>? get characters {
    if (_value.characters == null) {
      return null;
    }

    return $CharacterConnectionCopyWith<$Res>(_value.characters!, (value) {
      return _then(_value.copyWith(characters: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffConnectionCopyWith<$Res>? get staff {
    if (_value.staff == null) {
      return null;
    }

    return $StaffConnectionCopyWith<$Res>(_value.staff!, (value) {
      return _then(_value.copyWith(staff: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudioConnectionCopyWith<$Res>? get studios {
    if (_value.studios == null) {
      return null;
    }

    return $StudioConnectionCopyWith<$Res>(_value.studios!, (value) {
      return _then(_value.copyWith(studios: value) as $Val);
    });
  }

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaConnectionCopyWith<$Res>? get relations {
    if (_value.relations == null) {
      return null;
    }

    return $MediaConnectionCopyWith<$Res>(_value.relations!, (value) {
      return _then(_value.copyWith(relations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaDtoImplCopyWith<$Res>
    implements $MediaDtoCopyWith<$Res> {
  factory _$$MediaDtoImplCopyWith(
          _$MediaDtoImpl value, $Res Function(_$MediaDtoImpl) then) =
      __$$MediaDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') MediaTitle? title,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'coverImage') MediaCoverImageDto? coverImage,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') MediaStatus? status,
      @JsonKey(name: 'source') AnimeSource? source,
      @JsonKey(name: 'episodes') int? episodes,
      @JsonKey(name: 'seasonYear') int? seasonYear,
      @JsonKey(name: 'season') AnimeSeason? season,
      @JsonKey(name: 'hashtag') String? hashtag,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'bannerImage') String? bannerImage,
      @JsonKey(name: 'averageScore') int? averageScore,
      @JsonKey(name: 'trending') int? trending,
      @JsonKey(name: 'favourites') int? favourites,
      @JsonKey(name: 'startDate') FuzzyDateDto? startDate,
      @JsonKey(name: 'format') MediaFormat? format,
      @JsonKey(name: 'endDate') FuzzyDateDto? endDate,
      @JsonKey(name: 'genres') List<dynamic> genres,
      @JsonKey(name: 'trailer') TrailerDto? trailer,
      @JsonKey(name: 'nextAiringEpisode') AiringScheduleDto? nextAiringEpisode,
      @JsonKey(name: 'rankings') List<AnimeRank?> rankings,
      @JsonKey(name: 'characters') CharacterConnection? characters,
      @JsonKey(name: 'staff') StaffConnection? staff,
      @JsonKey(name: 'studios') StudioConnection? studios,
      @JsonKey(name: 'relations') MediaConnection? relations,
      @JsonKey(name: 'isFavourite') bool? isFavourite,
      @JsonKey(name: 'externalLinks')
      List<MediaExternalLinkDto> externalLinks});

  @override
  $MediaTitleCopyWith<$Res>? get title;
  @override
  $MediaCoverImageDtoCopyWith<$Res>? get coverImage;
  @override
  $FuzzyDateDtoCopyWith<$Res>? get startDate;
  @override
  $FuzzyDateDtoCopyWith<$Res>? get endDate;
  @override
  $TrailerDtoCopyWith<$Res>? get trailer;
  @override
  $AiringScheduleDtoCopyWith<$Res>? get nextAiringEpisode;
  @override
  $CharacterConnectionCopyWith<$Res>? get characters;
  @override
  $StaffConnectionCopyWith<$Res>? get staff;
  @override
  $StudioConnectionCopyWith<$Res>? get studios;
  @override
  $MediaConnectionCopyWith<$Res>? get relations;
}

/// @nodoc
class __$$MediaDtoImplCopyWithImpl<$Res>
    extends _$MediaDtoCopyWithImpl<$Res, _$MediaDtoImpl>
    implements _$$MediaDtoImplCopyWith<$Res> {
  __$$MediaDtoImplCopyWithImpl(
      _$MediaDtoImpl _value, $Res Function(_$MediaDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? type = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? source = freezed,
    Object? episodes = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? hashtag = freezed,
    Object? siteUrl = freezed,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? trending = freezed,
    Object? favourites = freezed,
    Object? startDate = freezed,
    Object? format = freezed,
    Object? endDate = freezed,
    Object? genres = null,
    Object? trailer = freezed,
    Object? nextAiringEpisode = freezed,
    Object? rankings = null,
    Object? characters = freezed,
    Object? staff = freezed,
    Object? studios = freezed,
    Object? relations = freezed,
    Object? isFavourite = freezed,
    Object? externalLinks = null,
  }) {
    return _then(_$MediaDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as MediaTitle?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as MediaCoverImageDto?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaStatus?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as AnimeSource?,
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
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as MediaFormat?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as TrailerDto?,
      nextAiringEpisode: freezed == nextAiringEpisode
          ? _value.nextAiringEpisode
          : nextAiringEpisode // ignore: cast_nullable_to_non_nullable
              as AiringScheduleDto?,
      rankings: null == rankings
          ? _value._rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<AnimeRank?>,
      characters: freezed == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as CharacterConnection?,
      staff: freezed == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as StaffConnection?,
      studios: freezed == studios
          ? _value.studios
          : studios // ignore: cast_nullable_to_non_nullable
              as StudioConnection?,
      relations: freezed == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as MediaConnection?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      externalLinks: null == externalLinks
          ? _value._externalLinks
          : externalLinks // ignore: cast_nullable_to_non_nullable
              as List<MediaExternalLinkDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaDtoImpl implements _MediaDto {
  _$MediaDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'coverImage') this.coverImage,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'source') this.source,
      @JsonKey(name: 'episodes') this.episodes,
      @JsonKey(name: 'seasonYear') this.seasonYear,
      @JsonKey(name: 'season') this.season,
      @JsonKey(name: 'hashtag') this.hashtag,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'bannerImage') this.bannerImage,
      @JsonKey(name: 'averageScore') this.averageScore,
      @JsonKey(name: 'trending') this.trending,
      @JsonKey(name: 'favourites') this.favourites,
      @JsonKey(name: 'startDate') this.startDate,
      @JsonKey(name: 'format') this.format,
      @JsonKey(name: 'endDate') this.endDate,
      @JsonKey(name: 'genres') final List<dynamic> genres = const [],
      @JsonKey(name: 'trailer') this.trailer,
      @JsonKey(name: 'nextAiringEpisode') this.nextAiringEpisode,
      @JsonKey(name: 'rankings') final List<AnimeRank?> rankings = const [],
      @JsonKey(name: 'characters') this.characters,
      @JsonKey(name: 'staff') this.staff,
      @JsonKey(name: 'studios') this.studios,
      @JsonKey(name: 'relations') this.relations,
      @JsonKey(name: 'isFavourite') this.isFavourite,
      @JsonKey(name: 'externalLinks')
      final List<MediaExternalLinkDto> externalLinks = const []})
      : _genres = genres,
        _rankings = rankings,
        _externalLinks = externalLinks;

  factory _$MediaDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final MediaTitle? title;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'coverImage')
  final MediaCoverImageDto? coverImage;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'status')
  final MediaStatus? status;
  @override
  @JsonKey(name: 'source')
  final AnimeSource? source;
  @override
  @JsonKey(name: 'episodes')
  final int? episodes;
  @override
  @JsonKey(name: 'seasonYear')
  final int? seasonYear;
  @override
  @JsonKey(name: 'season')
  final AnimeSeason? season;
  @override
  @JsonKey(name: 'hashtag')
  final String? hashtag;
  @override
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'bannerImage')
  final String? bannerImage;
  @override
  @JsonKey(name: 'averageScore')
  final int? averageScore;
  @override
  @JsonKey(name: 'trending')
  final int? trending;
  @override
  @JsonKey(name: 'favourites')
  final int? favourites;
  @override
  @JsonKey(name: 'startDate')
  final FuzzyDateDto? startDate;
  @override
  @JsonKey(name: 'format')
  final MediaFormat? format;
  @override
  @JsonKey(name: 'endDate')
  final FuzzyDateDto? endDate;
  final List<dynamic> _genres;
  @override
  @JsonKey(name: 'genres')
  List<dynamic> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey(name: 'trailer')
  final TrailerDto? trailer;
  @override
  @JsonKey(name: 'nextAiringEpisode')
  final AiringScheduleDto? nextAiringEpisode;
  final List<AnimeRank?> _rankings;
  @override
  @JsonKey(name: 'rankings')
  List<AnimeRank?> get rankings {
    if (_rankings is EqualUnmodifiableListView) return _rankings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankings);
  }

  @override
  @JsonKey(name: 'characters')
  final CharacterConnection? characters;
  @override
  @JsonKey(name: 'staff')
  final StaffConnection? staff;
  @override
  @JsonKey(name: 'studios')
  final StudioConnection? studios;
  @override
  @JsonKey(name: 'relations')
  final MediaConnection? relations;
  @override
  @JsonKey(name: 'isFavourite')
  final bool? isFavourite;
  final List<MediaExternalLinkDto> _externalLinks;
  @override
  @JsonKey(name: 'externalLinks')
  List<MediaExternalLinkDto> get externalLinks {
    if (_externalLinks is EqualUnmodifiableListView) return _externalLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_externalLinks);
  }

  @override
  String toString() {
    return 'MediaDto(id: $id, title: $title, type: $type, coverImage: $coverImage, description: $description, status: $status, source: $source, episodes: $episodes, seasonYear: $seasonYear, season: $season, hashtag: $hashtag, siteUrl: $siteUrl, bannerImage: $bannerImage, averageScore: $averageScore, trending: $trending, favourites: $favourites, startDate: $startDate, format: $format, endDate: $endDate, genres: $genres, trailer: $trailer, nextAiringEpisode: $nextAiringEpisode, rankings: $rankings, characters: $characters, staff: $staff, studios: $studios, relations: $relations, isFavourite: $isFavourite, externalLinks: $externalLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.seasonYear, seasonYear) ||
                other.seasonYear == seasonYear) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            (identical(other.favourites, favourites) ||
                other.favourites == favourites) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.trailer, trailer) || other.trailer == trailer) &&
            (identical(other.nextAiringEpisode, nextAiringEpisode) ||
                other.nextAiringEpisode == nextAiringEpisode) &&
            const DeepCollectionEquality().equals(other._rankings, _rankings) &&
            (identical(other.characters, characters) ||
                other.characters == characters) &&
            (identical(other.staff, staff) || other.staff == staff) &&
            (identical(other.studios, studios) || other.studios == studios) &&
            (identical(other.relations, relations) ||
                other.relations == relations) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            const DeepCollectionEquality()
                .equals(other._externalLinks, _externalLinks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        type,
        coverImage,
        description,
        status,
        source,
        episodes,
        seasonYear,
        season,
        hashtag,
        siteUrl,
        bannerImage,
        averageScore,
        trending,
        favourites,
        startDate,
        format,
        endDate,
        const DeepCollectionEquality().hash(_genres),
        trailer,
        nextAiringEpisode,
        const DeepCollectionEquality().hash(_rankings),
        characters,
        staff,
        studios,
        relations,
        isFavourite,
        const DeepCollectionEquality().hash(_externalLinks)
      ]);

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaDtoImplCopyWith<_$MediaDtoImpl> get copyWith =>
      __$$MediaDtoImplCopyWithImpl<_$MediaDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaDto implements MediaDto {
  factory _MediaDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'title') final MediaTitle? title,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'coverImage') final MediaCoverImageDto? coverImage,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'status') final MediaStatus? status,
      @JsonKey(name: 'source') final AnimeSource? source,
      @JsonKey(name: 'episodes') final int? episodes,
      @JsonKey(name: 'seasonYear') final int? seasonYear,
      @JsonKey(name: 'season') final AnimeSeason? season,
      @JsonKey(name: 'hashtag') final String? hashtag,
      @JsonKey(name: 'siteUrl') final String? siteUrl,
      @JsonKey(name: 'bannerImage') final String? bannerImage,
      @JsonKey(name: 'averageScore') final int? averageScore,
      @JsonKey(name: 'trending') final int? trending,
      @JsonKey(name: 'favourites') final int? favourites,
      @JsonKey(name: 'startDate') final FuzzyDateDto? startDate,
      @JsonKey(name: 'format') final MediaFormat? format,
      @JsonKey(name: 'endDate') final FuzzyDateDto? endDate,
      @JsonKey(name: 'genres') final List<dynamic> genres,
      @JsonKey(name: 'trailer') final TrailerDto? trailer,
      @JsonKey(name: 'nextAiringEpisode')
      final AiringScheduleDto? nextAiringEpisode,
      @JsonKey(name: 'rankings') final List<AnimeRank?> rankings,
      @JsonKey(name: 'characters') final CharacterConnection? characters,
      @JsonKey(name: 'staff') final StaffConnection? staff,
      @JsonKey(name: 'studios') final StudioConnection? studios,
      @JsonKey(name: 'relations') final MediaConnection? relations,
      @JsonKey(name: 'isFavourite') final bool? isFavourite,
      @JsonKey(name: 'externalLinks')
      final List<MediaExternalLinkDto> externalLinks}) = _$MediaDtoImpl;

  factory _MediaDto.fromJson(Map<String, dynamic> json) =
      _$MediaDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  MediaTitle? get title;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'coverImage')
  MediaCoverImageDto? get coverImage;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'status')
  MediaStatus? get status;
  @override
  @JsonKey(name: 'source')
  AnimeSource? get source;
  @override
  @JsonKey(name: 'episodes')
  int? get episodes;
  @override
  @JsonKey(name: 'seasonYear')
  int? get seasonYear;
  @override
  @JsonKey(name: 'season')
  AnimeSeason? get season;
  @override
  @JsonKey(name: 'hashtag')
  String? get hashtag;
  @override
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'bannerImage')
  String? get bannerImage;
  @override
  @JsonKey(name: 'averageScore')
  int? get averageScore;
  @override
  @JsonKey(name: 'trending')
  int? get trending;
  @override
  @JsonKey(name: 'favourites')
  int? get favourites;
  @override
  @JsonKey(name: 'startDate')
  FuzzyDateDto? get startDate;
  @override
  @JsonKey(name: 'format')
  MediaFormat? get format;
  @override
  @JsonKey(name: 'endDate')
  FuzzyDateDto? get endDate;
  @override
  @JsonKey(name: 'genres')
  List<dynamic> get genres;
  @override
  @JsonKey(name: 'trailer')
  TrailerDto? get trailer;
  @override
  @JsonKey(name: 'nextAiringEpisode')
  AiringScheduleDto? get nextAiringEpisode;
  @override
  @JsonKey(name: 'rankings')
  List<AnimeRank?> get rankings;
  @override
  @JsonKey(name: 'characters')
  CharacterConnection? get characters;
  @override
  @JsonKey(name: 'staff')
  StaffConnection? get staff;
  @override
  @JsonKey(name: 'studios')
  StudioConnection? get studios;
  @override
  @JsonKey(name: 'relations')
  MediaConnection? get relations;
  @override
  @JsonKey(name: 'isFavourite')
  bool? get isFavourite;
  @override
  @JsonKey(name: 'externalLinks')
  List<MediaExternalLinkDto> get externalLinks;

  /// Create a copy of MediaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaDtoImplCopyWith<_$MediaDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

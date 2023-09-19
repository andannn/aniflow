// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailAnimeDto _$DetailAnimeDtoFromJson(Map<String, dynamic> json) {
  return _DetailAnimeDto.fromJson(json);
}

/// @nodoc
mixin _$DetailAnimeDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  AnimeTitle? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImage')
  Map<String, String?> get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  AnimeStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  AnimeSource? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'episodes')
  int? get episodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'seasonYear')
  int? get seasonYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'season')
  AnimeSeason? get season => throw _privateConstructorUsedError;
  @JsonKey(name: 'hashtag')
  String get hashtag => throw _privateConstructorUsedError;
  @JsonKey(name: 'bannerImage')
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageScore')
  int? get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'trending')
  int? get trending => throw _privateConstructorUsedError;
  @JsonKey(name: 'favourites')
  int? get favourites => throw _privateConstructorUsedError;
  @JsonKey(name: 'genres')
  List<dynamic> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'trailer')
  TrailerDto? get trailer => throw _privateConstructorUsedError;
  @JsonKey(name: 'rankings')
  List<AnimeRank?> get rankings => throw _privateConstructorUsedError;
  @JsonKey(name: 'characters')
  CharacterConnection? get characters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailAnimeDtoCopyWith<DetailAnimeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailAnimeDtoCopyWith<$Res> {
  factory $DetailAnimeDtoCopyWith(
          DetailAnimeDto value, $Res Function(DetailAnimeDto) then) =
      _$DetailAnimeDtoCopyWithImpl<$Res, DetailAnimeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') AnimeTitle? title,
      @JsonKey(name: 'coverImage') Map<String, String?> coverImage,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') AnimeStatus? status,
      @JsonKey(name: 'source') AnimeSource? source,
      @JsonKey(name: 'episodes') int? episodes,
      @JsonKey(name: 'seasonYear') int? seasonYear,
      @JsonKey(name: 'season') AnimeSeason? season,
      @JsonKey(name: 'hashtag') String hashtag,
      @JsonKey(name: 'bannerImage') String? bannerImage,
      @JsonKey(name: 'averageScore') int? averageScore,
      @JsonKey(name: 'trending') int? trending,
      @JsonKey(name: 'favourites') int? favourites,
      @JsonKey(name: 'genres') List<dynamic> genres,
      @JsonKey(name: 'trailer') TrailerDto? trailer,
      @JsonKey(name: 'rankings') List<AnimeRank?> rankings,
      @JsonKey(name: 'characters') CharacterConnection? characters});

  $AnimeTitleCopyWith<$Res>? get title;
  $TrailerDtoCopyWith<$Res>? get trailer;
  $CharacterConnectionCopyWith<$Res>? get characters;
}

/// @nodoc
class _$DetailAnimeDtoCopyWithImpl<$Res, $Val extends DetailAnimeDto>
    implements $DetailAnimeDtoCopyWith<$Res> {
  _$DetailAnimeDtoCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? status = freezed,
    Object? source = freezed,
    Object? episodes = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? hashtag = null,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? trending = freezed,
    Object? favourites = freezed,
    Object? genres = null,
    Object? trailer = freezed,
    Object? rankings = null,
    Object? characters = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeStatus?,
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
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
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
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as TrailerDto?,
      rankings: null == rankings
          ? _value.rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<AnimeRank?>,
      characters: freezed == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as CharacterConnection?,
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
  $TrailerDtoCopyWith<$Res>? get trailer {
    if (_value.trailer == null) {
      return null;
    }

    return $TrailerDtoCopyWith<$Res>(_value.trailer!, (value) {
      return _then(_value.copyWith(trailer: value) as $Val);
    });
  }

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
}

/// @nodoc
abstract class _$$_DetailAnimeDtoCopyWith<$Res>
    implements $DetailAnimeDtoCopyWith<$Res> {
  factory _$$_DetailAnimeDtoCopyWith(
          _$_DetailAnimeDto value, $Res Function(_$_DetailAnimeDto) then) =
      __$$_DetailAnimeDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') AnimeTitle? title,
      @JsonKey(name: 'coverImage') Map<String, String?> coverImage,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') AnimeStatus? status,
      @JsonKey(name: 'source') AnimeSource? source,
      @JsonKey(name: 'episodes') int? episodes,
      @JsonKey(name: 'seasonYear') int? seasonYear,
      @JsonKey(name: 'season') AnimeSeason? season,
      @JsonKey(name: 'hashtag') String hashtag,
      @JsonKey(name: 'bannerImage') String? bannerImage,
      @JsonKey(name: 'averageScore') int? averageScore,
      @JsonKey(name: 'trending') int? trending,
      @JsonKey(name: 'favourites') int? favourites,
      @JsonKey(name: 'genres') List<dynamic> genres,
      @JsonKey(name: 'trailer') TrailerDto? trailer,
      @JsonKey(name: 'rankings') List<AnimeRank?> rankings,
      @JsonKey(name: 'characters') CharacterConnection? characters});

  @override
  $AnimeTitleCopyWith<$Res>? get title;
  @override
  $TrailerDtoCopyWith<$Res>? get trailer;
  @override
  $CharacterConnectionCopyWith<$Res>? get characters;
}

/// @nodoc
class __$$_DetailAnimeDtoCopyWithImpl<$Res>
    extends _$DetailAnimeDtoCopyWithImpl<$Res, _$_DetailAnimeDto>
    implements _$$_DetailAnimeDtoCopyWith<$Res> {
  __$$_DetailAnimeDtoCopyWithImpl(
      _$_DetailAnimeDto _value, $Res Function(_$_DetailAnimeDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? coverImage = null,
    Object? description = freezed,
    Object? status = freezed,
    Object? source = freezed,
    Object? episodes = freezed,
    Object? seasonYear = freezed,
    Object? season = freezed,
    Object? hashtag = null,
    Object? bannerImage = freezed,
    Object? averageScore = freezed,
    Object? trending = freezed,
    Object? favourites = freezed,
    Object? genres = null,
    Object? trailer = freezed,
    Object? rankings = null,
    Object? characters = freezed,
  }) {
    return _then(_$_DetailAnimeDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
      coverImage: null == coverImage
          ? _value._coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeStatus?,
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
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
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
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as TrailerDto?,
      rankings: null == rankings
          ? _value._rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<AnimeRank?>,
      characters: freezed == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as CharacterConnection?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailAnimeDto implements _DetailAnimeDto {
  _$_DetailAnimeDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'coverImage')
      final Map<String, String?> coverImage = const {},
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'source') this.source,
      @JsonKey(name: 'episodes') this.episodes,
      @JsonKey(name: 'seasonYear') this.seasonYear,
      @JsonKey(name: 'season') this.season,
      @JsonKey(name: 'hashtag') this.hashtag = '',
      @JsonKey(name: 'bannerImage') this.bannerImage,
      @JsonKey(name: 'averageScore') this.averageScore,
      @JsonKey(name: 'trending') this.trending,
      @JsonKey(name: 'favourites') this.favourites,
      @JsonKey(name: 'genres') final List<dynamic> genres = const [],
      @JsonKey(name: 'trailer') this.trailer,
      @JsonKey(name: 'rankings') final List<AnimeRank?> rankings = const [],
      @JsonKey(name: 'characters') this.characters})
      : _coverImage = coverImage,
        _genres = genres,
        _rankings = rankings;

  factory _$_DetailAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$$_DetailAnimeDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final AnimeTitle? title;
  final Map<String, String?> _coverImage;
  @override
  @JsonKey(name: 'coverImage')
  Map<String, String?> get coverImage {
    if (_coverImage is EqualUnmodifiableMapView) return _coverImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_coverImage);
  }

  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'status')
  final AnimeStatus? status;
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
  final String hashtag;
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
  String toString() {
    return 'DetailAnimeDto(id: $id, title: $title, coverImage: $coverImage, description: $description, status: $status, source: $source, episodes: $episodes, seasonYear: $seasonYear, season: $season, hashtag: $hashtag, bannerImage: $bannerImage, averageScore: $averageScore, trending: $trending, favourites: $favourites, genres: $genres, trailer: $trailer, rankings: $rankings, characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailAnimeDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._coverImage, _coverImage) &&
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
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            (identical(other.favourites, favourites) ||
                other.favourites == favourites) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.trailer, trailer) || other.trailer == trailer) &&
            const DeepCollectionEquality().equals(other._rankings, _rankings) &&
            (identical(other.characters, characters) ||
                other.characters == characters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_coverImage),
      description,
      status,
      source,
      episodes,
      seasonYear,
      season,
      hashtag,
      bannerImage,
      averageScore,
      trending,
      favourites,
      const DeepCollectionEquality().hash(_genres),
      trailer,
      const DeepCollectionEquality().hash(_rankings),
      characters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailAnimeDtoCopyWith<_$_DetailAnimeDto> get copyWith =>
      __$$_DetailAnimeDtoCopyWithImpl<_$_DetailAnimeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailAnimeDtoToJson(
      this,
    );
  }
}

abstract class _DetailAnimeDto implements DetailAnimeDto {
  factory _DetailAnimeDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'title') final AnimeTitle? title,
          @JsonKey(name: 'coverImage') final Map<String, String?> coverImage,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'status') final AnimeStatus? status,
          @JsonKey(name: 'source') final AnimeSource? source,
          @JsonKey(name: 'episodes') final int? episodes,
          @JsonKey(name: 'seasonYear') final int? seasonYear,
          @JsonKey(name: 'season') final AnimeSeason? season,
          @JsonKey(name: 'hashtag') final String hashtag,
          @JsonKey(name: 'bannerImage') final String? bannerImage,
          @JsonKey(name: 'averageScore') final int? averageScore,
          @JsonKey(name: 'trending') final int? trending,
          @JsonKey(name: 'favourites') final int? favourites,
          @JsonKey(name: 'genres') final List<dynamic> genres,
          @JsonKey(name: 'trailer') final TrailerDto? trailer,
          @JsonKey(name: 'rankings') final List<AnimeRank?> rankings,
          @JsonKey(name: 'characters') final CharacterConnection? characters}) =
      _$_DetailAnimeDto;

  factory _DetailAnimeDto.fromJson(Map<String, dynamic> json) =
      _$_DetailAnimeDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  AnimeTitle? get title;
  @override
  @JsonKey(name: 'coverImage')
  Map<String, String?> get coverImage;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'status')
  AnimeStatus? get status;
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
  String get hashtag;
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
  @JsonKey(name: 'genres')
  List<dynamic> get genres;
  @override
  @JsonKey(name: 'trailer')
  TrailerDto? get trailer;
  @override
  @JsonKey(name: 'rankings')
  List<AnimeRank?> get rankings;
  @override
  @JsonKey(name: 'characters')
  CharacterConnection? get characters;
  @override
  @JsonKey(ignore: true)
  _$$_DetailAnimeDtoCopyWith<_$_DetailAnimeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

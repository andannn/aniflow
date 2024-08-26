// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_time_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshTimeKey _$RefreshTimeKeyFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'birthdayCharacters':
      return BirthdayCharacters.fromJson(json);
    case 'airingSchedule':
      return AiringSchedule.fromJson(json);
    case 'recentMovies':
      return RecentMovies.fromJson(json);
    case 'mediaCategory':
      return MediaCategoryKey.fromJson(json);
    case 'mediaList':
      return MediaList.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RefreshTimeKey',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RefreshTimeKey {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() birthdayCharacters,
    required TResult Function() airingSchedule,
    required TResult Function() recentMovies,
    required TResult Function(MediaCategory category) mediaCategory,
    required TResult Function(String userId) mediaList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? birthdayCharacters,
    TResult? Function()? airingSchedule,
    TResult? Function()? recentMovies,
    TResult? Function(MediaCategory category)? mediaCategory,
    TResult? Function(String userId)? mediaList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? birthdayCharacters,
    TResult Function()? airingSchedule,
    TResult Function()? recentMovies,
    TResult Function(MediaCategory category)? mediaCategory,
    TResult Function(String userId)? mediaList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BirthdayCharacters value) birthdayCharacters,
    required TResult Function(AiringSchedule value) airingSchedule,
    required TResult Function(RecentMovies value) recentMovies,
    required TResult Function(MediaCategoryKey value) mediaCategory,
    required TResult Function(MediaList value) mediaList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BirthdayCharacters value)? birthdayCharacters,
    TResult? Function(AiringSchedule value)? airingSchedule,
    TResult? Function(RecentMovies value)? recentMovies,
    TResult? Function(MediaCategoryKey value)? mediaCategory,
    TResult? Function(MediaList value)? mediaList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BirthdayCharacters value)? birthdayCharacters,
    TResult Function(AiringSchedule value)? airingSchedule,
    TResult Function(RecentMovies value)? recentMovies,
    TResult Function(MediaCategoryKey value)? mediaCategory,
    TResult Function(MediaList value)? mediaList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RefreshTimeKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTimeKeyCopyWith<$Res> {
  factory $RefreshTimeKeyCopyWith(
          RefreshTimeKey value, $Res Function(RefreshTimeKey) then) =
      _$RefreshTimeKeyCopyWithImpl<$Res, RefreshTimeKey>;
}

/// @nodoc
class _$RefreshTimeKeyCopyWithImpl<$Res, $Val extends RefreshTimeKey>
    implements $RefreshTimeKeyCopyWith<$Res> {
  _$RefreshTimeKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BirthdayCharactersImplCopyWith<$Res> {
  factory _$$BirthdayCharactersImplCopyWith(_$BirthdayCharactersImpl value,
          $Res Function(_$BirthdayCharactersImpl) then) =
      __$$BirthdayCharactersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BirthdayCharactersImplCopyWithImpl<$Res>
    extends _$RefreshTimeKeyCopyWithImpl<$Res, _$BirthdayCharactersImpl>
    implements _$$BirthdayCharactersImplCopyWith<$Res> {
  __$$BirthdayCharactersImplCopyWithImpl(_$BirthdayCharactersImpl _value,
      $Res Function(_$BirthdayCharactersImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$BirthdayCharactersImpl implements BirthdayCharacters {
  const _$BirthdayCharactersImpl({final String? $type})
      : $type = $type ?? 'birthdayCharacters';

  factory _$BirthdayCharactersImpl.fromJson(Map<String, dynamic> json) =>
      _$$BirthdayCharactersImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RefreshTimeKey.birthdayCharacters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BirthdayCharactersImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() birthdayCharacters,
    required TResult Function() airingSchedule,
    required TResult Function() recentMovies,
    required TResult Function(MediaCategory category) mediaCategory,
    required TResult Function(String userId) mediaList,
  }) {
    return birthdayCharacters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? birthdayCharacters,
    TResult? Function()? airingSchedule,
    TResult? Function()? recentMovies,
    TResult? Function(MediaCategory category)? mediaCategory,
    TResult? Function(String userId)? mediaList,
  }) {
    return birthdayCharacters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? birthdayCharacters,
    TResult Function()? airingSchedule,
    TResult Function()? recentMovies,
    TResult Function(MediaCategory category)? mediaCategory,
    TResult Function(String userId)? mediaList,
    required TResult orElse(),
  }) {
    if (birthdayCharacters != null) {
      return birthdayCharacters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BirthdayCharacters value) birthdayCharacters,
    required TResult Function(AiringSchedule value) airingSchedule,
    required TResult Function(RecentMovies value) recentMovies,
    required TResult Function(MediaCategoryKey value) mediaCategory,
    required TResult Function(MediaList value) mediaList,
  }) {
    return birthdayCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BirthdayCharacters value)? birthdayCharacters,
    TResult? Function(AiringSchedule value)? airingSchedule,
    TResult? Function(RecentMovies value)? recentMovies,
    TResult? Function(MediaCategoryKey value)? mediaCategory,
    TResult? Function(MediaList value)? mediaList,
  }) {
    return birthdayCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BirthdayCharacters value)? birthdayCharacters,
    TResult Function(AiringSchedule value)? airingSchedule,
    TResult Function(RecentMovies value)? recentMovies,
    TResult Function(MediaCategoryKey value)? mediaCategory,
    TResult Function(MediaList value)? mediaList,
    required TResult orElse(),
  }) {
    if (birthdayCharacters != null) {
      return birthdayCharacters(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BirthdayCharactersImplToJson(
      this,
    );
  }
}

abstract class BirthdayCharacters implements RefreshTimeKey {
  const factory BirthdayCharacters() = _$BirthdayCharactersImpl;

  factory BirthdayCharacters.fromJson(Map<String, dynamic> json) =
      _$BirthdayCharactersImpl.fromJson;
}

/// @nodoc
abstract class _$$AiringScheduleImplCopyWith<$Res> {
  factory _$$AiringScheduleImplCopyWith(_$AiringScheduleImpl value,
          $Res Function(_$AiringScheduleImpl) then) =
      __$$AiringScheduleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AiringScheduleImplCopyWithImpl<$Res>
    extends _$RefreshTimeKeyCopyWithImpl<$Res, _$AiringScheduleImpl>
    implements _$$AiringScheduleImplCopyWith<$Res> {
  __$$AiringScheduleImplCopyWithImpl(
      _$AiringScheduleImpl _value, $Res Function(_$AiringScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AiringScheduleImpl implements AiringSchedule {
  const _$AiringScheduleImpl({final String? $type})
      : $type = $type ?? 'airingSchedule';

  factory _$AiringScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiringScheduleImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RefreshTimeKey.airingSchedule()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AiringScheduleImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() birthdayCharacters,
    required TResult Function() airingSchedule,
    required TResult Function() recentMovies,
    required TResult Function(MediaCategory category) mediaCategory,
    required TResult Function(String userId) mediaList,
  }) {
    return airingSchedule();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? birthdayCharacters,
    TResult? Function()? airingSchedule,
    TResult? Function()? recentMovies,
    TResult? Function(MediaCategory category)? mediaCategory,
    TResult? Function(String userId)? mediaList,
  }) {
    return airingSchedule?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? birthdayCharacters,
    TResult Function()? airingSchedule,
    TResult Function()? recentMovies,
    TResult Function(MediaCategory category)? mediaCategory,
    TResult Function(String userId)? mediaList,
    required TResult orElse(),
  }) {
    if (airingSchedule != null) {
      return airingSchedule();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BirthdayCharacters value) birthdayCharacters,
    required TResult Function(AiringSchedule value) airingSchedule,
    required TResult Function(RecentMovies value) recentMovies,
    required TResult Function(MediaCategoryKey value) mediaCategory,
    required TResult Function(MediaList value) mediaList,
  }) {
    return airingSchedule(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BirthdayCharacters value)? birthdayCharacters,
    TResult? Function(AiringSchedule value)? airingSchedule,
    TResult? Function(RecentMovies value)? recentMovies,
    TResult? Function(MediaCategoryKey value)? mediaCategory,
    TResult? Function(MediaList value)? mediaList,
  }) {
    return airingSchedule?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BirthdayCharacters value)? birthdayCharacters,
    TResult Function(AiringSchedule value)? airingSchedule,
    TResult Function(RecentMovies value)? recentMovies,
    TResult Function(MediaCategoryKey value)? mediaCategory,
    TResult Function(MediaList value)? mediaList,
    required TResult orElse(),
  }) {
    if (airingSchedule != null) {
      return airingSchedule(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AiringScheduleImplToJson(
      this,
    );
  }
}

abstract class AiringSchedule implements RefreshTimeKey {
  const factory AiringSchedule() = _$AiringScheduleImpl;

  factory AiringSchedule.fromJson(Map<String, dynamic> json) =
      _$AiringScheduleImpl.fromJson;
}

/// @nodoc
abstract class _$$RecentMoviesImplCopyWith<$Res> {
  factory _$$RecentMoviesImplCopyWith(
          _$RecentMoviesImpl value, $Res Function(_$RecentMoviesImpl) then) =
      __$$RecentMoviesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecentMoviesImplCopyWithImpl<$Res>
    extends _$RefreshTimeKeyCopyWithImpl<$Res, _$RecentMoviesImpl>
    implements _$$RecentMoviesImplCopyWith<$Res> {
  __$$RecentMoviesImplCopyWithImpl(
      _$RecentMoviesImpl _value, $Res Function(_$RecentMoviesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RecentMoviesImpl implements RecentMovies {
  const _$RecentMoviesImpl({final String? $type})
      : $type = $type ?? 'recentMovies';

  factory _$RecentMoviesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentMoviesImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RefreshTimeKey.recentMovies()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecentMoviesImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() birthdayCharacters,
    required TResult Function() airingSchedule,
    required TResult Function() recentMovies,
    required TResult Function(MediaCategory category) mediaCategory,
    required TResult Function(String userId) mediaList,
  }) {
    return recentMovies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? birthdayCharacters,
    TResult? Function()? airingSchedule,
    TResult? Function()? recentMovies,
    TResult? Function(MediaCategory category)? mediaCategory,
    TResult? Function(String userId)? mediaList,
  }) {
    return recentMovies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? birthdayCharacters,
    TResult Function()? airingSchedule,
    TResult Function()? recentMovies,
    TResult Function(MediaCategory category)? mediaCategory,
    TResult Function(String userId)? mediaList,
    required TResult orElse(),
  }) {
    if (recentMovies != null) {
      return recentMovies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BirthdayCharacters value) birthdayCharacters,
    required TResult Function(AiringSchedule value) airingSchedule,
    required TResult Function(RecentMovies value) recentMovies,
    required TResult Function(MediaCategoryKey value) mediaCategory,
    required TResult Function(MediaList value) mediaList,
  }) {
    return recentMovies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BirthdayCharacters value)? birthdayCharacters,
    TResult? Function(AiringSchedule value)? airingSchedule,
    TResult? Function(RecentMovies value)? recentMovies,
    TResult? Function(MediaCategoryKey value)? mediaCategory,
    TResult? Function(MediaList value)? mediaList,
  }) {
    return recentMovies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BirthdayCharacters value)? birthdayCharacters,
    TResult Function(AiringSchedule value)? airingSchedule,
    TResult Function(RecentMovies value)? recentMovies,
    TResult Function(MediaCategoryKey value)? mediaCategory,
    TResult Function(MediaList value)? mediaList,
    required TResult orElse(),
  }) {
    if (recentMovies != null) {
      return recentMovies(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentMoviesImplToJson(
      this,
    );
  }
}

abstract class RecentMovies implements RefreshTimeKey {
  const factory RecentMovies() = _$RecentMoviesImpl;

  factory RecentMovies.fromJson(Map<String, dynamic> json) =
      _$RecentMoviesImpl.fromJson;
}

/// @nodoc
abstract class _$$MediaCategoryKeyImplCopyWith<$Res> {
  factory _$$MediaCategoryKeyImplCopyWith(_$MediaCategoryKeyImpl value,
          $Res Function(_$MediaCategoryKeyImpl) then) =
      __$$MediaCategoryKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MediaCategory category});
}

/// @nodoc
class __$$MediaCategoryKeyImplCopyWithImpl<$Res>
    extends _$RefreshTimeKeyCopyWithImpl<$Res, _$MediaCategoryKeyImpl>
    implements _$$MediaCategoryKeyImplCopyWith<$Res> {
  __$$MediaCategoryKeyImplCopyWithImpl(_$MediaCategoryKeyImpl _value,
      $Res Function(_$MediaCategoryKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$MediaCategoryKeyImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MediaCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaCategoryKeyImpl implements MediaCategoryKey {
  const _$MediaCategoryKeyImpl({required this.category, final String? $type})
      : $type = $type ?? 'mediaCategory';

  factory _$MediaCategoryKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaCategoryKeyImplFromJson(json);

  @override
  final MediaCategory category;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RefreshTimeKey.mediaCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaCategoryKeyImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaCategoryKeyImplCopyWith<_$MediaCategoryKeyImpl> get copyWith =>
      __$$MediaCategoryKeyImplCopyWithImpl<_$MediaCategoryKeyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() birthdayCharacters,
    required TResult Function() airingSchedule,
    required TResult Function() recentMovies,
    required TResult Function(MediaCategory category) mediaCategory,
    required TResult Function(String userId) mediaList,
  }) {
    return mediaCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? birthdayCharacters,
    TResult? Function()? airingSchedule,
    TResult? Function()? recentMovies,
    TResult? Function(MediaCategory category)? mediaCategory,
    TResult? Function(String userId)? mediaList,
  }) {
    return mediaCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? birthdayCharacters,
    TResult Function()? airingSchedule,
    TResult Function()? recentMovies,
    TResult Function(MediaCategory category)? mediaCategory,
    TResult Function(String userId)? mediaList,
    required TResult orElse(),
  }) {
    if (mediaCategory != null) {
      return mediaCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BirthdayCharacters value) birthdayCharacters,
    required TResult Function(AiringSchedule value) airingSchedule,
    required TResult Function(RecentMovies value) recentMovies,
    required TResult Function(MediaCategoryKey value) mediaCategory,
    required TResult Function(MediaList value) mediaList,
  }) {
    return mediaCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BirthdayCharacters value)? birthdayCharacters,
    TResult? Function(AiringSchedule value)? airingSchedule,
    TResult? Function(RecentMovies value)? recentMovies,
    TResult? Function(MediaCategoryKey value)? mediaCategory,
    TResult? Function(MediaList value)? mediaList,
  }) {
    return mediaCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BirthdayCharacters value)? birthdayCharacters,
    TResult Function(AiringSchedule value)? airingSchedule,
    TResult Function(RecentMovies value)? recentMovies,
    TResult Function(MediaCategoryKey value)? mediaCategory,
    TResult Function(MediaList value)? mediaList,
    required TResult orElse(),
  }) {
    if (mediaCategory != null) {
      return mediaCategory(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaCategoryKeyImplToJson(
      this,
    );
  }
}

abstract class MediaCategoryKey implements RefreshTimeKey {
  const factory MediaCategoryKey({required final MediaCategory category}) =
      _$MediaCategoryKeyImpl;

  factory MediaCategoryKey.fromJson(Map<String, dynamic> json) =
      _$MediaCategoryKeyImpl.fromJson;

  MediaCategory get category;

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaCategoryKeyImplCopyWith<_$MediaCategoryKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MediaListImplCopyWith<$Res> {
  factory _$$MediaListImplCopyWith(
          _$MediaListImpl value, $Res Function(_$MediaListImpl) then) =
      __$$MediaListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$MediaListImplCopyWithImpl<$Res>
    extends _$RefreshTimeKeyCopyWithImpl<$Res, _$MediaListImpl>
    implements _$$MediaListImplCopyWith<$Res> {
  __$$MediaListImplCopyWithImpl(
      _$MediaListImpl _value, $Res Function(_$MediaListImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$MediaListImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaListImpl implements MediaList {
  const _$MediaListImpl({required this.userId, final String? $type})
      : $type = $type ?? 'mediaList';

  factory _$MediaListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaListImplFromJson(json);

  @override
  final String userId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RefreshTimeKey.mediaList(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListImplCopyWith<_$MediaListImpl> get copyWith =>
      __$$MediaListImplCopyWithImpl<_$MediaListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() birthdayCharacters,
    required TResult Function() airingSchedule,
    required TResult Function() recentMovies,
    required TResult Function(MediaCategory category) mediaCategory,
    required TResult Function(String userId) mediaList,
  }) {
    return mediaList(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? birthdayCharacters,
    TResult? Function()? airingSchedule,
    TResult? Function()? recentMovies,
    TResult? Function(MediaCategory category)? mediaCategory,
    TResult? Function(String userId)? mediaList,
  }) {
    return mediaList?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? birthdayCharacters,
    TResult Function()? airingSchedule,
    TResult Function()? recentMovies,
    TResult Function(MediaCategory category)? mediaCategory,
    TResult Function(String userId)? mediaList,
    required TResult orElse(),
  }) {
    if (mediaList != null) {
      return mediaList(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BirthdayCharacters value) birthdayCharacters,
    required TResult Function(AiringSchedule value) airingSchedule,
    required TResult Function(RecentMovies value) recentMovies,
    required TResult Function(MediaCategoryKey value) mediaCategory,
    required TResult Function(MediaList value) mediaList,
  }) {
    return mediaList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BirthdayCharacters value)? birthdayCharacters,
    TResult? Function(AiringSchedule value)? airingSchedule,
    TResult? Function(RecentMovies value)? recentMovies,
    TResult? Function(MediaCategoryKey value)? mediaCategory,
    TResult? Function(MediaList value)? mediaList,
  }) {
    return mediaList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BirthdayCharacters value)? birthdayCharacters,
    TResult Function(AiringSchedule value)? airingSchedule,
    TResult Function(RecentMovies value)? recentMovies,
    TResult Function(MediaCategoryKey value)? mediaCategory,
    TResult Function(MediaList value)? mediaList,
    required TResult orElse(),
  }) {
    if (mediaList != null) {
      return mediaList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaListImplToJson(
      this,
    );
  }
}

abstract class MediaList implements RefreshTimeKey {
  const factory MediaList({required final String userId}) = _$MediaListImpl;

  factory MediaList.fromJson(Map<String, dynamic> json) =
      _$MediaListImpl.fromJson;

  String get userId;

  /// Create a copy of RefreshTimeKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaListImplCopyWith<_$MediaListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

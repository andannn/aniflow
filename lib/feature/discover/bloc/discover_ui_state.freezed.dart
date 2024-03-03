// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<MediaCategory, PagingState<List<MediaModel>>> get categoryMediaMap =>
      throw _privateConstructorUsedError;
  MediaType get currentMediaType => throw _privateConstructorUsedError;
  UserModel? get userData => throw _privateConstructorUsedError;
  AniListSettings? get settings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverUiStateCopyWith<DiscoverUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverUiStateCopyWith<$Res> {
  factory $DiscoverUiStateCopyWith(
          DiscoverUiState value, $Res Function(DiscoverUiState) then) =
      _$DiscoverUiStateCopyWithImpl<$Res, DiscoverUiState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<MediaCategory, PagingState<List<MediaModel>>> categoryMediaMap,
      MediaType currentMediaType,
      UserModel? userData,
      AniListSettings? settings});

  $UserModelCopyWith<$Res>? get userData;
  $AniListSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$DiscoverUiStateCopyWithImpl<$Res, $Val extends DiscoverUiState>
    implements $DiscoverUiStateCopyWith<$Res> {
  _$DiscoverUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categoryMediaMap = null,
    Object? currentMediaType = null,
    Object? userData = freezed,
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryMediaMap: null == categoryMediaMap
          ? _value.categoryMediaMap
          : categoryMediaMap // ignore: cast_nullable_to_non_nullable
              as Map<MediaCategory, PagingState<List<MediaModel>>>,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AniListSettings?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AniListSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $AniListSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscoverUiStateImplCopyWith<$Res>
    implements $DiscoverUiStateCopyWith<$Res> {
  factory _$$DiscoverUiStateImplCopyWith(_$DiscoverUiStateImpl value,
          $Res Function(_$DiscoverUiStateImpl) then) =
      __$$DiscoverUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<MediaCategory, PagingState<List<MediaModel>>> categoryMediaMap,
      MediaType currentMediaType,
      UserModel? userData,
      AniListSettings? settings});

  @override
  $UserModelCopyWith<$Res>? get userData;
  @override
  $AniListSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$DiscoverUiStateImplCopyWithImpl<$Res>
    extends _$DiscoverUiStateCopyWithImpl<$Res, _$DiscoverUiStateImpl>
    implements _$$DiscoverUiStateImplCopyWith<$Res> {
  __$$DiscoverUiStateImplCopyWithImpl(
      _$DiscoverUiStateImpl _value, $Res Function(_$DiscoverUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categoryMediaMap = null,
    Object? currentMediaType = null,
    Object? userData = freezed,
    Object? settings = freezed,
  }) {
    return _then(_$DiscoverUiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryMediaMap: null == categoryMediaMap
          ? _value._categoryMediaMap
          : categoryMediaMap // ignore: cast_nullable_to_non_nullable
              as Map<MediaCategory, PagingState<List<MediaModel>>>,
      currentMediaType: null == currentMediaType
          ? _value.currentMediaType
          : currentMediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AniListSettings?,
    ));
  }
}

/// @nodoc

class _$DiscoverUiStateImpl implements _DiscoverUiState {
  _$DiscoverUiStateImpl(
      {this.isLoading = false,
      final Map<MediaCategory, PagingState<List<MediaModel>>> categoryMediaMap =
          const {
        MediaCategory.currentSeasonAnime: PageLoading(data: [], page: 1),
        MediaCategory.nextSeasonAnime: PageLoading(data: [], page: 1),
        MediaCategory.trendingAnime: PageLoading(data: [], page: 1),
        MediaCategory.movieAnime: PageLoading(data: [], page: 1),
        MediaCategory.trendingManga: PageLoading(data: [], page: 1),
        MediaCategory.allTimePopularManga: PageLoading(data: [], page: 1),
        MediaCategory.topManhwa: PageLoading(data: [], page: 1)
      },
      this.currentMediaType = MediaType.anime,
      this.userData,
      this.settings})
      : _categoryMediaMap = categoryMediaMap;

  @override
  @JsonKey()
  final bool isLoading;
  final Map<MediaCategory, PagingState<List<MediaModel>>> _categoryMediaMap;
  @override
  @JsonKey()
  Map<MediaCategory, PagingState<List<MediaModel>>> get categoryMediaMap {
    if (_categoryMediaMap is EqualUnmodifiableMapView) return _categoryMediaMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryMediaMap);
  }

  @override
  @JsonKey()
  final MediaType currentMediaType;
  @override
  final UserModel? userData;
  @override
  final AniListSettings? settings;

  @override
  String toString() {
    return 'DiscoverUiState(isLoading: $isLoading, categoryMediaMap: $categoryMediaMap, currentMediaType: $currentMediaType, userData: $userData, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categoryMediaMap, _categoryMediaMap) &&
            (identical(other.currentMediaType, currentMediaType) ||
                other.currentMediaType == currentMediaType) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categoryMediaMap),
      currentMediaType,
      userData,
      settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverUiStateImplCopyWith<_$DiscoverUiStateImpl> get copyWith =>
      __$$DiscoverUiStateImplCopyWithImpl<_$DiscoverUiStateImpl>(
          this, _$identity);
}

abstract class _DiscoverUiState implements DiscoverUiState {
  factory _DiscoverUiState(
      {final bool isLoading,
      final Map<MediaCategory, PagingState<List<MediaModel>>> categoryMediaMap,
      final MediaType currentMediaType,
      final UserModel? userData,
      final AniListSettings? settings}) = _$DiscoverUiStateImpl;

  @override
  bool get isLoading;
  @override
  Map<MediaCategory, PagingState<List<MediaModel>>> get categoryMediaMap;
  @override
  MediaType get currentMediaType;
  @override
  UserModel? get userData;
  @override
  AniListSettings? get settings;
  @override
  @JsonKey(ignore: true)
  _$$DiscoverUiStateImplCopyWith<_$DiscoverUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

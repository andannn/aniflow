// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_media_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailMediaUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isHiAnimationFeatureEnabled => throw _privateConstructorUsedError;
  MediaModel? get detailAnimeModel => throw _privateConstructorUsedError;
  MediaListItemModel? get mediaListItem => throw _privateConstructorUsedError;
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;
  UserStaffNameLanguage get userStaffNameLanguage =>
      throw _privateConstructorUsedError;
  ScoreFormat get scoreFormat => throw _privateConstructorUsedError;
  LoadingState<Episode> get episode => throw _privateConstructorUsedError;

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailMediaUiStateCopyWith<DetailMediaUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMediaUiStateCopyWith<$Res> {
  factory $DetailMediaUiStateCopyWith(
          DetailMediaUiState value, $Res Function(DetailMediaUiState) then) =
      _$DetailMediaUiStateCopyWithImpl<$Res, DetailMediaUiState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isHiAnimationFeatureEnabled,
      MediaModel? detailAnimeModel,
      MediaListItemModel? mediaListItem,
      UserTitleLanguage userTitleLanguage,
      UserStaffNameLanguage userStaffNameLanguage,
      ScoreFormat scoreFormat,
      LoadingState<Episode> episode});

  $MediaModelCopyWith<$Res>? get detailAnimeModel;
  $MediaListItemModelCopyWith<$Res>? get mediaListItem;
}

/// @nodoc
class _$DetailMediaUiStateCopyWithImpl<$Res, $Val extends DetailMediaUiState>
    implements $DetailMediaUiStateCopyWith<$Res> {
  _$DetailMediaUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isHiAnimationFeatureEnabled = null,
    Object? detailAnimeModel = freezed,
    Object? mediaListItem = freezed,
    Object? userTitleLanguage = null,
    Object? userStaffNameLanguage = null,
    Object? scoreFormat = null,
    Object? episode = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isHiAnimationFeatureEnabled: null == isHiAnimationFeatureEnabled
          ? _value.isHiAnimationFeatureEnabled
          : isHiAnimationFeatureEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      detailAnimeModel: freezed == detailAnimeModel
          ? _value.detailAnimeModel
          : detailAnimeModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
      mediaListItem: freezed == mediaListItem
          ? _value.mediaListItem
          : mediaListItem // ignore: cast_nullable_to_non_nullable
              as MediaListItemModel?,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
      userStaffNameLanguage: null == userStaffNameLanguage
          ? _value.userStaffNameLanguage
          : userStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      scoreFormat: null == scoreFormat
          ? _value.scoreFormat
          : scoreFormat // ignore: cast_nullable_to_non_nullable
              as ScoreFormat,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as LoadingState<Episode>,
    ) as $Val);
  }

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaModelCopyWith<$Res>? get detailAnimeModel {
    if (_value.detailAnimeModel == null) {
      return null;
    }

    return $MediaModelCopyWith<$Res>(_value.detailAnimeModel!, (value) {
      return _then(_value.copyWith(detailAnimeModel: value) as $Val);
    });
  }

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaListItemModelCopyWith<$Res>? get mediaListItem {
    if (_value.mediaListItem == null) {
      return null;
    }

    return $MediaListItemModelCopyWith<$Res>(_value.mediaListItem!, (value) {
      return _then(_value.copyWith(mediaListItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailMediaUiStateImplCopyWith<$Res>
    implements $DetailMediaUiStateCopyWith<$Res> {
  factory _$$DetailMediaUiStateImplCopyWith(_$DetailMediaUiStateImpl value,
          $Res Function(_$DetailMediaUiStateImpl) then) =
      __$$DetailMediaUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isHiAnimationFeatureEnabled,
      MediaModel? detailAnimeModel,
      MediaListItemModel? mediaListItem,
      UserTitleLanguage userTitleLanguage,
      UserStaffNameLanguage userStaffNameLanguage,
      ScoreFormat scoreFormat,
      LoadingState<Episode> episode});

  @override
  $MediaModelCopyWith<$Res>? get detailAnimeModel;
  @override
  $MediaListItemModelCopyWith<$Res>? get mediaListItem;
}

/// @nodoc
class __$$DetailMediaUiStateImplCopyWithImpl<$Res>
    extends _$DetailMediaUiStateCopyWithImpl<$Res, _$DetailMediaUiStateImpl>
    implements _$$DetailMediaUiStateImplCopyWith<$Res> {
  __$$DetailMediaUiStateImplCopyWithImpl(_$DetailMediaUiStateImpl _value,
      $Res Function(_$DetailMediaUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isHiAnimationFeatureEnabled = null,
    Object? detailAnimeModel = freezed,
    Object? mediaListItem = freezed,
    Object? userTitleLanguage = null,
    Object? userStaffNameLanguage = null,
    Object? scoreFormat = null,
    Object? episode = null,
  }) {
    return _then(_$DetailMediaUiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isHiAnimationFeatureEnabled: null == isHiAnimationFeatureEnabled
          ? _value.isHiAnimationFeatureEnabled
          : isHiAnimationFeatureEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      detailAnimeModel: freezed == detailAnimeModel
          ? _value.detailAnimeModel
          : detailAnimeModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
      mediaListItem: freezed == mediaListItem
          ? _value.mediaListItem
          : mediaListItem // ignore: cast_nullable_to_non_nullable
              as MediaListItemModel?,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
      userStaffNameLanguage: null == userStaffNameLanguage
          ? _value.userStaffNameLanguage
          : userStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      scoreFormat: null == scoreFormat
          ? _value.scoreFormat
          : scoreFormat // ignore: cast_nullable_to_non_nullable
              as ScoreFormat,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as LoadingState<Episode>,
    ));
  }
}

/// @nodoc

class _$DetailMediaUiStateImpl implements _DetailMediaUiState {
  _$DetailMediaUiStateImpl(
      {this.isLoading = false,
      this.isHiAnimationFeatureEnabled = false,
      this.detailAnimeModel,
      this.mediaListItem,
      this.userTitleLanguage = UserTitleLanguage.native,
      this.userStaffNameLanguage = UserStaffNameLanguage.native,
      this.scoreFormat = ScoreFormat.point3,
      this.episode = const None<Episode>()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isHiAnimationFeatureEnabled;
  @override
  final MediaModel? detailAnimeModel;
  @override
  final MediaListItemModel? mediaListItem;
  @override
  @JsonKey()
  final UserTitleLanguage userTitleLanguage;
  @override
  @JsonKey()
  final UserStaffNameLanguage userStaffNameLanguage;
  @override
  @JsonKey()
  final ScoreFormat scoreFormat;
  @override
  @JsonKey()
  final LoadingState<Episode> episode;

  @override
  String toString() {
    return 'DetailMediaUiState(isLoading: $isLoading, isHiAnimationFeatureEnabled: $isHiAnimationFeatureEnabled, detailAnimeModel: $detailAnimeModel, mediaListItem: $mediaListItem, userTitleLanguage: $userTitleLanguage, userStaffNameLanguage: $userStaffNameLanguage, scoreFormat: $scoreFormat, episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailMediaUiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isHiAnimationFeatureEnabled,
                    isHiAnimationFeatureEnabled) ||
                other.isHiAnimationFeatureEnabled ==
                    isHiAnimationFeatureEnabled) &&
            (identical(other.detailAnimeModel, detailAnimeModel) ||
                other.detailAnimeModel == detailAnimeModel) &&
            (identical(other.mediaListItem, mediaListItem) ||
                other.mediaListItem == mediaListItem) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage) &&
            (identical(other.userStaffNameLanguage, userStaffNameLanguage) ||
                other.userStaffNameLanguage == userStaffNameLanguage) &&
            (identical(other.scoreFormat, scoreFormat) ||
                other.scoreFormat == scoreFormat) &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isHiAnimationFeatureEnabled,
      detailAnimeModel,
      mediaListItem,
      userTitleLanguage,
      userStaffNameLanguage,
      scoreFormat,
      episode);

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailMediaUiStateImplCopyWith<_$DetailMediaUiStateImpl> get copyWith =>
      __$$DetailMediaUiStateImplCopyWithImpl<_$DetailMediaUiStateImpl>(
          this, _$identity);
}

abstract class _DetailMediaUiState implements DetailMediaUiState {
  factory _DetailMediaUiState(
      {final bool isLoading,
      final bool isHiAnimationFeatureEnabled,
      final MediaModel? detailAnimeModel,
      final MediaListItemModel? mediaListItem,
      final UserTitleLanguage userTitleLanguage,
      final UserStaffNameLanguage userStaffNameLanguage,
      final ScoreFormat scoreFormat,
      final LoadingState<Episode> episode}) = _$DetailMediaUiStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isHiAnimationFeatureEnabled;
  @override
  MediaModel? get detailAnimeModel;
  @override
  MediaListItemModel? get mediaListItem;
  @override
  UserTitleLanguage get userTitleLanguage;
  @override
  UserStaffNameLanguage get userStaffNameLanguage;
  @override
  ScoreFormat get scoreFormat;
  @override
  LoadingState<Episode> get episode;

  /// Create a copy of DetailMediaUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailMediaUiStateImplCopyWith<_$DetailMediaUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

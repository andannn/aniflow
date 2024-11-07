// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDataModel {
  /// local data.
  MediaType get mediaType => throw _privateConstructorUsedError;
  AnimeSeason get season => throw _privateConstructorUsedError;
  int get seasonYear => throw _privateConstructorUsedError;
  ThemeSetting get themeSetting => throw _privateConstructorUsedError;
  TrackListFilter get trackListFilter => throw _privateConstructorUsedError;
  ActivityScopeCategory get activityScopeCategory =>
      throw _privateConstructorUsedError;
  ActivityFilterType get activityFilterType =>
      throw _privateConstructorUsedError;
  String? get authedUserId => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;
  DateTime? get authExpiredTime => throw _privateConstructorUsedError;
  bool get useInAppPlayer => throw _privateConstructorUsedError;

  /// ani-list remote data.
  bool get displayAdultContent => throw _privateConstructorUsedError;
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;
  UserStaffNameLanguage get userStaffNameLanguage =>
      throw _privateConstructorUsedError;
  ScoreFormat get scoreFormat => throw _privateConstructorUsedError;
  List<String> get sentNotificationIds => throw _privateConstructorUsedError;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataModelCopyWith<UserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataModelCopyWith<$Res> {
  factory $UserDataModelCopyWith(
          UserDataModel value, $Res Function(UserDataModel) then) =
      _$UserDataModelCopyWithImpl<$Res, UserDataModel>;
  @useResult
  $Res call(
      {MediaType mediaType,
      AnimeSeason season,
      int seasonYear,
      ThemeSetting themeSetting,
      TrackListFilter trackListFilter,
      ActivityScopeCategory activityScopeCategory,
      ActivityFilterType activityFilterType,
      String? authedUserId,
      String? authToken,
      DateTime? authExpiredTime,
      bool useInAppPlayer,
      bool displayAdultContent,
      UserTitleLanguage userTitleLanguage,
      UserStaffNameLanguage userStaffNameLanguage,
      ScoreFormat scoreFormat,
      List<String> sentNotificationIds});
}

/// @nodoc
class _$UserDataModelCopyWithImpl<$Res, $Val extends UserDataModel>
    implements $UserDataModelCopyWith<$Res> {
  _$UserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaType = null,
    Object? season = null,
    Object? seasonYear = null,
    Object? themeSetting = null,
    Object? trackListFilter = null,
    Object? activityScopeCategory = null,
    Object? activityFilterType = null,
    Object? authedUserId = freezed,
    Object? authToken = freezed,
    Object? authExpiredTime = freezed,
    Object? useInAppPlayer = null,
    Object? displayAdultContent = null,
    Object? userTitleLanguage = null,
    Object? userStaffNameLanguage = null,
    Object? scoreFormat = null,
    Object? sentNotificationIds = null,
  }) {
    return _then(_value.copyWith(
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as AnimeSeason,
      seasonYear: null == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int,
      themeSetting: null == themeSetting
          ? _value.themeSetting
          : themeSetting // ignore: cast_nullable_to_non_nullable
              as ThemeSetting,
      trackListFilter: null == trackListFilter
          ? _value.trackListFilter
          : trackListFilter // ignore: cast_nullable_to_non_nullable
              as TrackListFilter,
      activityScopeCategory: null == activityScopeCategory
          ? _value.activityScopeCategory
          : activityScopeCategory // ignore: cast_nullable_to_non_nullable
              as ActivityScopeCategory,
      activityFilterType: null == activityFilterType
          ? _value.activityFilterType
          : activityFilterType // ignore: cast_nullable_to_non_nullable
              as ActivityFilterType,
      authedUserId: freezed == authedUserId
          ? _value.authedUserId
          : authedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      authExpiredTime: freezed == authExpiredTime
          ? _value.authExpiredTime
          : authExpiredTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      useInAppPlayer: null == useInAppPlayer
          ? _value.useInAppPlayer
          : useInAppPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
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
      sentNotificationIds: null == sentNotificationIds
          ? _value.sentNotificationIds
          : sentNotificationIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataModelImplCopyWith<$Res>
    implements $UserDataModelCopyWith<$Res> {
  factory _$$UserDataModelImplCopyWith(
          _$UserDataModelImpl value, $Res Function(_$UserDataModelImpl) then) =
      __$$UserDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MediaType mediaType,
      AnimeSeason season,
      int seasonYear,
      ThemeSetting themeSetting,
      TrackListFilter trackListFilter,
      ActivityScopeCategory activityScopeCategory,
      ActivityFilterType activityFilterType,
      String? authedUserId,
      String? authToken,
      DateTime? authExpiredTime,
      bool useInAppPlayer,
      bool displayAdultContent,
      UserTitleLanguage userTitleLanguage,
      UserStaffNameLanguage userStaffNameLanguage,
      ScoreFormat scoreFormat,
      List<String> sentNotificationIds});
}

/// @nodoc
class __$$UserDataModelImplCopyWithImpl<$Res>
    extends _$UserDataModelCopyWithImpl<$Res, _$UserDataModelImpl>
    implements _$$UserDataModelImplCopyWith<$Res> {
  __$$UserDataModelImplCopyWithImpl(
      _$UserDataModelImpl _value, $Res Function(_$UserDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaType = null,
    Object? season = null,
    Object? seasonYear = null,
    Object? themeSetting = null,
    Object? trackListFilter = null,
    Object? activityScopeCategory = null,
    Object? activityFilterType = null,
    Object? authedUserId = freezed,
    Object? authToken = freezed,
    Object? authExpiredTime = freezed,
    Object? useInAppPlayer = null,
    Object? displayAdultContent = null,
    Object? userTitleLanguage = null,
    Object? userStaffNameLanguage = null,
    Object? scoreFormat = null,
    Object? sentNotificationIds = null,
  }) {
    return _then(_$UserDataModelImpl(
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as AnimeSeason,
      seasonYear: null == seasonYear
          ? _value.seasonYear
          : seasonYear // ignore: cast_nullable_to_non_nullable
              as int,
      themeSetting: null == themeSetting
          ? _value.themeSetting
          : themeSetting // ignore: cast_nullable_to_non_nullable
              as ThemeSetting,
      trackListFilter: null == trackListFilter
          ? _value.trackListFilter
          : trackListFilter // ignore: cast_nullable_to_non_nullable
              as TrackListFilter,
      activityScopeCategory: null == activityScopeCategory
          ? _value.activityScopeCategory
          : activityScopeCategory // ignore: cast_nullable_to_non_nullable
              as ActivityScopeCategory,
      activityFilterType: null == activityFilterType
          ? _value.activityFilterType
          : activityFilterType // ignore: cast_nullable_to_non_nullable
              as ActivityFilterType,
      authedUserId: freezed == authedUserId
          ? _value.authedUserId
          : authedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      authExpiredTime: freezed == authExpiredTime
          ? _value.authExpiredTime
          : authExpiredTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      useInAppPlayer: null == useInAppPlayer
          ? _value.useInAppPlayer
          : useInAppPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
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
      sentNotificationIds: null == sentNotificationIds
          ? _value._sentNotificationIds
          : sentNotificationIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UserDataModelImpl implements _UserDataModel {
  const _$UserDataModelImpl(
      {this.mediaType = MediaType.anime,
      this.season = AnimeSeason.summer,
      this.seasonYear = -1,
      this.themeSetting = ThemeSetting.system,
      this.trackListFilter = TrackListFilter.all,
      this.activityScopeCategory = ActivityScopeCategory.global,
      this.activityFilterType = ActivityFilterType.all,
      this.authedUserId,
      this.authToken,
      this.authExpiredTime,
      this.useInAppPlayer = false,
      this.displayAdultContent = false,
      this.userTitleLanguage = UserTitleLanguage.native,
      this.userStaffNameLanguage = UserStaffNameLanguage.native,
      this.scoreFormat = ScoreFormat.point100,
      final List<String> sentNotificationIds = const []})
      : _sentNotificationIds = sentNotificationIds;

  /// local data.
  @override
  @JsonKey()
  final MediaType mediaType;
  @override
  @JsonKey()
  final AnimeSeason season;
  @override
  @JsonKey()
  final int seasonYear;
  @override
  @JsonKey()
  final ThemeSetting themeSetting;
  @override
  @JsonKey()
  final TrackListFilter trackListFilter;
  @override
  @JsonKey()
  final ActivityScopeCategory activityScopeCategory;
  @override
  @JsonKey()
  final ActivityFilterType activityFilterType;
  @override
  final String? authedUserId;
  @override
  final String? authToken;
  @override
  final DateTime? authExpiredTime;
  @override
  @JsonKey()
  final bool useInAppPlayer;

  /// ani-list remote data.
  @override
  @JsonKey()
  final bool displayAdultContent;
  @override
  @JsonKey()
  final UserTitleLanguage userTitleLanguage;
  @override
  @JsonKey()
  final UserStaffNameLanguage userStaffNameLanguage;
  @override
  @JsonKey()
  final ScoreFormat scoreFormat;
  final List<String> _sentNotificationIds;
  @override
  @JsonKey()
  List<String> get sentNotificationIds {
    if (_sentNotificationIds is EqualUnmodifiableListView)
      return _sentNotificationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentNotificationIds);
  }

  @override
  String toString() {
    return 'UserDataModel(mediaType: $mediaType, season: $season, seasonYear: $seasonYear, themeSetting: $themeSetting, trackListFilter: $trackListFilter, activityScopeCategory: $activityScopeCategory, activityFilterType: $activityFilterType, authedUserId: $authedUserId, authToken: $authToken, authExpiredTime: $authExpiredTime, useInAppPlayer: $useInAppPlayer, displayAdultContent: $displayAdultContent, userTitleLanguage: $userTitleLanguage, userStaffNameLanguage: $userStaffNameLanguage, scoreFormat: $scoreFormat, sentNotificationIds: $sentNotificationIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataModelImpl &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.seasonYear, seasonYear) ||
                other.seasonYear == seasonYear) &&
            (identical(other.themeSetting, themeSetting) ||
                other.themeSetting == themeSetting) &&
            (identical(other.trackListFilter, trackListFilter) ||
                other.trackListFilter == trackListFilter) &&
            (identical(other.activityScopeCategory, activityScopeCategory) ||
                other.activityScopeCategory == activityScopeCategory) &&
            (identical(other.activityFilterType, activityFilterType) ||
                other.activityFilterType == activityFilterType) &&
            (identical(other.authedUserId, authedUserId) ||
                other.authedUserId == authedUserId) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.authExpiredTime, authExpiredTime) ||
                other.authExpiredTime == authExpiredTime) &&
            (identical(other.useInAppPlayer, useInAppPlayer) ||
                other.useInAppPlayer == useInAppPlayer) &&
            (identical(other.displayAdultContent, displayAdultContent) ||
                other.displayAdultContent == displayAdultContent) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage) &&
            (identical(other.userStaffNameLanguage, userStaffNameLanguage) ||
                other.userStaffNameLanguage == userStaffNameLanguage) &&
            (identical(other.scoreFormat, scoreFormat) ||
                other.scoreFormat == scoreFormat) &&
            const DeepCollectionEquality()
                .equals(other._sentNotificationIds, _sentNotificationIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mediaType,
      season,
      seasonYear,
      themeSetting,
      trackListFilter,
      activityScopeCategory,
      activityFilterType,
      authedUserId,
      authToken,
      authExpiredTime,
      useInAppPlayer,
      displayAdultContent,
      userTitleLanguage,
      userStaffNameLanguage,
      scoreFormat,
      const DeepCollectionEquality().hash(_sentNotificationIds));

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataModelImplCopyWith<_$UserDataModelImpl> get copyWith =>
      __$$UserDataModelImplCopyWithImpl<_$UserDataModelImpl>(this, _$identity);
}

abstract class _UserDataModel implements UserDataModel {
  const factory _UserDataModel(
      {final MediaType mediaType,
      final AnimeSeason season,
      final int seasonYear,
      final ThemeSetting themeSetting,
      final TrackListFilter trackListFilter,
      final ActivityScopeCategory activityScopeCategory,
      final ActivityFilterType activityFilterType,
      final String? authedUserId,
      final String? authToken,
      final DateTime? authExpiredTime,
      final bool useInAppPlayer,
      final bool displayAdultContent,
      final UserTitleLanguage userTitleLanguage,
      final UserStaffNameLanguage userStaffNameLanguage,
      final ScoreFormat scoreFormat,
      final List<String> sentNotificationIds}) = _$UserDataModelImpl;

  /// local data.
  @override
  MediaType get mediaType;
  @override
  AnimeSeason get season;
  @override
  int get seasonYear;
  @override
  ThemeSetting get themeSetting;
  @override
  TrackListFilter get trackListFilter;
  @override
  ActivityScopeCategory get activityScopeCategory;
  @override
  ActivityFilterType get activityFilterType;
  @override
  String? get authedUserId;
  @override
  String? get authToken;
  @override
  DateTime? get authExpiredTime;
  @override
  bool get useInAppPlayer;

  /// ani-list remote data.
  @override
  bool get displayAdultContent;
  @override
  UserTitleLanguage get userTitleLanguage;
  @override
  UserStaffNameLanguage get userStaffNameLanguage;
  @override
  ScoreFormat get scoreFormat;
  @override
  List<String> get sentNotificationIds;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataModelImplCopyWith<_$UserDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

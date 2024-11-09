// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ani_flow_route_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AniFlowRoutePath _$AniFlowRoutePathFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'home':
      return AniFlowHomePath.fromJson(json);
    case 'search':
      return SearchRoutePath.fromJson(json);
    case 'userProfile':
      return UserProfileRoutePath.fromJson(json);
    case 'categoryAnimeList':
      return CategoryAnimeListRoutePath.fromJson(json);
    case 'mediaCharacterList':
      return MediaCharacterListRoutePath.fromJson(json);
    case 'mediaStaffList':
      return MediaStaffListRoutePath.fromJson(json);
    case 'detailMedia':
      return DetailMediaRoutePath.fromJson(json);
    case 'detailCharacter':
      return DetailCharacterPath.fromJson(json);
    case 'detailStaff':
      return DetailStaffPath.fromJson(json);
    case 'airingSchedule':
      return AiringScheduleRoutePath.fromJson(json);
    case 'notification':
      return NotificationRoutePath.fromJson(json);
    case 'detailStudio':
      return DetailStudioRoutePath.fromJson(json);
    case 'activityReplies':
      return ActivityRepliesRoutePath.fromJson(json);
    case 'imagePreview':
      return ImagePreviewRoutePath.fromJson(json);
    case 'mediaListUpdate':
      return MediaListUpdateRoutePath.fromJson(json);
    case 'settings':
      return SettingsRoutePath.fromJson(json);
    case 'birthdayCharacterPage':
      return BirthdayCharacterPagePath.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AniFlowRoutePath',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AniFlowRoutePath {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AniFlowRoutePath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AniFlowRoutePathCopyWith<$Res> {
  factory $AniFlowRoutePathCopyWith(
          AniFlowRoutePath value, $Res Function(AniFlowRoutePath) then) =
      _$AniFlowRoutePathCopyWithImpl<$Res, AniFlowRoutePath>;
}

/// @nodoc
class _$AniFlowRoutePathCopyWithImpl<$Res, $Val extends AniFlowRoutePath>
    implements $AniFlowRoutePathCopyWith<$Res> {
  _$AniFlowRoutePathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AniFlowHomePathImplCopyWith<$Res> {
  factory _$$AniFlowHomePathImplCopyWith(_$AniFlowHomePathImpl value,
          $Res Function(_$AniFlowHomePathImpl) then) =
      __$$AniFlowHomePathImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AniFlowHomePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$AniFlowHomePathImpl>
    implements _$$AniFlowHomePathImplCopyWith<$Res> {
  __$$AniFlowHomePathImplCopyWithImpl(
      _$AniFlowHomePathImpl _value, $Res Function(_$AniFlowHomePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AniFlowHomePathImpl implements AniFlowHomePath {
  const _$AniFlowHomePathImpl({final String? $type}) : $type = $type ?? 'home';

  factory _$AniFlowHomePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$AniFlowHomePathImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.home()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AniFlowHomePathImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return home();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return home?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AniFlowHomePathImplToJson(
      this,
    );
  }
}

abstract class AniFlowHomePath implements AniFlowRoutePath {
  const factory AniFlowHomePath() = _$AniFlowHomePathImpl;

  factory AniFlowHomePath.fromJson(Map<String, dynamic> json) =
      _$AniFlowHomePathImpl.fromJson;
}

/// @nodoc
abstract class _$$SearchRoutePathImplCopyWith<$Res> {
  factory _$$SearchRoutePathImplCopyWith(_$SearchRoutePathImpl value,
          $Res Function(_$SearchRoutePathImpl) then) =
      __$$SearchRoutePathImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$SearchRoutePathImpl>
    implements _$$SearchRoutePathImplCopyWith<$Res> {
  __$$SearchRoutePathImplCopyWithImpl(
      _$SearchRoutePathImpl _value, $Res Function(_$SearchRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SearchRoutePathImpl implements SearchRoutePath {
  const _$SearchRoutePathImpl({final String? $type})
      : $type = $type ?? 'search';

  factory _$SearchRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRoutePathImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.search()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchRoutePathImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return search();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return search?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchRoutePathImplToJson(
      this,
    );
  }
}

abstract class SearchRoutePath implements AniFlowRoutePath {
  const factory SearchRoutePath() = _$SearchRoutePathImpl;

  factory SearchRoutePath.fromJson(Map<String, dynamic> json) =
      _$SearchRoutePathImpl.fromJson;
}

/// @nodoc
abstract class _$$UserProfileRoutePathImplCopyWith<$Res> {
  factory _$$UserProfileRoutePathImplCopyWith(_$UserProfileRoutePathImpl value,
          $Res Function(_$UserProfileRoutePathImpl) then) =
      __$$UserProfileRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$UserProfileRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$UserProfileRoutePathImpl>
    implements _$$UserProfileRoutePathImplCopyWith<$Res> {
  __$$UserProfileRoutePathImplCopyWithImpl(_$UserProfileRoutePathImpl _value,
      $Res Function(_$UserProfileRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UserProfileRoutePathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileRoutePathImpl implements UserProfileRoutePath {
  const _$UserProfileRoutePathImpl({required this.id, final String? $type})
      : $type = $type ?? 'userProfile';

  factory _$UserProfileRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileRoutePathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.userProfile(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileRoutePathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileRoutePathImplCopyWith<_$UserProfileRoutePathImpl>
      get copyWith =>
          __$$UserProfileRoutePathImplCopyWithImpl<_$UserProfileRoutePathImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return userProfile(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return userProfile?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (userProfile != null) {
      return userProfile(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return userProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return userProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (userProfile != null) {
      return userProfile(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileRoutePathImplToJson(
      this,
    );
  }
}

abstract class UserProfileRoutePath implements AniFlowRoutePath {
  const factory UserProfileRoutePath({required final String id}) =
      _$UserProfileRoutePathImpl;

  factory UserProfileRoutePath.fromJson(Map<String, dynamic> json) =
      _$UserProfileRoutePathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileRoutePathImplCopyWith<_$UserProfileRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryAnimeListRoutePathImplCopyWith<$Res> {
  factory _$$CategoryAnimeListRoutePathImplCopyWith(
          _$CategoryAnimeListRoutePathImpl value,
          $Res Function(_$CategoryAnimeListRoutePathImpl) then) =
      __$$CategoryAnimeListRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MediaCategory category});
}

/// @nodoc
class __$$CategoryAnimeListRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res,
        _$CategoryAnimeListRoutePathImpl>
    implements _$$CategoryAnimeListRoutePathImplCopyWith<$Res> {
  __$$CategoryAnimeListRoutePathImplCopyWithImpl(
      _$CategoryAnimeListRoutePathImpl _value,
      $Res Function(_$CategoryAnimeListRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoryAnimeListRoutePathImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MediaCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryAnimeListRoutePathImpl implements CategoryAnimeListRoutePath {
  const _$CategoryAnimeListRoutePathImpl(
      {required this.category, final String? $type})
      : $type = $type ?? 'categoryAnimeList';

  factory _$CategoryAnimeListRoutePathImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CategoryAnimeListRoutePathImplFromJson(json);

  @override
  final MediaCategory category;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.categoryAnimeList(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAnimeListRoutePathImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAnimeListRoutePathImplCopyWith<_$CategoryAnimeListRoutePathImpl>
      get copyWith => __$$CategoryAnimeListRoutePathImplCopyWithImpl<
          _$CategoryAnimeListRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return categoryAnimeList(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return categoryAnimeList?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (categoryAnimeList != null) {
      return categoryAnimeList(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return categoryAnimeList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return categoryAnimeList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (categoryAnimeList != null) {
      return categoryAnimeList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryAnimeListRoutePathImplToJson(
      this,
    );
  }
}

abstract class CategoryAnimeListRoutePath implements AniFlowRoutePath {
  const factory CategoryAnimeListRoutePath(
          {required final MediaCategory category}) =
      _$CategoryAnimeListRoutePathImpl;

  factory CategoryAnimeListRoutePath.fromJson(Map<String, dynamic> json) =
      _$CategoryAnimeListRoutePathImpl.fromJson;

  MediaCategory get category;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryAnimeListRoutePathImplCopyWith<_$CategoryAnimeListRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MediaCharacterListRoutePathImplCopyWith<$Res> {
  factory _$$MediaCharacterListRoutePathImplCopyWith(
          _$MediaCharacterListRoutePathImpl value,
          $Res Function(_$MediaCharacterListRoutePathImpl) then) =
      __$$MediaCharacterListRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MediaCharacterListRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res,
        _$MediaCharacterListRoutePathImpl>
    implements _$$MediaCharacterListRoutePathImplCopyWith<$Res> {
  __$$MediaCharacterListRoutePathImplCopyWithImpl(
      _$MediaCharacterListRoutePathImpl _value,
      $Res Function(_$MediaCharacterListRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MediaCharacterListRoutePathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaCharacterListRoutePathImpl implements MediaCharacterListRoutePath {
  const _$MediaCharacterListRoutePathImpl(
      {required this.id, final String? $type})
      : $type = $type ?? 'mediaCharacterList';

  factory _$MediaCharacterListRoutePathImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MediaCharacterListRoutePathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.mediaCharacterList(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaCharacterListRoutePathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaCharacterListRoutePathImplCopyWith<_$MediaCharacterListRoutePathImpl>
      get copyWith => __$$MediaCharacterListRoutePathImplCopyWithImpl<
          _$MediaCharacterListRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return mediaCharacterList(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return mediaCharacterList?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (mediaCharacterList != null) {
      return mediaCharacterList(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return mediaCharacterList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return mediaCharacterList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (mediaCharacterList != null) {
      return mediaCharacterList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaCharacterListRoutePathImplToJson(
      this,
    );
  }
}

abstract class MediaCharacterListRoutePath implements AniFlowRoutePath {
  const factory MediaCharacterListRoutePath({required final String id}) =
      _$MediaCharacterListRoutePathImpl;

  factory MediaCharacterListRoutePath.fromJson(Map<String, dynamic> json) =
      _$MediaCharacterListRoutePathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaCharacterListRoutePathImplCopyWith<_$MediaCharacterListRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MediaStaffListRoutePathImplCopyWith<$Res> {
  factory _$$MediaStaffListRoutePathImplCopyWith(
          _$MediaStaffListRoutePathImpl value,
          $Res Function(_$MediaStaffListRoutePathImpl) then) =
      __$$MediaStaffListRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MediaStaffListRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$MediaStaffListRoutePathImpl>
    implements _$$MediaStaffListRoutePathImplCopyWith<$Res> {
  __$$MediaStaffListRoutePathImplCopyWithImpl(
      _$MediaStaffListRoutePathImpl _value,
      $Res Function(_$MediaStaffListRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MediaStaffListRoutePathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaStaffListRoutePathImpl implements MediaStaffListRoutePath {
  const _$MediaStaffListRoutePathImpl({required this.id, final String? $type})
      : $type = $type ?? 'mediaStaffList';

  factory _$MediaStaffListRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaStaffListRoutePathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.mediaStaffList(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaStaffListRoutePathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaStaffListRoutePathImplCopyWith<_$MediaStaffListRoutePathImpl>
      get copyWith => __$$MediaStaffListRoutePathImplCopyWithImpl<
          _$MediaStaffListRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return mediaStaffList(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return mediaStaffList?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (mediaStaffList != null) {
      return mediaStaffList(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return mediaStaffList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return mediaStaffList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (mediaStaffList != null) {
      return mediaStaffList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaStaffListRoutePathImplToJson(
      this,
    );
  }
}

abstract class MediaStaffListRoutePath implements AniFlowRoutePath {
  const factory MediaStaffListRoutePath({required final String id}) =
      _$MediaStaffListRoutePathImpl;

  factory MediaStaffListRoutePath.fromJson(Map<String, dynamic> json) =
      _$MediaStaffListRoutePathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaStaffListRoutePathImplCopyWith<_$MediaStaffListRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailMediaRoutePathImplCopyWith<$Res> {
  factory _$$DetailMediaRoutePathImplCopyWith(_$DetailMediaRoutePathImpl value,
          $Res Function(_$DetailMediaRoutePathImpl) then) =
      __$$DetailMediaRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DetailMediaRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$DetailMediaRoutePathImpl>
    implements _$$DetailMediaRoutePathImplCopyWith<$Res> {
  __$$DetailMediaRoutePathImplCopyWithImpl(_$DetailMediaRoutePathImpl _value,
      $Res Function(_$DetailMediaRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DetailMediaRoutePathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailMediaRoutePathImpl implements DetailMediaRoutePath {
  const _$DetailMediaRoutePathImpl({required this.id, final String? $type})
      : $type = $type ?? 'detailMedia';

  factory _$DetailMediaRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailMediaRoutePathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.detailMedia(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailMediaRoutePathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailMediaRoutePathImplCopyWith<_$DetailMediaRoutePathImpl>
      get copyWith =>
          __$$DetailMediaRoutePathImplCopyWithImpl<_$DetailMediaRoutePathImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return detailMedia(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return detailMedia?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailMedia != null) {
      return detailMedia(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return detailMedia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return detailMedia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailMedia != null) {
      return detailMedia(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailMediaRoutePathImplToJson(
      this,
    );
  }
}

abstract class DetailMediaRoutePath implements AniFlowRoutePath {
  const factory DetailMediaRoutePath({required final String id}) =
      _$DetailMediaRoutePathImpl;

  factory DetailMediaRoutePath.fromJson(Map<String, dynamic> json) =
      _$DetailMediaRoutePathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailMediaRoutePathImplCopyWith<_$DetailMediaRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailCharacterPathImplCopyWith<$Res> {
  factory _$$DetailCharacterPathImplCopyWith(_$DetailCharacterPathImpl value,
          $Res Function(_$DetailCharacterPathImpl) then) =
      __$$DetailCharacterPathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DetailCharacterPathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$DetailCharacterPathImpl>
    implements _$$DetailCharacterPathImplCopyWith<$Res> {
  __$$DetailCharacterPathImplCopyWithImpl(_$DetailCharacterPathImpl _value,
      $Res Function(_$DetailCharacterPathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DetailCharacterPathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCharacterPathImpl implements DetailCharacterPath {
  const _$DetailCharacterPathImpl({required this.id, final String? $type})
      : $type = $type ?? 'detailCharacter';

  factory _$DetailCharacterPathImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCharacterPathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.detailCharacter(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCharacterPathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCharacterPathImplCopyWith<_$DetailCharacterPathImpl> get copyWith =>
      __$$DetailCharacterPathImplCopyWithImpl<_$DetailCharacterPathImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return detailCharacter(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return detailCharacter?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailCharacter != null) {
      return detailCharacter(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return detailCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return detailCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailCharacter != null) {
      return detailCharacter(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCharacterPathImplToJson(
      this,
    );
  }
}

abstract class DetailCharacterPath implements AniFlowRoutePath {
  const factory DetailCharacterPath({required final String id}) =
      _$DetailCharacterPathImpl;

  factory DetailCharacterPath.fromJson(Map<String, dynamic> json) =
      _$DetailCharacterPathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCharacterPathImplCopyWith<_$DetailCharacterPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailStaffPathImplCopyWith<$Res> {
  factory _$$DetailStaffPathImplCopyWith(_$DetailStaffPathImpl value,
          $Res Function(_$DetailStaffPathImpl) then) =
      __$$DetailStaffPathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DetailStaffPathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$DetailStaffPathImpl>
    implements _$$DetailStaffPathImplCopyWith<$Res> {
  __$$DetailStaffPathImplCopyWithImpl(
      _$DetailStaffPathImpl _value, $Res Function(_$DetailStaffPathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DetailStaffPathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStaffPathImpl implements DetailStaffPath {
  const _$DetailStaffPathImpl({required this.id, final String? $type})
      : $type = $type ?? 'detailStaff';

  factory _$DetailStaffPathImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStaffPathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.detailStaff(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStaffPathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStaffPathImplCopyWith<_$DetailStaffPathImpl> get copyWith =>
      __$$DetailStaffPathImplCopyWithImpl<_$DetailStaffPathImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return detailStaff(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return detailStaff?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailStaff != null) {
      return detailStaff(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return detailStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return detailStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailStaff != null) {
      return detailStaff(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStaffPathImplToJson(
      this,
    );
  }
}

abstract class DetailStaffPath implements AniFlowRoutePath {
  const factory DetailStaffPath({required final String id}) =
      _$DetailStaffPathImpl;

  factory DetailStaffPath.fromJson(Map<String, dynamic> json) =
      _$DetailStaffPathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailStaffPathImplCopyWith<_$DetailStaffPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiringScheduleRoutePathImplCopyWith<$Res> {
  factory _$$AiringScheduleRoutePathImplCopyWith(
          _$AiringScheduleRoutePathImpl value,
          $Res Function(_$AiringScheduleRoutePathImpl) then) =
      __$$AiringScheduleRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScheduleType type});
}

/// @nodoc
class __$$AiringScheduleRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$AiringScheduleRoutePathImpl>
    implements _$$AiringScheduleRoutePathImplCopyWith<$Res> {
  __$$AiringScheduleRoutePathImplCopyWithImpl(
      _$AiringScheduleRoutePathImpl _value,
      $Res Function(_$AiringScheduleRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$AiringScheduleRoutePathImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiringScheduleRoutePathImpl implements AiringScheduleRoutePath {
  const _$AiringScheduleRoutePathImpl({required this.type, final String? $type})
      : $type = $type ?? 'airingSchedule';

  factory _$AiringScheduleRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiringScheduleRoutePathImplFromJson(json);

  @override
  final ScheduleType type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.airingSchedule(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiringScheduleRoutePathImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiringScheduleRoutePathImplCopyWith<_$AiringScheduleRoutePathImpl>
      get copyWith => __$$AiringScheduleRoutePathImplCopyWithImpl<
          _$AiringScheduleRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return airingSchedule(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return airingSchedule?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (airingSchedule != null) {
      return airingSchedule(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return airingSchedule(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return airingSchedule?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (airingSchedule != null) {
      return airingSchedule(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AiringScheduleRoutePathImplToJson(
      this,
    );
  }
}

abstract class AiringScheduleRoutePath implements AniFlowRoutePath {
  const factory AiringScheduleRoutePath({required final ScheduleType type}) =
      _$AiringScheduleRoutePathImpl;

  factory AiringScheduleRoutePath.fromJson(Map<String, dynamic> json) =
      _$AiringScheduleRoutePathImpl.fromJson;

  ScheduleType get type;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiringScheduleRoutePathImplCopyWith<_$AiringScheduleRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationRoutePathImplCopyWith<$Res> {
  factory _$$NotificationRoutePathImplCopyWith(
          _$NotificationRoutePathImpl value,
          $Res Function(_$NotificationRoutePathImpl) then) =
      __$$NotificationRoutePathImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$NotificationRoutePathImpl>
    implements _$$NotificationRoutePathImplCopyWith<$Res> {
  __$$NotificationRoutePathImplCopyWithImpl(_$NotificationRoutePathImpl _value,
      $Res Function(_$NotificationRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NotificationRoutePathImpl implements NotificationRoutePath {
  const _$NotificationRoutePathImpl({final String? $type})
      : $type = $type ?? 'notification';

  factory _$NotificationRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationRoutePathImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.notification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationRoutePathImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return notification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return notification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return notification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return notification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationRoutePathImplToJson(
      this,
    );
  }
}

abstract class NotificationRoutePath implements AniFlowRoutePath {
  const factory NotificationRoutePath() = _$NotificationRoutePathImpl;

  factory NotificationRoutePath.fromJson(Map<String, dynamic> json) =
      _$NotificationRoutePathImpl.fromJson;
}

/// @nodoc
abstract class _$$DetailStudioRoutePathImplCopyWith<$Res> {
  factory _$$DetailStudioRoutePathImplCopyWith(
          _$DetailStudioRoutePathImpl value,
          $Res Function(_$DetailStudioRoutePathImpl) then) =
      __$$DetailStudioRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DetailStudioRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$DetailStudioRoutePathImpl>
    implements _$$DetailStudioRoutePathImplCopyWith<$Res> {
  __$$DetailStudioRoutePathImplCopyWithImpl(_$DetailStudioRoutePathImpl _value,
      $Res Function(_$DetailStudioRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DetailStudioRoutePathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStudioRoutePathImpl implements DetailStudioRoutePath {
  const _$DetailStudioRoutePathImpl({required this.id, final String? $type})
      : $type = $type ?? 'detailStudio';

  factory _$DetailStudioRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStudioRoutePathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.detailStudio(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStudioRoutePathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStudioRoutePathImplCopyWith<_$DetailStudioRoutePathImpl>
      get copyWith => __$$DetailStudioRoutePathImplCopyWithImpl<
          _$DetailStudioRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return detailStudio(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return detailStudio?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailStudio != null) {
      return detailStudio(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return detailStudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return detailStudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (detailStudio != null) {
      return detailStudio(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStudioRoutePathImplToJson(
      this,
    );
  }
}

abstract class DetailStudioRoutePath implements AniFlowRoutePath {
  const factory DetailStudioRoutePath({required final String id}) =
      _$DetailStudioRoutePathImpl;

  factory DetailStudioRoutePath.fromJson(Map<String, dynamic> json) =
      _$DetailStudioRoutePathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailStudioRoutePathImplCopyWith<_$DetailStudioRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivityRepliesRoutePathImplCopyWith<$Res> {
  factory _$$ActivityRepliesRoutePathImplCopyWith(
          _$ActivityRepliesRoutePathImpl value,
          $Res Function(_$ActivityRepliesRoutePathImpl) then) =
      __$$ActivityRepliesRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ActivityRepliesRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$ActivityRepliesRoutePathImpl>
    implements _$$ActivityRepliesRoutePathImplCopyWith<$Res> {
  __$$ActivityRepliesRoutePathImplCopyWithImpl(
      _$ActivityRepliesRoutePathImpl _value,
      $Res Function(_$ActivityRepliesRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ActivityRepliesRoutePathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityRepliesRoutePathImpl implements ActivityRepliesRoutePath {
  const _$ActivityRepliesRoutePathImpl({required this.id, final String? $type})
      : $type = $type ?? 'activityReplies';

  factory _$ActivityRepliesRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityRepliesRoutePathImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.activityReplies(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityRepliesRoutePathImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityRepliesRoutePathImplCopyWith<_$ActivityRepliesRoutePathImpl>
      get copyWith => __$$ActivityRepliesRoutePathImplCopyWithImpl<
          _$ActivityRepliesRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return activityReplies(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return activityReplies?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (activityReplies != null) {
      return activityReplies(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return activityReplies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return activityReplies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (activityReplies != null) {
      return activityReplies(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityRepliesRoutePathImplToJson(
      this,
    );
  }
}

abstract class ActivityRepliesRoutePath implements AniFlowRoutePath {
  const factory ActivityRepliesRoutePath({required final String id}) =
      _$ActivityRepliesRoutePathImpl;

  factory ActivityRepliesRoutePath.fromJson(Map<String, dynamic> json) =
      _$ActivityRepliesRoutePathImpl.fromJson;

  String get id;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityRepliesRoutePathImplCopyWith<_$ActivityRepliesRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagePreviewRoutePathImplCopyWith<$Res> {
  factory _$$ImagePreviewRoutePathImplCopyWith(
          _$ImagePreviewRoutePathImpl value,
          $Res Function(_$ImagePreviewRoutePathImpl) then) =
      __$$ImagePreviewRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@PreviewSourceConverter() PreviewSource source});

  $PreviewSourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$ImagePreviewRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$ImagePreviewRoutePathImpl>
    implements _$$ImagePreviewRoutePathImplCopyWith<$Res> {
  __$$ImagePreviewRoutePathImplCopyWithImpl(_$ImagePreviewRoutePathImpl _value,
      $Res Function(_$ImagePreviewRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$ImagePreviewRoutePathImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as PreviewSource,
    ));
  }

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreviewSourceCopyWith<$Res> get source {
    return $PreviewSourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagePreviewRoutePathImpl implements ImagePreviewRoutePath {
  const _$ImagePreviewRoutePathImpl(
      {@PreviewSourceConverter() required this.source, final String? $type})
      : $type = $type ?? 'imagePreview';

  factory _$ImagePreviewRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagePreviewRoutePathImplFromJson(json);

  @override
  @PreviewSourceConverter()
  final PreviewSource source;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.imagePreview(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagePreviewRoutePathImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePreviewRoutePathImplCopyWith<_$ImagePreviewRoutePathImpl>
      get copyWith => __$$ImagePreviewRoutePathImplCopyWithImpl<
          _$ImagePreviewRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return imagePreview(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return imagePreview?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (imagePreview != null) {
      return imagePreview(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return imagePreview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return imagePreview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (imagePreview != null) {
      return imagePreview(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagePreviewRoutePathImplToJson(
      this,
    );
  }
}

abstract class ImagePreviewRoutePath implements AniFlowRoutePath {
  const factory ImagePreviewRoutePath(
          {@PreviewSourceConverter() required final PreviewSource source}) =
      _$ImagePreviewRoutePathImpl;

  factory ImagePreviewRoutePath.fromJson(Map<String, dynamic> json) =
      _$ImagePreviewRoutePathImpl.fromJson;

  @PreviewSourceConverter()
  PreviewSource get source;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagePreviewRoutePathImplCopyWith<_$ImagePreviewRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MediaListUpdateRoutePathImplCopyWith<$Res> {
  factory _$$MediaListUpdateRoutePathImplCopyWith(
          _$MediaListUpdateRoutePathImpl value,
          $Res Function(_$MediaListUpdateRoutePathImpl) then) =
      __$$MediaListUpdateRoutePathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mediaId, String from});
}

/// @nodoc
class __$$MediaListUpdateRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$MediaListUpdateRoutePathImpl>
    implements _$$MediaListUpdateRoutePathImplCopyWith<$Res> {
  __$$MediaListUpdateRoutePathImplCopyWithImpl(
      _$MediaListUpdateRoutePathImpl _value,
      $Res Function(_$MediaListUpdateRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaId = null,
    Object? from = null,
  }) {
    return _then(_$MediaListUpdateRoutePathImpl(
      mediaId: null == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaListUpdateRoutePathImpl implements MediaListUpdateRoutePath {
  const _$MediaListUpdateRoutePathImpl(
      {required this.mediaId, required this.from, final String? $type})
      : $type = $type ?? 'mediaListUpdate';

  factory _$MediaListUpdateRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaListUpdateRoutePathImplFromJson(json);

  @override
  final String mediaId;
  @override
  final String from;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.mediaListUpdate(mediaId: $mediaId, from: $from)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListUpdateRoutePathImpl &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            (identical(other.from, from) || other.from == from));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mediaId, from);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListUpdateRoutePathImplCopyWith<_$MediaListUpdateRoutePathImpl>
      get copyWith => __$$MediaListUpdateRoutePathImplCopyWithImpl<
          _$MediaListUpdateRoutePathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return mediaListUpdate(mediaId, from);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return mediaListUpdate?.call(mediaId, from);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (mediaListUpdate != null) {
      return mediaListUpdate(mediaId, from);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return mediaListUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return mediaListUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (mediaListUpdate != null) {
      return mediaListUpdate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaListUpdateRoutePathImplToJson(
      this,
    );
  }
}

abstract class MediaListUpdateRoutePath implements AniFlowRoutePath {
  const factory MediaListUpdateRoutePath(
      {required final String mediaId,
      required final String from}) = _$MediaListUpdateRoutePathImpl;

  factory MediaListUpdateRoutePath.fromJson(Map<String, dynamic> json) =
      _$MediaListUpdateRoutePathImpl.fromJson;

  String get mediaId;
  String get from;

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaListUpdateRoutePathImplCopyWith<_$MediaListUpdateRoutePathImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsRoutePathImplCopyWith<$Res> {
  factory _$$SettingsRoutePathImplCopyWith(_$SettingsRoutePathImpl value,
          $Res Function(_$SettingsRoutePathImpl) then) =
      __$$SettingsRoutePathImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsRoutePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res, _$SettingsRoutePathImpl>
    implements _$$SettingsRoutePathImplCopyWith<$Res> {
  __$$SettingsRoutePathImplCopyWithImpl(_$SettingsRoutePathImpl _value,
      $Res Function(_$SettingsRoutePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SettingsRoutePathImpl implements SettingsRoutePath {
  const _$SettingsRoutePathImpl({final String? $type})
      : $type = $type ?? 'settings';

  factory _$SettingsRoutePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsRoutePathImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.settings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsRoutePathImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return settings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return settings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return settings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return settings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsRoutePathImplToJson(
      this,
    );
  }
}

abstract class SettingsRoutePath implements AniFlowRoutePath {
  const factory SettingsRoutePath() = _$SettingsRoutePathImpl;

  factory SettingsRoutePath.fromJson(Map<String, dynamic> json) =
      _$SettingsRoutePathImpl.fromJson;
}

/// @nodoc
abstract class _$$BirthdayCharacterPagePathImplCopyWith<$Res> {
  factory _$$BirthdayCharacterPagePathImplCopyWith(
          _$BirthdayCharacterPagePathImpl value,
          $Res Function(_$BirthdayCharacterPagePathImpl) then) =
      __$$BirthdayCharacterPagePathImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BirthdayCharacterPagePathImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathCopyWithImpl<$Res,
        _$BirthdayCharacterPagePathImpl>
    implements _$$BirthdayCharacterPagePathImplCopyWith<$Res> {
  __$$BirthdayCharacterPagePathImplCopyWithImpl(
      _$BirthdayCharacterPagePathImpl _value,
      $Res Function(_$BirthdayCharacterPagePathImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniFlowRoutePath
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$BirthdayCharacterPagePathImpl implements BirthdayCharacterPagePath {
  const _$BirthdayCharacterPagePathImpl({final String? $type})
      : $type = $type ?? 'birthdayCharacterPage';

  factory _$BirthdayCharacterPagePathImpl.fromJson(Map<String, dynamic> json) =>
      _$$BirthdayCharacterPagePathImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AniFlowRoutePath.birthdayCharacterPage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BirthdayCharacterPagePathImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function() search,
    required TResult Function(String id) userProfile,
    required TResult Function(MediaCategory category) categoryAnimeList,
    required TResult Function(String id) mediaCharacterList,
    required TResult Function(String id) mediaStaffList,
    required TResult Function(String id) detailMedia,
    required TResult Function(String id) detailCharacter,
    required TResult Function(String id) detailStaff,
    required TResult Function(ScheduleType type) airingSchedule,
    required TResult Function() notification,
    required TResult Function(String id) detailStudio,
    required TResult Function(String id) activityReplies,
    required TResult Function(@PreviewSourceConverter() PreviewSource source)
        imagePreview,
    required TResult Function(String mediaId, String from) mediaListUpdate,
    required TResult Function() settings,
    required TResult Function() birthdayCharacterPage,
  }) {
    return birthdayCharacterPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? home,
    TResult? Function()? search,
    TResult? Function(String id)? userProfile,
    TResult? Function(MediaCategory category)? categoryAnimeList,
    TResult? Function(String id)? mediaCharacterList,
    TResult? Function(String id)? mediaStaffList,
    TResult? Function(String id)? detailMedia,
    TResult? Function(String id)? detailCharacter,
    TResult? Function(String id)? detailStaff,
    TResult? Function(ScheduleType type)? airingSchedule,
    TResult? Function()? notification,
    TResult? Function(String id)? detailStudio,
    TResult? Function(String id)? activityReplies,
    TResult? Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult? Function(String mediaId, String from)? mediaListUpdate,
    TResult? Function()? settings,
    TResult? Function()? birthdayCharacterPage,
  }) {
    return birthdayCharacterPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function()? search,
    TResult Function(String id)? userProfile,
    TResult Function(MediaCategory category)? categoryAnimeList,
    TResult Function(String id)? mediaCharacterList,
    TResult Function(String id)? mediaStaffList,
    TResult Function(String id)? detailMedia,
    TResult Function(String id)? detailCharacter,
    TResult Function(String id)? detailStaff,
    TResult Function(ScheduleType type)? airingSchedule,
    TResult Function()? notification,
    TResult Function(String id)? detailStudio,
    TResult Function(String id)? activityReplies,
    TResult Function(@PreviewSourceConverter() PreviewSource source)?
        imagePreview,
    TResult Function(String mediaId, String from)? mediaListUpdate,
    TResult Function()? settings,
    TResult Function()? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (birthdayCharacterPage != null) {
      return birthdayCharacterPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AniFlowHomePath value) home,
    required TResult Function(SearchRoutePath value) search,
    required TResult Function(UserProfileRoutePath value) userProfile,
    required TResult Function(CategoryAnimeListRoutePath value)
        categoryAnimeList,
    required TResult Function(MediaCharacterListRoutePath value)
        mediaCharacterList,
    required TResult Function(MediaStaffListRoutePath value) mediaStaffList,
    required TResult Function(DetailMediaRoutePath value) detailMedia,
    required TResult Function(DetailCharacterPath value) detailCharacter,
    required TResult Function(DetailStaffPath value) detailStaff,
    required TResult Function(AiringScheduleRoutePath value) airingSchedule,
    required TResult Function(NotificationRoutePath value) notification,
    required TResult Function(DetailStudioRoutePath value) detailStudio,
    required TResult Function(ActivityRepliesRoutePath value) activityReplies,
    required TResult Function(ImagePreviewRoutePath value) imagePreview,
    required TResult Function(MediaListUpdateRoutePath value) mediaListUpdate,
    required TResult Function(SettingsRoutePath value) settings,
    required TResult Function(BirthdayCharacterPagePath value)
        birthdayCharacterPage,
  }) {
    return birthdayCharacterPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AniFlowHomePath value)? home,
    TResult? Function(SearchRoutePath value)? search,
    TResult? Function(UserProfileRoutePath value)? userProfile,
    TResult? Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult? Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult? Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult? Function(DetailMediaRoutePath value)? detailMedia,
    TResult? Function(DetailCharacterPath value)? detailCharacter,
    TResult? Function(DetailStaffPath value)? detailStaff,
    TResult? Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult? Function(NotificationRoutePath value)? notification,
    TResult? Function(DetailStudioRoutePath value)? detailStudio,
    TResult? Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult? Function(ImagePreviewRoutePath value)? imagePreview,
    TResult? Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult? Function(SettingsRoutePath value)? settings,
    TResult? Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
  }) {
    return birthdayCharacterPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AniFlowHomePath value)? home,
    TResult Function(SearchRoutePath value)? search,
    TResult Function(UserProfileRoutePath value)? userProfile,
    TResult Function(CategoryAnimeListRoutePath value)? categoryAnimeList,
    TResult Function(MediaCharacterListRoutePath value)? mediaCharacterList,
    TResult Function(MediaStaffListRoutePath value)? mediaStaffList,
    TResult Function(DetailMediaRoutePath value)? detailMedia,
    TResult Function(DetailCharacterPath value)? detailCharacter,
    TResult Function(DetailStaffPath value)? detailStaff,
    TResult Function(AiringScheduleRoutePath value)? airingSchedule,
    TResult Function(NotificationRoutePath value)? notification,
    TResult Function(DetailStudioRoutePath value)? detailStudio,
    TResult Function(ActivityRepliesRoutePath value)? activityReplies,
    TResult Function(ImagePreviewRoutePath value)? imagePreview,
    TResult Function(MediaListUpdateRoutePath value)? mediaListUpdate,
    TResult Function(SettingsRoutePath value)? settings,
    TResult Function(BirthdayCharacterPagePath value)? birthdayCharacterPage,
    required TResult orElse(),
  }) {
    if (birthdayCharacterPage != null) {
      return birthdayCharacterPage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BirthdayCharacterPagePathImplToJson(
      this,
    );
  }
}

abstract class BirthdayCharacterPagePath implements AniFlowRoutePath {
  const factory BirthdayCharacterPagePath() = _$BirthdayCharacterPagePathImpl;

  factory BirthdayCharacterPagePath.fromJson(Map<String, dynamic> json) =
      _$BirthdayCharacterPagePathImpl.fromJson;
}

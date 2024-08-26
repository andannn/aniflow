// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ani_list_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AniListSettings _$AniListSettingsFromJson(Map<String, dynamic> json) {
  return _AniListSettings.fromJson(json);
}

/// @nodoc
mixin _$AniListSettings {
  @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
  bool get displayAdultContent => throw _privateConstructorUsedError;
  @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
  UserStaffNameLanguage get userStaffNameLanguage =>
      throw _privateConstructorUsedError;
  @JsonKey(name: AniListSettingsKeys.scoreFormat)
  ScoreFormat get scoreFormat => throw _privateConstructorUsedError;

  /// Serializes this AniListSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AniListSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AniListSettingsCopyWith<AniListSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AniListSettingsCopyWith<$Res> {
  factory $AniListSettingsCopyWith(
          AniListSettings value, $Res Function(AniListSettings) then) =
      _$AniListSettingsCopyWithImpl<$Res, AniListSettings>;
  @useResult
  $Res call(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      bool displayAdultContent,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      UserTitleLanguage userTitleLanguage,
      @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
      UserStaffNameLanguage userStaffNameLanguage,
      @JsonKey(name: AniListSettingsKeys.scoreFormat) ScoreFormat scoreFormat});
}

/// @nodoc
class _$AniListSettingsCopyWithImpl<$Res, $Val extends AniListSettings>
    implements $AniListSettingsCopyWith<$Res> {
  _$AniListSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AniListSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayAdultContent = null,
    Object? userTitleLanguage = null,
    Object? userStaffNameLanguage = null,
    Object? scoreFormat = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AniListSettingsImplCopyWith<$Res>
    implements $AniListSettingsCopyWith<$Res> {
  factory _$$AniListSettingsImplCopyWith(_$AniListSettingsImpl value,
          $Res Function(_$AniListSettingsImpl) then) =
      __$$AniListSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      bool displayAdultContent,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      UserTitleLanguage userTitleLanguage,
      @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
      UserStaffNameLanguage userStaffNameLanguage,
      @JsonKey(name: AniListSettingsKeys.scoreFormat) ScoreFormat scoreFormat});
}

/// @nodoc
class __$$AniListSettingsImplCopyWithImpl<$Res>
    extends _$AniListSettingsCopyWithImpl<$Res, _$AniListSettingsImpl>
    implements _$$AniListSettingsImplCopyWith<$Res> {
  __$$AniListSettingsImplCopyWithImpl(
      _$AniListSettingsImpl _value, $Res Function(_$AniListSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AniListSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayAdultContent = null,
    Object? userTitleLanguage = null,
    Object? userStaffNameLanguage = null,
    Object? scoreFormat = null,
  }) {
    return _then(_$AniListSettingsImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AniListSettingsImpl implements _AniListSettings {
  _$AniListSettingsImpl(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      this.displayAdultContent = false,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      this.userTitleLanguage = UserTitleLanguage.native,
      @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
      this.userStaffNameLanguage = UserStaffNameLanguage.native,
      @JsonKey(name: AniListSettingsKeys.scoreFormat)
      this.scoreFormat = ScoreFormat.point100});

  factory _$AniListSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AniListSettingsImplFromJson(json);

  @override
  @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
  final bool displayAdultContent;
  @override
  @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
  final UserTitleLanguage userTitleLanguage;
  @override
  @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
  final UserStaffNameLanguage userStaffNameLanguage;
  @override
  @JsonKey(name: AniListSettingsKeys.scoreFormat)
  final ScoreFormat scoreFormat;

  @override
  String toString() {
    return 'AniListSettings(displayAdultContent: $displayAdultContent, userTitleLanguage: $userTitleLanguage, userStaffNameLanguage: $userStaffNameLanguage, scoreFormat: $scoreFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AniListSettingsImpl &&
            (identical(other.displayAdultContent, displayAdultContent) ||
                other.displayAdultContent == displayAdultContent) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage) &&
            (identical(other.userStaffNameLanguage, userStaffNameLanguage) ||
                other.userStaffNameLanguage == userStaffNameLanguage) &&
            (identical(other.scoreFormat, scoreFormat) ||
                other.scoreFormat == scoreFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayAdultContent,
      userTitleLanguage, userStaffNameLanguage, scoreFormat);

  /// Create a copy of AniListSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AniListSettingsImplCopyWith<_$AniListSettingsImpl> get copyWith =>
      __$$AniListSettingsImplCopyWithImpl<_$AniListSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AniListSettingsImplToJson(
      this,
    );
  }
}

abstract class _AniListSettings implements AniListSettings {
  factory _AniListSettings(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      final bool displayAdultContent,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      final UserTitleLanguage userTitleLanguage,
      @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
      final UserStaffNameLanguage userStaffNameLanguage,
      @JsonKey(name: AniListSettingsKeys.scoreFormat)
      final ScoreFormat scoreFormat}) = _$AniListSettingsImpl;

  factory _AniListSettings.fromJson(Map<String, dynamic> json) =
      _$AniListSettingsImpl.fromJson;

  @override
  @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
  bool get displayAdultContent;
  @override
  @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
  UserTitleLanguage get userTitleLanguage;
  @override
  @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
  UserStaffNameLanguage get userStaffNameLanguage;
  @override
  @JsonKey(name: AniListSettingsKeys.scoreFormat)
  ScoreFormat get scoreFormat;

  /// Create a copy of AniListSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AniListSettingsImplCopyWith<_$AniListSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

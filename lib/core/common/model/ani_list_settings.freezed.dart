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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AniListSettings _$AniListSettingsFromJson(Map<String, dynamic> json) {
  return _AniListSettings.fromJson(json);
}

/// @nodoc
mixin _$AniListSettings {
  @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
  bool get displayAdultContent => throw _privateConstructorUsedError;
  @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      UserTitleLanguage userTitleLanguage});
}

/// @nodoc
class _$AniListSettingsCopyWithImpl<$Res, $Val extends AniListSettings>
    implements $AniListSettingsCopyWith<$Res> {
  _$AniListSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayAdultContent = null,
    Object? userTitleLanguage = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AniListSettingsCopyWith<$Res>
    implements $AniListSettingsCopyWith<$Res> {
  factory _$$_AniListSettingsCopyWith(
          _$_AniListSettings value, $Res Function(_$_AniListSettings) then) =
      __$$_AniListSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      bool displayAdultContent,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      UserTitleLanguage userTitleLanguage});
}

/// @nodoc
class __$$_AniListSettingsCopyWithImpl<$Res>
    extends _$AniListSettingsCopyWithImpl<$Res, _$_AniListSettings>
    implements _$$_AniListSettingsCopyWith<$Res> {
  __$$_AniListSettingsCopyWithImpl(
      _$_AniListSettings _value, $Res Function(_$_AniListSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayAdultContent = null,
    Object? userTitleLanguage = null,
  }) {
    return _then(_$_AniListSettings(
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AniListSettings implements _AniListSettings {
  _$_AniListSettings(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      this.displayAdultContent = false,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      this.userTitleLanguage = UserTitleLanguage.native});

  factory _$_AniListSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AniListSettingsFromJson(json);

  @override
  @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
  final bool displayAdultContent;
  @override
  @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
  final UserTitleLanguage userTitleLanguage;

  @override
  String toString() {
    return 'AniListSettings(displayAdultContent: $displayAdultContent, userTitleLanguage: $userTitleLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AniListSettings &&
            (identical(other.displayAdultContent, displayAdultContent) ||
                other.displayAdultContent == displayAdultContent) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, displayAdultContent, userTitleLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AniListSettingsCopyWith<_$_AniListSettings> get copyWith =>
      __$$_AniListSettingsCopyWithImpl<_$_AniListSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AniListSettingsToJson(
      this,
    );
  }
}

abstract class _AniListSettings implements AniListSettings {
  factory _AniListSettings(
      {@JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
      final bool displayAdultContent,
      @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
      final UserTitleLanguage userTitleLanguage}) = _$_AniListSettings;

  factory _AniListSettings.fromJson(Map<String, dynamic> json) =
      _$_AniListSettings.fromJson;

  @override
  @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
  bool get displayAdultContent;
  @override
  @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
  UserTitleLanguage get userTitleLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_AniListSettingsCopyWith<_$_AniListSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
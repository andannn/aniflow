// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  ThemeSetting get theme => throw _privateConstructorUsedError;
  MediaType get type => throw _privateConstructorUsedError;
  ScoreFormat get selectedScoreFormat => throw _privateConstructorUsedError;
  UserTitleLanguage get selectedTitleLanguage =>
      throw _privateConstructorUsedError;
  UserStaffNameLanguage get selectedStaffNameLanguage =>
      throw _privateConstructorUsedError;
  bool get displayAdultContent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {ThemeSetting theme,
      MediaType type,
      ScoreFormat selectedScoreFormat,
      UserTitleLanguage selectedTitleLanguage,
      UserStaffNameLanguage selectedStaffNameLanguage,
      bool displayAdultContent});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? type = null,
    Object? selectedScoreFormat = null,
    Object? selectedTitleLanguage = null,
    Object? selectedStaffNameLanguage = null,
    Object? displayAdultContent = null,
  }) {
    return _then(_value.copyWith(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSetting,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      selectedScoreFormat: null == selectedScoreFormat
          ? _value.selectedScoreFormat
          : selectedScoreFormat // ignore: cast_nullable_to_non_nullable
              as ScoreFormat,
      selectedTitleLanguage: null == selectedTitleLanguage
          ? _value.selectedTitleLanguage
          : selectedTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
      selectedStaffNameLanguage: null == selectedStaffNameLanguage
          ? _value.selectedStaffNameLanguage
          : selectedStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeSetting theme,
      MediaType type,
      ScoreFormat selectedScoreFormat,
      UserTitleLanguage selectedTitleLanguage,
      UserStaffNameLanguage selectedStaffNameLanguage,
      bool displayAdultContent});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? type = null,
    Object? selectedScoreFormat = null,
    Object? selectedTitleLanguage = null,
    Object? selectedStaffNameLanguage = null,
    Object? displayAdultContent = null,
  }) {
    return _then(_$SettingsStateImpl(
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSetting,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      selectedScoreFormat: null == selectedScoreFormat
          ? _value.selectedScoreFormat
          : selectedScoreFormat // ignore: cast_nullable_to_non_nullable
              as ScoreFormat,
      selectedTitleLanguage: null == selectedTitleLanguage
          ? _value.selectedTitleLanguage
          : selectedTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
      selectedStaffNameLanguage: null == selectedStaffNameLanguage
          ? _value.selectedStaffNameLanguage
          : selectedStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  _$SettingsStateImpl(
      {this.theme = ThemeSetting.system,
      this.type = MediaType.anime,
      this.selectedScoreFormat = ScoreFormat.point100,
      this.selectedTitleLanguage = UserTitleLanguage.native,
      this.selectedStaffNameLanguage = UserStaffNameLanguage.native,
      this.displayAdultContent = false});

  @override
  @JsonKey()
  final ThemeSetting theme;
  @override
  @JsonKey()
  final MediaType type;
  @override
  @JsonKey()
  final ScoreFormat selectedScoreFormat;
  @override
  @JsonKey()
  final UserTitleLanguage selectedTitleLanguage;
  @override
  @JsonKey()
  final UserStaffNameLanguage selectedStaffNameLanguage;
  @override
  @JsonKey()
  final bool displayAdultContent;

  @override
  String toString() {
    return 'SettingsState(theme: $theme, type: $type, selectedScoreFormat: $selectedScoreFormat, selectedTitleLanguage: $selectedTitleLanguage, selectedStaffNameLanguage: $selectedStaffNameLanguage, displayAdultContent: $displayAdultContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.selectedScoreFormat, selectedScoreFormat) ||
                other.selectedScoreFormat == selectedScoreFormat) &&
            (identical(other.selectedTitleLanguage, selectedTitleLanguage) ||
                other.selectedTitleLanguage == selectedTitleLanguage) &&
            (identical(other.selectedStaffNameLanguage,
                    selectedStaffNameLanguage) ||
                other.selectedStaffNameLanguage == selectedStaffNameLanguage) &&
            (identical(other.displayAdultContent, displayAdultContent) ||
                other.displayAdultContent == displayAdultContent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme, type, selectedScoreFormat,
      selectedTitleLanguage, selectedStaffNameLanguage, displayAdultContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  factory _SettingsState(
      {final ThemeSetting theme,
      final MediaType type,
      final ScoreFormat selectedScoreFormat,
      final UserTitleLanguage selectedTitleLanguage,
      final UserStaffNameLanguage selectedStaffNameLanguage,
      final bool displayAdultContent}) = _$SettingsStateImpl;

  @override
  ThemeSetting get theme;
  @override
  MediaType get type;
  @override
  ScoreFormat get selectedScoreFormat;
  @override
  UserTitleLanguage get selectedTitleLanguage;
  @override
  UserStaffNameLanguage get selectedStaffNameLanguage;
  @override
  bool get displayAdultContent;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

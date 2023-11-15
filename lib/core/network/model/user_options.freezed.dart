// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserOptions _$UserOptionsFromJson(Map<String, dynamic> json) {
  return _UserOptions.fromJson(json);
}

/// @nodoc
mixin _$UserOptions {
  @JsonKey(name: 'titleLanguage')
  UserTitleLanguage? get titleLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayAdultContent')
  bool get displayAdultContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'airingNotifications')
  bool get airingNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileColor')
  String? get profileColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'activityMergeTime')
  int? get activityMergeTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOptionsCopyWith<UserOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOptionsCopyWith<$Res> {
  factory $UserOptionsCopyWith(
          UserOptions value, $Res Function(UserOptions) then) =
      _$UserOptionsCopyWithImpl<$Res, UserOptions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'titleLanguage') UserTitleLanguage? titleLanguage,
      @JsonKey(name: 'displayAdultContent') bool displayAdultContent,
      @JsonKey(name: 'airingNotifications') bool airingNotifications,
      @JsonKey(name: 'profileColor') String? profileColor,
      @JsonKey(name: 'activityMergeTime') int? activityMergeTime});
}

/// @nodoc
class _$UserOptionsCopyWithImpl<$Res, $Val extends UserOptions>
    implements $UserOptionsCopyWith<$Res> {
  _$UserOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleLanguage = freezed,
    Object? displayAdultContent = null,
    Object? airingNotifications = null,
    Object? profileColor = freezed,
    Object? activityMergeTime = freezed,
  }) {
    return _then(_value.copyWith(
      titleLanguage: freezed == titleLanguage
          ? _value.titleLanguage
          : titleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage?,
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
      airingNotifications: null == airingNotifications
          ? _value.airingNotifications
          : airingNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      profileColor: freezed == profileColor
          ? _value.profileColor
          : profileColor // ignore: cast_nullable_to_non_nullable
              as String?,
      activityMergeTime: freezed == activityMergeTime
          ? _value.activityMergeTime
          : activityMergeTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserOptionsCopyWith<$Res>
    implements $UserOptionsCopyWith<$Res> {
  factory _$$_UserOptionsCopyWith(
          _$_UserOptions value, $Res Function(_$_UserOptions) then) =
      __$$_UserOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'titleLanguage') UserTitleLanguage? titleLanguage,
      @JsonKey(name: 'displayAdultContent') bool displayAdultContent,
      @JsonKey(name: 'airingNotifications') bool airingNotifications,
      @JsonKey(name: 'profileColor') String? profileColor,
      @JsonKey(name: 'activityMergeTime') int? activityMergeTime});
}

/// @nodoc
class __$$_UserOptionsCopyWithImpl<$Res>
    extends _$UserOptionsCopyWithImpl<$Res, _$_UserOptions>
    implements _$$_UserOptionsCopyWith<$Res> {
  __$$_UserOptionsCopyWithImpl(
      _$_UserOptions _value, $Res Function(_$_UserOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleLanguage = freezed,
    Object? displayAdultContent = null,
    Object? airingNotifications = null,
    Object? profileColor = freezed,
    Object? activityMergeTime = freezed,
  }) {
    return _then(_$_UserOptions(
      titleLanguage: freezed == titleLanguage
          ? _value.titleLanguage
          : titleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage?,
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
      airingNotifications: null == airingNotifications
          ? _value.airingNotifications
          : airingNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      profileColor: freezed == profileColor
          ? _value.profileColor
          : profileColor // ignore: cast_nullable_to_non_nullable
              as String?,
      activityMergeTime: freezed == activityMergeTime
          ? _value.activityMergeTime
          : activityMergeTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserOptions implements _UserOptions {
  _$_UserOptions(
      {@JsonKey(name: 'titleLanguage') this.titleLanguage,
      @JsonKey(name: 'displayAdultContent') this.displayAdultContent = false,
      @JsonKey(name: 'airingNotifications') this.airingNotifications = false,
      @JsonKey(name: 'profileColor') this.profileColor,
      @JsonKey(name: 'activityMergeTime') this.activityMergeTime});

  factory _$_UserOptions.fromJson(Map<String, dynamic> json) =>
      _$$_UserOptionsFromJson(json);

  @override
  @JsonKey(name: 'titleLanguage')
  final UserTitleLanguage? titleLanguage;
  @override
  @JsonKey(name: 'displayAdultContent')
  final bool displayAdultContent;
  @override
  @JsonKey(name: 'airingNotifications')
  final bool airingNotifications;
  @override
  @JsonKey(name: 'profileColor')
  final String? profileColor;
  @override
  @JsonKey(name: 'activityMergeTime')
  final int? activityMergeTime;

  @override
  String toString() {
    return 'UserOptions(titleLanguage: $titleLanguage, displayAdultContent: $displayAdultContent, airingNotifications: $airingNotifications, profileColor: $profileColor, activityMergeTime: $activityMergeTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserOptions &&
            (identical(other.titleLanguage, titleLanguage) ||
                other.titleLanguage == titleLanguage) &&
            (identical(other.displayAdultContent, displayAdultContent) ||
                other.displayAdultContent == displayAdultContent) &&
            (identical(other.airingNotifications, airingNotifications) ||
                other.airingNotifications == airingNotifications) &&
            (identical(other.profileColor, profileColor) ||
                other.profileColor == profileColor) &&
            (identical(other.activityMergeTime, activityMergeTime) ||
                other.activityMergeTime == activityMergeTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      titleLanguage,
      displayAdultContent,
      airingNotifications,
      profileColor,
      activityMergeTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserOptionsCopyWith<_$_UserOptions> get copyWith =>
      __$$_UserOptionsCopyWithImpl<_$_UserOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserOptionsToJson(
      this,
    );
  }
}

abstract class _UserOptions implements UserOptions {
  factory _UserOptions(
      {@JsonKey(name: 'titleLanguage') final UserTitleLanguage? titleLanguage,
      @JsonKey(name: 'displayAdultContent') final bool displayAdultContent,
      @JsonKey(name: 'airingNotifications') final bool airingNotifications,
      @JsonKey(name: 'profileColor') final String? profileColor,
      @JsonKey(name: 'activityMergeTime')
      final int? activityMergeTime}) = _$_UserOptions;

  factory _UserOptions.fromJson(Map<String, dynamic> json) =
      _$_UserOptions.fromJson;

  @override
  @JsonKey(name: 'titleLanguage')
  UserTitleLanguage? get titleLanguage;
  @override
  @JsonKey(name: 'displayAdultContent')
  bool get displayAdultContent;
  @override
  @JsonKey(name: 'airingNotifications')
  bool get airingNotifications;
  @override
  @JsonKey(name: 'profileColor')
  String? get profileColor;
  @override
  @JsonKey(name: 'activityMergeTime')
  int? get activityMergeTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserOptionsCopyWith<_$_UserOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

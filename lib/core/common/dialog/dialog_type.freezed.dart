// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DialogType _$DialogTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'appUpdate':
      return AppUpdateDialog.fromJson(json);
    case 'appUpToDate':
      return AppUpToDateDialog.fromJson(json);
    case 'longPressGestureTutorial':
      return LongPressGestureTutorialDialog.fromJson(json);
    case 'slideGestureTutorial':
      return SlideGestureTutorialDialog.fromJson(json);
    case 'downloading':
      return DownloadingDialog.fromJson(json);
    case 'about':
      return AniFlowAboutDialog.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DialogType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DialogType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DialogType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogTypeCopyWith<$Res> {
  factory $DialogTypeCopyWith(
          DialogType value, $Res Function(DialogType) then) =
      _$DialogTypeCopyWithImpl<$Res, DialogType>;
}

/// @nodoc
class _$DialogTypeCopyWithImpl<$Res, $Val extends DialogType>
    implements $DialogTypeCopyWith<$Res> {
  _$DialogTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AppUpdateDialogImplCopyWith<$Res> {
  factory _$$AppUpdateDialogImplCopyWith(_$AppUpdateDialogImpl value,
          $Res Function(_$AppUpdateDialogImpl) then) =
      __$$AppUpdateDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@DialogTypeJsonConverter() String appVersion});
}

/// @nodoc
class __$$AppUpdateDialogImplCopyWithImpl<$Res>
    extends _$DialogTypeCopyWithImpl<$Res, _$AppUpdateDialogImpl>
    implements _$$AppUpdateDialogImplCopyWith<$Res> {
  __$$AppUpdateDialogImplCopyWithImpl(
      _$AppUpdateDialogImpl _value, $Res Function(_$AppUpdateDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
  }) {
    return _then(_$AppUpdateDialogImpl(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUpdateDialogImpl implements AppUpdateDialog {
  const _$AppUpdateDialogImpl(
      {@DialogTypeJsonConverter() required this.appVersion,
      final String? $type})
      : $type = $type ?? 'appUpdate';

  factory _$AppUpdateDialogImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpdateDialogImplFromJson(json);

  @override
  @DialogTypeJsonConverter()
  final String appVersion;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DialogType.appUpdate(appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateDialogImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appVersion);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateDialogImplCopyWith<_$AppUpdateDialogImpl> get copyWith =>
      __$$AppUpdateDialogImplCopyWithImpl<_$AppUpdateDialogImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) {
    return appUpdate(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) {
    return appUpdate?.call(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) {
    if (appUpdate != null) {
      return appUpdate(appVersion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) {
    return appUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) {
    return appUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) {
    if (appUpdate != null) {
      return appUpdate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpdateDialogImplToJson(
      this,
    );
  }
}

abstract class AppUpdateDialog implements DialogType, MessageDialog {
  const factory AppUpdateDialog(
          {@DialogTypeJsonConverter() required final String appVersion}) =
      _$AppUpdateDialogImpl;

  factory AppUpdateDialog.fromJson(Map<String, dynamic> json) =
      _$AppUpdateDialogImpl.fromJson;

  @DialogTypeJsonConverter()
  String get appVersion;

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUpdateDialogImplCopyWith<_$AppUpdateDialogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppUpToDateDialogImplCopyWith<$Res> {
  factory _$$AppUpToDateDialogImplCopyWith(_$AppUpToDateDialogImpl value,
          $Res Function(_$AppUpToDateDialogImpl) then) =
      __$$AppUpToDateDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppUpToDateDialogImplCopyWithImpl<$Res>
    extends _$DialogTypeCopyWithImpl<$Res, _$AppUpToDateDialogImpl>
    implements _$$AppUpToDateDialogImplCopyWith<$Res> {
  __$$AppUpToDateDialogImplCopyWithImpl(_$AppUpToDateDialogImpl _value,
      $Res Function(_$AppUpToDateDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AppUpToDateDialogImpl implements AppUpToDateDialog {
  const _$AppUpToDateDialogImpl({final String? $type})
      : $type = $type ?? 'appUpToDate';

  factory _$AppUpToDateDialogImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpToDateDialogImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DialogType.appUpToDate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppUpToDateDialogImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) {
    return appUpToDate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) {
    return appUpToDate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) {
    if (appUpToDate != null) {
      return appUpToDate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) {
    return appUpToDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) {
    return appUpToDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) {
    if (appUpToDate != null) {
      return appUpToDate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpToDateDialogImplToJson(
      this,
    );
  }
}

abstract class AppUpToDateDialog implements DialogType, MessageDialog {
  const factory AppUpToDateDialog() = _$AppUpToDateDialogImpl;

  factory AppUpToDateDialog.fromJson(Map<String, dynamic> json) =
      _$AppUpToDateDialogImpl.fromJson;
}

/// @nodoc
abstract class _$$LongPressGestureTutorialDialogImplCopyWith<$Res> {
  factory _$$LongPressGestureTutorialDialogImplCopyWith(
          _$LongPressGestureTutorialDialogImpl value,
          $Res Function(_$LongPressGestureTutorialDialogImpl) then) =
      __$$LongPressGestureTutorialDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LongPressGestureTutorialDialogImplCopyWithImpl<$Res>
    extends _$DialogTypeCopyWithImpl<$Res, _$LongPressGestureTutorialDialogImpl>
    implements _$$LongPressGestureTutorialDialogImplCopyWith<$Res> {
  __$$LongPressGestureTutorialDialogImplCopyWithImpl(
      _$LongPressGestureTutorialDialogImpl _value,
      $Res Function(_$LongPressGestureTutorialDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$LongPressGestureTutorialDialogImpl
    implements LongPressGestureTutorialDialog {
  const _$LongPressGestureTutorialDialogImpl({final String? $type})
      : $type = $type ?? 'longPressGestureTutorial';

  factory _$LongPressGestureTutorialDialogImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LongPressGestureTutorialDialogImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DialogType.longPressGestureTutorial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongPressGestureTutorialDialogImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) {
    return longPressGestureTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) {
    return longPressGestureTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) {
    if (longPressGestureTutorial != null) {
      return longPressGestureTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) {
    return longPressGestureTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) {
    return longPressGestureTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) {
    if (longPressGestureTutorial != null) {
      return longPressGestureTutorial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LongPressGestureTutorialDialogImplToJson(
      this,
    );
  }
}

abstract class LongPressGestureTutorialDialog
    implements DialogType, TutorialDialog {
  const factory LongPressGestureTutorialDialog() =
      _$LongPressGestureTutorialDialogImpl;

  factory LongPressGestureTutorialDialog.fromJson(Map<String, dynamic> json) =
      _$LongPressGestureTutorialDialogImpl.fromJson;
}

/// @nodoc
abstract class _$$SlideGestureTutorialDialogImplCopyWith<$Res> {
  factory _$$SlideGestureTutorialDialogImplCopyWith(
          _$SlideGestureTutorialDialogImpl value,
          $Res Function(_$SlideGestureTutorialDialogImpl) then) =
      __$$SlideGestureTutorialDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SlideGestureTutorialDialogImplCopyWithImpl<$Res>
    extends _$DialogTypeCopyWithImpl<$Res, _$SlideGestureTutorialDialogImpl>
    implements _$$SlideGestureTutorialDialogImplCopyWith<$Res> {
  __$$SlideGestureTutorialDialogImplCopyWithImpl(
      _$SlideGestureTutorialDialogImpl _value,
      $Res Function(_$SlideGestureTutorialDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SlideGestureTutorialDialogImpl implements SlideGestureTutorialDialog {
  const _$SlideGestureTutorialDialogImpl({final String? $type})
      : $type = $type ?? 'slideGestureTutorial';

  factory _$SlideGestureTutorialDialogImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SlideGestureTutorialDialogImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DialogType.slideGestureTutorial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlideGestureTutorialDialogImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) {
    return slideGestureTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) {
    return slideGestureTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) {
    if (slideGestureTutorial != null) {
      return slideGestureTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) {
    return slideGestureTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) {
    return slideGestureTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) {
    if (slideGestureTutorial != null) {
      return slideGestureTutorial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SlideGestureTutorialDialogImplToJson(
      this,
    );
  }
}

abstract class SlideGestureTutorialDialog
    implements DialogType, TutorialDialog {
  const factory SlideGestureTutorialDialog() = _$SlideGestureTutorialDialogImpl;

  factory SlideGestureTutorialDialog.fromJson(Map<String, dynamic> json) =
      _$SlideGestureTutorialDialogImpl.fromJson;
}

/// @nodoc
abstract class _$$DownloadingDialogImplCopyWith<$Res> {
  factory _$$DownloadingDialogImplCopyWith(_$DownloadingDialogImpl value,
          $Res Function(_$DownloadingDialogImpl) then) =
      __$$DownloadingDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String downloadUrl, String savePath});
}

/// @nodoc
class __$$DownloadingDialogImplCopyWithImpl<$Res>
    extends _$DialogTypeCopyWithImpl<$Res, _$DownloadingDialogImpl>
    implements _$$DownloadingDialogImplCopyWith<$Res> {
  __$$DownloadingDialogImplCopyWithImpl(_$DownloadingDialogImpl _value,
      $Res Function(_$DownloadingDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = null,
    Object? savePath = null,
  }) {
    return _then(_$DownloadingDialogImpl(
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      savePath: null == savePath
          ? _value.savePath
          : savePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadingDialogImpl implements DownloadingDialog {
  const _$DownloadingDialogImpl(
      {required this.downloadUrl, required this.savePath, final String? $type})
      : $type = $type ?? 'downloading';

  factory _$DownloadingDialogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadingDialogImplFromJson(json);

  @override
  final String downloadUrl;
  @override
  final String savePath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DialogType.downloading(downloadUrl: $downloadUrl, savePath: $savePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadingDialogImpl &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.savePath, savePath) ||
                other.savePath == savePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, downloadUrl, savePath);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadingDialogImplCopyWith<_$DownloadingDialogImpl> get copyWith =>
      __$$DownloadingDialogImplCopyWithImpl<_$DownloadingDialogImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) {
    return downloading(downloadUrl, savePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) {
    return downloading?.call(downloadUrl, savePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(downloadUrl, savePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadingDialogImplToJson(
      this,
    );
  }
}

abstract class DownloadingDialog implements DialogType {
  const factory DownloadingDialog(
      {required final String downloadUrl,
      required final String savePath}) = _$DownloadingDialogImpl;

  factory DownloadingDialog.fromJson(Map<String, dynamic> json) =
      _$DownloadingDialogImpl.fromJson;

  String get downloadUrl;
  String get savePath;

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadingDialogImplCopyWith<_$DownloadingDialogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AniFlowAboutDialogImplCopyWith<$Res> {
  factory _$$AniFlowAboutDialogImplCopyWith(_$AniFlowAboutDialogImpl value,
          $Res Function(_$AniFlowAboutDialogImpl) then) =
      __$$AniFlowAboutDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String appVersion});
}

/// @nodoc
class __$$AniFlowAboutDialogImplCopyWithImpl<$Res>
    extends _$DialogTypeCopyWithImpl<$Res, _$AniFlowAboutDialogImpl>
    implements _$$AniFlowAboutDialogImplCopyWith<$Res> {
  __$$AniFlowAboutDialogImplCopyWithImpl(_$AniFlowAboutDialogImpl _value,
      $Res Function(_$AniFlowAboutDialogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
  }) {
    return _then(_$AniFlowAboutDialogImpl(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AniFlowAboutDialogImpl implements AniFlowAboutDialog {
  const _$AniFlowAboutDialogImpl(
      {required this.appVersion, final String? $type})
      : $type = $type ?? 'about';

  factory _$AniFlowAboutDialogImpl.fromJson(Map<String, dynamic> json) =>
      _$$AniFlowAboutDialogImplFromJson(json);

  @override
  final String appVersion;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DialogType.about(appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AniFlowAboutDialogImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appVersion);

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AniFlowAboutDialogImplCopyWith<_$AniFlowAboutDialogImpl> get copyWith =>
      __$$AniFlowAboutDialogImplCopyWithImpl<_$AniFlowAboutDialogImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@DialogTypeJsonConverter() String appVersion)
        appUpdate,
    required TResult Function() appUpToDate,
    required TResult Function() longPressGestureTutorial,
    required TResult Function() slideGestureTutorial,
    required TResult Function(String downloadUrl, String savePath) downloading,
    required TResult Function(String appVersion) about,
  }) {
    return about(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult? Function()? appUpToDate,
    TResult? Function()? longPressGestureTutorial,
    TResult? Function()? slideGestureTutorial,
    TResult? Function(String downloadUrl, String savePath)? downloading,
    TResult? Function(String appVersion)? about,
  }) {
    return about?.call(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@DialogTypeJsonConverter() String appVersion)? appUpdate,
    TResult Function()? appUpToDate,
    TResult Function()? longPressGestureTutorial,
    TResult Function()? slideGestureTutorial,
    TResult Function(String downloadUrl, String savePath)? downloading,
    TResult Function(String appVersion)? about,
    required TResult orElse(),
  }) {
    if (about != null) {
      return about(appVersion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppUpdateDialog value) appUpdate,
    required TResult Function(AppUpToDateDialog value) appUpToDate,
    required TResult Function(LongPressGestureTutorialDialog value)
        longPressGestureTutorial,
    required TResult Function(SlideGestureTutorialDialog value)
        slideGestureTutorial,
    required TResult Function(DownloadingDialog value) downloading,
    required TResult Function(AniFlowAboutDialog value) about,
  }) {
    return about(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppUpdateDialog value)? appUpdate,
    TResult? Function(AppUpToDateDialog value)? appUpToDate,
    TResult? Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult? Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult? Function(DownloadingDialog value)? downloading,
    TResult? Function(AniFlowAboutDialog value)? about,
  }) {
    return about?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppUpdateDialog value)? appUpdate,
    TResult Function(AppUpToDateDialog value)? appUpToDate,
    TResult Function(LongPressGestureTutorialDialog value)?
        longPressGestureTutorial,
    TResult Function(SlideGestureTutorialDialog value)? slideGestureTutorial,
    TResult Function(DownloadingDialog value)? downloading,
    TResult Function(AniFlowAboutDialog value)? about,
    required TResult orElse(),
  }) {
    if (about != null) {
      return about(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AniFlowAboutDialogImplToJson(
      this,
    );
  }
}

abstract class AniFlowAboutDialog implements DialogType {
  const factory AniFlowAboutDialog({required final String appVersion}) =
      _$AniFlowAboutDialogImpl;

  factory AniFlowAboutDialog.fromJson(Map<String, dynamic> json) =
      _$AniFlowAboutDialogImpl.fromJson;

  String get appVersion;

  /// Create a copy of DialogType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AniFlowAboutDialogImplCopyWith<_$AniFlowAboutDialogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

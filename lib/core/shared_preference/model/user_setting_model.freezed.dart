// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSettingModel {
  bool get displayAdultContent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSettingModelCopyWith<UserSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingModelCopyWith<$Res> {
  factory $UserSettingModelCopyWith(
          UserSettingModel value, $Res Function(UserSettingModel) then) =
      _$UserSettingModelCopyWithImpl<$Res, UserSettingModel>;
  @useResult
  $Res call({bool displayAdultContent});
}

/// @nodoc
class _$UserSettingModelCopyWithImpl<$Res, $Val extends UserSettingModel>
    implements $UserSettingModelCopyWith<$Res> {
  _$UserSettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayAdultContent = null,
  }) {
    return _then(_value.copyWith(
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSettingModelCopyWith<$Res>
    implements $UserSettingModelCopyWith<$Res> {
  factory _$$_UserSettingModelCopyWith(
          _$_UserSettingModel value, $Res Function(_$_UserSettingModel) then) =
      __$$_UserSettingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool displayAdultContent});
}

/// @nodoc
class __$$_UserSettingModelCopyWithImpl<$Res>
    extends _$UserSettingModelCopyWithImpl<$Res, _$_UserSettingModel>
    implements _$$_UserSettingModelCopyWith<$Res> {
  __$$_UserSettingModelCopyWithImpl(
      _$_UserSettingModel _value, $Res Function(_$_UserSettingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayAdultContent = null,
  }) {
    return _then(_$_UserSettingModel(
      displayAdultContent: null == displayAdultContent
          ? _value.displayAdultContent
          : displayAdultContent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserSettingModel implements _UserSettingModel {
  _$_UserSettingModel({this.displayAdultContent = false});

  @override
  @JsonKey()
  final bool displayAdultContent;

  @override
  String toString() {
    return 'UserSettingModel(displayAdultContent: $displayAdultContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSettingModel &&
            (identical(other.displayAdultContent, displayAdultContent) ||
                other.displayAdultContent == displayAdultContent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayAdultContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSettingModelCopyWith<_$_UserSettingModel> get copyWith =>
      __$$_UserSettingModelCopyWithImpl<_$_UserSettingModel>(this, _$identity);
}

abstract class _UserSettingModel implements UserSettingModel {
  factory _UserSettingModel({final bool displayAdultContent}) =
      _$_UserSettingModel;

  @override
  bool get displayAdultContent;
  @override
  @JsonKey(ignore: true)
  _$$_UserSettingModelCopyWith<_$_UserSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

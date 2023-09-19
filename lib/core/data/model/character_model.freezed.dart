// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterModel {
  String get id => throw _privateConstructorUsedError;
  CharacterRole get role => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get nameEnglish => throw _privateConstructorUsedError;
  String get nameNative => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
          CharacterModel value, $Res Function(CharacterModel) then) =
      _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call(
      {String id,
      CharacterRole role,
      String image,
      String nameEnglish,
      String nameNative});
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? image = null,
    Object? nameEnglish = null,
    Object? nameNative = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CharacterRole,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      nameEnglish: null == nameEnglish
          ? _value.nameEnglish
          : nameEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      nameNative: null == nameNative
          ? _value.nameNative
          : nameNative // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterModelCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$_CharacterModelCopyWith(
          _$_CharacterModel value, $Res Function(_$_CharacterModel) then) =
      __$$_CharacterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      CharacterRole role,
      String image,
      String nameEnglish,
      String nameNative});
}

/// @nodoc
class __$$_CharacterModelCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$_CharacterModel>
    implements _$$_CharacterModelCopyWith<$Res> {
  __$$_CharacterModelCopyWithImpl(
      _$_CharacterModel _value, $Res Function(_$_CharacterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? image = null,
    Object? nameEnglish = null,
    Object? nameNative = null,
  }) {
    return _then(_$_CharacterModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CharacterRole,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      nameEnglish: null == nameEnglish
          ? _value.nameEnglish
          : nameEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      nameNative: null == nameNative
          ? _value.nameNative
          : nameNative // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CharacterModel implements _CharacterModel {
  _$_CharacterModel(
      {this.id = '',
      this.role = CharacterRole.background,
      this.image = '',
      this.nameEnglish = '',
      this.nameNative = ''});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final CharacterRole role;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String nameEnglish;
  @override
  @JsonKey()
  final String nameNative;

  @override
  String toString() {
    return 'CharacterModel(id: $id, role: $role, image: $image, nameEnglish: $nameEnglish, nameNative: $nameNative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.nameEnglish, nameEnglish) ||
                other.nameEnglish == nameEnglish) &&
            (identical(other.nameNative, nameNative) ||
                other.nameNative == nameNative));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, role, image, nameEnglish, nameNative);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterModelCopyWith<_$_CharacterModel> get copyWith =>
      __$$_CharacterModelCopyWithImpl<_$_CharacterModel>(this, _$identity);
}

abstract class _CharacterModel implements CharacterModel {
  factory _CharacterModel(
      {final String id,
      final CharacterRole role,
      final String image,
      final String nameEnglish,
      final String nameNative}) = _$_CharacterModel;

  @override
  String get id;
  @override
  CharacterRole get role;
  @override
  String get image;
  @override
  String get nameEnglish;
  @override
  String get nameNative;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterModelCopyWith<_$_CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

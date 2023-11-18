// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StaffModel {
  String get id => throw _privateConstructorUsedError;
  String get voiceActorId => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get nameEnglish => throw _privateConstructorUsedError;
  String get nameNative => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StaffModelCopyWith<StaffModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffModelCopyWith<$Res> {
  factory $StaffModelCopyWith(
          StaffModel value, $Res Function(StaffModel) then) =
      _$StaffModelCopyWithImpl<$Res, StaffModel>;
  @useResult
  $Res call(
      {String id,
      String voiceActorId,
      String image,
      String nameEnglish,
      String nameNative});
}

/// @nodoc
class _$StaffModelCopyWithImpl<$Res, $Val extends StaffModel>
    implements $StaffModelCopyWith<$Res> {
  _$StaffModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voiceActorId = null,
    Object? image = null,
    Object? nameEnglish = null,
    Object? nameNative = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voiceActorId: null == voiceActorId
          ? _value.voiceActorId
          : voiceActorId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$StaffModelImplCopyWith<$Res>
    implements $StaffModelCopyWith<$Res> {
  factory _$$StaffModelImplCopyWith(
          _$StaffModelImpl value, $Res Function(_$StaffModelImpl) then) =
      __$$StaffModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String voiceActorId,
      String image,
      String nameEnglish,
      String nameNative});
}

/// @nodoc
class __$$StaffModelImplCopyWithImpl<$Res>
    extends _$StaffModelCopyWithImpl<$Res, _$StaffModelImpl>
    implements _$$StaffModelImplCopyWith<$Res> {
  __$$StaffModelImplCopyWithImpl(
      _$StaffModelImpl _value, $Res Function(_$StaffModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voiceActorId = null,
    Object? image = null,
    Object? nameEnglish = null,
    Object? nameNative = null,
  }) {
    return _then(_$StaffModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voiceActorId: null == voiceActorId
          ? _value.voiceActorId
          : voiceActorId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$StaffModelImpl implements _StaffModel {
  _$StaffModelImpl(
      {this.id = '',
      this.voiceActorId = '',
      this.image = '',
      this.nameEnglish = '',
      this.nameNative = ''});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String voiceActorId;
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
    return 'StaffModel(id: $id, voiceActorId: $voiceActorId, image: $image, nameEnglish: $nameEnglish, nameNative: $nameNative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.voiceActorId, voiceActorId) ||
                other.voiceActorId == voiceActorId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.nameEnglish, nameEnglish) ||
                other.nameEnglish == nameEnglish) &&
            (identical(other.nameNative, nameNative) ||
                other.nameNative == nameNative));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, voiceActorId, image, nameEnglish, nameNative);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      __$$StaffModelImplCopyWithImpl<_$StaffModelImpl>(this, _$identity);
}

abstract class _StaffModel implements StaffModel {
  factory _StaffModel(
      {final String id,
      final String voiceActorId,
      final String image,
      final String nameEnglish,
      final String nameNative}) = _$StaffModelImpl;

  @override
  String get id;
  @override
  String get voiceActorId;
  @override
  String get image;
  @override
  String get nameEnglish;
  @override
  String get nameNative;
  @override
  @JsonKey(ignore: true)
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

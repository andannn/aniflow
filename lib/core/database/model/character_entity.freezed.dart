// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterEntity _$CharacterEntityFromJson(Map<String, dynamic> json) {
  return _CharacterEntity.fromJson(json);
}

/// @nodoc
mixin _$CharacterEntity {
  @JsonKey(name: CharacterColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: CharacterColumns.image)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: CharacterColumns.nameEnglish)
  String? get nameEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: CharacterColumns.nameNative)
  String? get nameNative => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterEntityCopyWith<CharacterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterEntityCopyWith<$Res> {
  factory $CharacterEntityCopyWith(
          CharacterEntity value, $Res Function(CharacterEntity) then) =
      _$CharacterEntityCopyWithImpl<$Res, CharacterEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: CharacterColumns.id) String id,
      @JsonKey(name: CharacterColumns.image) String? image,
      @JsonKey(name: CharacterColumns.nameEnglish) String? nameEnglish,
      @JsonKey(name: CharacterColumns.nameNative) String? nameNative});
}

/// @nodoc
class _$CharacterEntityCopyWithImpl<$Res, $Val extends CharacterEntity>
    implements $CharacterEntityCopyWith<$Res> {
  _$CharacterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? nameEnglish = freezed,
    Object? nameNative = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEnglish: freezed == nameEnglish
          ? _value.nameEnglish
          : nameEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      nameNative: freezed == nameNative
          ? _value.nameNative
          : nameNative // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterEntityCopyWith<$Res>
    implements $CharacterEntityCopyWith<$Res> {
  factory _$$_CharacterEntityCopyWith(
          _$_CharacterEntity value, $Res Function(_$_CharacterEntity) then) =
      __$$_CharacterEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: CharacterColumns.id) String id,
      @JsonKey(name: CharacterColumns.image) String? image,
      @JsonKey(name: CharacterColumns.nameEnglish) String? nameEnglish,
      @JsonKey(name: CharacterColumns.nameNative) String? nameNative});
}

/// @nodoc
class __$$_CharacterEntityCopyWithImpl<$Res>
    extends _$CharacterEntityCopyWithImpl<$Res, _$_CharacterEntity>
    implements _$$_CharacterEntityCopyWith<$Res> {
  __$$_CharacterEntityCopyWithImpl(
      _$_CharacterEntity _value, $Res Function(_$_CharacterEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? nameEnglish = freezed,
    Object? nameNative = freezed,
  }) {
    return _then(_$_CharacterEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEnglish: freezed == nameEnglish
          ? _value.nameEnglish
          : nameEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      nameNative: freezed == nameNative
          ? _value.nameNative
          : nameNative // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterEntity implements _CharacterEntity {
  _$_CharacterEntity(
      {@JsonKey(name: CharacterColumns.id) this.id = '',
      @JsonKey(name: CharacterColumns.image) this.image = '',
      @JsonKey(name: CharacterColumns.nameEnglish) this.nameEnglish,
      @JsonKey(name: CharacterColumns.nameNative) this.nameNative});

  factory _$_CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterEntityFromJson(json);

  @override
  @JsonKey(name: CharacterColumns.id)
  final String id;
  @override
  @JsonKey(name: CharacterColumns.image)
  final String? image;
  @override
  @JsonKey(name: CharacterColumns.nameEnglish)
  final String? nameEnglish;
  @override
  @JsonKey(name: CharacterColumns.nameNative)
  final String? nameNative;

  @override
  String toString() {
    return 'CharacterEntity(id: $id, image: $image, nameEnglish: $nameEnglish, nameNative: $nameNative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.nameEnglish, nameEnglish) ||
                other.nameEnglish == nameEnglish) &&
            (identical(other.nameNative, nameNative) ||
                other.nameNative == nameNative));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image, nameEnglish, nameNative);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterEntityCopyWith<_$_CharacterEntity> get copyWith =>
      __$$_CharacterEntityCopyWithImpl<_$_CharacterEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterEntityToJson(
      this,
    );
  }
}

abstract class _CharacterEntity implements CharacterEntity {
  factory _CharacterEntity(
      {@JsonKey(name: CharacterColumns.id) final String id,
      @JsonKey(name: CharacterColumns.image) final String? image,
      @JsonKey(name: CharacterColumns.nameEnglish) final String? nameEnglish,
      @JsonKey(name: CharacterColumns.nameNative)
      final String? nameNative}) = _$_CharacterEntity;

  factory _CharacterEntity.fromJson(Map<String, dynamic> json) =
      _$_CharacterEntity.fromJson;

  @override
  @JsonKey(name: CharacterColumns.id)
  String get id;
  @override
  @JsonKey(name: CharacterColumns.image)
  String? get image;
  @override
  @JsonKey(name: CharacterColumns.nameEnglish)
  String? get nameEnglish;
  @override
  @JsonKey(name: CharacterColumns.nameNative)
  String? get nameNative;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterEntityCopyWith<_$_CharacterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

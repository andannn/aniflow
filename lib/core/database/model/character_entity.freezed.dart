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
  @JsonKey(name: CharacterColumns.name)
  String? get name => throw _privateConstructorUsedError;

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
      @JsonKey(name: CharacterColumns.name) String? name});
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
    Object? name = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterEntityImplCopyWith<$Res>
    implements $CharacterEntityCopyWith<$Res> {
  factory _$$CharacterEntityImplCopyWith(_$CharacterEntityImpl value,
          $Res Function(_$CharacterEntityImpl) then) =
      __$$CharacterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: CharacterColumns.id) String id,
      @JsonKey(name: CharacterColumns.image) String? image,
      @JsonKey(name: CharacterColumns.name) String? name});
}

/// @nodoc
class __$$CharacterEntityImplCopyWithImpl<$Res>
    extends _$CharacterEntityCopyWithImpl<$Res, _$CharacterEntityImpl>
    implements _$$CharacterEntityImplCopyWith<$Res> {
  __$$CharacterEntityImplCopyWithImpl(
      _$CharacterEntityImpl _value, $Res Function(_$CharacterEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_$CharacterEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterEntityImpl implements _CharacterEntity {
  _$CharacterEntityImpl(
      {@JsonKey(name: CharacterColumns.id) this.id = '',
      @JsonKey(name: CharacterColumns.image) this.image = '',
      @JsonKey(name: CharacterColumns.name) this.name});

  factory _$CharacterEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterEntityImplFromJson(json);

  @override
  @JsonKey(name: CharacterColumns.id)
  final String id;
  @override
  @JsonKey(name: CharacterColumns.image)
  final String? image;
  @override
  @JsonKey(name: CharacterColumns.name)
  final String? name;

  @override
  String toString() {
    return 'CharacterEntity(id: $id, image: $image, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterEntityImplCopyWith<_$CharacterEntityImpl> get copyWith =>
      __$$CharacterEntityImplCopyWithImpl<_$CharacterEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterEntityImplToJson(
      this,
    );
  }
}

abstract class _CharacterEntity implements CharacterEntity {
  factory _CharacterEntity(
          {@JsonKey(name: CharacterColumns.id) final String id,
          @JsonKey(name: CharacterColumns.image) final String? image,
          @JsonKey(name: CharacterColumns.name) final String? name}) =
      _$CharacterEntityImpl;

  factory _CharacterEntity.fromJson(Map<String, dynamic> json) =
      _$CharacterEntityImpl.fromJson;

  @override
  @JsonKey(name: CharacterColumns.id)
  String get id;
  @override
  @JsonKey(name: CharacterColumns.image)
  String? get image;
  @override
  @JsonKey(name: CharacterColumns.name)
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$CharacterEntityImplCopyWith<_$CharacterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

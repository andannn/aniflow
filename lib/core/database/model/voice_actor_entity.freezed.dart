// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_actor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VoiceActorEntity _$VoiceActorEntityFromJson(Map<String, dynamic> json) {
  return _VoiceActorEntity.fromJson(json);
}

/// @nodoc
mixin _$VoiceActorEntity {
  @JsonKey(name: VoiceActorColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: VoiceActorColumns.image)
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: VoiceActorColumns.nameEnglish)
  String get nameEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: VoiceActorColumns.nameNative)
  String get nameNative => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoiceActorEntityCopyWith<VoiceActorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceActorEntityCopyWith<$Res> {
  factory $VoiceActorEntityCopyWith(
          VoiceActorEntity value, $Res Function(VoiceActorEntity) then) =
      _$VoiceActorEntityCopyWithImpl<$Res, VoiceActorEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: VoiceActorColumns.id) String id,
      @JsonKey(name: VoiceActorColumns.image) String image,
      @JsonKey(name: VoiceActorColumns.nameEnglish) String nameEnglish,
      @JsonKey(name: VoiceActorColumns.nameNative) String nameNative});
}

/// @nodoc
class _$VoiceActorEntityCopyWithImpl<$Res, $Val extends VoiceActorEntity>
    implements $VoiceActorEntityCopyWith<$Res> {
  _$VoiceActorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? nameEnglish = null,
    Object? nameNative = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_VoiceActorEntityCopyWith<$Res>
    implements $VoiceActorEntityCopyWith<$Res> {
  factory _$$_VoiceActorEntityCopyWith(
          _$_VoiceActorEntity value, $Res Function(_$_VoiceActorEntity) then) =
      __$$_VoiceActorEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: VoiceActorColumns.id) String id,
      @JsonKey(name: VoiceActorColumns.image) String image,
      @JsonKey(name: VoiceActorColumns.nameEnglish) String nameEnglish,
      @JsonKey(name: VoiceActorColumns.nameNative) String nameNative});
}

/// @nodoc
class __$$_VoiceActorEntityCopyWithImpl<$Res>
    extends _$VoiceActorEntityCopyWithImpl<$Res, _$_VoiceActorEntity>
    implements _$$_VoiceActorEntityCopyWith<$Res> {
  __$$_VoiceActorEntityCopyWithImpl(
      _$_VoiceActorEntity _value, $Res Function(_$_VoiceActorEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? nameEnglish = null,
    Object? nameNative = null,
  }) {
    return _then(_$_VoiceActorEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$_VoiceActorEntity implements _VoiceActorEntity {
  _$_VoiceActorEntity(
      {@JsonKey(name: VoiceActorColumns.id) this.id = '',
      @JsonKey(name: VoiceActorColumns.image) this.image = '',
      @JsonKey(name: VoiceActorColumns.nameEnglish) this.nameEnglish = '',
      @JsonKey(name: VoiceActorColumns.nameNative) this.nameNative = ''});

  factory _$_VoiceActorEntity.fromJson(Map<String, dynamic> json) =>
      _$$_VoiceActorEntityFromJson(json);

  @override
  @JsonKey(name: VoiceActorColumns.id)
  final String id;
  @override
  @JsonKey(name: VoiceActorColumns.image)
  final String image;
  @override
  @JsonKey(name: VoiceActorColumns.nameEnglish)
  final String nameEnglish;
  @override
  @JsonKey(name: VoiceActorColumns.nameNative)
  final String nameNative;

  @override
  String toString() {
    return 'VoiceActorEntity(id: $id, image: $image, nameEnglish: $nameEnglish, nameNative: $nameNative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoiceActorEntity &&
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
  _$$_VoiceActorEntityCopyWith<_$_VoiceActorEntity> get copyWith =>
      __$$_VoiceActorEntityCopyWithImpl<_$_VoiceActorEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VoiceActorEntityToJson(
      this,
    );
  }
}

abstract class _VoiceActorEntity implements VoiceActorEntity {
  factory _VoiceActorEntity(
      {@JsonKey(name: VoiceActorColumns.id) final String id,
      @JsonKey(name: VoiceActorColumns.image) final String image,
      @JsonKey(name: VoiceActorColumns.nameEnglish) final String nameEnglish,
      @JsonKey(name: VoiceActorColumns.nameNative)
      final String nameNative}) = _$_VoiceActorEntity;

  factory _VoiceActorEntity.fromJson(Map<String, dynamic> json) =
      _$_VoiceActorEntity.fromJson;

  @override
  @JsonKey(name: VoiceActorColumns.id)
  String get id;
  @override
  @JsonKey(name: VoiceActorColumns.image)
  String get image;
  @override
  @JsonKey(name: VoiceActorColumns.nameEnglish)
  String get nameEnglish;
  @override
  @JsonKey(name: VoiceActorColumns.nameNative)
  String get nameNative;
  @override
  @JsonKey(ignore: true)
  _$$_VoiceActorEntityCopyWith<_$_VoiceActorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffEntity _$StaffEntityFromJson(Map<String, dynamic> json) {
  return _StaffEntity.fromJson(json);
}

/// @nodoc
mixin _$StaffEntity {
  @JsonKey(name: StaffColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.image)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.nameEnglish)
  String? get nameEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.nameNative)
  String? get nameNative => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffEntityCopyWith<StaffEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffEntityCopyWith<$Res> {
  factory $StaffEntityCopyWith(
          StaffEntity value, $Res Function(StaffEntity) then) =
      _$StaffEntityCopyWithImpl<$Res, StaffEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: StaffColumns.id) String id,
      @JsonKey(name: StaffColumns.image) String? image,
      @JsonKey(name: StaffColumns.nameEnglish) String? nameEnglish,
      @JsonKey(name: StaffColumns.nameNative) String? nameNative});
}

/// @nodoc
class _$StaffEntityCopyWithImpl<$Res, $Val extends StaffEntity>
    implements $StaffEntityCopyWith<$Res> {
  _$StaffEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_StaffEntityCopyWith<$Res>
    implements $StaffEntityCopyWith<$Res> {
  factory _$$_StaffEntityCopyWith(
          _$_StaffEntity value, $Res Function(_$_StaffEntity) then) =
      __$$_StaffEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: StaffColumns.id) String id,
      @JsonKey(name: StaffColumns.image) String? image,
      @JsonKey(name: StaffColumns.nameEnglish) String? nameEnglish,
      @JsonKey(name: StaffColumns.nameNative) String? nameNative});
}

/// @nodoc
class __$$_StaffEntityCopyWithImpl<$Res>
    extends _$StaffEntityCopyWithImpl<$Res, _$_StaffEntity>
    implements _$$_StaffEntityCopyWith<$Res> {
  __$$_StaffEntityCopyWithImpl(
      _$_StaffEntity _value, $Res Function(_$_StaffEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? nameEnglish = freezed,
    Object? nameNative = freezed,
  }) {
    return _then(_$_StaffEntity(
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
class _$_StaffEntity implements _StaffEntity {
  _$_StaffEntity(
      {@JsonKey(name: StaffColumns.id) this.id = '',
      @JsonKey(name: StaffColumns.image) this.image,
      @JsonKey(name: StaffColumns.nameEnglish) this.nameEnglish,
      @JsonKey(name: StaffColumns.nameNative) this.nameNative});

  factory _$_StaffEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StaffEntityFromJson(json);

  @override
  @JsonKey(name: StaffColumns.id)
  final String id;
  @override
  @JsonKey(name: StaffColumns.image)
  final String? image;
  @override
  @JsonKey(name: StaffColumns.nameEnglish)
  final String? nameEnglish;
  @override
  @JsonKey(name: StaffColumns.nameNative)
  final String? nameNative;

  @override
  String toString() {
    return 'StaffEntity(id: $id, image: $image, nameEnglish: $nameEnglish, nameNative: $nameNative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StaffEntity &&
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
  _$$_StaffEntityCopyWith<_$_StaffEntity> get copyWith =>
      __$$_StaffEntityCopyWithImpl<_$_StaffEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StaffEntityToJson(
      this,
    );
  }
}

abstract class _StaffEntity implements StaffEntity {
  factory _StaffEntity(
          {@JsonKey(name: StaffColumns.id) final String id,
          @JsonKey(name: StaffColumns.image) final String? image,
          @JsonKey(name: StaffColumns.nameEnglish) final String? nameEnglish,
          @JsonKey(name: StaffColumns.nameNative) final String? nameNative}) =
      _$_StaffEntity;

  factory _StaffEntity.fromJson(Map<String, dynamic> json) =
      _$_StaffEntity.fromJson;

  @override
  @JsonKey(name: StaffColumns.id)
  String get id;
  @override
  @JsonKey(name: StaffColumns.image)
  String? get image;
  @override
  @JsonKey(name: StaffColumns.nameEnglish)
  String? get nameEnglish;
  @override
  @JsonKey(name: StaffColumns.nameNative)
  String? get nameNative;
  @override
  @JsonKey(ignore: true)
  _$$_StaffEntityCopyWith<_$_StaffEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

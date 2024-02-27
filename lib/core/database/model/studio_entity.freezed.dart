// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studio_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudioEntity _$StudioEntityFromJson(Map<String, dynamic> json) {
  return _StudioEntity.fromJson(json);
}

/// @nodoc
mixin _$StudioEntity {
  @JsonKey(name: StudioColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: StudioColumns.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: StudioColumns.siteUrl)
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: StudioColumns.isFavourite)
  int? get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: StudioColumns.isAnimationStudio)
  int? get isAnimationStudio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudioEntityCopyWith<StudioEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudioEntityCopyWith<$Res> {
  factory $StudioEntityCopyWith(
          StudioEntity value, $Res Function(StudioEntity) then) =
      _$StudioEntityCopyWithImpl<$Res, StudioEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: StudioColumns.id) String id,
      @JsonKey(name: StudioColumns.name) String? name,
      @JsonKey(name: StudioColumns.siteUrl) String? siteUrl,
      @JsonKey(name: StudioColumns.isFavourite) int? isFavourite,
      @JsonKey(name: StudioColumns.isAnimationStudio) int? isAnimationStudio});
}

/// @nodoc
class _$StudioEntityCopyWithImpl<$Res, $Val extends StudioEntity>
    implements $StudioEntityCopyWith<$Res> {
  _$StudioEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? siteUrl = freezed,
    Object? isFavourite = freezed,
    Object? isAnimationStudio = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as int?,
      isAnimationStudio: freezed == isAnimationStudio
          ? _value.isAnimationStudio
          : isAnimationStudio // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudioEntityImplCopyWith<$Res>
    implements $StudioEntityCopyWith<$Res> {
  factory _$$StudioEntityImplCopyWith(
          _$StudioEntityImpl value, $Res Function(_$StudioEntityImpl) then) =
      __$$StudioEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: StudioColumns.id) String id,
      @JsonKey(name: StudioColumns.name) String? name,
      @JsonKey(name: StudioColumns.siteUrl) String? siteUrl,
      @JsonKey(name: StudioColumns.isFavourite) int? isFavourite,
      @JsonKey(name: StudioColumns.isAnimationStudio) int? isAnimationStudio});
}

/// @nodoc
class __$$StudioEntityImplCopyWithImpl<$Res>
    extends _$StudioEntityCopyWithImpl<$Res, _$StudioEntityImpl>
    implements _$$StudioEntityImplCopyWith<$Res> {
  __$$StudioEntityImplCopyWithImpl(
      _$StudioEntityImpl _value, $Res Function(_$StudioEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? siteUrl = freezed,
    Object? isFavourite = freezed,
    Object? isAnimationStudio = freezed,
  }) {
    return _then(_$StudioEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as int?,
      isAnimationStudio: freezed == isAnimationStudio
          ? _value.isAnimationStudio
          : isAnimationStudio // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudioEntityImpl implements _StudioEntity {
  _$StudioEntityImpl(
      {@JsonKey(name: StudioColumns.id) this.id = '',
      @JsonKey(name: StudioColumns.name) this.name,
      @JsonKey(name: StudioColumns.siteUrl) this.siteUrl,
      @JsonKey(name: StudioColumns.isFavourite) this.isFavourite,
      @JsonKey(name: StudioColumns.isAnimationStudio) this.isAnimationStudio});

  factory _$StudioEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudioEntityImplFromJson(json);

  @override
  @JsonKey(name: StudioColumns.id)
  final String id;
  @override
  @JsonKey(name: StudioColumns.name)
  final String? name;
  @override
  @JsonKey(name: StudioColumns.siteUrl)
  final String? siteUrl;
  @override
  @JsonKey(name: StudioColumns.isFavourite)
  final int? isFavourite;
  @override
  @JsonKey(name: StudioColumns.isAnimationStudio)
  final int? isAnimationStudio;

  @override
  String toString() {
    return 'StudioEntity(id: $id, name: $name, siteUrl: $siteUrl, isFavourite: $isFavourite, isAnimationStudio: $isAnimationStudio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudioEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.isAnimationStudio, isAnimationStudio) ||
                other.isAnimationStudio == isAnimationStudio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, siteUrl, isFavourite, isAnimationStudio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudioEntityImplCopyWith<_$StudioEntityImpl> get copyWith =>
      __$$StudioEntityImplCopyWithImpl<_$StudioEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudioEntityImplToJson(
      this,
    );
  }
}

abstract class _StudioEntity implements StudioEntity {
  factory _StudioEntity(
      {@JsonKey(name: StudioColumns.id) final String id,
      @JsonKey(name: StudioColumns.name) final String? name,
      @JsonKey(name: StudioColumns.siteUrl) final String? siteUrl,
      @JsonKey(name: StudioColumns.isFavourite) final int? isFavourite,
      @JsonKey(name: StudioColumns.isAnimationStudio)
      final int? isAnimationStudio}) = _$StudioEntityImpl;

  factory _StudioEntity.fromJson(Map<String, dynamic> json) =
      _$StudioEntityImpl.fromJson;

  @override
  @JsonKey(name: StudioColumns.id)
  String get id;
  @override
  @JsonKey(name: StudioColumns.name)
  String? get name;
  @override
  @JsonKey(name: StudioColumns.siteUrl)
  String? get siteUrl;
  @override
  @JsonKey(name: StudioColumns.isFavourite)
  int? get isFavourite;
  @override
  @JsonKey(name: StudioColumns.isAnimationStudio)
  int? get isAnimationStudio;
  @override
  @JsonKey(ignore: true)
  _$$StudioEntityImplCopyWith<_$StudioEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

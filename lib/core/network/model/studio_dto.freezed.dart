// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studio_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudioDto _$StudioDtoFromJson(Map<String, dynamic> json) {
  return _StudioDto.fromJson(json);
}

/// @nodoc
mixin _$StudioDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isAnimationStudio')
  bool get isAnimationStudio => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavourite')
  bool get isFavourite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudioDtoCopyWith<StudioDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudioDtoCopyWith<$Res> {
  factory $StudioDtoCopyWith(StudioDto value, $Res Function(StudioDto) then) =
      _$StudioDtoCopyWithImpl<$Res, StudioDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'isAnimationStudio') bool isAnimationStudio,
      @JsonKey(name: 'isFavourite') bool isFavourite});
}

/// @nodoc
class _$StudioDtoCopyWithImpl<$Res, $Val extends StudioDto>
    implements $StudioDtoCopyWith<$Res> {
  _$StudioDtoCopyWithImpl(this._value, this._then);

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
    Object? isAnimationStudio = null,
    Object? isFavourite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnimationStudio: null == isAnimationStudio
          ? _value.isAnimationStudio
          : isAnimationStudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudioDtoImplCopyWith<$Res>
    implements $StudioDtoCopyWith<$Res> {
  factory _$$StudioDtoImplCopyWith(
          _$StudioDtoImpl value, $Res Function(_$StudioDtoImpl) then) =
      __$$StudioDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'isAnimationStudio') bool isAnimationStudio,
      @JsonKey(name: 'isFavourite') bool isFavourite});
}

/// @nodoc
class __$$StudioDtoImplCopyWithImpl<$Res>
    extends _$StudioDtoCopyWithImpl<$Res, _$StudioDtoImpl>
    implements _$$StudioDtoImplCopyWith<$Res> {
  __$$StudioDtoImplCopyWithImpl(
      _$StudioDtoImpl _value, $Res Function(_$StudioDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? siteUrl = freezed,
    Object? isAnimationStudio = null,
    Object? isFavourite = null,
  }) {
    return _then(_$StudioDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnimationStudio: null == isAnimationStudio
          ? _value.isAnimationStudio
          : isAnimationStudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudioDtoImpl implements _StudioDto {
  _$StudioDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'isAnimationStudio') this.isAnimationStudio = false,
      @JsonKey(name: 'isFavourite') this.isFavourite = false});

  factory _$StudioDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudioDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'isAnimationStudio')
  final bool isAnimationStudio;
  @override
  @JsonKey(name: 'isFavourite')
  final bool isFavourite;

  @override
  String toString() {
    return 'StudioDto(id: $id, name: $name, siteUrl: $siteUrl, isAnimationStudio: $isAnimationStudio, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudioDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.isAnimationStudio, isAnimationStudio) ||
                other.isAnimationStudio == isAnimationStudio) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, siteUrl, isAnimationStudio, isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudioDtoImplCopyWith<_$StudioDtoImpl> get copyWith =>
      __$$StudioDtoImplCopyWithImpl<_$StudioDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudioDtoImplToJson(
      this,
    );
  }
}

abstract class _StudioDto implements StudioDto {
  factory _StudioDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'siteUrl') final String? siteUrl,
      @JsonKey(name: 'isAnimationStudio') final bool isAnimationStudio,
      @JsonKey(name: 'isFavourite') final bool isFavourite}) = _$StudioDtoImpl;

  factory _StudioDto.fromJson(Map<String, dynamic> json) =
      _$StudioDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'isAnimationStudio')
  bool get isAnimationStudio;
  @override
  @JsonKey(name: 'isFavourite')
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$StudioDtoImplCopyWith<_$StudioDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

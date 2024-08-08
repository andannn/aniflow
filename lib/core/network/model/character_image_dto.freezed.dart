// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterImageDto _$CharacterImageDtoFromJson(Map<String, dynamic> json) {
  return _CharacterImageDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterImageDto {
  @JsonKey(name: 'large')
  String? get large => throw _privateConstructorUsedError;
  @JsonKey(name: 'medium')
  String? get medium => throw _privateConstructorUsedError;

  /// Serializes this CharacterImageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterImageDtoCopyWith<CharacterImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterImageDtoCopyWith<$Res> {
  factory $CharacterImageDtoCopyWith(
          CharacterImageDto value, $Res Function(CharacterImageDto) then) =
      _$CharacterImageDtoCopyWithImpl<$Res, CharacterImageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'large') String? large,
      @JsonKey(name: 'medium') String? medium});
}

/// @nodoc
class _$CharacterImageDtoCopyWithImpl<$Res, $Val extends CharacterImageDto>
    implements $CharacterImageDtoCopyWith<$Res> {
  _$CharacterImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? medium = freezed,
  }) {
    return _then(_value.copyWith(
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterImageDtoImplCopyWith<$Res>
    implements $CharacterImageDtoCopyWith<$Res> {
  factory _$$CharacterImageDtoImplCopyWith(_$CharacterImageDtoImpl value,
          $Res Function(_$CharacterImageDtoImpl) then) =
      __$$CharacterImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'large') String? large,
      @JsonKey(name: 'medium') String? medium});
}

/// @nodoc
class __$$CharacterImageDtoImplCopyWithImpl<$Res>
    extends _$CharacterImageDtoCopyWithImpl<$Res, _$CharacterImageDtoImpl>
    implements _$$CharacterImageDtoImplCopyWith<$Res> {
  __$$CharacterImageDtoImplCopyWithImpl(_$CharacterImageDtoImpl _value,
      $Res Function(_$CharacterImageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? medium = freezed,
  }) {
    return _then(_$CharacterImageDtoImpl(
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImageDtoImpl implements _CharacterImageDto {
  const _$CharacterImageDtoImpl(
      {@JsonKey(name: 'large') this.large,
      @JsonKey(name: 'medium') this.medium});

  factory _$CharacterImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'large')
  final String? large;
  @override
  @JsonKey(name: 'medium')
  final String? medium;

  @override
  String toString() {
    return 'CharacterImageDto(large: $large, medium: $medium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImageDtoImpl &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, large, medium);

  /// Create a copy of CharacterImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImageDtoImplCopyWith<_$CharacterImageDtoImpl> get copyWith =>
      __$$CharacterImageDtoImplCopyWithImpl<_$CharacterImageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImageDtoImplToJson(
      this,
    );
  }
}

abstract class _CharacterImageDto implements CharacterImageDto {
  const factory _CharacterImageDto(
      {@JsonKey(name: 'large') final String? large,
      @JsonKey(name: 'medium') final String? medium}) = _$CharacterImageDtoImpl;

  factory _CharacterImageDto.fromJson(Map<String, dynamic> json) =
      _$CharacterImageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'large')
  String? get large;
  @override
  @JsonKey(name: 'medium')
  String? get medium;

  /// Create a copy of CharacterImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterImageDtoImplCopyWith<_$CharacterImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

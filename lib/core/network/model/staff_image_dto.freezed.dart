// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffImageDto _$StaffImageDtoFromJson(Map<String, dynamic> json) {
  return _StaffImageDto.fromJson(json);
}

/// @nodoc
mixin _$StaffImageDto {
  @JsonKey(name: 'large')
  String? get large => throw _privateConstructorUsedError;
  @JsonKey(name: 'medium')
  String? get medium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffImageDtoCopyWith<StaffImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffImageDtoCopyWith<$Res> {
  factory $StaffImageDtoCopyWith(
          StaffImageDto value, $Res Function(StaffImageDto) then) =
      _$StaffImageDtoCopyWithImpl<$Res, StaffImageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'large') String? large,
      @JsonKey(name: 'medium') String? medium});
}

/// @nodoc
class _$StaffImageDtoCopyWithImpl<$Res, $Val extends StaffImageDto>
    implements $StaffImageDtoCopyWith<$Res> {
  _$StaffImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$StaffImageDtoImplCopyWith<$Res>
    implements $StaffImageDtoCopyWith<$Res> {
  factory _$$StaffImageDtoImplCopyWith(
          _$StaffImageDtoImpl value, $Res Function(_$StaffImageDtoImpl) then) =
      __$$StaffImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'large') String? large,
      @JsonKey(name: 'medium') String? medium});
}

/// @nodoc
class __$$StaffImageDtoImplCopyWithImpl<$Res>
    extends _$StaffImageDtoCopyWithImpl<$Res, _$StaffImageDtoImpl>
    implements _$$StaffImageDtoImplCopyWith<$Res> {
  __$$StaffImageDtoImplCopyWithImpl(
      _$StaffImageDtoImpl _value, $Res Function(_$StaffImageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? medium = freezed,
  }) {
    return _then(_$StaffImageDtoImpl(
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
class _$StaffImageDtoImpl implements _StaffImageDto {
  const _$StaffImageDtoImpl(
      {@JsonKey(name: 'large') this.large,
      @JsonKey(name: 'medium') this.medium});

  factory _$StaffImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffImageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'large')
  final String? large;
  @override
  @JsonKey(name: 'medium')
  final String? medium;

  @override
  String toString() {
    return 'StaffImageDto(large: $large, medium: $medium)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffImageDtoImpl &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, large, medium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffImageDtoImplCopyWith<_$StaffImageDtoImpl> get copyWith =>
      __$$StaffImageDtoImplCopyWithImpl<_$StaffImageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffImageDtoImplToJson(
      this,
    );
  }
}

abstract class _StaffImageDto implements StaffImageDto {
  const factory _StaffImageDto(
      {@JsonKey(name: 'large') final String? large,
      @JsonKey(name: 'medium') final String? medium}) = _$StaffImageDtoImpl;

  factory _StaffImageDto.fromJson(Map<String, dynamic> json) =
      _$StaffImageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'large')
  String? get large;
  @override
  @JsonKey(name: 'medium')
  String? get medium;
  @override
  @JsonKey(ignore: true)
  _$$StaffImageDtoImplCopyWith<_$StaffImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

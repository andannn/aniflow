// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_cover_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaCoverImageDto _$MediaCoverImageDtoFromJson(Map<String, dynamic> json) {
  return _MediaCoverImageDto.fromJson(json);
}

/// @nodoc
mixin _$MediaCoverImageDto {
  @JsonKey(name: 'extraLarge')
  String? get extraLarge => throw _privateConstructorUsedError;
  @JsonKey(name: 'large')
  String? get large => throw _privateConstructorUsedError;
  @JsonKey(name: 'medium')
  String? get medium => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this MediaCoverImageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaCoverImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCoverImageDtoCopyWith<MediaCoverImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCoverImageDtoCopyWith<$Res> {
  factory $MediaCoverImageDtoCopyWith(
          MediaCoverImageDto value, $Res Function(MediaCoverImageDto) then) =
      _$MediaCoverImageDtoCopyWithImpl<$Res, MediaCoverImageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'extraLarge') String? extraLarge,
      @JsonKey(name: 'large') String? large,
      @JsonKey(name: 'medium') String? medium,
      @JsonKey(name: 'color') String? color});
}

/// @nodoc
class _$MediaCoverImageDtoCopyWithImpl<$Res, $Val extends MediaCoverImageDto>
    implements $MediaCoverImageDtoCopyWith<$Res> {
  _$MediaCoverImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaCoverImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      extraLarge: freezed == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaCoverImageDtoImplCopyWith<$Res>
    implements $MediaCoverImageDtoCopyWith<$Res> {
  factory _$$MediaCoverImageDtoImplCopyWith(_$MediaCoverImageDtoImpl value,
          $Res Function(_$MediaCoverImageDtoImpl) then) =
      __$$MediaCoverImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'extraLarge') String? extraLarge,
      @JsonKey(name: 'large') String? large,
      @JsonKey(name: 'medium') String? medium,
      @JsonKey(name: 'color') String? color});
}

/// @nodoc
class __$$MediaCoverImageDtoImplCopyWithImpl<$Res>
    extends _$MediaCoverImageDtoCopyWithImpl<$Res, _$MediaCoverImageDtoImpl>
    implements _$$MediaCoverImageDtoImplCopyWith<$Res> {
  __$$MediaCoverImageDtoImplCopyWithImpl(_$MediaCoverImageDtoImpl _value,
      $Res Function(_$MediaCoverImageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaCoverImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? color = freezed,
  }) {
    return _then(_$MediaCoverImageDtoImpl(
      extraLarge: freezed == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaCoverImageDtoImpl implements _MediaCoverImageDto {
  const _$MediaCoverImageDtoImpl(
      {@JsonKey(name: 'extraLarge') this.extraLarge,
      @JsonKey(name: 'large') this.large,
      @JsonKey(name: 'medium') this.medium,
      @JsonKey(name: 'color') this.color});

  factory _$MediaCoverImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaCoverImageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'extraLarge')
  final String? extraLarge;
  @override
  @JsonKey(name: 'large')
  final String? large;
  @override
  @JsonKey(name: 'medium')
  final String? medium;
  @override
  @JsonKey(name: 'color')
  final String? color;

  @override
  String toString() {
    return 'MediaCoverImageDto(extraLarge: $extraLarge, large: $large, medium: $medium, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaCoverImageDtoImpl &&
            (identical(other.extraLarge, extraLarge) ||
                other.extraLarge == extraLarge) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extraLarge, large, medium, color);

  /// Create a copy of MediaCoverImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaCoverImageDtoImplCopyWith<_$MediaCoverImageDtoImpl> get copyWith =>
      __$$MediaCoverImageDtoImplCopyWithImpl<_$MediaCoverImageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaCoverImageDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaCoverImageDto implements MediaCoverImageDto {
  const factory _MediaCoverImageDto(
      {@JsonKey(name: 'extraLarge') final String? extraLarge,
      @JsonKey(name: 'large') final String? large,
      @JsonKey(name: 'medium') final String? medium,
      @JsonKey(name: 'color') final String? color}) = _$MediaCoverImageDtoImpl;

  factory _MediaCoverImageDto.fromJson(Map<String, dynamic> json) =
      _$MediaCoverImageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'extraLarge')
  String? get extraLarge;
  @override
  @JsonKey(name: 'large')
  String? get large;
  @override
  @JsonKey(name: 'medium')
  String? get medium;
  @override
  @JsonKey(name: 'color')
  String? get color;

  /// Create a copy of MediaCoverImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaCoverImageDtoImplCopyWith<_$MediaCoverImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

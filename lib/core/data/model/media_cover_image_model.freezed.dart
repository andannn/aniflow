// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_cover_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaCoverImageModel {
  String? get extraLarge => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  /// Create a copy of MediaCoverImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCoverImageModelCopyWith<MediaCoverImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCoverImageModelCopyWith<$Res> {
  factory $MediaCoverImageModelCopyWith(MediaCoverImageModel value,
          $Res Function(MediaCoverImageModel) then) =
      _$MediaCoverImageModelCopyWithImpl<$Res, MediaCoverImageModel>;
  @useResult
  $Res call({String? extraLarge, String? large, String? medium, Color? color});
}

/// @nodoc
class _$MediaCoverImageModelCopyWithImpl<$Res,
        $Val extends MediaCoverImageModel>
    implements $MediaCoverImageModelCopyWith<$Res> {
  _$MediaCoverImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaCoverImageModel
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
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaCoverImageModelImplCopyWith<$Res>
    implements $MediaCoverImageModelCopyWith<$Res> {
  factory _$$MediaCoverImageModelImplCopyWith(_$MediaCoverImageModelImpl value,
          $Res Function(_$MediaCoverImageModelImpl) then) =
      __$$MediaCoverImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? extraLarge, String? large, String? medium, Color? color});
}

/// @nodoc
class __$$MediaCoverImageModelImplCopyWithImpl<$Res>
    extends _$MediaCoverImageModelCopyWithImpl<$Res, _$MediaCoverImageModelImpl>
    implements _$$MediaCoverImageModelImplCopyWith<$Res> {
  __$$MediaCoverImageModelImplCopyWithImpl(_$MediaCoverImageModelImpl _value,
      $Res Function(_$MediaCoverImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaCoverImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraLarge = freezed,
    Object? large = freezed,
    Object? medium = freezed,
    Object? color = freezed,
  }) {
    return _then(_$MediaCoverImageModelImpl(
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
              as Color?,
    ));
  }
}

/// @nodoc

class _$MediaCoverImageModelImpl implements _MediaCoverImageModel {
  const _$MediaCoverImageModelImpl(
      {this.extraLarge, this.large, this.medium, this.color});

  @override
  final String? extraLarge;
  @override
  final String? large;
  @override
  final String? medium;
  @override
  final Color? color;

  @override
  String toString() {
    return 'MediaCoverImageModel(extraLarge: $extraLarge, large: $large, medium: $medium, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaCoverImageModelImpl &&
            (identical(other.extraLarge, extraLarge) ||
                other.extraLarge == extraLarge) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, extraLarge, large, medium, color);

  /// Create a copy of MediaCoverImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaCoverImageModelImplCopyWith<_$MediaCoverImageModelImpl>
      get copyWith =>
          __$$MediaCoverImageModelImplCopyWithImpl<_$MediaCoverImageModelImpl>(
              this, _$identity);
}

abstract class _MediaCoverImageModel implements MediaCoverImageModel {
  const factory _MediaCoverImageModel(
      {final String? extraLarge,
      final String? large,
      final String? medium,
      final Color? color}) = _$MediaCoverImageModelImpl;

  @override
  String? get extraLarge;
  @override
  String? get large;
  @override
  String? get medium;
  @override
  Color? get color;

  /// Create a copy of MediaCoverImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaCoverImageModelImplCopyWith<_$MediaCoverImageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

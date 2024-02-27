// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudioModel {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get siteUrl => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  bool get isAnimationStudio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudioModelCopyWith<StudioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudioModelCopyWith<$Res> {
  factory $StudioModelCopyWith(
          StudioModel value, $Res Function(StudioModel) then) =
      _$StudioModelCopyWithImpl<$Res, StudioModel>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? siteUrl,
      bool isFavourite,
      bool isAnimationStudio});
}

/// @nodoc
class _$StudioModelCopyWithImpl<$Res, $Val extends StudioModel>
    implements $StudioModelCopyWith<$Res> {
  _$StudioModelCopyWithImpl(this._value, this._then);

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
    Object? isFavourite = null,
    Object? isAnimationStudio = null,
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
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimationStudio: null == isAnimationStudio
          ? _value.isAnimationStudio
          : isAnimationStudio // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudioModelImplCopyWith<$Res>
    implements $StudioModelCopyWith<$Res> {
  factory _$$StudioModelImplCopyWith(
          _$StudioModelImpl value, $Res Function(_$StudioModelImpl) then) =
      __$$StudioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? siteUrl,
      bool isFavourite,
      bool isAnimationStudio});
}

/// @nodoc
class __$$StudioModelImplCopyWithImpl<$Res>
    extends _$StudioModelCopyWithImpl<$Res, _$StudioModelImpl>
    implements _$$StudioModelImplCopyWith<$Res> {
  __$$StudioModelImplCopyWithImpl(
      _$StudioModelImpl _value, $Res Function(_$StudioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? siteUrl = freezed,
    Object? isFavourite = null,
    Object? isAnimationStudio = null,
  }) {
    return _then(_$StudioModelImpl(
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
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimationStudio: null == isAnimationStudio
          ? _value.isAnimationStudio
          : isAnimationStudio // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StudioModelImpl implements _StudioModel {
  _$StudioModelImpl(
      {this.id = '',
      this.name,
      this.siteUrl,
      this.isFavourite = false,
      this.isAnimationStudio = false});

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  final String? siteUrl;
  @override
  @JsonKey()
  final bool isFavourite;
  @override
  @JsonKey()
  final bool isAnimationStudio;

  @override
  String toString() {
    return 'StudioModel(id: $id, name: $name, siteUrl: $siteUrl, isFavourite: $isFavourite, isAnimationStudio: $isAnimationStudio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudioModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.isAnimationStudio, isAnimationStudio) ||
                other.isAnimationStudio == isAnimationStudio));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, siteUrl, isFavourite, isAnimationStudio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudioModelImplCopyWith<_$StudioModelImpl> get copyWith =>
      __$$StudioModelImplCopyWithImpl<_$StudioModelImpl>(this, _$identity);
}

abstract class _StudioModel implements StudioModel {
  factory _StudioModel(
      {final String id,
      final String? name,
      final String? siteUrl,
      final bool isFavourite,
      final bool isAnimationStudio}) = _$StudioModelImpl;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get siteUrl;
  @override
  bool get isFavourite;
  @override
  bool get isAnimationStudio;
  @override
  @JsonKey(ignore: true)
  _$$StudioModelImplCopyWith<_$StudioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

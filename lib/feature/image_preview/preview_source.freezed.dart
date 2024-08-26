// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreviewSource _$PreviewSourceFromJson(Map<String, dynamic> json) {
  return _PreviewSource.fromJson(json);
}

/// @nodoc
mixin _$PreviewSource {
  String get imageUrl => throw _privateConstructorUsedError;
  String? get savedFileTitle => throw _privateConstructorUsedError;

  /// Serializes this PreviewSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreviewSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreviewSourceCopyWith<PreviewSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewSourceCopyWith<$Res> {
  factory $PreviewSourceCopyWith(
          PreviewSource value, $Res Function(PreviewSource) then) =
      _$PreviewSourceCopyWithImpl<$Res, PreviewSource>;
  @useResult
  $Res call({String imageUrl, String? savedFileTitle});
}

/// @nodoc
class _$PreviewSourceCopyWithImpl<$Res, $Val extends PreviewSource>
    implements $PreviewSourceCopyWith<$Res> {
  _$PreviewSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreviewSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? savedFileTitle = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      savedFileTitle: freezed == savedFileTitle
          ? _value.savedFileTitle
          : savedFileTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewSourceImplCopyWith<$Res>
    implements $PreviewSourceCopyWith<$Res> {
  factory _$$PreviewSourceImplCopyWith(
          _$PreviewSourceImpl value, $Res Function(_$PreviewSourceImpl) then) =
      __$$PreviewSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, String? savedFileTitle});
}

/// @nodoc
class __$$PreviewSourceImplCopyWithImpl<$Res>
    extends _$PreviewSourceCopyWithImpl<$Res, _$PreviewSourceImpl>
    implements _$$PreviewSourceImplCopyWith<$Res> {
  __$$PreviewSourceImplCopyWithImpl(
      _$PreviewSourceImpl _value, $Res Function(_$PreviewSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreviewSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? savedFileTitle = freezed,
  }) {
    return _then(_$PreviewSourceImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      savedFileTitle: freezed == savedFileTitle
          ? _value.savedFileTitle
          : savedFileTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewSourceImpl implements _PreviewSource {
  const _$PreviewSourceImpl({required this.imageUrl, this.savedFileTitle});

  factory _$PreviewSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewSourceImplFromJson(json);

  @override
  final String imageUrl;
  @override
  final String? savedFileTitle;

  @override
  String toString() {
    return 'PreviewSource(imageUrl: $imageUrl, savedFileTitle: $savedFileTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewSourceImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.savedFileTitle, savedFileTitle) ||
                other.savedFileTitle == savedFileTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, savedFileTitle);

  /// Create a copy of PreviewSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewSourceImplCopyWith<_$PreviewSourceImpl> get copyWith =>
      __$$PreviewSourceImplCopyWithImpl<_$PreviewSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewSourceImplToJson(
      this,
    );
  }
}

abstract class _PreviewSource implements PreviewSource {
  const factory _PreviewSource(
      {required final String imageUrl,
      final String? savedFileTitle}) = _$PreviewSourceImpl;

  factory _PreviewSource.fromJson(Map<String, dynamic> json) =
      _$PreviewSourceImpl.fromJson;

  @override
  String get imageUrl;
  @override
  String? get savedFileTitle;

  /// Create a copy of PreviewSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreviewSourceImplCopyWith<_$PreviewSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

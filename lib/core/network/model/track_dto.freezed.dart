// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) {
  return _TrackDto.fromJson(json);
}

/// @nodoc
mixin _$TrackDto {
  String get file => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  @JsonKey(name: "default")
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this TrackDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackDtoCopyWith<TrackDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackDtoCopyWith<$Res> {
  factory $TrackDtoCopyWith(TrackDto value, $Res Function(TrackDto) then) =
      _$TrackDtoCopyWithImpl<$Res, TrackDto>;
  @useResult
  $Res call(
      {String file,
      String label,
      String kind,
      @JsonKey(name: "default") bool isDefault});
}

/// @nodoc
class _$TrackDtoCopyWithImpl<$Res, $Val extends TrackDto>
    implements $TrackDtoCopyWith<$Res> {
  _$TrackDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? label = null,
    Object? kind = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackDtoImplCopyWith<$Res>
    implements $TrackDtoCopyWith<$Res> {
  factory _$$TrackDtoImplCopyWith(
          _$TrackDtoImpl value, $Res Function(_$TrackDtoImpl) then) =
      __$$TrackDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String file,
      String label,
      String kind,
      @JsonKey(name: "default") bool isDefault});
}

/// @nodoc
class __$$TrackDtoImplCopyWithImpl<$Res>
    extends _$TrackDtoCopyWithImpl<$Res, _$TrackDtoImpl>
    implements _$$TrackDtoImplCopyWith<$Res> {
  __$$TrackDtoImplCopyWithImpl(
      _$TrackDtoImpl _value, $Res Function(_$TrackDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? label = null,
    Object? kind = null,
    Object? isDefault = null,
  }) {
    return _then(_$TrackDtoImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackDtoImpl implements _TrackDto {
  const _$TrackDtoImpl(
      {this.file = "",
      this.label = "",
      this.kind = "",
      @JsonKey(name: "default") this.isDefault = false});

  factory _$TrackDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackDtoImplFromJson(json);

  @override
  @JsonKey()
  final String file;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final String kind;
  @override
  @JsonKey(name: "default")
  final bool isDefault;

  @override
  String toString() {
    return 'TrackDto(file: $file, label: $label, kind: $kind, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackDtoImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, file, label, kind, isDefault);

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackDtoImplCopyWith<_$TrackDtoImpl> get copyWith =>
      __$$TrackDtoImplCopyWithImpl<_$TrackDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackDtoImplToJson(
      this,
    );
  }
}

abstract class _TrackDto implements TrackDto {
  const factory _TrackDto(
      {final String file,
      final String label,
      final String kind,
      @JsonKey(name: "default") final bool isDefault}) = _$TrackDtoImpl;

  factory _TrackDto.fromJson(Map<String, dynamic> json) =
      _$TrackDtoImpl.fromJson;

  @override
  String get file;
  @override
  String get label;
  @override
  String get kind;
  @override
  @JsonKey(name: "default")
  bool get isDefault;

  /// Create a copy of TrackDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackDtoImplCopyWith<_$TrackDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

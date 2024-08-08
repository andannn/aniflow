// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_list_option_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaListOptionDto _$MediaListOptionDtoFromJson(Map<String, dynamic> json) {
  return _MediaListOptionDto.fromJson(json);
}

/// @nodoc
mixin _$MediaListOptionDto {
  @JsonKey(name: 'scoreFormat')
  ScoreFormat? get scoreFormat => throw _privateConstructorUsedError;

  /// Serializes this MediaListOptionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaListOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaListOptionDtoCopyWith<MediaListOptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListOptionDtoCopyWith<$Res> {
  factory $MediaListOptionDtoCopyWith(
          MediaListOptionDto value, $Res Function(MediaListOptionDto) then) =
      _$MediaListOptionDtoCopyWithImpl<$Res, MediaListOptionDto>;
  @useResult
  $Res call({@JsonKey(name: 'scoreFormat') ScoreFormat? scoreFormat});
}

/// @nodoc
class _$MediaListOptionDtoCopyWithImpl<$Res, $Val extends MediaListOptionDto>
    implements $MediaListOptionDtoCopyWith<$Res> {
  _$MediaListOptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaListOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreFormat = freezed,
  }) {
    return _then(_value.copyWith(
      scoreFormat: freezed == scoreFormat
          ? _value.scoreFormat
          : scoreFormat // ignore: cast_nullable_to_non_nullable
              as ScoreFormat?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaListOptionDtoImplCopyWith<$Res>
    implements $MediaListOptionDtoCopyWith<$Res> {
  factory _$$MediaListOptionDtoImplCopyWith(_$MediaListOptionDtoImpl value,
          $Res Function(_$MediaListOptionDtoImpl) then) =
      __$$MediaListOptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'scoreFormat') ScoreFormat? scoreFormat});
}

/// @nodoc
class __$$MediaListOptionDtoImplCopyWithImpl<$Res>
    extends _$MediaListOptionDtoCopyWithImpl<$Res, _$MediaListOptionDtoImpl>
    implements _$$MediaListOptionDtoImplCopyWith<$Res> {
  __$$MediaListOptionDtoImplCopyWithImpl(_$MediaListOptionDtoImpl _value,
      $Res Function(_$MediaListOptionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaListOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreFormat = freezed,
  }) {
    return _then(_$MediaListOptionDtoImpl(
      scoreFormat: freezed == scoreFormat
          ? _value.scoreFormat
          : scoreFormat // ignore: cast_nullable_to_non_nullable
              as ScoreFormat?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaListOptionDtoImpl implements _MediaListOptionDto {
  _$MediaListOptionDtoImpl({@JsonKey(name: 'scoreFormat') this.scoreFormat});

  factory _$MediaListOptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaListOptionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'scoreFormat')
  final ScoreFormat? scoreFormat;

  @override
  String toString() {
    return 'MediaListOptionDto(scoreFormat: $scoreFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListOptionDtoImpl &&
            (identical(other.scoreFormat, scoreFormat) ||
                other.scoreFormat == scoreFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scoreFormat);

  /// Create a copy of MediaListOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListOptionDtoImplCopyWith<_$MediaListOptionDtoImpl> get copyWith =>
      __$$MediaListOptionDtoImplCopyWithImpl<_$MediaListOptionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaListOptionDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaListOptionDto implements MediaListOptionDto {
  factory _MediaListOptionDto(
          {@JsonKey(name: 'scoreFormat') final ScoreFormat? scoreFormat}) =
      _$MediaListOptionDtoImpl;

  factory _MediaListOptionDto.fromJson(Map<String, dynamic> json) =
      _$MediaListOptionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'scoreFormat')
  ScoreFormat? get scoreFormat;

  /// Create a copy of MediaListOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaListOptionDtoImplCopyWith<_$MediaListOptionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

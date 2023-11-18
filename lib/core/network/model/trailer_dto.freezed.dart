// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trailer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrailerDto _$TrailerDtoFromJson(Map<String, dynamic> json) {
  return _TrailerDto.fromJson(json);
}

/// @nodoc
mixin _$TrailerDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'site')
  String get site => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrailerDtoCopyWith<TrailerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrailerDtoCopyWith<$Res> {
  factory $TrailerDtoCopyWith(
          TrailerDto value, $Res Function(TrailerDto) then) =
      _$TrailerDtoCopyWithImpl<$Res, TrailerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'site') String site,
      @JsonKey(name: 'thumbnail') String thumbnail});
}

/// @nodoc
class _$TrailerDtoCopyWithImpl<$Res, $Val extends TrailerDto>
    implements $TrailerDtoCopyWith<$Res> {
  _$TrailerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? site = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrailerDtoImplCopyWith<$Res>
    implements $TrailerDtoCopyWith<$Res> {
  factory _$$TrailerDtoImplCopyWith(
          _$TrailerDtoImpl value, $Res Function(_$TrailerDtoImpl) then) =
      __$$TrailerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'site') String site,
      @JsonKey(name: 'thumbnail') String thumbnail});
}

/// @nodoc
class __$$TrailerDtoImplCopyWithImpl<$Res>
    extends _$TrailerDtoCopyWithImpl<$Res, _$TrailerDtoImpl>
    implements _$$TrailerDtoImplCopyWith<$Res> {
  __$$TrailerDtoImplCopyWithImpl(
      _$TrailerDtoImpl _value, $Res Function(_$TrailerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? site = null,
    Object? thumbnail = null,
  }) {
    return _then(_$TrailerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrailerDtoImpl implements _TrailerDto {
  _$TrailerDtoImpl(
      {@JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'site') this.site = '',
      @JsonKey(name: 'thumbnail') this.thumbnail = ''});

  factory _$TrailerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrailerDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'site')
  final String site;
  @override
  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  @override
  String toString() {
    return 'TrailerDto(id: $id, site: $site, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrailerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, site, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrailerDtoImplCopyWith<_$TrailerDtoImpl> get copyWith =>
      __$$TrailerDtoImplCopyWithImpl<_$TrailerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrailerDtoImplToJson(
      this,
    );
  }
}

abstract class _TrailerDto implements TrailerDto {
  factory _TrailerDto(
      {@JsonKey(name: 'id') final String id,
      @JsonKey(name: 'site') final String site,
      @JsonKey(name: 'thumbnail') final String thumbnail}) = _$TrailerDtoImpl;

  factory _TrailerDto.fromJson(Map<String, dynamic> json) =
      _$TrailerDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'site')
  String get site;
  @override
  @JsonKey(name: 'thumbnail')
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$TrailerDtoImplCopyWith<_$TrailerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bangumi_subject_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BangumiSubjectDto _$BangumiSubjectDtoFromJson(Map<String, dynamic> json) {
  return _BangumiSubjectDto.fromJson(json);
}

/// @nodoc
mixin _$BangumiSubjectDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_cn')
  String get nameCn => throw _privateConstructorUsedError;

  /// Serializes this BangumiSubjectDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BangumiSubjectDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BangumiSubjectDtoCopyWith<BangumiSubjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BangumiSubjectDtoCopyWith<$Res> {
  factory $BangumiSubjectDtoCopyWith(
          BangumiSubjectDto value, $Res Function(BangumiSubjectDto) then) =
      _$BangumiSubjectDtoCopyWithImpl<$Res, BangumiSubjectDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'name_cn') String nameCn});
}

/// @nodoc
class _$BangumiSubjectDtoCopyWithImpl<$Res, $Val extends BangumiSubjectDto>
    implements $BangumiSubjectDtoCopyWith<$Res> {
  _$BangumiSubjectDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BangumiSubjectDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameCn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameCn: null == nameCn
          ? _value.nameCn
          : nameCn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BangumiSubjectDtoImplCopyWith<$Res>
    implements $BangumiSubjectDtoCopyWith<$Res> {
  factory _$$BangumiSubjectDtoImplCopyWith(_$BangumiSubjectDtoImpl value,
          $Res Function(_$BangumiSubjectDtoImpl) then) =
      __$$BangumiSubjectDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'name_cn') String nameCn});
}

/// @nodoc
class __$$BangumiSubjectDtoImplCopyWithImpl<$Res>
    extends _$BangumiSubjectDtoCopyWithImpl<$Res, _$BangumiSubjectDtoImpl>
    implements _$$BangumiSubjectDtoImplCopyWith<$Res> {
  __$$BangumiSubjectDtoImplCopyWithImpl(_$BangumiSubjectDtoImpl _value,
      $Res Function(_$BangumiSubjectDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BangumiSubjectDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameCn = null,
  }) {
    return _then(_$BangumiSubjectDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameCn: null == nameCn
          ? _value.nameCn
          : nameCn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BangumiSubjectDtoImpl implements _BangumiSubjectDto {
  const _$BangumiSubjectDtoImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'name_cn') required this.nameCn});

  factory _$BangumiSubjectDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BangumiSubjectDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'name_cn')
  final String nameCn;

  @override
  String toString() {
    return 'BangumiSubjectDto(id: $id, name: $name, nameCn: $nameCn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BangumiSubjectDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameCn, nameCn) || other.nameCn == nameCn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, nameCn);

  /// Create a copy of BangumiSubjectDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BangumiSubjectDtoImplCopyWith<_$BangumiSubjectDtoImpl> get copyWith =>
      __$$BangumiSubjectDtoImplCopyWithImpl<_$BangumiSubjectDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BangumiSubjectDtoImplToJson(
      this,
    );
  }
}

abstract class _BangumiSubjectDto implements BangumiSubjectDto {
  const factory _BangumiSubjectDto(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'name_cn') required final String nameCn}) =
      _$BangumiSubjectDtoImpl;

  factory _BangumiSubjectDto.fromJson(Map<String, dynamic> json) =
      _$BangumiSubjectDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'name_cn')
  String get nameCn;

  /// Create a copy of BangumiSubjectDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BangumiSubjectDtoImplCopyWith<_$BangumiSubjectDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

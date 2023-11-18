// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffDto _$StaffDtoFromJson(Map<String, dynamic> json) {
  return _StaffDto.fromJson(json);
}

/// @nodoc
mixin _$StaffDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  Map<String, String?> get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  Map<String, String?> get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffDtoCopyWith<StaffDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffDtoCopyWith<$Res> {
  factory $StaffDtoCopyWith(StaffDto value, $Res Function(StaffDto) then) =
      _$StaffDtoCopyWithImpl<$Res, StaffDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') Map<String, String?> image,
      @JsonKey(name: 'name') Map<String, String?> name});
}

/// @nodoc
class _$StaffDtoCopyWithImpl<$Res, $Val extends StaffDto>
    implements $StaffDtoCopyWith<$Res> {
  _$StaffDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffDtoImplCopyWith<$Res>
    implements $StaffDtoCopyWith<$Res> {
  factory _$$StaffDtoImplCopyWith(
          _$StaffDtoImpl value, $Res Function(_$StaffDtoImpl) then) =
      __$$StaffDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') Map<String, String?> image,
      @JsonKey(name: 'name') Map<String, String?> name});
}

/// @nodoc
class __$$StaffDtoImplCopyWithImpl<$Res>
    extends _$StaffDtoCopyWithImpl<$Res, _$StaffDtoImpl>
    implements _$$StaffDtoImplCopyWith<$Res> {
  __$$StaffDtoImplCopyWithImpl(
      _$StaffDtoImpl _value, $Res Function(_$StaffDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = null,
  }) {
    return _then(_$StaffDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      name: null == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffDtoImpl implements _StaffDto {
  _$StaffDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'image') final Map<String, String?> image = const {},
      @JsonKey(name: 'name') final Map<String, String?> name = const {}})
      : _image = image,
        _name = name;

  factory _$StaffDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  final Map<String, String?> _image;
  @override
  @JsonKey(name: 'image')
  Map<String, String?> get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

  final Map<String, String?> _name;
  @override
  @JsonKey(name: 'name')
  Map<String, String?> get name {
    if (_name is EqualUnmodifiableMapView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_name);
  }

  @override
  String toString() {
    return 'StaffDto(id: $id, image: $image, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other._name, _name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(_name));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffDtoImplCopyWith<_$StaffDtoImpl> get copyWith =>
      __$$StaffDtoImplCopyWithImpl<_$StaffDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffDtoImplToJson(
      this,
    );
  }
}

abstract class _StaffDto implements StaffDto {
  factory _StaffDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'image') final Map<String, String?> image,
      @JsonKey(name: 'name') final Map<String, String?> name}) = _$StaffDtoImpl;

  factory _StaffDto.fromJson(Map<String, dynamic> json) =
      _$StaffDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'image')
  Map<String, String?> get image;
  @override
  @JsonKey(name: 'name')
  Map<String, String?> get name;
  @override
  @JsonKey(ignore: true)
  _$$StaffDtoImplCopyWith<_$StaffDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

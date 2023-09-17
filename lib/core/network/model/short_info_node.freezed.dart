// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'short_info_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShortInfoNode _$ShortInfoNodeFromJson(Map<String, dynamic> json) {
  return _CharacterNode.fromJson(json);
}

/// @nodoc
mixin _$ShortInfoNode {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  Map<String, String?> get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  Map<String, String?> get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortInfoNodeCopyWith<ShortInfoNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortInfoNodeCopyWith<$Res> {
  factory $ShortInfoNodeCopyWith(
          ShortInfoNode value, $Res Function(ShortInfoNode) then) =
      _$ShortInfoNodeCopyWithImpl<$Res, ShortInfoNode>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') Map<String, String?> image,
      @JsonKey(name: 'name') Map<String, String?> name});
}

/// @nodoc
class _$ShortInfoNodeCopyWithImpl<$Res, $Val extends ShortInfoNode>
    implements $ShortInfoNodeCopyWith<$Res> {
  _$ShortInfoNodeCopyWithImpl(this._value, this._then);

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
abstract class _$$_CharacterNodeCopyWith<$Res>
    implements $ShortInfoNodeCopyWith<$Res> {
  factory _$$_CharacterNodeCopyWith(
          _$_CharacterNode value, $Res Function(_$_CharacterNode) then) =
      __$$_CharacterNodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') Map<String, String?> image,
      @JsonKey(name: 'name') Map<String, String?> name});
}

/// @nodoc
class __$$_CharacterNodeCopyWithImpl<$Res>
    extends _$ShortInfoNodeCopyWithImpl<$Res, _$_CharacterNode>
    implements _$$_CharacterNodeCopyWith<$Res> {
  __$$_CharacterNodeCopyWithImpl(
      _$_CharacterNode _value, $Res Function(_$_CharacterNode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = null,
  }) {
    return _then(_$_CharacterNode(
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
class _$_CharacterNode implements _CharacterNode {
  _$_CharacterNode(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'image') final Map<String, String?> image = const {},
      @JsonKey(name: 'name') final Map<String, String?> name = const {}})
      : _image = image,
        _name = name;

  factory _$_CharacterNode.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterNodeFromJson(json);

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
    return 'ShortInfoNode(id: $id, image: $image, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterNode &&
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
  _$$_CharacterNodeCopyWith<_$_CharacterNode> get copyWith =>
      __$$_CharacterNodeCopyWithImpl<_$_CharacterNode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterNodeToJson(
      this,
    );
  }
}

abstract class _CharacterNode implements ShortInfoNode {
  factory _CharacterNode(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'image') final Map<String, String?> image,
          @JsonKey(name: 'name') final Map<String, String?> name}) =
      _$_CharacterNode;

  factory _CharacterNode.fromJson(Map<String, dynamic> json) =
      _$_CharacterNode.fromJson;

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
  _$$_CharacterNodeCopyWith<_$_CharacterNode> get copyWith =>
      throw _privateConstructorUsedError;
}

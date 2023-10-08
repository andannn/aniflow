// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterEdge _$CharacterEdgeFromJson(Map<String, dynamic> json) {
  return _CharacterEdge.fromJson(json);
}

/// @nodoc
mixin _$CharacterEdge {
  @JsonKey(name: 'role')
  CharacterRole? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  CharacterDto? get characterNode => throw _privateConstructorUsedError;
  @JsonKey(name: 'voiceActors')
  List<StaffDto> get voiceActors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterEdgeCopyWith<CharacterEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterEdgeCopyWith<$Res> {
  factory $CharacterEdgeCopyWith(
          CharacterEdge value, $Res Function(CharacterEdge) then) =
      _$CharacterEdgeCopyWithImpl<$Res, CharacterEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'role') CharacterRole? role,
      @JsonKey(name: 'node') CharacterDto? characterNode,
      @JsonKey(name: 'voiceActors') List<StaffDto> voiceActors});

  $CharacterDtoCopyWith<$Res>? get characterNode;
}

/// @nodoc
class _$CharacterEdgeCopyWithImpl<$Res, $Val extends CharacterEdge>
    implements $CharacterEdgeCopyWith<$Res> {
  _$CharacterEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? characterNode = freezed,
    Object? voiceActors = null,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CharacterRole?,
      characterNode: freezed == characterNode
          ? _value.characterNode
          : characterNode // ignore: cast_nullable_to_non_nullable
              as CharacterDto?,
      voiceActors: null == voiceActors
          ? _value.voiceActors
          : voiceActors // ignore: cast_nullable_to_non_nullable
              as List<StaffDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterDtoCopyWith<$Res>? get characterNode {
    if (_value.characterNode == null) {
      return null;
    }

    return $CharacterDtoCopyWith<$Res>(_value.characterNode!, (value) {
      return _then(_value.copyWith(characterNode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterEdgeCopyWith<$Res>
    implements $CharacterEdgeCopyWith<$Res> {
  factory _$$_CharacterEdgeCopyWith(
          _$_CharacterEdge value, $Res Function(_$_CharacterEdge) then) =
      __$$_CharacterEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'role') CharacterRole? role,
      @JsonKey(name: 'node') CharacterDto? characterNode,
      @JsonKey(name: 'voiceActors') List<StaffDto> voiceActors});

  @override
  $CharacterDtoCopyWith<$Res>? get characterNode;
}

/// @nodoc
class __$$_CharacterEdgeCopyWithImpl<$Res>
    extends _$CharacterEdgeCopyWithImpl<$Res, _$_CharacterEdge>
    implements _$$_CharacterEdgeCopyWith<$Res> {
  __$$_CharacterEdgeCopyWithImpl(
      _$_CharacterEdge _value, $Res Function(_$_CharacterEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? characterNode = freezed,
    Object? voiceActors = null,
  }) {
    return _then(_$_CharacterEdge(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as CharacterRole?,
      characterNode: freezed == characterNode
          ? _value.characterNode
          : characterNode // ignore: cast_nullable_to_non_nullable
              as CharacterDto?,
      voiceActors: null == voiceActors
          ? _value._voiceActors
          : voiceActors // ignore: cast_nullable_to_non_nullable
              as List<StaffDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterEdge implements _CharacterEdge {
  _$_CharacterEdge(
      {@JsonKey(name: 'role') this.role,
      @JsonKey(name: 'node') this.characterNode,
      @JsonKey(name: 'voiceActors')
      final List<StaffDto> voiceActors = const []})
      : _voiceActors = voiceActors;

  factory _$_CharacterEdge.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterEdgeFromJson(json);

  @override
  @JsonKey(name: 'role')
  final CharacterRole? role;
  @override
  @JsonKey(name: 'node')
  final CharacterDto? characterNode;
  final List<StaffDto> _voiceActors;
  @override
  @JsonKey(name: 'voiceActors')
  List<StaffDto> get voiceActors {
    if (_voiceActors is EqualUnmodifiableListView) return _voiceActors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voiceActors);
  }

  @override
  String toString() {
    return 'CharacterEdge(role: $role, characterNode: $characterNode, voiceActors: $voiceActors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterEdge &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.characterNode, characterNode) ||
                other.characterNode == characterNode) &&
            const DeepCollectionEquality()
                .equals(other._voiceActors, _voiceActors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, characterNode,
      const DeepCollectionEquality().hash(_voiceActors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterEdgeCopyWith<_$_CharacterEdge> get copyWith =>
      __$$_CharacterEdgeCopyWithImpl<_$_CharacterEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterEdgeToJson(
      this,
    );
  }
}

abstract class _CharacterEdge implements CharacterEdge {
  factory _CharacterEdge(
          {@JsonKey(name: 'role') final CharacterRole? role,
          @JsonKey(name: 'node') final CharacterDto? characterNode,
          @JsonKey(name: 'voiceActors') final List<StaffDto> voiceActors}) =
      _$_CharacterEdge;

  factory _CharacterEdge.fromJson(Map<String, dynamic> json) =
      _$_CharacterEdge.fromJson;

  @override
  @JsonKey(name: 'role')
  CharacterRole? get role;
  @override
  @JsonKey(name: 'node')
  CharacterDto? get characterNode;
  @override
  @JsonKey(name: 'voiceActors')
  List<StaffDto> get voiceActors;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterEdgeCopyWith<_$_CharacterEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

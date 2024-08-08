// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterConnection _$CharacterConnectionFromJson(Map<String, dynamic> json) {
  return _CharacterConnection.fromJson(json);
}

/// @nodoc
mixin _$CharacterConnection {
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'edges')
  List<CharacterEdge> get edges => throw _privateConstructorUsedError;

  /// Serializes this CharacterConnection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterConnectionCopyWith<CharacterConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterConnectionCopyWith<$Res> {
  factory $CharacterConnectionCopyWith(
          CharacterConnection value, $Res Function(CharacterConnection) then) =
      _$CharacterConnectionCopyWithImpl<$Res, CharacterConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CharacterEdge> edges});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$CharacterConnectionCopyWithImpl<$Res, $Val extends CharacterConnection>
    implements $CharacterConnectionCopyWith<$Res> {
  _$CharacterConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = null,
  }) {
    return _then(_value.copyWith(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: null == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<CharacterEdge>,
    ) as $Val);
  }

  /// Create a copy of CharacterConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterConnectionImplCopyWith<$Res>
    implements $CharacterConnectionCopyWith<$Res> {
  factory _$$CharacterConnectionImplCopyWith(_$CharacterConnectionImpl value,
          $Res Function(_$CharacterConnectionImpl) then) =
      __$$CharacterConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<CharacterEdge> edges});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$CharacterConnectionImplCopyWithImpl<$Res>
    extends _$CharacterConnectionCopyWithImpl<$Res, _$CharacterConnectionImpl>
    implements _$$CharacterConnectionImplCopyWith<$Res> {
  __$$CharacterConnectionImplCopyWithImpl(_$CharacterConnectionImpl _value,
      $Res Function(_$CharacterConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = null,
  }) {
    return _then(_$CharacterConnectionImpl(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<CharacterEdge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterConnectionImpl implements _CharacterConnection {
  _$CharacterConnectionImpl(
      {@JsonKey(name: 'pageInfo') this.pageInfo,
      @JsonKey(name: 'edges') final List<CharacterEdge> edges = const []})
      : _edges = edges;

  factory _$CharacterConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterConnectionImplFromJson(json);

  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  final List<CharacterEdge> _edges;
  @override
  @JsonKey(name: 'edges')
  List<CharacterEdge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  @override
  String toString() {
    return 'CharacterConnection(pageInfo: $pageInfo, edges: $edges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterConnectionImpl &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo) &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageInfo, const DeepCollectionEquality().hash(_edges));

  /// Create a copy of CharacterConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterConnectionImplCopyWith<_$CharacterConnectionImpl> get copyWith =>
      __$$CharacterConnectionImplCopyWithImpl<_$CharacterConnectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterConnectionImplToJson(
      this,
    );
  }
}

abstract class _CharacterConnection implements CharacterConnection {
  factory _CharacterConnection(
          {@JsonKey(name: 'pageInfo') final PageInfo? pageInfo,
          @JsonKey(name: 'edges') final List<CharacterEdge> edges}) =
      _$CharacterConnectionImpl;

  factory _CharacterConnection.fromJson(Map<String, dynamic> json) =
      _$CharacterConnectionImpl.fromJson;

  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(name: 'edges')
  List<CharacterEdge> get edges;

  /// Create a copy of CharacterConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterConnectionImplCopyWith<_$CharacterConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

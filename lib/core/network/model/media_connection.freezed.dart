// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaConnection _$MediaConnectionFromJson(Map<String, dynamic> json) {
  return _MediaConnection.fromJson(json);
}

/// @nodoc
mixin _$MediaConnection {
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'edges')
  List<MediaEdge> get edges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaConnectionCopyWith<MediaConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaConnectionCopyWith<$Res> {
  factory $MediaConnectionCopyWith(
          MediaConnection value, $Res Function(MediaConnection) then) =
      _$MediaConnectionCopyWithImpl<$Res, MediaConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<MediaEdge> edges});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$MediaConnectionCopyWithImpl<$Res, $Val extends MediaConnection>
    implements $MediaConnectionCopyWith<$Res> {
  _$MediaConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as List<MediaEdge>,
    ) as $Val);
  }

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
abstract class _$$MediaConnectionImplCopyWith<$Res>
    implements $MediaConnectionCopyWith<$Res> {
  factory _$$MediaConnectionImplCopyWith(_$MediaConnectionImpl value,
          $Res Function(_$MediaConnectionImpl) then) =
      __$$MediaConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<MediaEdge> edges});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$MediaConnectionImplCopyWithImpl<$Res>
    extends _$MediaConnectionCopyWithImpl<$Res, _$MediaConnectionImpl>
    implements _$$MediaConnectionImplCopyWith<$Res> {
  __$$MediaConnectionImplCopyWithImpl(
      _$MediaConnectionImpl _value, $Res Function(_$MediaConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = null,
  }) {
    return _then(_$MediaConnectionImpl(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<MediaEdge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaConnectionImpl implements _MediaConnection {
  _$MediaConnectionImpl(
      {@JsonKey(name: 'pageInfo') this.pageInfo,
      @JsonKey(name: 'edges') final List<MediaEdge> edges = const []})
      : _edges = edges;

  factory _$MediaConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaConnectionImplFromJson(json);

  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  final List<MediaEdge> _edges;
  @override
  @JsonKey(name: 'edges')
  List<MediaEdge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  @override
  String toString() {
    return 'MediaConnection(pageInfo: $pageInfo, edges: $edges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaConnectionImpl &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo) &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageInfo, const DeepCollectionEquality().hash(_edges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaConnectionImplCopyWith<_$MediaConnectionImpl> get copyWith =>
      __$$MediaConnectionImplCopyWithImpl<_$MediaConnectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaConnectionImplToJson(
      this,
    );
  }
}

abstract class _MediaConnection implements MediaConnection {
  factory _MediaConnection(
          {@JsonKey(name: 'pageInfo') final PageInfo? pageInfo,
          @JsonKey(name: 'edges') final List<MediaEdge> edges}) =
      _$MediaConnectionImpl;

  factory _MediaConnection.fromJson(Map<String, dynamic> json) =
      _$MediaConnectionImpl.fromJson;

  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(name: 'edges')
  List<MediaEdge> get edges;
  @override
  @JsonKey(ignore: true)
  _$$MediaConnectionImplCopyWith<_$MediaConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

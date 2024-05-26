// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ani_flow_route_path_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AniFlowRoutePathList _$AniFlowRoutePathListFromJson(Map<String, dynamic> json) {
  return _AniFlowRoutePathList.fromJson(json);
}

/// @nodoc
mixin _$AniFlowRoutePathList {
  List<AniFlowRoutePath> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AniFlowRoutePathListCopyWith<AniFlowRoutePathList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AniFlowRoutePathListCopyWith<$Res> {
  factory $AniFlowRoutePathListCopyWith(AniFlowRoutePathList value,
          $Res Function(AniFlowRoutePathList) then) =
      _$AniFlowRoutePathListCopyWithImpl<$Res, AniFlowRoutePathList>;
  @useResult
  $Res call({List<AniFlowRoutePath> list});
}

/// @nodoc
class _$AniFlowRoutePathListCopyWithImpl<$Res,
        $Val extends AniFlowRoutePathList>
    implements $AniFlowRoutePathListCopyWith<$Res> {
  _$AniFlowRoutePathListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<AniFlowRoutePath>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AniFlowRoutePathListImplCopyWith<$Res>
    implements $AniFlowRoutePathListCopyWith<$Res> {
  factory _$$AniFlowRoutePathListImplCopyWith(_$AniFlowRoutePathListImpl value,
          $Res Function(_$AniFlowRoutePathListImpl) then) =
      __$$AniFlowRoutePathListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AniFlowRoutePath> list});
}

/// @nodoc
class __$$AniFlowRoutePathListImplCopyWithImpl<$Res>
    extends _$AniFlowRoutePathListCopyWithImpl<$Res, _$AniFlowRoutePathListImpl>
    implements _$$AniFlowRoutePathListImplCopyWith<$Res> {
  __$$AniFlowRoutePathListImplCopyWithImpl(_$AniFlowRoutePathListImpl _value,
      $Res Function(_$AniFlowRoutePathListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$AniFlowRoutePathListImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<AniFlowRoutePath>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AniFlowRoutePathListImpl implements _AniFlowRoutePathList {
  const _$AniFlowRoutePathListImpl({required final List<AniFlowRoutePath> list})
      : _list = list;

  factory _$AniFlowRoutePathListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AniFlowRoutePathListImplFromJson(json);

  final List<AniFlowRoutePath> _list;
  @override
  List<AniFlowRoutePath> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'AniFlowRoutePathList(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AniFlowRoutePathListImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AniFlowRoutePathListImplCopyWith<_$AniFlowRoutePathListImpl>
      get copyWith =>
          __$$AniFlowRoutePathListImplCopyWithImpl<_$AniFlowRoutePathListImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AniFlowRoutePathListImplToJson(
      this,
    );
  }
}

abstract class _AniFlowRoutePathList implements AniFlowRoutePathList {
  const factory _AniFlowRoutePathList(
          {required final List<AniFlowRoutePath> list}) =
      _$AniFlowRoutePathListImpl;

  factory _AniFlowRoutePathList.fromJson(Map<String, dynamic> json) =
      _$AniFlowRoutePathListImpl.fromJson;

  @override
  List<AniFlowRoutePath> get list;
  @override
  @JsonKey(ignore: true)
  _$$AniFlowRoutePathListImplCopyWith<_$AniFlowRoutePathListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

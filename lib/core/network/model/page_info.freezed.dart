// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

/// @nodoc
mixin _$PageInfo {
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'perPage')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPage')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastPage')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasNextPage')
  bool get hasNextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInfoCopyWith<PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoCopyWith<$Res> {
  factory $PageInfoCopyWith(PageInfo value, $Res Function(PageInfo) then) =
      _$PageInfoCopyWithImpl<$Res, PageInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total') int total,
      @JsonKey(name: 'perPage') int perPage,
      @JsonKey(name: 'currentPage') int currentPage,
      @JsonKey(name: 'lastPage') int lastPage,
      @JsonKey(name: 'hasNextPage') bool hasNextPage});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res, $Val extends PageInfo>
    implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? hasNextPage = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageInfoCopyWith<$Res> implements $PageInfoCopyWith<$Res> {
  factory _$$_PageInfoCopyWith(
          _$_PageInfo value, $Res Function(_$_PageInfo) then) =
      __$$_PageInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total') int total,
      @JsonKey(name: 'perPage') int perPage,
      @JsonKey(name: 'currentPage') int currentPage,
      @JsonKey(name: 'lastPage') int lastPage,
      @JsonKey(name: 'hasNextPage') bool hasNextPage});
}

/// @nodoc
class __$$_PageInfoCopyWithImpl<$Res>
    extends _$PageInfoCopyWithImpl<$Res, _$_PageInfo>
    implements _$$_PageInfoCopyWith<$Res> {
  __$$_PageInfoCopyWithImpl(
      _$_PageInfo _value, $Res Function(_$_PageInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? hasNextPage = null,
  }) {
    return _then(_$_PageInfo(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageInfo implements _PageInfo {
  _$_PageInfo(
      {@JsonKey(name: 'total') this.total = -1,
      @JsonKey(name: 'perPage') this.perPage = -1,
      @JsonKey(name: 'currentPage') this.currentPage = -1,
      @JsonKey(name: 'lastPage') this.lastPage = -1,
      @JsonKey(name: 'hasNextPage') this.hasNextPage = true});

  factory _$_PageInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PageInfoFromJson(json);

  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'perPage')
  final int perPage;
  @override
  @JsonKey(name: 'currentPage')
  final int currentPage;
  @override
  @JsonKey(name: 'lastPage')
  final int lastPage;
  @override
  @JsonKey(name: 'hasNextPage')
  final bool hasNextPage;

  @override
  String toString() {
    return 'PageInfo(total: $total, perPage: $perPage, currentPage: $currentPage, lastPage: $lastPage, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageInfo &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, perPage, currentPage, lastPage, hasNextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageInfoCopyWith<_$_PageInfo> get copyWith =>
      __$$_PageInfoCopyWithImpl<_$_PageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageInfoToJson(
      this,
    );
  }
}

abstract class _PageInfo implements PageInfo {
  factory _PageInfo(
      {@JsonKey(name: 'total') final int total,
      @JsonKey(name: 'perPage') final int perPage,
      @JsonKey(name: 'currentPage') final int currentPage,
      @JsonKey(name: 'lastPage') final int lastPage,
      @JsonKey(name: 'hasNextPage') final bool hasNextPage}) = _$_PageInfo;

  factory _PageInfo.fromJson(Map<String, dynamic> json) = _$_PageInfo.fromJson;

  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'perPage')
  int get perPage;
  @override
  @JsonKey(name: 'currentPage')
  int get currentPage;
  @override
  @JsonKey(name: 'lastPage')
  int get lastPage;
  @override
  @JsonKey(name: 'hasNextPage')
  bool get hasNextPage;
  @override
  @JsonKey(ignore: true)
  _$$_PageInfoCopyWith<_$_PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

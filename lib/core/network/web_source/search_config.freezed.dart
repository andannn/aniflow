// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchConfig {
  String get baseUrl => throw _privateConstructorUsedError;
  String get searchUrl => throw _privateConstructorUsedError;
  SubjectMatcher get matcher => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  List<Locale> get validLocal => throw _privateConstructorUsedError;

  /// Create a copy of SearchConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchConfigCopyWith<SearchConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchConfigCopyWith<$Res> {
  factory $SearchConfigCopyWith(
          SearchConfig value, $Res Function(SearchConfig) then) =
      _$SearchConfigCopyWithImpl<$Res, SearchConfig>;
  @useResult
  $Res call(
      {String baseUrl,
      String searchUrl,
      SubjectMatcher matcher,
      String? iconUrl,
      List<Locale> validLocal});
}

/// @nodoc
class _$SearchConfigCopyWithImpl<$Res, $Val extends SearchConfig>
    implements $SearchConfigCopyWith<$Res> {
  _$SearchConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? searchUrl = null,
    Object? matcher = null,
    Object? iconUrl = freezed,
    Object? validLocal = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      searchUrl: null == searchUrl
          ? _value.searchUrl
          : searchUrl // ignore: cast_nullable_to_non_nullable
              as String,
      matcher: null == matcher
          ? _value.matcher
          : matcher // ignore: cast_nullable_to_non_nullable
              as SubjectMatcher,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      validLocal: null == validLocal
          ? _value.validLocal
          : validLocal // ignore: cast_nullable_to_non_nullable
              as List<Locale>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchConfigImplCopyWith<$Res>
    implements $SearchConfigCopyWith<$Res> {
  factory _$$SearchConfigImplCopyWith(
          _$SearchConfigImpl value, $Res Function(_$SearchConfigImpl) then) =
      __$$SearchConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseUrl,
      String searchUrl,
      SubjectMatcher matcher,
      String? iconUrl,
      List<Locale> validLocal});
}

/// @nodoc
class __$$SearchConfigImplCopyWithImpl<$Res>
    extends _$SearchConfigCopyWithImpl<$Res, _$SearchConfigImpl>
    implements _$$SearchConfigImplCopyWith<$Res> {
  __$$SearchConfigImplCopyWithImpl(
      _$SearchConfigImpl _value, $Res Function(_$SearchConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? searchUrl = null,
    Object? matcher = null,
    Object? iconUrl = freezed,
    Object? validLocal = null,
  }) {
    return _then(_$SearchConfigImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      searchUrl: null == searchUrl
          ? _value.searchUrl
          : searchUrl // ignore: cast_nullable_to_non_nullable
              as String,
      matcher: null == matcher
          ? _value.matcher
          : matcher // ignore: cast_nullable_to_non_nullable
              as SubjectMatcher,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      validLocal: null == validLocal
          ? _value._validLocal
          : validLocal // ignore: cast_nullable_to_non_nullable
              as List<Locale>,
    ));
  }
}

/// @nodoc

class _$SearchConfigImpl implements _SearchConfig {
  const _$SearchConfigImpl(
      {required this.baseUrl,
      required this.searchUrl,
      required this.matcher,
      this.iconUrl,
      final List<Locale> validLocal = const []})
      : _validLocal = validLocal;

  @override
  final String baseUrl;
  @override
  final String searchUrl;
  @override
  final SubjectMatcher matcher;
  @override
  final String? iconUrl;
  final List<Locale> _validLocal;
  @override
  @JsonKey()
  List<Locale> get validLocal {
    if (_validLocal is EqualUnmodifiableListView) return _validLocal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validLocal);
  }

  @override
  String toString() {
    return 'SearchConfig(baseUrl: $baseUrl, searchUrl: $searchUrl, matcher: $matcher, iconUrl: $iconUrl, validLocal: $validLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.searchUrl, searchUrl) ||
                other.searchUrl == searchUrl) &&
            (identical(other.matcher, matcher) || other.matcher == matcher) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality()
                .equals(other._validLocal, _validLocal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseUrl, searchUrl, matcher,
      iconUrl, const DeepCollectionEquality().hash(_validLocal));

  /// Create a copy of SearchConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchConfigImplCopyWith<_$SearchConfigImpl> get copyWith =>
      __$$SearchConfigImplCopyWithImpl<_$SearchConfigImpl>(this, _$identity);
}

abstract class _SearchConfig implements SearchConfig {
  const factory _SearchConfig(
      {required final String baseUrl,
      required final String searchUrl,
      required final SubjectMatcher matcher,
      final String? iconUrl,
      final List<Locale> validLocal}) = _$SearchConfigImpl;

  @override
  String get baseUrl;
  @override
  String get searchUrl;
  @override
  SubjectMatcher get matcher;
  @override
  String? get iconUrl;
  @override
  List<Locale> get validLocal;

  /// Create a copy of SearchConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchConfigImplCopyWith<_$SearchConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

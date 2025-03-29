// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchTitle _$SearchTitleFromJson(Map<String, dynamic> json) {
  return _SearchTitle.fromJson(json);
}

/// @nodoc
mixin _$SearchTitle {
  String get fullText => throw _privateConstructorUsedError;
  Set<String> get keyword => throw _privateConstructorUsedError;
  @LocaleConverter()
  Locale get locale => throw _privateConstructorUsedError;

  /// Serializes this SearchTitle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTitleCopyWith<SearchTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTitleCopyWith<$Res> {
  factory $SearchTitleCopyWith(
          SearchTitle value, $Res Function(SearchTitle) then) =
      _$SearchTitleCopyWithImpl<$Res, SearchTitle>;
  @useResult
  $Res call(
      {String fullText, Set<String> keyword, @LocaleConverter() Locale locale});
}

/// @nodoc
class _$SearchTitleCopyWithImpl<$Res, $Val extends SearchTitle>
    implements $SearchTitleCopyWith<$Res> {
  _$SearchTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullText = null,
    Object? keyword = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      fullText: null == fullText
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchTitleImplCopyWith<$Res>
    implements $SearchTitleCopyWith<$Res> {
  factory _$$SearchTitleImplCopyWith(
          _$SearchTitleImpl value, $Res Function(_$SearchTitleImpl) then) =
      __$$SearchTitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullText, Set<String> keyword, @LocaleConverter() Locale locale});
}

/// @nodoc
class __$$SearchTitleImplCopyWithImpl<$Res>
    extends _$SearchTitleCopyWithImpl<$Res, _$SearchTitleImpl>
    implements _$$SearchTitleImplCopyWith<$Res> {
  __$$SearchTitleImplCopyWithImpl(
      _$SearchTitleImpl _value, $Res Function(_$SearchTitleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullText = null,
    Object? keyword = null,
    Object? locale = null,
  }) {
    return _then(_$SearchTitleImpl(
      fullText: null == fullText
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value._keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTitleImpl implements _SearchTitle {
  const _$SearchTitleImpl(
      {required this.fullText,
      required final Set<String> keyword,
      @LocaleConverter() required this.locale})
      : _keyword = keyword;

  factory _$SearchTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTitleImplFromJson(json);

  @override
  final String fullText;
  final Set<String> _keyword;
  @override
  Set<String> get keyword {
    if (_keyword is EqualUnmodifiableSetView) return _keyword;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_keyword);
  }

  @override
  @LocaleConverter()
  final Locale locale;

  @override
  String toString() {
    return 'SearchTitle(fullText: $fullText, keyword: $keyword, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTitleImpl &&
            (identical(other.fullText, fullText) ||
                other.fullText == fullText) &&
            const DeepCollectionEquality().equals(other._keyword, _keyword) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullText,
      const DeepCollectionEquality().hash(_keyword), locale);

  /// Create a copy of SearchTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTitleImplCopyWith<_$SearchTitleImpl> get copyWith =>
      __$$SearchTitleImplCopyWithImpl<_$SearchTitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTitleImplToJson(
      this,
    );
  }
}

abstract class _SearchTitle implements SearchTitle {
  const factory _SearchTitle(
      {required final String fullText,
      required final Set<String> keyword,
      @LocaleConverter() required final Locale locale}) = _$SearchTitleImpl;

  factory _SearchTitle.fromJson(Map<String, dynamic> json) =
      _$SearchTitleImpl.fromJson;

  @override
  String get fullText;
  @override
  Set<String> get keyword;
  @override
  @LocaleConverter()
  Locale get locale;

  /// Create a copy of SearchTitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTitleImplCopyWith<_$SearchTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

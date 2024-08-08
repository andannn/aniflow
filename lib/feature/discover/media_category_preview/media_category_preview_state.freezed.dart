// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_category_preview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaCategoryPreviewState {
  List<MediaModel> get data => throw _privateConstructorUsedError;

  /// Create a copy of MediaCategoryPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaCategoryPreviewStateCopyWith<MediaCategoryPreviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCategoryPreviewStateCopyWith<$Res> {
  factory $MediaCategoryPreviewStateCopyWith(MediaCategoryPreviewState value,
          $Res Function(MediaCategoryPreviewState) then) =
      _$MediaCategoryPreviewStateCopyWithImpl<$Res, MediaCategoryPreviewState>;
  @useResult
  $Res call({List<MediaModel> data});
}

/// @nodoc
class _$MediaCategoryPreviewStateCopyWithImpl<$Res,
        $Val extends MediaCategoryPreviewState>
    implements $MediaCategoryPreviewStateCopyWith<$Res> {
  _$MediaCategoryPreviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaCategoryPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaCategoryPreviewStateImplCopyWith<$Res>
    implements $MediaCategoryPreviewStateCopyWith<$Res> {
  factory _$$MediaCategoryPreviewStateImplCopyWith(
          _$MediaCategoryPreviewStateImpl value,
          $Res Function(_$MediaCategoryPreviewStateImpl) then) =
      __$$MediaCategoryPreviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MediaModel> data});
}

/// @nodoc
class __$$MediaCategoryPreviewStateImplCopyWithImpl<$Res>
    extends _$MediaCategoryPreviewStateCopyWithImpl<$Res,
        _$MediaCategoryPreviewStateImpl>
    implements _$$MediaCategoryPreviewStateImplCopyWith<$Res> {
  __$$MediaCategoryPreviewStateImplCopyWithImpl(
      _$MediaCategoryPreviewStateImpl _value,
      $Res Function(_$MediaCategoryPreviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaCategoryPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MediaCategoryPreviewStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
    ));
  }
}

/// @nodoc

class _$MediaCategoryPreviewStateImpl implements _MediaCategoryPreviewState {
  const _$MediaCategoryPreviewStateImpl(
      {final List<MediaModel> data = const []})
      : _data = data;

  final List<MediaModel> _data;
  @override
  @JsonKey()
  List<MediaModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MediaCategoryPreviewState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaCategoryPreviewStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of MediaCategoryPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaCategoryPreviewStateImplCopyWith<_$MediaCategoryPreviewStateImpl>
      get copyWith => __$$MediaCategoryPreviewStateImplCopyWithImpl<
          _$MediaCategoryPreviewStateImpl>(this, _$identity);
}

abstract class _MediaCategoryPreviewState implements MediaCategoryPreviewState {
  const factory _MediaCategoryPreviewState({final List<MediaModel> data}) =
      _$MediaCategoryPreviewStateImpl;

  @override
  List<MediaModel> get data;

  /// Create a copy of MediaCategoryPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaCategoryPreviewStateImplCopyWith<_$MediaCategoryPreviewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

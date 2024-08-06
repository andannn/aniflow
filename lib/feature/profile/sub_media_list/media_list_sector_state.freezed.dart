// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_list_sector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaListSectorState {
  List<MediaWithListModel> get mediaList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaListSectorStateCopyWith<MediaListSectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListSectorStateCopyWith<$Res> {
  factory $MediaListSectorStateCopyWith(MediaListSectorState value,
          $Res Function(MediaListSectorState) then) =
      _$MediaListSectorStateCopyWithImpl<$Res, MediaListSectorState>;
  @useResult
  $Res call({List<MediaWithListModel> mediaList});
}

/// @nodoc
class _$MediaListSectorStateCopyWithImpl<$Res,
        $Val extends MediaListSectorState>
    implements $MediaListSectorStateCopyWith<$Res> {
  _$MediaListSectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaList = null,
  }) {
    return _then(_value.copyWith(
      mediaList: null == mediaList
          ? _value.mediaList
          : mediaList // ignore: cast_nullable_to_non_nullable
              as List<MediaWithListModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaListSectorStateImplCopyWith<$Res>
    implements $MediaListSectorStateCopyWith<$Res> {
  factory _$$MediaListSectorStateImplCopyWith(_$MediaListSectorStateImpl value,
          $Res Function(_$MediaListSectorStateImpl) then) =
      __$$MediaListSectorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MediaWithListModel> mediaList});
}

/// @nodoc
class __$$MediaListSectorStateImplCopyWithImpl<$Res>
    extends _$MediaListSectorStateCopyWithImpl<$Res, _$MediaListSectorStateImpl>
    implements _$$MediaListSectorStateImplCopyWith<$Res> {
  __$$MediaListSectorStateImplCopyWithImpl(_$MediaListSectorStateImpl _value,
      $Res Function(_$MediaListSectorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaList = null,
  }) {
    return _then(_$MediaListSectorStateImpl(
      mediaList: null == mediaList
          ? _value._mediaList
          : mediaList // ignore: cast_nullable_to_non_nullable
              as List<MediaWithListModel>,
    ));
  }
}

/// @nodoc

class _$MediaListSectorStateImpl implements _MediaListSectorState {
  const _$MediaListSectorStateImpl(
      {final List<MediaWithListModel> mediaList = const []})
      : _mediaList = mediaList;

  final List<MediaWithListModel> _mediaList;
  @override
  @JsonKey()
  List<MediaWithListModel> get mediaList {
    if (_mediaList is EqualUnmodifiableListView) return _mediaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaList);
  }

  @override
  String toString() {
    return 'MediaListSectorState(mediaList: $mediaList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListSectorStateImpl &&
            const DeepCollectionEquality()
                .equals(other._mediaList, _mediaList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mediaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListSectorStateImplCopyWith<_$MediaListSectorStateImpl>
      get copyWith =>
          __$$MediaListSectorStateImplCopyWithImpl<_$MediaListSectorStateImpl>(
              this, _$identity);
}

abstract class _MediaListSectorState implements MediaListSectorState {
  const factory _MediaListSectorState(
      {final List<MediaWithListModel> mediaList}) = _$MediaListSectorStateImpl;

  @override
  List<MediaWithListModel> get mediaList;
  @override
  @JsonKey(ignore: true)
  _$$MediaListSectorStateImplCopyWith<_$MediaListSectorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

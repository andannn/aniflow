// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_to_watch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NextToWatchState {
  List<MediaListItemModel> get nextToWatchMediaList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NextToWatchStateCopyWith<NextToWatchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextToWatchStateCopyWith<$Res> {
  factory $NextToWatchStateCopyWith(
          NextToWatchState value, $Res Function(NextToWatchState) then) =
      _$NextToWatchStateCopyWithImpl<$Res, NextToWatchState>;
  @useResult
  $Res call({List<MediaListItemModel> nextToWatchMediaList});
}

/// @nodoc
class _$NextToWatchStateCopyWithImpl<$Res, $Val extends NextToWatchState>
    implements $NextToWatchStateCopyWith<$Res> {
  _$NextToWatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextToWatchMediaList = null,
  }) {
    return _then(_value.copyWith(
      nextToWatchMediaList: null == nextToWatchMediaList
          ? _value.nextToWatchMediaList
          : nextToWatchMediaList // ignore: cast_nullable_to_non_nullable
              as List<MediaListItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NextToWatchStateImplCopyWith<$Res>
    implements $NextToWatchStateCopyWith<$Res> {
  factory _$$NextToWatchStateImplCopyWith(_$NextToWatchStateImpl value,
          $Res Function(_$NextToWatchStateImpl) then) =
      __$$NextToWatchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MediaListItemModel> nextToWatchMediaList});
}

/// @nodoc
class __$$NextToWatchStateImplCopyWithImpl<$Res>
    extends _$NextToWatchStateCopyWithImpl<$Res, _$NextToWatchStateImpl>
    implements _$$NextToWatchStateImplCopyWith<$Res> {
  __$$NextToWatchStateImplCopyWithImpl(_$NextToWatchStateImpl _value,
      $Res Function(_$NextToWatchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextToWatchMediaList = null,
  }) {
    return _then(_$NextToWatchStateImpl(
      nextToWatchMediaList: null == nextToWatchMediaList
          ? _value._nextToWatchMediaList
          : nextToWatchMediaList // ignore: cast_nullable_to_non_nullable
              as List<MediaListItemModel>,
    ));
  }
}

/// @nodoc

class _$NextToWatchStateImpl implements _NextToWatchState {
  const _$NextToWatchStateImpl(
      {final List<MediaListItemModel> nextToWatchMediaList = const []})
      : _nextToWatchMediaList = nextToWatchMediaList;

  final List<MediaListItemModel> _nextToWatchMediaList;
  @override
  @JsonKey()
  List<MediaListItemModel> get nextToWatchMediaList {
    if (_nextToWatchMediaList is EqualUnmodifiableListView)
      return _nextToWatchMediaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextToWatchMediaList);
  }

  @override
  String toString() {
    return 'NextToWatchState(nextToWatchMediaList: $nextToWatchMediaList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextToWatchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._nextToWatchMediaList, _nextToWatchMediaList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_nextToWatchMediaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextToWatchStateImplCopyWith<_$NextToWatchStateImpl> get copyWith =>
      __$$NextToWatchStateImplCopyWithImpl<_$NextToWatchStateImpl>(
          this, _$identity);
}

abstract class _NextToWatchState implements NextToWatchState {
  const factory _NextToWatchState(
          {final List<MediaListItemModel> nextToWatchMediaList}) =
      _$NextToWatchStateImpl;

  @override
  List<MediaListItemModel> get nextToWatchMediaList;
  @override
  @JsonKey(ignore: true)
  _$$NextToWatchStateImplCopyWith<_$NextToWatchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

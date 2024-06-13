// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_list_update_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaListUpdatePageState {
  MediaWithListModel? get mediaWithListModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaListUpdatePageStateCopyWith<MediaListUpdatePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListUpdatePageStateCopyWith<$Res> {
  factory $MediaListUpdatePageStateCopyWith(MediaListUpdatePageState value,
          $Res Function(MediaListUpdatePageState) then) =
      _$MediaListUpdatePageStateCopyWithImpl<$Res, MediaListUpdatePageState>;
  @useResult
  $Res call({MediaWithListModel? mediaWithListModel});
}

/// @nodoc
class _$MediaListUpdatePageStateCopyWithImpl<$Res,
        $Val extends MediaListUpdatePageState>
    implements $MediaListUpdatePageStateCopyWith<$Res> {
  _$MediaListUpdatePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaWithListModel = freezed,
  }) {
    return _then(_value.copyWith(
      mediaWithListModel: freezed == mediaWithListModel
          ? _value.mediaWithListModel
          : mediaWithListModel // ignore: cast_nullable_to_non_nullable
              as MediaWithListModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaListUpdatePageStateImplCopyWith<$Res>
    implements $MediaListUpdatePageStateCopyWith<$Res> {
  factory _$$MediaListUpdatePageStateImplCopyWith(
          _$MediaListUpdatePageStateImpl value,
          $Res Function(_$MediaListUpdatePageStateImpl) then) =
      __$$MediaListUpdatePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MediaWithListModel? mediaWithListModel});
}

/// @nodoc
class __$$MediaListUpdatePageStateImplCopyWithImpl<$Res>
    extends _$MediaListUpdatePageStateCopyWithImpl<$Res,
        _$MediaListUpdatePageStateImpl>
    implements _$$MediaListUpdatePageStateImplCopyWith<$Res> {
  __$$MediaListUpdatePageStateImplCopyWithImpl(
      _$MediaListUpdatePageStateImpl _value,
      $Res Function(_$MediaListUpdatePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaWithListModel = freezed,
  }) {
    return _then(_$MediaListUpdatePageStateImpl(
      mediaWithListModel: freezed == mediaWithListModel
          ? _value.mediaWithListModel
          : mediaWithListModel // ignore: cast_nullable_to_non_nullable
              as MediaWithListModel?,
    ));
  }
}

/// @nodoc

class _$MediaListUpdatePageStateImpl implements _MediaListUpdatePageState {
  const _$MediaListUpdatePageStateImpl({this.mediaWithListModel});

  @override
  final MediaWithListModel? mediaWithListModel;

  @override
  String toString() {
    return 'MediaListUpdatePageState(mediaWithListModel: $mediaWithListModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaListUpdatePageStateImpl &&
            (identical(other.mediaWithListModel, mediaWithListModel) ||
                other.mediaWithListModel == mediaWithListModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mediaWithListModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaListUpdatePageStateImplCopyWith<_$MediaListUpdatePageStateImpl>
      get copyWith => __$$MediaListUpdatePageStateImplCopyWithImpl<
          _$MediaListUpdatePageStateImpl>(this, _$identity);
}

abstract class _MediaListUpdatePageState implements MediaListUpdatePageState {
  const factory _MediaListUpdatePageState(
          {final MediaWithListModel? mediaWithListModel}) =
      _$MediaListUpdatePageStateImpl;

  @override
  MediaWithListModel? get mediaWithListModel;
  @override
  @JsonKey(ignore: true)
  _$$MediaListUpdatePageStateImplCopyWith<_$MediaListUpdatePageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

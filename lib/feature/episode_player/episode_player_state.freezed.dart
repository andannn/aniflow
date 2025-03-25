// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EpisodePlayerState {
  MediaSource? get selectedMediaSource => throw _privateConstructorUsedError;
  MediaModel? get mediaModel => throw _privateConstructorUsedError;

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodePlayerStateCopyWith<EpisodePlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodePlayerStateCopyWith<$Res> {
  factory $EpisodePlayerStateCopyWith(
          EpisodePlayerState value, $Res Function(EpisodePlayerState) then) =
      _$EpisodePlayerStateCopyWithImpl<$Res, EpisodePlayerState>;
  @useResult
  $Res call({MediaSource? selectedMediaSource, MediaModel? mediaModel});

  $MediaModelCopyWith<$Res>? get mediaModel;
}

/// @nodoc
class _$EpisodePlayerStateCopyWithImpl<$Res, $Val extends EpisodePlayerState>
    implements $EpisodePlayerStateCopyWith<$Res> {
  _$EpisodePlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMediaSource = freezed,
    Object? mediaModel = freezed,
  }) {
    return _then(_value.copyWith(
      selectedMediaSource: freezed == selectedMediaSource
          ? _value.selectedMediaSource
          : selectedMediaSource // ignore: cast_nullable_to_non_nullable
              as MediaSource?,
      mediaModel: freezed == mediaModel
          ? _value.mediaModel
          : mediaModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
    ) as $Val);
  }

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaModelCopyWith<$Res>? get mediaModel {
    if (_value.mediaModel == null) {
      return null;
    }

    return $MediaModelCopyWith<$Res>(_value.mediaModel!, (value) {
      return _then(_value.copyWith(mediaModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodePlayerStateImplCopyWith<$Res>
    implements $EpisodePlayerStateCopyWith<$Res> {
  factory _$$EpisodePlayerStateImplCopyWith(_$EpisodePlayerStateImpl value,
          $Res Function(_$EpisodePlayerStateImpl) then) =
      __$$EpisodePlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MediaSource? selectedMediaSource, MediaModel? mediaModel});

  @override
  $MediaModelCopyWith<$Res>? get mediaModel;
}

/// @nodoc
class __$$EpisodePlayerStateImplCopyWithImpl<$Res>
    extends _$EpisodePlayerStateCopyWithImpl<$Res, _$EpisodePlayerStateImpl>
    implements _$$EpisodePlayerStateImplCopyWith<$Res> {
  __$$EpisodePlayerStateImplCopyWithImpl(_$EpisodePlayerStateImpl _value,
      $Res Function(_$EpisodePlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMediaSource = freezed,
    Object? mediaModel = freezed,
  }) {
    return _then(_$EpisodePlayerStateImpl(
      selectedMediaSource: freezed == selectedMediaSource
          ? _value.selectedMediaSource
          : selectedMediaSource // ignore: cast_nullable_to_non_nullable
              as MediaSource?,
      mediaModel: freezed == mediaModel
          ? _value.mediaModel
          : mediaModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
    ));
  }
}

/// @nodoc

class _$EpisodePlayerStateImpl implements _EpisodePlayerState {
  const _$EpisodePlayerStateImpl({this.selectedMediaSource, this.mediaModel});

  @override
  final MediaSource? selectedMediaSource;
  @override
  final MediaModel? mediaModel;

  @override
  String toString() {
    return 'EpisodePlayerState(selectedMediaSource: $selectedMediaSource, mediaModel: $mediaModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodePlayerStateImpl &&
            (identical(other.selectedMediaSource, selectedMediaSource) ||
                other.selectedMediaSource == selectedMediaSource) &&
            (identical(other.mediaModel, mediaModel) ||
                other.mediaModel == mediaModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMediaSource, mediaModel);

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodePlayerStateImplCopyWith<_$EpisodePlayerStateImpl> get copyWith =>
      __$$EpisodePlayerStateImplCopyWithImpl<_$EpisodePlayerStateImpl>(
          this, _$identity);
}

abstract class _EpisodePlayerState implements EpisodePlayerState {
  const factory _EpisodePlayerState(
      {final MediaSource? selectedMediaSource,
      final MediaModel? mediaModel}) = _$EpisodePlayerStateImpl;

  @override
  MediaSource? get selectedMediaSource;
  @override
  MediaModel? get mediaModel;

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodePlayerStateImplCopyWith<_$EpisodePlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  int get selectedEpisodeNumber => throw _privateConstructorUsedError;
  MediaModel? get mediaModel => throw _privateConstructorUsedError;
  MediaListItemModel? get mediaListItemModel =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {MediaSource? selectedMediaSource,
      int selectedEpisodeNumber,
      MediaModel? mediaModel,
      MediaListItemModel? mediaListItemModel});

  $MediaModelCopyWith<$Res>? get mediaModel;
  $MediaListItemModelCopyWith<$Res>? get mediaListItemModel;
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
    Object? selectedEpisodeNumber = null,
    Object? mediaModel = freezed,
    Object? mediaListItemModel = freezed,
  }) {
    return _then(_value.copyWith(
      selectedMediaSource: freezed == selectedMediaSource
          ? _value.selectedMediaSource
          : selectedMediaSource // ignore: cast_nullable_to_non_nullable
              as MediaSource?,
      selectedEpisodeNumber: null == selectedEpisodeNumber
          ? _value.selectedEpisodeNumber
          : selectedEpisodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      mediaModel: freezed == mediaModel
          ? _value.mediaModel
          : mediaModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
      mediaListItemModel: freezed == mediaListItemModel
          ? _value.mediaListItemModel
          : mediaListItemModel // ignore: cast_nullable_to_non_nullable
              as MediaListItemModel?,
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

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaListItemModelCopyWith<$Res>? get mediaListItemModel {
    if (_value.mediaListItemModel == null) {
      return null;
    }

    return $MediaListItemModelCopyWith<$Res>(_value.mediaListItemModel!,
        (value) {
      return _then(_value.copyWith(mediaListItemModel: value) as $Val);
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
  $Res call(
      {MediaSource? selectedMediaSource,
      int selectedEpisodeNumber,
      MediaModel? mediaModel,
      MediaListItemModel? mediaListItemModel});

  @override
  $MediaModelCopyWith<$Res>? get mediaModel;
  @override
  $MediaListItemModelCopyWith<$Res>? get mediaListItemModel;
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
    Object? selectedEpisodeNumber = null,
    Object? mediaModel = freezed,
    Object? mediaListItemModel = freezed,
  }) {
    return _then(_$EpisodePlayerStateImpl(
      selectedMediaSource: freezed == selectedMediaSource
          ? _value.selectedMediaSource
          : selectedMediaSource // ignore: cast_nullable_to_non_nullable
              as MediaSource?,
      selectedEpisodeNumber: null == selectedEpisodeNumber
          ? _value.selectedEpisodeNumber
          : selectedEpisodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      mediaModel: freezed == mediaModel
          ? _value.mediaModel
          : mediaModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
      mediaListItemModel: freezed == mediaListItemModel
          ? _value.mediaListItemModel
          : mediaListItemModel // ignore: cast_nullable_to_non_nullable
              as MediaListItemModel?,
    ));
  }
}

/// @nodoc

class _$EpisodePlayerStateImpl implements _EpisodePlayerState {
  const _$EpisodePlayerStateImpl(
      {this.selectedMediaSource,
      required this.selectedEpisodeNumber,
      this.mediaModel,
      this.mediaListItemModel});

  @override
  final MediaSource? selectedMediaSource;
  @override
  final int selectedEpisodeNumber;
  @override
  final MediaModel? mediaModel;
  @override
  final MediaListItemModel? mediaListItemModel;

  @override
  String toString() {
    return 'EpisodePlayerState(selectedMediaSource: $selectedMediaSource, selectedEpisodeNumber: $selectedEpisodeNumber, mediaModel: $mediaModel, mediaListItemModel: $mediaListItemModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodePlayerStateImpl &&
            (identical(other.selectedMediaSource, selectedMediaSource) ||
                other.selectedMediaSource == selectedMediaSource) &&
            (identical(other.selectedEpisodeNumber, selectedEpisodeNumber) ||
                other.selectedEpisodeNumber == selectedEpisodeNumber) &&
            (identical(other.mediaModel, mediaModel) ||
                other.mediaModel == mediaModel) &&
            (identical(other.mediaListItemModel, mediaListItemModel) ||
                other.mediaListItemModel == mediaListItemModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMediaSource,
      selectedEpisodeNumber, mediaModel, mediaListItemModel);

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
      required final int selectedEpisodeNumber,
      final MediaModel? mediaModel,
      final MediaListItemModel? mediaListItemModel}) = _$EpisodePlayerStateImpl;

  @override
  MediaSource? get selectedMediaSource;
  @override
  int get selectedEpisodeNumber;
  @override
  MediaModel? get mediaModel;
  @override
  MediaListItemModel? get mediaListItemModel;

  /// Create a copy of EpisodePlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodePlayerStateImplCopyWith<_$EpisodePlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

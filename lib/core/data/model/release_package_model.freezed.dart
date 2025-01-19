// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReleasePackageModel {
  AppVersion get version => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;

  /// Create a copy of ReleasePackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReleasePackageModelCopyWith<ReleasePackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleasePackageModelCopyWith<$Res> {
  factory $ReleasePackageModelCopyWith(
          ReleasePackageModel value, $Res Function(ReleasePackageModel) then) =
      _$ReleasePackageModelCopyWithImpl<$Res, ReleasePackageModel>;
  @useResult
  $Res call({AppVersion version, String downloadUrl});
}

/// @nodoc
class _$ReleasePackageModelCopyWithImpl<$Res, $Val extends ReleasePackageModel>
    implements $ReleasePackageModelCopyWith<$Res> {
  _$ReleasePackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReleasePackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? downloadUrl = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as AppVersion,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReleasePackageModelImplCopyWith<$Res>
    implements $ReleasePackageModelCopyWith<$Res> {
  factory _$$ReleasePackageModelImplCopyWith(_$ReleasePackageModelImpl value,
          $Res Function(_$ReleasePackageModelImpl) then) =
      __$$ReleasePackageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppVersion version, String downloadUrl});
}

/// @nodoc
class __$$ReleasePackageModelImplCopyWithImpl<$Res>
    extends _$ReleasePackageModelCopyWithImpl<$Res, _$ReleasePackageModelImpl>
    implements _$$ReleasePackageModelImplCopyWith<$Res> {
  __$$ReleasePackageModelImplCopyWithImpl(_$ReleasePackageModelImpl _value,
      $Res Function(_$ReleasePackageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReleasePackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? downloadUrl = null,
  }) {
    return _then(_$ReleasePackageModelImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as AppVersion,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReleasePackageModelImpl implements _ReleasePackageModel {
  const _$ReleasePackageModelImpl(
      {required this.version, required this.downloadUrl});

  @override
  final AppVersion version;
  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'ReleasePackageModel(version: $version, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReleasePackageModelImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version, downloadUrl);

  /// Create a copy of ReleasePackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReleasePackageModelImplCopyWith<_$ReleasePackageModelImpl> get copyWith =>
      __$$ReleasePackageModelImplCopyWithImpl<_$ReleasePackageModelImpl>(
          this, _$identity);
}

abstract class _ReleasePackageModel implements ReleasePackageModel {
  const factory _ReleasePackageModel(
      {required final AppVersion version,
      required final String downloadUrl}) = _$ReleasePackageModelImpl;

  @override
  AppVersion get version;
  @override
  String get downloadUrl;

  /// Create a copy of ReleasePackageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReleasePackageModelImplCopyWith<_$ReleasePackageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

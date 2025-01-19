import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_package_model.freezed.dart';

@freezed
class ReleasePackageModel with _$ReleasePackageModel {
  const factory ReleasePackageModel({
    required AppVersion version,
    required String downloadUrl,
  }) = _ReleasePackageModel;
}

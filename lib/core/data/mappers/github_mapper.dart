import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/data/model/github_user_model.dart';
import 'package:aniflow/core/data/model/release_package_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/github_user_dto.dart';

extension GithubMapper on GithubUserDto {
  GithubUserModel toModel() {
    return GithubUserModel(
      id: id ?? -1,
      login: login ?? '',
      avatarUrl: avatarUrl ?? '',
      bio: bio ?? '',
    );
  }
}

extension ReleasedPackageEntityEx on ReleasedPackageEntity {
  ReleasePackageModel toModel() {
    return ReleasePackageModel(
      version: AppVersion.parse(tagName),
      downloadUrl: apkDownloadUrl,
    );
  }
}

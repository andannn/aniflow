import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/github_released_dto.dart';

extension GithubReleaseDtoEx on GithubReleaseDto {
  ReleasedPackageEntity toEntity() {
    final androidAssets = assets.firstWhere(
      (e) =>
          e.contentType == 'application/vnd.android.package-archive' &&
          e.name?.contains('v8a') == true,
    );
    return ReleasedPackageEntity(
      tagName: tagName,
      apkDownloadUrl: androidAssets.browserDownloadUrl,
    );
  }
}

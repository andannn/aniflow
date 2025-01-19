import 'dart:convert';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/github_mapper.dart';
import 'package:aniflow/core/data/model/github_user_model.dart';
import 'package:aniflow/core/data/model/release_package_model.dart';
import 'package:aniflow/core/database/dao/github_release_dao.dart';
import 'package:aniflow/core/database/mappers/github_data_mapper.dart';
import 'package:aniflow/core/network/github_data_source.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class GithubRepository {
  GithubRepository(
    this.githubDataSource,
    this.preferences,
    this.githubReleaseDao,
  );

  final GithubDataSource githubDataSource;
  final GithubReleaseDao githubReleaseDao;
  final UserDataPreferences preferences;

  Future<LoadResult> refreshGithubInfo() async {
    try {
      final dto = await githubDataSource.getGithubUserById(mineUserId);
      final model = dto.toModel();
      await preferences.setMineGithubUserInfo(jsonEncode(model));
      return LoadSuccess(data: model);
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

  Stream<GithubUserModel> getMineGithubUserStream() {
    return preferences
        .getMineGithubUserInfoStream()
        .whereNotNull()
        .map((str) => GithubUserModel.fromJson(jsonDecode(str)));
  }

  Stream<ReleasePackageModel?> getLatestReleasePackageStream() {
    return githubReleaseDao.getLatestReleasePackages().map((e) => e?.toModel());
  }

  Future<LoadResult> refreshAndGetLatestRelease() async {
    try {
      const owner = 'andannn';
      const repo = 'aniflow';
      final dto =
          await githubDataSource.getLatestRelease(owner: owner, repo: repo);
      await githubReleaseDao.upsertReleasePackage([dto.toEntity()]);
      return LoadSuccess(data: []);
    } on Exception catch (e) {
      return LoadError(e);
    }
  }
}

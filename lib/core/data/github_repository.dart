import 'dart:convert';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/github_mapper.dart';
import 'package:aniflow/core/data/model/github_user_model.dart';
import 'package:aniflow/core/network/github_data_source.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class GithubRepository {
  GithubRepository(this.githubDataSource, this.preferences);

  final GithubDataSource githubDataSource;
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

  Future refreshLatestRelease({required String owner, required String repo}) async {
    final dto = await githubDataSource.getLatestRelease(owner: owner, repo: repo);
    return dto.toModel();
  }
}

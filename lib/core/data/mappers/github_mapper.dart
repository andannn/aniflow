import 'package:aniflow/core/data/model/github_user_model.dart';
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

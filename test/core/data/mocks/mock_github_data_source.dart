
import 'package:aniflow/core/network/github_data_source.dart';
import 'package:aniflow/core/network/model/github_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGithubDataSource extends Fake implements GithubDataSource {
  @override
  Future<GithubUserDto> getGithubUserById(String id) async {
    return const GithubUserDto(
      id: 121212,
      login: 'login',
      avatarUrl: 'avatarUrl',
    );
  }
}


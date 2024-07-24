import 'package:aniflow/core/network/model/github_user_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

String githubUrl = "https://api.github.com";
String mineUserId = "103762629";

@lazySingleton
class GithubDataSource {
  GithubDataSource(this.dio);

  final Dio dio;

  Future<GithubUserDto> getGithubUserById(String id) async {
    final response = await dio.get(
      '$githubUrl/user/$id',
    );

    return GithubUserDto.fromJson(response.data);
  }
}

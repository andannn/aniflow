// import 'package:aniflow/core/network/ani_list_data_source.dart';
// import 'package:aniflow/core/network/github_data_source.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   group('anime_database_test', () {
//     late AniListDataSource dataSource;
//     late GithubDataSource githubDataSource;
//
//     late Dio dio;
//     setUp(() async {
//       dio = Dio()
//         ..options = BaseOptions(
//           connectTimeout: const Duration(seconds: 15),
//           receiveTimeout: const Duration(seconds: 15),
//           headers: {
//             "Content-Type": "application/json",
//             "Accept": "application/json",
//           },
//         )
//         ..interceptors.addAll([
//           LogInterceptor(),
//         ]);
//       dataSource = AniListDataSource(dio);
//       githubDataSource = GithubDataSource(dio);
//     });
//
//     test('_', () async {
//       try {
//         await dataSource.getCharactersOfBirthday(1, 12);
//       } on DioException catch (_) {}
//     });
//     test('_', () async {
//       await githubDataSource.getGithubUserById(mineUserId);
//     });
//   });
// }

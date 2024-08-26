import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:dio/dio.dart';

void main() async {
  AniListDataSource dataSource;

  late Dio dio;
  dio = Dio()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    )
    ..interceptors.addAll([
      LogInterceptor(),
    ]);
  dataSource = AniListDataSource(dio);

  await dataSource.getFavoriteInfo(userId: '1');
}

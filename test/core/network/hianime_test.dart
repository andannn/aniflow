// import 'package:aniflow/core/network/hianime_data_source.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   group('data source', () {
//     final HiAnimationDataSource dataSource = HiAnimationDataSource(
//         dio: Dio()
//           ..options = BaseOptions(
//             connectTimeout: const Duration(seconds: 5),
//             receiveTimeout: const Duration(seconds: 5),
//             headers: {
//               "Content-Type": "application/json",
//               "Accept": "application/json",
//             },
//           )
//           ..interceptors.add(LogInterceptor()));
//
//     test('search', () async {
//       final res2 = await dataSource
//           .searchAnimationByKeyword(['Majo to Yajuu', 'The Witch and the Beast']);
//       expect(res2 != null, equals(true));
//     });
//
//     test('ep', () async {
//       final res2 = await dataSource.getEpisodesById('the-witch-and-the-beast-18850');
//       expect(res2.isNotEmpty, equals(true));
//     });
//
//     test('server', () async {
//       final res2 = await dataSource.getAvailableServerIdList('122900');
//       expect(res2.isNotEmpty, equals(true));
//     });
//
//     test('link', () async {
//       final res2 = await dataSource.getLink('1106683');
//       expect(res2.isNotEmpty, equals(true));
//     });
//   });
// }

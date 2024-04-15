import 'package:aniflow/core/common/util/logger.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import 'package:string_similarity/string_similarity.dart';

String hiAnimationUrl = "https://hianime.to/";

@lazySingleton
class HiAnimationDataSource {
  HiAnimationDataSource({required this.dio});

  final Dio dio;

  Future<String?> searchAnimationByKeyword(List<String> keywords,
      [CancelToken? token]) async {
    bool isMatchKeywords(String title) {
      final numbers = keywords.first
          .split(' ')
          .map((e) => int.tryParse(e))
          .whereNotNull()
          .toList();
      if (numbers.isNotEmpty) {
        bool matchNumbers = true;
        for (var element in numbers) {
          if (!title.contains(element.toString())) {
            matchNumbers = false;
            break;
          }
        }
        return matchNumbers &&
            keywords
                .where((keyword) => title.similarityTo(keyword) > 0.7)
                .isNotEmpty;
      } else {
        return keywords
            .where((keyword) => title.similarityTo(keyword) > 0.7)
            .isNotEmpty;
      }
    }

    for (var keyword in keywords) {
      final result = await dio.get(
        '${hiAnimationUrl}search',
        queryParameters: {'keyword': keyword, 'page': 1},
      );

      final document = parse(result.data);

      final elements = document
          .querySelectorAll('div.flw-item')
          .map((e) => e.querySelector('a'))
          .whereNotNull()
          .toList();

      for (var element in elements) {
        final title = element.attributes['title'] ?? '';
        if (isMatchKeywords(title)) {
          return element.attributes['href'] ?? '';
        }
      }
    }

    return null;
  }

  Future<List<(String, String, String)>> getEpisodesById(String fullId,
      [CancelToken? token]) async {
    final id = fullId.split('-').lastOrNull!;

    final result = await dio.get(
      '${hiAnimationUrl}ajax/v2/episode/list/$id',
    );
    logger.d('getEpisodesById response ${result.data}');
    final document = parse(result.data['html']);
    final attrList =
        document.querySelector('div.ss-list')?.querySelectorAll('a') ?? [];
    return attrList
        .map((e) => (
              e.attributes['data-id'] ?? '',
              e.attributes['title'] ?? '',
              e.attributes['data-number'] ?? '',
            ))
        .toList();
  }

  Future<List<String>> getAvailableServerIdList(String episodeId,
      [CancelToken? cancelToken]) async {
    final result = await dio
        .get('${hiAnimationUrl}ajax/v2/episode/servers', queryParameters: {
      'episodeId': episodeId,
    });
    print(result.data['html']);
    final document = parse(result.data['html']);
    final serverList = document.querySelectorAll('div.server-item');
    return serverList.map((e) => e.attributes['data-id'] ?? '').toList();
  }

  Future<String> getLink(String serverId, [CancelToken? cancelToken]) async {
    final result = await dio
        .get('${hiAnimationUrl}ajax/v2/episode/sources', queryParameters: {
      'id': serverId,
    });
    // 0 = {map entry} "type" -> "iframe"
    // 1 = {map entry} "link" -> "https://megacloud.tv/embed-2/e-1/CFDwFhuUXMy7?k=1"
    // 2 = {map entry} "server" -> 4
    // 3 = {map entry} "sources" -> [_GrowableList]
    // 4 = {map entry} "tracks" -> [_GrowableList]
    // 5 = {map entry} "htmlGuide" -> ""

    return result.data['link'];
  }
}

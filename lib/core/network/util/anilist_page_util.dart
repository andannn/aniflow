import 'package:aniflow/core/network/model/page_info.dart';

mixin AniListPageUtil {
  static Future<List<T>> getAllPageItem<T>({
    required Future Function(int page) onGetPage,
    required PageInfo Function(dynamic result) getPageInfoFromResult,
    required List<T> Function(dynamic result) getItemListFromResult,
  }) async {
    var currentPage = 1;
    PageInfo currentPageInfo;
    List<T> accList = [];

    do {
      final result = await onGetPage(currentPage);
      currentPageInfo = getPageInfoFromResult(result);
      accList += getItemListFromResult(result);
      currentPage++;
    } while (currentPageInfo.hasNextPage);

    return accList;
  }
}

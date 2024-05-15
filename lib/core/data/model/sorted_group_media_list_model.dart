
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';

const int newUpdateDayRange = 3;

class SortedGroupMediaListModel {
  const SortedGroupMediaListModel(this.newUpdateList, this.otherList);

  /// media lists which are regarded as newly updated
  /// by [newUpdateDayRange], before [MediaEntity.nextAiringEpisodeUpdateTime]
  final List<MediaListItemModel> newUpdateList;
  final List<MediaListItemModel> otherList;
}

extension SortedGroupMediaListModelEx on SortedGroupMediaListModel {
  bool get isEmpty => newUpdateList.isEmpty && otherList.isEmpty;
}
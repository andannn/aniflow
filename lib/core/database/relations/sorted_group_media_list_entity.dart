import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';
import 'package:equatable/equatable.dart';

class SortedGroupMediaListEntity extends Equatable {
  const SortedGroupMediaListEntity(this.newUpdateList, this.otherList);

  final List<MediaListAndMediaRelation> newUpdateList;
  final List<MediaListAndMediaRelation> otherList;

  @override
  List<Object?> get props => [...newUpdateList, ...otherList];
}

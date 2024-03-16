import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';

extension StudioMapper on StudioDto {
  StudioEntity toEntity() {
    return StudioEntity(
      id: id.toString(),
      name: name ?? '',
      siteUrl: siteUrl,
      isFavourite: isFavourite,
      isAnimationStudio: isAnimationStudio,
    );
  }
}

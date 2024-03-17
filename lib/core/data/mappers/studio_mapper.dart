import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/studio_mapper.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';

extension StudioMapper on StudioEntity {
  StudioModel toModel() {
    return StudioModel(
      id: id,
      name: name,
      siteUrl: siteUrl,
      isFavourite: isFavourite,
      isAnimationStudio: isAnimationStudio,
    );
  }
}

extension StudioMapper2 on StudioDto {
  StudioModel toModel() {
    return toEntity().toModel();
  }
}

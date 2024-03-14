import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';

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

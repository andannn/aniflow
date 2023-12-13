import 'package:aniflow/core/database/model/studio_entity.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'studio_model.freezed.dart';

@freezed
class StudioModel with _$StudioModel {
  factory StudioModel({
    @Default('') String id,
    String? name,
    String? siteUrl,
    @Default(false) bool isFavourite,
    @Default(false) bool isAnimationStudio,
  }) = _StudioModel;

  static StudioModel fromEntity(StudioEntity e) {
    return StudioModel(
      id: e.id,
      name: e.id,
      siteUrl: e.siteUrl,
      isFavourite: e.isFavourite.toBoolean(),
      isAnimationStudio: e.isAnimationStudio.toBoolean(),
    );
  }
}

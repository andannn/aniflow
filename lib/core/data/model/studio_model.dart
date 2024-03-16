import 'package:aniflow/core/data/mappers/studio_mapper.dart';
import 'package:aniflow/core/database/mappers/studio_mapper.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';
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

  static StudioModel fromDto(StudioDto dto) {
    return dto.toEntity().toModel();
  }
}

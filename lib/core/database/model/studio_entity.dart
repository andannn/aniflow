import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'studio_entity.freezed.dart';

part 'studio_entity.g.dart';

@freezed
class StudioEntity with _$StudioEntity {
  factory StudioEntity({
    @Default('') @JsonKey(name: StudioColumns.id) String id,
    @JsonKey(name: StudioColumns.name) String? name,
    @JsonKey(name: StudioColumns.siteUrl) String? siteUrl,
    @JsonKey(name: StudioColumns.isFavourite) int? isFavourite,
    @JsonKey(name: StudioColumns.isAnimationStudio) int? isAnimationStudio,
  }) = _StudioEntity;

  factory StudioEntity.fromJson(Map<String, dynamic> json) =>
      _$$StudioEntityImplFromJson(json);

  static StudioEntity fromDto(StudioDto dto) {
    return StudioEntity(
      id: dto.id.toString(),
      name: dto.name,
      siteUrl: dto.siteUrl,
      isFavourite: dto.isFavourite.toInteger(),
      isAnimationStudio: dto.isAnimationStudio.toInteger(),
    );
  }
}

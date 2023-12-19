import 'package:aniflow/core/network/model/media_tag_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_tag_model.freezed.dart';

@freezed
class MediaTagModel with _$MediaTagModel {
  const factory MediaTagModel({
    @Default('') String id,
    String? name,
    String? description,
    String? category,
    String? rank,
  }) = _MediaTagModel;

  static MediaTagModel fromDto(MediaTagDto dto) {
    return MediaTagModel(
      id: dto.toString(),
      name: dto.name,
      description: dto.description,
      category: dto.category,
      rank: dto.rank,
    );
  }
}

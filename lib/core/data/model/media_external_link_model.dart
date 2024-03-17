import 'package:aniflow/core/common/definitions/media_external_link_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_external_link_model.freezed.dart';

part 'media_external_link_model.g.dart';

@freezed
class MediaExternalLinkModel with _$MediaExternalLinkModel {
  factory MediaExternalLinkModel({
    @Default('') String url,
    @Default('') String site,
    @Default(MediaExternalLinkType.info) MediaExternalLinkType type,
    @Default(-1) int siteId,
    @Default('') String icon,
    @Default('') String color,
  }) = _MediaExternalLinkModel;

  factory MediaExternalLinkModel.fromJson(Map<String, dynamic> json) =>
      _$$MediaExternalLinkModelImplFromJson(json);
}

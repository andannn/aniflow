import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_cover_image_model.freezed.dart';

@freezed
class MediaCoverImageModel with _$MediaCoverImageModel {
  const factory MediaCoverImageModel({
    String? extraLarge,
    String? large,
    String? medium,
    Color? color,
  }) = _MediaCoverImageModel;
}

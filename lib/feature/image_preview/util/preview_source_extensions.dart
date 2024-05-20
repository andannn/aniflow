import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/feature/image_preview/image_preview.dart';

extension CharacterModelEx on CharacterModel {
  PreviewSource get previewSource => PreviewSource(
        imageUrl: largeImage,
        savedFileTitle: name?.full?.replaceAll(' ', '_'),
      );
}

extension StaffModelEx on StaffModel {
  PreviewSource get previewSource => PreviewSource(
        imageUrl: largeImage,
        savedFileTitle: name?.full?.replaceAll(' ', '_'),
      );
}

extension MediaModelEx on MediaModel {
  PreviewSource get coverPreviewSource => PreviewSource(
        imageUrl: coverImage?.extraLarge ?? '',
        savedFileTitle: '${title?.english.replaceAll(' ', '_')}_cover',
      );

  PreviewSource get bannerImagePreviewSource => PreviewSource(
        imageUrl: bannerImage ?? '',
        savedFileTitle: '${title?.english.replaceAll(' ', '_')}_banner',
      );
}

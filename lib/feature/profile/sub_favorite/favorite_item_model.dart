import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:equatable/equatable.dart';

class FavoriteItemModel extends Equatable {
  final String id;
  final String title;
  final String imageUrl;

  const FavoriteItemModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, imageUrl];
}

extension MediaModelEx on MediaModel {
  FavoriteItemModel toFavoriteItemModel(UserTitleLanguage titleLanguage) {
    return FavoriteItemModel(
      id: id,
      title: title?.getTitle(titleLanguage) ?? '',
      imageUrl: coverImage?.large ?? '',
    );
  }
}

extension CharacterModelEx on CharacterModel {
  FavoriteItemModel toFavoriteItemModel(UserStaffNameLanguage language) {
    return FavoriteItemModel(
      id: id,
      title: name?.getNameByUserSetting(language) ?? '',
      imageUrl: largeImage,
    );
  }
}

extension StaffModelEx on StaffModel {
  FavoriteItemModel toFavoriteItemModel(UserStaffNameLanguage language) {
    return FavoriteItemModel(
      id: id,
      title: name?.getNameByUserSetting(language) ?? '',
      imageUrl: largeImage,
    );
  }
}

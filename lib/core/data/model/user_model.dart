import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String avatar,
    String? bannerImage,
  }) = _UserModel;

  static UserModel? fromDatabaseModel(UserEntity? model) {
    if (model == null) {
      return null;
    } else {
      return UserModel(
        id: model.id,
        name: model.name,
        avatar: model.avatar,
        bannerImage: model.bannerImage,
      );
    }
  }
}

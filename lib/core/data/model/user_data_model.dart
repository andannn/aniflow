import 'package:aniflow/core/database/model/user_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';

@freezed
class UserData with _$UserData {
  factory UserData({
    @Default('') String id,
    @Default('') String name,
    @Default('') String avatar,
    String? bannerImage,
  }) = _UserData;

  static UserData? fromDatabaseModel(UserDataEntity? model) {
    if (model == null) {
      return null;
    } else {
      return UserData(
        id: model.id,
        name: model.name,
        avatar: model.avatar,
        bannerImage: model.bannerImage,
      );
    }
  }
}

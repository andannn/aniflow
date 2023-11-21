import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    @Default('') @JsonKey(name: UserDataTableColumns.id) String id,
    @Default('') @JsonKey(name: UserDataTableColumns.name) String name,
    @Default('') @JsonKey(name: UserDataTableColumns.avatarImage) String avatar,
    @JsonKey(name: UserDataTableColumns.bannerImage) String? bannerImage,
    @JsonKey(name: UserDataTableColumns.profileColor) String? profileColor,
    @JsonKey(name: UserDataTableColumns.unreadNotificationCount)
    int? unreadNotificationCount,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  static UserEntity fromDto(UserDto model) => UserEntity(
        id: model.id.toString(),
        name: model.name,
        avatar: model.avatar['large']!,
        bannerImage: model.bannerImage,
        profileColor: model.options?.profileColor,
        unreadNotificationCount: model.unreadNotificationCount,
      );
}

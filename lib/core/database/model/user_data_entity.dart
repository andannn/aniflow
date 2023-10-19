import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/network/model/user_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_entity.freezed.dart';
part 'user_data_entity.g.dart';

@freezed
class UserDataEntity with _$UserDataEntity {
  factory UserDataEntity({
    @Default('') @JsonKey(name: UserDataTableColumns.id) String id,
    @Default('') @JsonKey(name: UserDataTableColumns.name) String name,
    @Default('') @JsonKey(name: UserDataTableColumns.avatarImage) String avatar,
    @JsonKey(name: UserDataTableColumns.bannerImage) String? bannerImage,
  }) = _UserDataEntity;

  factory UserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataEntityFromJson(json);

  static UserDataEntity fromNetworkModel(UserDataDto model) => UserDataEntity(
    id: model.id.toString(),
    name: model.name,
    avatar: model.avatar['large']!,
    bannerImage: model.bannerImage
  );
}

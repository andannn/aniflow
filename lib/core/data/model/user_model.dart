import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String avatar,
    String? bannerImage,
    Color? profileColor,
    @Default(0) int unreadNotificationCount,
  }) = _UserModel;

  static UserModel? fromEntity(UserEntity? model) {
    if (model == null) {
      return null;
    } else {
      return UserModel(
        id: model.id,
        name: model.name,
        avatar: model.avatar,
        bannerImage: model.bannerImage,
        profileColor: ProfileColorDict.fromDict(model.profileColor),
        unreadNotificationCount: model.unreadNotificationCount ?? 0,
      );
    }
  }

  static UserModel fromDto(UserDto dto) {
    final entity = UserEntity.fromDto(dto);
    return UserModel.fromEntity(entity)!;
  }
}

mixin ProfileColorDict {
  static final profileColorDict = {
    'purple' : Colors.purple,
  };

  static Color? fromDict(String? color) => profileColorDict[color];
}
import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/database/mappers/user_mapper.dart';
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

  static UserModel fromDto(UserDto dto) {
    return dto.toEntity().toModel();
  }
}

mixin ProfileColorDict {
  static final profileColorDict = {
    'purple' : Colors.purple,
  };

  static Color? fromDict(String? color) => profileColorDict[color];
}
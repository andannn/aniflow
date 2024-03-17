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
}

mixin ProfileColorDict {
  static final profileColorDict = {
    'purple' : Colors.purple,
  };

  static Color? fromDict(String? color) => profileColorDict[color];
}
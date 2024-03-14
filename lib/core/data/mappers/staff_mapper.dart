import 'dart:convert';

import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';

extension StaffMapper on StaffEntity {
  StaffModel toModel() {
    return StaffModel(
      id: id,
      largeImage: largeImage ?? '',
      mediumImage: mediumImage ?? '',
      name: StaffCharacterName(
        first: firstName,
        middle: middleName,
        last: lastName,
        full: fullName,
        native: nativeName,
      ),
      description: description,
      gender: gender,
      siteUrl: siteUrl,
      age: age,
      isFavourite: isFavourite ?? false,
      dateOfBirth: dateOfBirth != null
          ? DateTime.fromMillisecondsSinceEpoch(dateOfBirth!)
          : null,
      dateOfDeath: dateOfDeath != null
          ? DateTime.fromMillisecondsSinceEpoch(dateOfDeath!)
          : null,
      yearsActive: yearsActive != null ? jsonDecode(yearsActive!) : [],
      homeTown: homeTown,
      bloodType: bloodType,
    );
  }
}

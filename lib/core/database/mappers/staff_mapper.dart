import 'dart:convert';

import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/util/date_time_util.dart';

extension StaffMapper on StaffDto {
  StaffEntity toEntity() {
    return StaffEntity(
      id: id.toString(),
      largeImage: image?.large,
      mediumImage: image?.medium,
      firstName: name?.first,
      middleName: name?.middle,
      lastName: name?.last,
      fullName: name?.full,
      nativeName: name?.native,
      description: description,
      gender: gender,
      siteUrl: siteUrl,
      age: age,
      isFavourite: isFavourite,
      dateOfBirth: dateOfBirth?.toDateTime()?.millisecondsSinceEpoch,
      dateOfDeath: dateOfDeath?.toDateTime()?.millisecondsSinceEpoch,
      yearsActive: yearsActive.isNotEmpty ? jsonEncode(yearsActive) : null,
      homeTown: homeTown,
      bloodType: bloodType,
    );
  }
}

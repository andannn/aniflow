// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:flutter/material.dart';

class DescriptionItem {
  DescriptionItem({required this.key, required this.value});

  final String key;
  final String value;
}

List<DescriptionItem> createDescription(dynamic model, BuildContext context) {
  if (model is CharacterModel) {
    return model.createDescriptionItem(context);
  } else if (model is StaffModel) {
    return model.createDescriptionItem(context);
  } else {
    throw Exception('Unknown model type');
  }
}

extension CharacterModelEx on CharacterModel {
  List<DescriptionItem> createDescriptionItem(BuildContext context) {
    final localization = Localizations.of<MaterialLocalizations>(
        context, MaterialLocalizations)!;
    final descriptionItemList = <DescriptionItem>[];

    if (dateOfBirth != null) {
      descriptionItemList.add(
        DescriptionItem(
          key: 'Birthday: ',
          value: localization.formatMediumDate(dateOfBirth!),
        ),
      );
    }

    if (age != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'Age: ', value: age!),
      );
    }

    if (gender != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'Gender: ', value: gender!),
      );
    }
    if (bloodType != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'BloodType: ', value: bloodType!),
      );
    }

    return descriptionItemList;
  }
}

extension StaffModelEx on StaffModel {
  List<DescriptionItem> createDescriptionItem(BuildContext context) {
    final localization = Localizations.of<MaterialLocalizations>(
        context, MaterialLocalizations)!;
    final descriptionItemList = <DescriptionItem>[];

    if (dateOfBirth != null) {
      descriptionItemList.add(
        DescriptionItem(
          key: 'Birthday: ',
          value: localization.formatShortDate(dateOfBirth!),
        ),
      );
    }

    if (age != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'Age: ', value: age!.toString()),
      );
    }

    if (gender != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'Gender: ', value: gender!),
      );
    }

    if (yearsActive.isNotEmpty) {
      final startYear = yearsActive[0];
      final endYear = yearsActive.elementAtOrNull(1);
      descriptionItemList.add(
        DescriptionItem(
            key: 'Years active: ', value: '$startYear-${endYear ?? 'Present'}'),
      );
    }

    if (homeTown != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'Hometown: ', value: homeTown!),
      );
    }

    if (bloodType != null) {
      descriptionItemList.add(
        DescriptionItem(key: 'Blood Type: ', value: bloodType!),
      );
    }

    return descriptionItemList;
  }
}

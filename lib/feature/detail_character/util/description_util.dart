import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDescriptionItem {
  CharacterDescriptionItem({required this.key, required this.value});

  final String key;
  final String value;
}

extension CharacterModelEx on CharacterModel {
  List<CharacterDescriptionItem> createDescriptionItem(BuildContext context) {
    final localization = Localizations.of<MaterialLocalizations>(
        context, MaterialLocalizations)!;
    final descriptionItemList = <CharacterDescriptionItem>[];

    if (dateOfBirth != null) {
      descriptionItemList.add(
        CharacterDescriptionItem(
          key: 'Birthday: ',
          value: localization.formatShortDate(dateOfBirth!),
        ),
      );
    }

    if (age != null) {
      descriptionItemList.add(
        CharacterDescriptionItem(key: 'Age: ', value: age!),
      );
    }

    if (gender != null) {
      descriptionItemList.add(
        CharacterDescriptionItem(key: 'Gender: ', value: gender!),
      );
    }
    if (bloodType != null) {
      descriptionItemList.add(
        CharacterDescriptionItem(key: 'BloodType: ', value: bloodType!),
      );
    }

    logger.d(description);

    return descriptionItemList;
  }
}

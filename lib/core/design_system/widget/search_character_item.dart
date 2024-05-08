import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class SearchCharacterItem extends StatelessWidget {
  const SearchCharacterItem({
    required this.model,
    required this.onClick,
    super.key,
    required this.userStaffNameLanguage,
  });

  final CharacterModel model;
  final VoidCallback onClick;
  final UserStaffNameLanguage userStaffNameLanguage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceTextColor = colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 85,
              width: 85,
              child: AFNetworkImage(
                imageUrl: model.mediumImage,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Text(
                model.name!.getNameByUserSetting(userStaffNameLanguage),
                style: textTheme.titleMedium?.copyWith(color: surfaceTextColor),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

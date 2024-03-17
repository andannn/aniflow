import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class StaffItem extends StatelessWidget {
  const StaffItem({
    required this.model,
    super.key,
    this.textStyle,
    this.onStaffClick,
    required this.language,
  });

  final StaffAndRoleModel model;
  final UserStaffNameLanguage language;
  final VoidCallback? onStaffClick;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final style = textStyle?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant);
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: onStaffClick,
            child: AspectRatio(
              aspectRatio: 3.0 / 4,
              child: AFNetworkImage(
                imageUrl: model.staff.mediumImage,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.staff.name!.getNameByUserSetting(language),
                    style: style,
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Text(
                    model.role,
                    style: style,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

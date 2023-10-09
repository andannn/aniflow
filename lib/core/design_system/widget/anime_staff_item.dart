import 'package:anime_tracker/core/data/model/staff_and_role_model.dart';
import 'package:flutter/material.dart';

import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';

class StaffItem extends StatelessWidget {
  const StaffItem({
    required this.model,
    super.key,
    this.textStyle,
    this.onStaffClick,
  });

  final StaffAndRoleModel model;
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
                imageUrl: model.staff.image,
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
                  Text(model.staff.nameNative, style: style),
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

import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:flutter/material.dart';

class AiringMediaItem extends StatelessWidget {
  const AiringMediaItem({
    super.key,
    required this.model,
    required this.onClick,
    required this.userTitleLanguage,
    required this.description,
  });

  final MediaModel model;
  final String description;
  final VoidCallback onClick;
  final UserTitleLanguage userTitleLanguage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: MediaRowItem(
        model: model,
        language: userTitleLanguage,
        centerWidget: Text(
          description,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: colorScheme.primary),
        ),
        titleMaxLines: null,
        onClick: onClick,
      ),
    );
  }
}

import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:flutter/material.dart';

class SearchMediaItem extends StatelessWidget {
  const SearchMediaItem({
    required this.model,
    required this.onClick,
    super.key,
    required this.userTitleLanguage,
  });

  final MediaModel model;
  final VoidCallback onClick;
  final UserTitleLanguage userTitleLanguage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: MediaRowItem(
        model: model,
        language: userTitleLanguage,
        titleMaxLines: null,
        onClick: onClick,
      ),
    );
  }
}

import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';

class SearchAnimeItem extends StatelessWidget {
  const SearchAnimeItem(
      {required this.model, required this.onClick, super.key});

  final MediaModel model;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: MediaRowItem(
        model: model,
        language: getIt.get<AniFlowPreferences>().aniListSettings.value.userTitleLanguage,
        titleMaxLines: null,
        onClick: onClick,
      ),
    );
  }
}

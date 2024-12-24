import 'dart:math';

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/design_system/widget/character_and_voice_actor_widget.dart';
import 'package:aniflow/core/design_system/widget/external_link_item.dart';
import 'package:aniflow/core/design_system/widget/media_relation_widget.dart';
import 'package:aniflow/core/design_system/widget/staff_item.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildExternalLinkSection(
    BuildContext context, List<MediaExternalLinkModel> externalLinks) {
  return AnimatedScaleSwitcher(
    visible: externalLinks.isNotEmpty,
    builder: () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            context.appLocal.externalLinks,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 6,
            children: externalLinks
                .map((e) => ExternalLinkItem(externalLink: e))
                .toList(),
          ),
        ),
      ],
    ),
  );
}

Widget buildMediaRelations(
    {required BuildContext context,
      required List<MediaRelationModel> relations}) {
  return AnimatedScaleSwitcher(
    visible: relations.isNotEmpty,
    builder: () => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.appLocal.relations,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: relations.length,
              itemBuilder: (BuildContext context, int index) {
                final relation = relations[index];
                return MediaRelationWidget(
                  model: relation,
                  onClick: () {
                    RootRouterDelegate.get()
                        .navigateToDetailMedia(relation.media.id);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    ),
  );
}

Widget buildStudioSection(
  BuildContext context, {
  required List<StudioModel> studios,
  required Function(String id) onStudioClick,
}) {
  return AnimatedScaleSwitcher(
    visible: studios.isNotEmpty,
    builder: () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            context.appLocal.studio,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 6,
            children: studios
                .map((e) => OutlinedButton(
                    onPressed: () => onStudioClick.call(e.id),
                    child: Text(e.name!)))
                .toList(),
          ),
        ),
      ],
    ),
  );
}

Widget buildCharacterSection(
    BuildContext context, List<CharacterAndVoiceActorModel> models) {
  final canFillPage = models.length >= AfConfig.characterColumnCount;
  const itemHeight = AfConfig.detailPagePreviewItemHeight;
  final pageHeight = canFillPage
      ? AfConfig.characterColumnCount * itemHeight
      : models.length * itemHeight;
  return AnimatedScaleSwitcher(
    visible: models.isNotEmpty,
    builder: () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                context.appLocal.characters,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Expanded(flex: 1, child: SizedBox()),
              TextButton(
                onPressed: () {
                  RootRouterDelegate.get().navigateToCharacterList(
                      context.read<DetailMediaBloc>().mediaId);
                },
                child: Text(context.materialLocal.moreButtonTooltip),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: pageHeight,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.93),
            itemCount: (models.length / 3).ceil(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: _createColumItemsPage(context,
                    models: models,
                    pageItemCount: AfConfig.characterColumnCount,
                    pageIndex: index,
                    onBuildWidget: _buildCharacterAndVoiceActorItem),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildCharacterAndVoiceActorItem(
    BuildContext context, CharacterAndVoiceActorModel model) {
  final language = context.read<DetailMediaBloc>().state.userStaffNameLanguage;
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: CharacterAndVoiceActorWidget(
        model: model,
        language: language,
        textStyle: Theme.of(context).textTheme.bodyMedium,
        onCharacterTap: () {
          final characterId = model.characterModel.id;
          RootRouterDelegate.get().navigateToDetailCharacter(characterId);
        },
        onVoiceActorTop: () {
          final id = model.voiceActorModel?.id;
          if (id != null) {
            RootRouterDelegate.get().navigateToDetailStaff(id);
          }
        },
      ),
    ),
  );
}

Widget buildStaffsSection(
    BuildContext context, List<StaffAndRoleModel> staffs) {
  final canFillPage = staffs.length >= AfConfig.staffColumnCount;
  const itemHeight = AfConfig.detailPagePreviewItemHeight;
  final pageHeight = canFillPage
      ? AfConfig.staffColumnCount * itemHeight
      : staffs.length * itemHeight;
  return AnimatedScaleSwitcher(
    visible: staffs.isNotEmpty,
    builder: () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                context.appLocal.staff,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Expanded(flex: 1, child: SizedBox()),
              TextButton(
                onPressed: () {
                  RootRouterDelegate.get().navigateToStaffList(
                      context.read<DetailMediaBloc>().mediaId);
                },
                child: Text(context.materialLocal.moreButtonTooltip),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: pageHeight,
          child: PageView.builder(
            itemCount: (staffs.length).ceil(),
            itemBuilder: (BuildContext context, int index) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.93),
                itemCount: (staffs.length / 2).ceil(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _createColumItemsPage(
                      context,
                      models: staffs,
                      pageItemCount: AfConfig.staffColumnCount,
                      pageIndex: index,
                      onBuildWidget: _buildStaffItem,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildStaffItem(BuildContext context, StaffAndRoleModel model) {
  final language = context.read<DetailMediaBloc>().state.userStaffNameLanguage;
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: StaffItem(
        model: model,
        language: language,
        textStyle: Theme.of(context).textTheme.bodyMedium,
        onStaffClick: () {
          RootRouterDelegate.get().navigateToDetailStaff(
            model.staff.id,
          );
        },
      ),
    ),
  );
}

List<Widget> _createColumItemsPage<T>(
  BuildContext context, {
  required List<T> models,
  required int pageItemCount,
  required int pageIndex,
  required Widget Function(BuildContext, T model) onBuildWidget,
}) {
  final modelList = models.sublist(
    pageIndex * pageItemCount,
    min((pageIndex + 1) * pageItemCount, models.length),
  );
  final widgets = <Widget>[];
  widgets.addAll(
    modelList.map((model) => onBuildWidget(context, model)),
  );

  if (pageIndex == 0) {
    /// first page have no need to add space.
    return widgets;
  }

  // ignore: lines_longer_than_80_chars
  /// when column count is less than pageCount, add empty SizeBox to take the space.
  while (widgets.length < pageItemCount) {
    widgets.add(const Expanded(flex: 1, child: SizedBox()));
  }
  return widgets;
}

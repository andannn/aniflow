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
import 'package:aniflow/feature/discover/birthday_characters/birthday_character.dart';
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
                return Row(
                  children: [
                    MediaRelationWidget(
                      model: relation,
                      onClick: () {
                        RootRouterDelegate.get()
                            .navigateToDetailMedia(relation.media.id);
                      },
                    ),
                    if (index != relations.length - 1) const VerticalDivider()
                  ],
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

List<Widget> buildCharacterSection(
    BuildContext context, List<CharacterAndVoiceActorModel> models) {
  return [
    if (models.isNotEmpty)
      SliverToBoxAdapter(
        child: Column(
          children: [
            CategoryTitleBar(
              title: context.appLocal.characters,
              onMoreClick: () {
                RootRouterDelegate.get().navigateToCharacterList(
                    context.read<DetailMediaBloc>().mediaId);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    SliverGrid.builder(
      itemCount: models.length,
      gridDelegate: AfConfig.horizonGridDelegate,
      itemBuilder: (BuildContext context, int index) {
        return _buildCharacterAndVoiceActorItem(context, models[index]);
      },
    )
  ];
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

List<Widget> buildStaffsSection(
    BuildContext context, List<StaffAndRoleModel> staffs) {
  return [
    if (staffs.isNotEmpty)
      SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CategoryTitleBar(
              title: context.appLocal.staff,
              onMoreClick: () {
                RootRouterDelegate.get().navigateToStaffList(
                    context.read<DetailMediaBloc>().mediaId);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    SliverGrid.builder(
      itemCount: staffs.length,
      gridDelegate: AfConfig.horizonGridDelegate,
      itemBuilder: (BuildContext context, int index) {
        return _buildStaffItem(context, staffs[index]);
      },
    ),
  ];
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

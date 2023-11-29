import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_state.dart';
import 'package:aniflow/feature/detail_character/util/description_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailCharacterPage extends Page {
  final String id;

  const DetailCharacterPage({required this.id, super.key});

  @override
  Route createRoute(BuildContext context) {
    return DetailCharacterRoute(settings: this, id: id);
  }
}

class DetailCharacterRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String id;

  DetailCharacterRoute({required this.id, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCharacterBloc(
        characterId: id,
        mediaRepository: context.read<MediaInformationRepository>(),
        favoriteRepository: context.read<FavoriteRepository>(),
      ),
      child: const _DetailCharacterContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailCharacterContent extends StatelessWidget {
  const _DetailCharacterContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
        builder: (BuildContext context, state) {
      final colorScheme = Theme.of(context).colorScheme;
      final character = state.characterModel;
      final isLoading = state.isLoading;
      final relatedMedias = state.characterModel?.relatedMedias ?? [];

      if (character == null) {
        return const SizedBox();
      }

      final isFavourite = character.isFavourite;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(character.name),
          actions: [
            isLoading
                ? LoadingIndicator(isLoading: isLoading)
                : IconButton(
                    onPressed: () {
                      context.read<DetailCharacterBloc>().add(OnToggleLike());
                    },
                    icon: isFavourite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_outline),
                  ),
            const SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: Card(
                    elevation: 0,
                    color: colorScheme.surfaceVariant,
                    clipBehavior: Clip.antiAlias,
                    child: AFNetworkImage(imageUrl: character.image),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _buildDescriptionSection(context, character),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 48)),
              SliverToBoxAdapter(
                child: Text(
                  'Related Content',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 4)),
              SliverGrid.builder(
                itemCount: relatedMedias.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3.0 / 5.2,
                ),
                itemBuilder: (context, index) {
                  return _buildGridItems(context, relatedMedias[index]);
                },
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 32)),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDescriptionSection(
      BuildContext context, CharacterModel character) {
    final textTheme = Theme.of(context).textTheme;
    final items = character.createDescriptionItem(context);
    final description = character.description ?? '';
    return VerticalScaleSwitcher(
      visible: items.isNotEmpty || description.isNotEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...items.map(
            (item) => RichText(
              text: TextSpan(
                text: item.key,
                style: textTheme.titleSmall,
                children: [
                  TextSpan(
                    text: item.value,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          HtmlWidget(description)
        ],
      ),
    );
  }

  Widget _buildGridItems(BuildContext context, MediaModel model) {
    return MediaPreviewItem(
      textStyle: Theme.of(context).textTheme.labelMedium,
      coverImage: model.coverImage,
      title: model.title!.getTitle(
          AniFlowPreferences().getAniListSettings().userTitleLanguage),
      isFollowing: model.isFollowing,
      onClick: () {
        AFRouterDelegate.of(context).navigateToDetailMedia(
          model.id,
        );
      },
    );
  }
}

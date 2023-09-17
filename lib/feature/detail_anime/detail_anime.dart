import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/designsystem/widget/anime_character_and_voice_actor.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_error_widget.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_initial_widget.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_bloc.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_ui_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_tracker/core/designsystem/animetion/page_transaction_animetion.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailAnimePage extends Page {
  final String animeId;

  const DetailAnimePage({required this.animeId, super.key});

  @override
  Route createRoute(BuildContext context) {
    return DetailAnimeRoute(settings: this, animeId: animeId);
  }
}

class DetailAnimeRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String animeId;

  DetailAnimeRoute({required this.animeId, super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailAnimeBloc(
        animeId: animeId,
        aniListRepository: context.read<AniListRepository>(),
      ),
      child: Scaffold(
        body: const _DetailAnimePageContent(),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.favorite_border),
          label: const Text('Follow'),
          isExtended: false,
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return getFistPageTransaction(
      animation: animation,
      child: getSecondaryPageTransaction(
        animation: secondaryAnimation,
        child: child,
      ),
    );
  }

  @override
  bool get maintainState => false;
}

class _DetailAnimePageContent extends StatelessWidget {
  const _DetailAnimePageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailAnimeBloc, DetailAnimeUiState>(
      builder: (context, state) {
        final model = state.detailAnimeModel;
        if (model == null) {
          return const SizedBox();
        }

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
              title: Text(model.title!.getLocalTitle(context)),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    height: 128,
                    imageUrl: model.bannerImage ?? '',
                    placeholder: buildImageInitialWidget,
                    errorWidget: buildErrorWidget,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: _buildAnimeBasicInfoBar(
                  context: context,
                  model: model,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: _buildAnimeDescription(
                  context: context,
                  description: model.description ?? '',
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: _buildCharacterSection(
                  context,
                  model.characterAndVoiceActors,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        );
      },
    );
  }

  Widget _buildAnimeBasicInfoBar(
      {required BuildContext context, required DetailAnimeModel model}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Card(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            child: AspectRatio(
              aspectRatio: 3.0 / 4,
              child: CachedNetworkImage(
                imageUrl: model.coverImage,
                fit: BoxFit.cover,
                placeholder: buildImageInitialWidget,
                errorWidget: buildErrorWidget,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Wrap(
                spacing: 12,
                children: [
                  const _InfoItem(
                    label: 'RATED',
                    content: Text('#32'),
                  ),
                  const _InfoItem(
                    label: 'POPULAR',
                    content: Text('#65'),
                  ),
                  _InfoItem(
                    label: 'SCORE',
                    content: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_purple500_sharp,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${model.averageScore != null ? (model.averageScore! / 10.0) : '--'}',
                        ),
                      ],
                    ),
                  ),
                  _InfoItem(
                    label: 'FAVOURITE',
                    content: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_sharp,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${model.favourites != null ? (model.favourites) : '--'}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: _buildGenreItems(
                    context,
                    ["Action", "Adventure", "Drama", "Sci-Fi"],
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '2023·Spring·TV·12 episodes',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildGenreItems(BuildContext context, List<String> list) {
    final widgets = <Widget>[];
    for (final item in list) {
      widgets.add(_GenreItem(label: item));
      if (list.lastOrNull != item) {
        widgets.add(
          Text(
            '·',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      }
    }
    return widgets;
  }

  Widget _buildAnimeDescription(
      {required BuildContext context, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this anime',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Html(data: description),
      ],
    );
  }

  Widget _buildCharacterSection(
      BuildContext context, List<CharacterAndVoiceActorModel> models) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Characters',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 400,
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      _buildCharacterAndVoiceActorItem(context, models[index]),
                  childCount: models.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 400,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCharacterAndVoiceActorItem(
      BuildContext context, CharacterAndVoiceActorModel model) {
    return CharacterAndVoiceActor(
      model: model,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _GenreItem extends StatelessWidget {
  const _GenreItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.label, this.content});

  final String label;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          content ?? const SizedBox(),
        ],
      ),
    );
  }
}

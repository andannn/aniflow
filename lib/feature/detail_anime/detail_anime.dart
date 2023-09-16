import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_error_widget.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_bloc.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_ui_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_tracker/core/designsystem/animetion/page_transaction_animetion.dart';

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
  const _DetailAnimePageContent({super.key});

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
                    imageUrl: model.bannerImage,
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
                child: _buildAnimeBasicInfoBar(model: model),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAnimeBasicInfoBar({required DetailAnimeModel model}) {
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
                errorWidget: buildErrorWidget,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: CachedNetworkImage(imageUrl: model.coverImage),
        ),
      ],
    );
  }
}

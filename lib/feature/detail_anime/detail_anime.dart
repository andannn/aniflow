import 'dart:math';

import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/model/staff_and_role_model.dart';
import 'package:anime_tracker/core/data/model/trailter_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/util/anime_model_extension.dart';
import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';
import 'package:anime_tracker/core/design_system/widget/anime_character_and_voice_actor.dart';
import 'package:anime_tracker/core/design_system/widget/anime_staff_item.dart';
import 'package:anime_tracker/core/design_system/widget/trailer_preview.dart';
import 'package:anime_tracker/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_bloc.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_tracker/core/design_system/animetion/page_transaction_animetion.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';

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
        authRepository: context.read<AuthRepository>(),
        animeTrackListRepository: context.read<AnimeTrackListRepository>(),
      ),
      child: const _DetailAnimePageContent(),
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
        final isFollowing = model.isFollowing;
        final isLoading = state.isLoading;
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(
              isFollowing ? Icons.favorite_outlined : Icons.favorite_border,
            ),
            label: const Text('Follow'),
            isExtended: false,
            onPressed: () {
              context
                  .read<DetailAnimeBloc>()
                  .add(OnToggleFollowState(isFollow: !isFollowing));
            },
          ),
          body: CustomScrollView(
            cacheExtent: Config.defaultCatchExtend,
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
                title: Text(model.title!.getLocalTitle(context)),
                actions: [
                  AnimatedOpacity(
                    opacity: isLoading ? 1.0 : 0.0,
                    duration: Config.defaultAnimationDuration,
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 33.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SliverToBoxAdapter(
                child: _buildBannerSectionSection(context, model.bannerImage),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: _buildAnimeBasicInfoBar(
                  context: context,
                  model: model,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: _buildAnimeInfoSection(context, model),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: _buildAnimeDescription(
                  context: context,
                  description: model.description,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: _buildCharacterSection(
                  context,
                  model.characterAndVoiceActors,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: _buildStaffsSection(
                  context,
                  model.staffs,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: _buildTrailerSection(
                  context,
                  trailerModel: model.trailerModel,
                  onTrailerClick: () {
                    launchUrl(TrailerModel.getLaunchUri(model.trailerModel));
                  },
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimeBasicInfoBar(
      {required BuildContext context, required AnimeModel model}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 0,
              clipBehavior: Clip.hardEdge,
              child: AspectRatio(
                aspectRatio: 3.0 / 4,
                child: AFNetworkImage(
                  imageUrl: model.coverImage,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 12,
                    children: [
                      _InfoItem(
                        label: 'RATED',
                        iconData: Icons.hotel_class_sharp,
                        contentText: '#${model.ratedRank ?? '--'}',
                      ),
                      _InfoItem(
                        label: 'POPULAR',
                        iconData: Icons.favorite_sharp,
                        contentText: '#${model.popularRank ?? '--'}',
                      ),
                      _InfoItem(
                        label: 'SCORE',
                        iconData: Icons.star_purple500_sharp,
                        contentText:
                            '${model.averageScore != null ? (model.averageScore! / 10.0) : '--'}',
                      ),
                      _InfoItem(
                        label: 'FAVOURITE',
                        iconData: Icons.thumb_up,
                        contentText:
                            '${model.favourites != null ? (model.favourites) : '--'}',
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: _buildGenreItems(context, model.genres),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGenreItems(BuildContext context, List<String> list) {
    final widgets = <Widget>[];
    for (final item in list) {
      widgets.add(_GenreItem(label: item));
    }
    return widgets;
  }

  Widget _buildAnimeDescription(
      {required BuildContext context, required String? description}) {
    return VerticalScaleSwitcher(
      child: description != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AFLocalizations.of(context).animeDescription,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Html(data: description),
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _buildCharacterSection(
      BuildContext context, List<CharacterAndVoiceActorModel> models) {
    return VerticalScaleSwitcher(
      child: models.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    AFLocalizations.of(context).characters,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    itemCount: (models.length / 3).ceil(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _createColumItemsPage(context,
                            models: models,
                            pageCount: 3,
                            pageIndex: index,
                            onBuildWidget: _buildCharacterAndVoiceActorItem),
                      );
                    },
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }

  Widget _buildCharacterAndVoiceActorItem(
      BuildContext context, CharacterAndVoiceActorModel model) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CharacterAndVoiceActor(
          model: model,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildStaffsSection(
      BuildContext context, List<StaffAndRoleModel> staffs) {
    return VerticalScaleSwitcher(
      child: staffs.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    AFLocalizations.of(context).staff,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 266,
                  child: PageView.builder(
                    itemCount: (staffs.length).ceil(),
                    itemBuilder: (BuildContext context, int index) {
                      return PageView.builder(
                        itemCount: (staffs.length / 2).ceil(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _createColumItemsPage(
                              context,
                              models: staffs,
                              pageCount: 2,
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
            )
          : const SizedBox(),
    );
  }

  Widget _buildStaffItem(BuildContext context, StaffAndRoleModel model) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: StaffItem(
          model: model,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildBannerSectionSection(BuildContext context, String? bannerImage) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        child: AFNetworkImage(
          height: 128,
          imageUrl: bannerImage ?? '',
        ),
      ),
    );
  }

  Widget _buildTrailerSection(BuildContext context,
      {required VoidCallback onTrailerClick, TrailerModel? trailerModel}) {
    return VerticalScaleSwitcher(
      child: trailerModel != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AFLocalizations.of(context).trailer,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  TrailerPreview(
                    model: trailerModel,
                    onTrailerClick: onTrailerClick,
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _buildAnimeInfoSection(BuildContext context, AnimeModel model) {
    final infoString = model.getAnimeInfoString(context);
    return VerticalScaleSwitcher(
      child: infoString.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.getAnimeInfoString(context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  _buildAiringInfo(context, model)
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _buildAiringInfo(BuildContext context, AnimeModel model) {
    final nextAiringEpisode = model.nextAiringEpisode;
    final airingTimeString = model.getReleasingTimeString(context);
    if (airingTimeString.isEmpty) {
      return const SizedBox();
    }
    const stringRes = 'Next airing schedule is EP.%s in %s';
    return VerticalScaleSwitcher(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          sprintf(stringRes, [nextAiringEpisode, airingTimeString]),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  List<Widget> _createColumItemsPage<T>(
    BuildContext context, {
    required List<T> models,
    required int pageCount,
    required int pageIndex,
    required Widget Function(BuildContext, T model) onBuildWidget,
  }) {
    final modelList = models.sublist(
      pageIndex * pageCount,
      min((pageIndex + 1) * pageCount, models.length),
    );
    final widgets = <Widget>[];
    widgets.addAll(
      modelList.map((model) => onBuildWidget(context, model)),
    );

    /// when column count is less than pageCount, add empty SizeBox to take the space.
    while (widgets.length < pageCount) {
      widgets.add(const Expanded(flex: 1, child: SizedBox()));
    }
    return widgets;
  }
}

class _GenreItem extends StatelessWidget {
  const _GenreItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem(
      {required this.label, required this.iconData, required this.contentText});

  final String label;
  final String contentText;
  final IconData iconData;

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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(width: 8),
              Text(
                contentText,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

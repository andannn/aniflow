import 'dart:math';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/app/local/util/string_resource_util.dart';
import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/core/common/util/color_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/trailter_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/character_and_voice_actor_widget.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_relation_widget.dart';
import 'package:aniflow/core/design_system/widget/staff_item.dart';
import 'package:aniflow/core/design_system/widget/trailer_preview.dart';
import 'package:aniflow/core/design_system/widget/twitter_hashtag_widget.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:aniflow/core/design_system/widget/update_media_list_bottom_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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

  DetailAnimeRoute({required this.animeId, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailMediaBloc(
        animeId: animeId,
        aniListRepository: context.read<MediaInformationRepository>(),
        authRepository: context.read<AuthRepository>(),
        animeTrackListRepository: context.read<MediaListRepository>(),
        favoriteRepository: context.read<FavoriteRepository>(),
      ),
      child: const Scaffold(body: _DetailAnimePageContent()),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailAnimePageContent extends StatelessWidget {
  const _DetailAnimePageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMediaBloc, DetailMediaUiState>(
      builder: (context, state) {
        final model = state.detailAnimeModel;
        if (model == null) {
          return const SizedBox();
        }
        final isLoading = state.isLoading;
        final stateString = state.mediaListItem?.status?.stateString ?? '';
        final hasDescription = stateString.isNotEmpty;
        final statusIcon = state.mediaListItem?.status?.statusIcon ?? Icons.add;
        final isFavorite = model.isFavourite ?? false;

        void floatingButtonClickAction() async {
          final bloc = context.read<DetailMediaBloc>();
          final result = await showUpdateMediaListBottomSheet(
            context,
            listItemModel: state.mediaListItem,
            media: state.detailAnimeModel!,
          );

          if (result != null) {
            bloc.add(OnMediaListModified(result: result));
          }
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            title: AutoSizeText(
              model.title!.getTitle(
                  AniFlowPreferences().getAniListSettings().userTitleLanguage),
              maxLines: 2,
            ),
            actions: [
              isLoading
                  ? LoadingIndicator(isLoading: isLoading)
                  : IconButton(
                      onPressed: () {
                        context.read<DetailMediaBloc>().add(
                              OnToggleFavoriteState(
                                  isAnime: true, mediaId: model.id),
                            );
                      },
                      icon: isFavorite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_outline),
                    ),
              const SizedBox(width: 10),
            ],
          ),
          floatingActionButton: hasDescription
              ? FloatingActionButton.extended(
                  icon: Icon(statusIcon),
                  label: Text(stateString),
                  onPressed: floatingButtonClickAction,
                )
              : FloatingActionButton(
                  onPressed: floatingButtonClickAction,
                  child: Icon(statusIcon),
                ),
          body: CustomScrollView(
            cacheExtent: Config.defaultCatchExtend,
            slivers: [
              SliverToBoxAdapter(
                child: _buildBannerSectionSection(context, model.bannerImage),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildAnimeBasicInfoBar(
                  context: context,
                  model: model,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildTwitterHashTags(context, model),
              ),
              SliverToBoxAdapter(
                child: _buildAnimeRelations(
                  context: context,
                  relations: model.relations,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildAnimeInfoSection(context, model),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildAnimeDescription(
                  context: context,
                  description: model.description,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildCharacterSection(
                  context,
                  model.characterAndVoiceActors,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildStaffsSection(
                  context,
                  model.staffs,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildTrailerSection(
                  context,
                  trailerModel: model.trailerModel,
                  onTrailerClick: () {
                    launchUrl(TrailerModel.getLaunchUri(model.trailerModel));
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: _buildExternalLinkSection(
                  context,
                  model.externalLinks,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 16)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimeBasicInfoBar(
      {required BuildContext context, required MediaModel model}) {
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
                            // ignore: lines_longer_than_80_chars
                            '${model.averageScore != null ? (model.averageScore! / 10.0) : '--'}',
                      ),
                      _InfoItem(
                        label: 'FAVOURITE',
                        iconData: Icons.thumb_up,
                        contentText:
                            // ignore: lines_longer_than_80_chars
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
      visible: description != null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AFLocalizations.of(context).animeDescription,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            description != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HtmlWidget(description),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterSection(
      BuildContext context, List<CharacterAndVoiceActorModel> models) {
    final canFillPage = models.length >= Config.characterColumnCount;
    const itemHeight = Config.detailPagePreviewItemHeight;
    final pageHeight = canFillPage
        ? Config.characterColumnCount * itemHeight
        : models.length * itemHeight;
    return VerticalScaleSwitcher(
      visible: models.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  AFLocalizations.of(context).characters,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Expanded(flex: 1, child: SizedBox()),
                TextButton(
                  onPressed: () {
                    AFRouterDelegate.of(context).navigateToCharacterList(
                        context.read<DetailMediaBloc>().animeId);
                  },
                  child: const Text('More'),
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
                      pageItemCount: Config.characterColumnCount,
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
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CharacterAndVoiceActorWidget(
          model: model,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildStaffsSection(
      BuildContext context, List<StaffAndRoleModel> staffs) {
    final canFillPage = staffs.length >= Config.staffColumnCount;
    const itemHeight = Config.detailPagePreviewItemHeight;
    final pageHeight = canFillPage
        ? Config.staffColumnCount * itemHeight
        : staffs.length * itemHeight;
    return VerticalScaleSwitcher(
      visible: staffs.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  AFLocalizations.of(context).staff,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Expanded(flex: 1, child: SizedBox()),
                TextButton(
                  onPressed: () {
                    AFRouterDelegate.of(context).navigateToStaffList(
                        context.read<DetailMediaBloc>().animeId);
                  },
                  child: const Text('More'),
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
                        pageItemCount: Config.staffColumnCount,
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

  Widget _buildExternalLinkSection(
      BuildContext context, List<MediaExternalLinkModel> externalLinks) {
    return VerticalScaleSwitcher(
      visible: externalLinks.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'External & Streaming links',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 6,
              children: externalLinks
                  .map((e) => _ExternalLinkItem(externalLink: e))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrailerSection(BuildContext context,
      {required VoidCallback onTrailerClick, TrailerModel? trailerModel}) {
    return VerticalScaleSwitcher(
      visible: trailerModel != null,
      child: Padding(
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
      ),
    );
  }

  Widget _buildTwitterHashTags(BuildContext context, MediaModel model) {
    final hashTags = model.hashtags;
    return VerticalScaleSwitcher(
      visible: hashTags.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          children: hashTags
              .map((hashtag) => TwitterHashtagWidget(hashtag: hashtag))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildAnimeInfoSection(BuildContext context, MediaModel model) {
    final infoString = model.getAnimeInfoString(context);
    return VerticalScaleSwitcher(
      visible: infoString.isNotEmpty,
      child: Padding(
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
      ),
    );
  }

  Widget _buildAiringInfo(BuildContext context, MediaModel model) {
    final nextAiringEpisode = model.nextAiringEpisode;
    final airingTimeString = model.getReleasingTimeString(context);
    if (airingTimeString.isEmpty) {
      return const SizedBox();
    }
    const stringRes = 'Next airing schedule is EP.%s in %s';
    return VerticalScaleSwitcher(
      visible: true,
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

  Widget _buildAnimeRelations(
      {required BuildContext context,
      required List<MediaRelationModel> relations}) {
    return VerticalScaleSwitcher(
      visible: relations.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relations',
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
                      AFRouterDelegate.of(context)
                          .navigateToDetailMedia(relation.media.id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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

class _ExternalLinkItem extends StatelessWidget {
  const _ExternalLinkItem({required this.externalLink});

  final MediaExternalLinkModel externalLink;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final url = Uri.parse(externalLink.url);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      icon: externalLink.icon.isNotEmpty
          ? Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: ColorUtil.parseColor(externalLink.color),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AFNetworkImage(imageUrl: externalLink.icon),
              ),
            )
          : const SizedBox(),
      label: Text(externalLink.site),
    );
  }
}

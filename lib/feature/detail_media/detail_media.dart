import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/screen_size_util.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/trailer_model.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/shrinkable_floating_action_button.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:aniflow/feature/detail_media/build_media_basic_info.dart';
import 'package:aniflow/feature/detail_media/build_related_info.dart';
import 'package:aniflow/feature/detail_media/build_watch_next_episode_area.dart';
import 'package:aniflow/feature/image_preview/util/preview_source_extensions.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_modify_result.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_update_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

const _identifier = 'detail_media';

class DetailAnimePage extends Page {
  final String animeId;

  const DetailAnimePage({required this.animeId, super.key, super.onPopInvoked});

  @override
  Route createRoute(BuildContext context) {
    return DetailAnimeRoute(settings: this, mediaId: animeId);
  }
}

class DetailAnimeRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String mediaId;

  DetailAnimeRoute({required this.mediaId, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return DetailMediaPageContent(mediaId: mediaId);
  }

  @override
  bool canTransitionTo(TransitionRoute nextRoute) {
    if (nextRoute is MediaListUpdateRoute) {
      return false;
    } else {
      return super.canTransitionTo(nextRoute);
    }
  }

  @override
  bool get maintainState => true;
}

class DetailMediaPageContent extends StatelessWidget {
  const DetailMediaPageContent({super.key, required this.mediaId});

  final String mediaId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetItScope.of(context).get<DetailMediaBloc>(param1: mediaId),
      child: const ScaffoldMessenger(
        child: _DetailMediaPageContent(),
      ),
    );
  }
}

class _DetailMediaPageContent extends StatefulWidget {
  const _DetailMediaPageContent();

  @override
  State<_DetailMediaPageContent> createState() =>
      _DetailMediaPageContentState();
}

class _DetailMediaPageContentState extends State<_DetailMediaPageContent>
    with ShowSnackBarMixin {
  late ScrollController controller;

  /// Shrink the FAB button when user scroll 300 pixel in this page.
  bool isScrollOverLimit = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();

    controller.addListener(() {
      final needShrinkFabButton = controller.position.pixels > 300;
      if (isScrollOverLimit != needShrinkFabButton) {
        setState(() {
          isScrollOverLimit = needShrinkFabButton;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMediaBloc, DetailMediaUiState>(
      builder: (context, state) {
        final model = state.detailAnimeModel;
        if (model == null) {
          return const LoadingDummyScaffold();
        }
        final stateString =
            state.mediaListItem?.status?.translated(context) ?? "Follow";
        final statusIcon = state.mediaListItem?.status?.statusIcon ?? Icons.add;
        final isFavorite = model.isFavourite;
        final isLoading = state.isLoading;

        void floatingButtonClickAction() async {
          final bloc = context.read<DetailMediaBloc>();
          final isAuthed = await bloc.authed();
          if (!isAuthed) {
            bloc.add(OnTapFollowWithoutAuth());
          } else {
            final mediaListItem = state.mediaListItem;
            if (mediaListItem == null) {
              bloc.add(OnTapFollowWithAuthed());
              return;
            }

            RootRouterDelegate.get().navigateToMediaListUpdatePage(
                state.detailAnimeModel!.id, _identifier);
            MediaListModifyResult? result =
            await RootRouterDelegate.get().awaitPageResult();
            if (result != null) {
              bloc.safeAdd(OnMediaListModified(result: result));
            }
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: AutoSizeText(
              model.title!.getTitle(state.userTitleLanguage),
              maxLines: 2,
            ),
            actions: [
              isLoading
                  ? LoadingIndicator(isLoading: isLoading)
                  : const SizedBox(),
              const SizedBox(width: 10),
            ],
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedFadeSwitcher(
                visible: !isScrollOverLimit,
                builder: () => FloatingActionButton.small(
                  onPressed: () {
                    context.read<DetailMediaBloc>().add(
                          OnToggleFavoriteState(
                            isAnime: true,
                            mediaId: model.id,
                          ),
                        );
                  },
                  child: isFavorite
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_outline),
                ),
              ),
              const SizedBox(height: 8),
              ShrinkableFloatingActionButton(
                heroTag:
                    mediaListUpdatePageHeroTagBuilder(model.id, _identifier),
                isExtended: !isScrollOverLimit,
                icon: Icon(statusIcon),
                label: Text(stateString),
                onPressed: floatingButtonClickAction,
              ),
            ],
          ),
          body: CustomScrollView(
            key: const ValueKey('detail_media_page_scroll_view'),
            controller: controller,
            cacheExtent: AfConfig.defaultCatchExtend,
            slivers: [
              SliverToBoxAdapter(
                child: buildBannerSectionSection(
                  context,
                  model,
                  onImageClick: () {
                    final image = model.bannerImage;
                    if (image != null) {
                      RootRouterDelegate.get().navigateImagePreviewPage(
                          model.bannerImagePreviewSource);
                    }
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildReactiveMediaBasicInfoBar(
                    context: context,
                    model: model,
                    onImageClick: () {
                      final image = model.coverImage?.extraLarge;
                      if (image != null) {
                        RootRouterDelegate.get()
                            .navigateImagePreviewPage(model.coverPreviewSource);
                      }
                    },
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              if (!ScreenSizeUtil.isLargeScreen(context))
                SliverToBoxAdapter(
                  child: buildTwitterHashTags(context, model),
                ),
              if (!ScreenSizeUtil.isLargeScreen(context))
                SliverToBoxAdapter(
                  child: buildAnimeInfo(context, model),
                ),
              SliverToBoxAdapter(
                child: buildWatchNextEpisodeArea(context, state),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: buildMediaRelations(
                  context: context,
                  relations: model.relations,
                ),
              ),
              if (!ScreenSizeUtil.isLargeScreen(context))
                SliverToBoxAdapter(
                  child: buildMediaDescription(
                    context: context,
                    description: model.description,
                  ),
                ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              ...buildCharacterSection(
                context,
                model.characterAndVoiceActors,
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              ...buildStaffsSection(
                context,
                model.staffs,
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                key: const ValueKey('character_trailer_title'),
                child: buildTrailerSection(
                  context,
                  trailerModel: model.trailerModel,
                  onTrailerClick: () {
                    launchUrl(TrailerModel.getLaunchUri(model.trailerModel));
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: buildStudioSection(
                  context,
                  studios: model.studios,
                  onStudioClick: (id) {
                    RootRouterDelegate.get().navigateToDetailStudio(id);
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: buildExternalLinkSection(
                  context,
                  model.externalLinks,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 36)),
            ],
          ),
        );
      },
    );
  }
}

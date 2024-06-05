import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/anime_category.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/aniflow_home/auth/auth_dialog.dart';
import 'package:aniflow/feature/aniflow_home/discover/bloc/discover_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/bloc/discover_ui_state.dart';
import 'package:aniflow/feature/aniflow_home/discover/media_category_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverPage extends Page {
  const DiscoverPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return DiscoverPageRoute(settings: this);
  }
}

class DiscoverPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  DiscoverPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const DiscoverScreen();
  }

  @override
  bool get maintainState => true;
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverUiState>(
      builder: (BuildContext context, state) {
        final userData = state.userData;
        final hasUnreadNotification =
            userData != null && userData.unreadNotificationCount != 0;
        final nextToWatchMediaList = state.nextToWatchMediaList;
        final isLoggedIn = state.isLoggedIn;
        final isLoading = state.isLoading;
        return Scaffold(
          appBar: AppBar(
            title: Text(context.appLocal.discover),
            actions: [
              LoadingIndicator(isLoading: isLoading),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () {
                    RootRouterDelegate.get().navigateToSearch();
                  },
                  icon: const Icon(Icons.search_rounded),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () => showAuthDialog(context),
                  icon: isLoggedIn
                      ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            buildAvatarIcon(context, userData!.avatar),
                            hasUnreadNotification
                                ? Positioned(
                                    right: -2,
                                    top: -2,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 20,
                                        minWidth: 20,
                                      ),
                                      decoration: const ShapeDecoration(
                                        color: Colors.red,
                                        shape: StadiumBorder(),
                                      ),
                                      child: Center(
                                        child: Text(
                                          userData.unreadNotificationCount
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        )
                      : const Icon(Icons.person_outline),
                ),
              )
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await context.read<DiscoverBloc>().onPullToRefreshTriggered();
            },
            child: CustomScrollView(
              cacheExtent: AfConfig.defaultCatchExtend,
              slivers: [
                SliverToBoxAdapter(
                  child: _buildNextToWatchMedia(
                    context,
                    nextToWatchMediaList,
                    state.settings?.userTitleLanguage ??
                        UserTitleLanguage.romaji,
                  ),
                ),
                ...MediaCategory.getAllCategoryByType(state.currentMediaType)
                    .map(
                  (category) => SliverToBoxAdapter(
                    child: MediaPreviewBlocProvider(
                      mediaCategory: category,
                      userId: context.read<DiscoverBloc>().state.userData?.id,
                      mediaType:
                          context.read<DiscoverBloc>().state.currentMediaType,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNextToWatchMedia(
    BuildContext context,
    List<MediaListItemModel> models,
    UserTitleLanguage titleLanguage,
  ) {
    return AnimatedScaleSwitcher(
      visible: models.isNotEmpty,
      builder: () => Padding(
        padding: const EdgeInsets.all(12.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Card.outlined(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                RootRouterDelegate.get()
                    .navigateToDetailMedia(models.first.animeModel!.id);
              },
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: AFNetworkImage(
                      imageUrl: models.first.animeModel?.bannerImage ?? '',
                    ),
                  ),
                  Container(
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(0.8),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            shape: const StadiumBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 6.0,
                            ),
                            child: Text(
                              'Up next',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          models.first.animeModel?.title
                                  ?.getTitle(titleLanguage) ??
                              '',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          context.appLocal
                              .nextEpToWatch((models.first.progress ?? 0) + 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

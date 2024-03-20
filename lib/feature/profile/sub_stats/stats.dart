import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/definitions/user_stats_type.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/model/user_statistics_model.dart';
import 'package:aniflow/core/data/user_statistics_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart';
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileStatsTabPage extends StatefulWidget {
  const ProfileStatsTabPage({super.key});

  @override
  State<ProfileStatsTabPage> createState() => _ProfileMediaListTabPageState();
}

class _ProfileMediaListTabPageState extends State<ProfileStatsTabPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (BuildContext context, state) {
        final type = state.type;
        final loadState = state.loadState;
        final isLoading = state.loadState is Loading;

        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverToBoxAdapter(
              child: PopupMenuAnchor(
                menuItems: UserStatisticType.values,
                builder: (context, controller, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                        child: Text(
                          type.label,
                        ),
                      ),
                    ],
                  );
                },
                menuItemBuilder: (context, item) {
                  return MenuItemButton(
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Text(item.label),
                    ),
                    onPressed: () {
                      context
                          .read<StatsBloc>()
                          .add(OnStatsTypeChanged(type: item));
                    },
                  );
                },
              ),
            ),
            isLoading
                ? const SliverFillRemaining()
                : SliverList.builder(
                    itemCount: (loadState as Ready).models.length,
                    itemBuilder: (context, index) {
                      final model = loadState.models[index];
                      return _buildStatsContents(
                        context: context,
                        model: model,
                      );
                    },
                  )
          ],
        );
      },
    );
  }

  Widget _buildStatsContents(
      {required BuildContext context, required UserStatisticsModel model}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: UserStatics(model: model),
    );
  }
}

class UserStatics extends StatelessWidget {
  const UserStatics({super.key, required this.model});

  final UserStatisticsModel model;

  @override
  Widget build(BuildContext context) {
    final userStaffLanguage =
        AniFlowPreferences().aniListSettings.value.userStaffNameLanguage;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final statics = model;
    final String title;
    switch (statics) {
      case UserGenreStatisticsModel():
        title = statics.genre;
      case UserStudioStatisticsModel():
        title = statics.studio.name ?? '';
      case UserStaffStatisticsModel():
        title =
            statics.staff.name?.getNameByUserSetting(userStaffLanguage) ?? '';
      case UserVoiceActorStatisticsModel():
        title =
            statics.voiceActor.name?.getNameByUserSetting(userStaffLanguage) ??
                '';
      case UserTagStatisticsModel():
        title = statics.mediaTag.name ?? '';
    }
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surfaceVariant.withOpacity(0.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: colorScheme.surfaceVariant,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: textTheme.headlineMedium),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _InfoItem(
                      content: model.count.toString(),
                      title: 'Count',
                    ),
                    const Expanded(child: SizedBox()),
                    _InfoItem(
                      content: model.meanScore.toString(),
                      title: 'Mean Score',
                    ),
                    const Expanded(child: SizedBox()),
                    _InfoItem(
                      content: model.minutesWatched.toString(),
                      title: 'Time Watched',
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: _MediaListFutureBuilder(model.mediaIds),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _MediaListFutureBuilder extends StatefulWidget {
  const _MediaListFutureBuilder(this.mediaIds);

  final List<String> mediaIds;

  @override
  State<_MediaListFutureBuilder> createState() =>
      _MediaListFutureBuilderState();
}

class _MediaListFutureBuilderState extends State<_MediaListFutureBuilder>
    with AutomaticKeepAliveClientMixin {
  final userTitleLanguage =
      AniFlowPreferences().aniListSettings.value.userTitleLanguage;

  final UserStatisticsRepository repository = UserStatisticsRepository();

  late final Future<LoadResult<List<MediaModel>>> future;

  @override
  void initState() {
    super.initState();

    future = repository.getMediasById(ids: widget.mediaIds);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: future,
      builder: (
        BuildContext context,
        AsyncSnapshot<LoadResult<List<MediaModel>>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          final result = snapshot.data;

          switch (result) {
            case LoadSuccess<List<MediaModel>>():
              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                itemCount: result.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final model = result.data[index];
                  return SizedBox(
                    height: double.infinity,
                    child: Card(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          AfRouterDelegate.of(context)
                              .backStack
                              .navigateToDetailMedia(model.id);
                        },
                        child: AspectRatio(
                          aspectRatio: 3.0 / 4,
                          child: AFNetworkImage(
                            imageUrl: model.coverImage?.large ?? '',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            case LoadError<List<MediaModel>>():
            case null:
              return const SizedBox();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.content, required this.title});

  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = Theme.of(context).colorScheme.onSurface;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content,
          style: textTheme.headlineSmall?.copyWith(color: textColor),
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: 0.9,
          child: Text(
            title,
            style: textTheme.labelLarge?.copyWith(color: textColor),
          ),
        ),
      ],
    );
  }
}

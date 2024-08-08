import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list_bloc.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileMediaList extends StatelessWidget {
  const ProfileMediaList(
      {super.key, required this.mediaType, required this.userId});

  final MediaType mediaType;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ProfileMediaListContent(mediaType: mediaType);
  }
}

class ProfileMediaListContent extends StatelessWidget {
  const ProfileMediaListContent({super.key, required this.mediaType});

  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    Widget builder<T extends ProfileMediaListBloc>() {
      return BlocBuilder<T, ProfileMediaListState>(
          builder: (context, state) {
            final param = context
                .read<T>()
                .param;
            return CustomScrollView(
              key: PageStorageKey<String>('profile_$param'),
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context),
                ),
                for (var item in state.sectorMap.entries)
                  ..._buildSector(context, item.key, item.value),
              ],
            );
          });
    }
    if (mediaType == MediaType.anime) {
      return builder<ProfileAnimeListBloc>();
    } else {
      return builder<ProfileMangaListBloc>();
    }
  }

  List<Widget> _buildSector(BuildContext context, MediaListSectorParam key,
      List<MediaWithListModel> items) {
    return [
      if (items.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                Text(
                  key.name(context),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
          ),
        ),
      SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => _buildItem(context, items[index]),
      ),
    ];
  }

  Widget _buildItem(BuildContext context, MediaWithListModel item) {
    final progress = item.mediaListModel?.progress ?? 0;
    final totalEp = item.mediaModel.episodes;
    final score = item.mediaListModel?.score?.toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              RootRouterDelegate.get()
                  .navigateToDetailMedia(item.mediaModel.id);
            },
            child: MediaRowItem(
              model: item.mediaModel,
              language: UserTitleLanguage.native,
              centerWidget: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '$progress/$totalEp',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge,
                    ),
                  ),
                  if (score != null && score > 0)
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            score.toString(),
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                color:
                                Theme
                                    .of(context)
                                    .colorScheme
                                    .primary),
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

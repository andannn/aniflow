// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/feature/profile/profile_bloc.dart';
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart';
import 'package:aniflow/feature/profile/title_with_items_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class MediaList {
  const MediaList();
}

class WatchingAnimeList extends MediaList {
  const WatchingAnimeList();
}

class CompletedAnimeList extends MediaList {
  const CompletedAnimeList();
}

class DroppedAnimeList extends MediaList {
  const DroppedAnimeList();
}

class ReadingMangaList extends MediaList {
  const ReadingMangaList();
}

class DroppedMangaList extends MediaList {
  const DroppedMangaList();
}

List<MediaList> _getAllAnimeListType() => [
      const WatchingAnimeList(),
      const CompletedAnimeList(),
      const DroppedAnimeList(),
    ];

List<MediaList> _getAllMangaListType() => [
      const ReadingMangaList(),
      const DroppedMangaList(),
    ];

class ProfileMediaListTabPage extends StatefulWidget {
  const ProfileMediaListTabPage({required this.mediaType, super.key});

  final MediaType mediaType;

  @override
  State<ProfileMediaListTabPage> createState() =>
      _ProfileMediaListTabPageState();
}

class _ProfileMediaListTabPageState extends State<ProfileMediaListTabPage> {
  PagingState<List<MediaWithListModel>>? watchingAnime;
  PagingState<List<MediaWithListModel>>? droppedAnime;
  PagingState<List<MediaWithListModel>>? completeAnime;
  PagingState<List<MediaWithListModel>>? readingManga;
  PagingState<List<MediaWithListModel>>? droppedManga;

  bool get isAnime => widget.mediaType == MediaType.anime;

  @override
  Widget build(BuildContext context) {
    if (isAnime) {
      watchingAnime = context.watch<WatchingAnimeListPagingBloc>().state;
      droppedAnime = context.watch<DroppedAnimeListPagingBloc>().state;
      completeAnime = context.watch<CompleteAnimeListPagingBloc>().state;
    } else {
      readingManga = context.watch<ReadingMangaListPagingBloc>().state;
      droppedManga = context.watch<DroppedMangaListPagingBloc>().state;
    }

    PagingState? getPagingStateByType(type) {
      PagingState? state;
      switch (type) {
        case ReadingMangaList():
          state = readingManga;
        case DroppedMangaList():
          state = droppedManga;
        case WatchingAnimeList():
          state = watchingAnime;
        case CompletedAnimeList():
          state = completeAnime;
        case DroppedAnimeList():
          state = droppedAnime;
      }

      return state;
    }

    final bool isNoData;
    if (isAnime) {
      isNoData = watchingAnime!.data.isEmpty &&
          droppedAnime!.data.isEmpty &&
          completeAnime!.data.isEmpty;
    } else {
      isNoData = readingManga!.data.isEmpty && droppedManga!.data.isEmpty;
    }

    if (isNoData) {
      return Center(
        child: Text(
          'Empty',
          style: Theme.of(context).textTheme.headlineSmall,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: CustomScrollView(
        key: PageStorageKey<String>('profile_${widget.mediaType}'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          for (var type
              in isAnime ? _getAllAnimeListType() : _getAllMangaListType())
            ...buildTitleBarWithContent(
              context: context,
              state: getPagingStateByType(type),
              title: _buildTitle(context, type),
              onBuildItem: (context, item) =>
                  _buildGridItems(context, type, item),
              onMoreClick: () {
                final userId = context.read<ProfileBloc>().state.userData?.id;
                if (userId == null) {
                  return;
                }

                RootRouterDelegate.get().navigateToMediaListPage(type, userId);
              },
            ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }

  String _buildTitle(BuildContext context, MediaList type) {
    final String title;
    switch (type) {
      case ReadingMangaList():
        title = 'Reading';
      case DroppedMangaList():
        title = 'Dropped';
      case WatchingAnimeList():
        title = 'Watching';
      case CompletedAnimeList():
        title = 'Completed';
      case DroppedAnimeList():
        title = 'Dropped';
    }

    return title;
  }

  Widget _buildGridItems(
      BuildContext context, MediaList type, MediaWithListModel model) {
    return MediaPreviewItem(
      coverImage: model.mediaModel.coverImage?.large ?? '',
      title: model.mediaModel.title!.getTitle(
          context.read<ProfileBloc>().userTitleLanguage),
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        RootRouterDelegate.get().navigateToDetailMedia(model.mediaModel.id);
      },
    );
  }
}

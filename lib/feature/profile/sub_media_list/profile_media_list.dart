// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:aniflow/feature/profile/sub_media_list/media_list_sector_bloc.dart';
import 'package:aniflow/feature/profile/sub_media_list/media_list_sector_state.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileMediaList extends StatelessWidget {
  const ProfileMediaList(
      {super.key, required this.mediaType, required this.userId});

  final MediaType mediaType;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Builder(
      key: ValueKey('ProfileMediaList $mediaType-$userId'),
      builder: (context) {
        return BlocProvider(
          create: (BuildContext context) =>
              GetIt.instance.get<ProfileMediaListBloc>(
            param1: ProfileMediaListParam(
              userId: userId,
              mediaType: mediaType,
            ),
          ),
          child: const ProfileMediaListContent(),
        );
      },
    );
  }
}

class ProfileMediaListContent extends StatelessWidget {
  const ProfileMediaListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileMediaListBloc, ProfileMediaListState>(
        builder: (context, state) {
      final param = context.read<ProfileMediaListBloc>().param;
      final sectors = _buildSectors(param.mediaType, param.userId);
      return CustomScrollView(
        key: PageStorageKey<String>('profile_$param'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          for (var sector in sectors)
            SliverToBoxAdapter(
              child: Builder(
                  key: ValueKey(
                      'ProfileMediaListContent ${sector.name(context)}'),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          GetIt.instance.get<MediaListSectorBloc>(
                        param1: sector,
                      ),
                      child: const _MediaListSectorContent(),
                    );
                  }),
            ),
        ],
      );
    });
  }
}

class _MediaListSectorContent extends StatelessWidget {
  const _MediaListSectorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaListSectorBloc, MediaListSectorState>(
        builder: (context, state) {
      final param = context.read<MediaListSectorBloc>().param;
      if (state.mediaList.isEmpty) {
        return const SizedBox();
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                Text(
                  param.name(context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: state.mediaList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final media = state.mediaList[index];
              return MediaRowItem(
                model: media.mediaModel,
                language: UserTitleLanguage.native,
              );
            },
          )
        ],
      );
    });
  }
}

List<MediaListSectorParam> _buildSectors(
  MediaType type,
  String userId,
) =>
    switch (type) {
      MediaType.anime => [
          MediaListSectorParam(
            name: (context) => 'Planning',
            userId: userId,
            type: type,
            status: [MediaListStatus.planning],
          ),
          MediaListSectorParam(
            name: (context) => 'Watching',
            userId: userId,
            type: type,
            status: [MediaListStatus.current],
          ),
          MediaListSectorParam(
            name: (context) => 'Completed',
            userId: userId,
            type: type,
            status: [MediaListStatus.completed],
          ),
          MediaListSectorParam(
            name: (context) => 'Dropped',
            userId: userId,
            type: type,
            status: [MediaListStatus.dropped, MediaListStatus.paused],
          ),
        ],
      MediaType.manga => [
          MediaListSectorParam(
            name: (context) => 'Planning',
            userId: userId,
            type: type,
            status: [MediaListStatus.planning],
          ),
          MediaListSectorParam(
            name: (context) => 'Reading',
            userId: userId,
            type: type,
            status: [MediaListStatus.current],
          ),
          MediaListSectorParam(
            name: (context) => 'Dropped',
            userId: userId,
            type: type,
            status: [MediaListStatus.dropped, MediaListStatus.paused],
          ),
        ],
    };

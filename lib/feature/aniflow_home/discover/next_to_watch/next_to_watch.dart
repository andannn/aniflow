import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/aniflow_home/discover/next_to_watch/next_to_watch_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/next_to_watch/next_to_watch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NextToWatchAnimeBlocProvider extends StatelessWidget {
  const NextToWatchAnimeBlocProvider({
    super.key,
    required this.userId,
    required this.mediaType,
  });

  final String? userId;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey('$userId+$mediaType'),
      create: (context) => GetIt.instance.get<NextToWatchBloc>(
        param1: userId,
        param2: mediaType,
      ),
      child: const NextToWatchAnimeContent(),
    );
  }
}

class NextToWatchAnimeContent extends StatelessWidget {
  const NextToWatchAnimeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextToWatchBloc, NextToWatchState>(
      builder: (context, state) {
        return NextToWatchAnimeWidget(
          models: state.nextToWatchMediaList,
          titleLanguage: GetIt.instance
              .get<UserDataRepository>()
              .userData
              .userTitleLanguage,
        );
      },
    );
  }
}

class NextToWatchAnimeWidget extends StatelessWidget {
  const NextToWatchAnimeWidget({
    super.key,
    required this.models,
    required this.titleLanguage,
  });

  final List<MediaListItemModel> models;
  final UserTitleLanguage titleLanguage;

  @override
  Widget build(BuildContext context) {
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

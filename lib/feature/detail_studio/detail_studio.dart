import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart';
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStudioPage extends Page {
  final String id;

  const DetailStudioPage({required this.id, super.key});

  @override
  Route createRoute(BuildContext context) {
    return DetailStudioRoute(settings: this, id: id);
  }
}

class DetailStudioRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String id;

  DetailStudioRoute({required this.id, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => DetailStudioBloc(
            studioId: id,
            mediaRepository: context.read<MediaInformationRepository>(),
            favoriteRepository: context.read<FavoriteRepository>(),
          ),
        )
      ],
      child: const _DetailStudioContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailStudioContent extends StatelessWidget {
  const _DetailStudioContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailStudioBloc, DetailStudioState>(
      builder: (BuildContext context, state) {
        // final colorScheme = Theme.of(context).colorScheme;
        final studio = state.studioModel;
        final isLoading = state.isLoading;
        if (studio == null) {
          return const LoadingDummyScaffold();
        }

        // final pagingState =
        // context.watch<VoiceActorContentsPagingBloc>().state;
        final isFavourite = studio.isFavourite;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(studio.name ?? ''),
            actions: [
              isLoading
                  ? LoadingIndicator(isLoading: isLoading)
                  : IconButton(
                      onPressed: () {
                        context.read<DetailStudioBloc>().add(OnToggleLike());
                      },
                      icon: isFavourite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_outline),
                    ),
              const SizedBox(width: 10),
            ],
          ),
          body: const CustomScrollView(
            slivers: [
              //   SliverToBoxAdapter(
              //     child: FractionallySizedBox(
              //       widthFactor: 0.65,
              //       child: Card(
              //         elevation: 0,
              //         color: colorScheme.surfaceVariant,
              //         clipBehavior: Clip.antiAlias,
              //         child: AFNetworkImage(imageUrl: Studio.image),
              //       ),
              //     ),
              //   ),
              //   SliverPadding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 24.0,
              //       vertical: 8.0,
              //     ),
              //     sliver: SliverToBoxAdapter(
              //       child: _buildDescriptionSection(context, Studio),
              //     ),
              //   ),
              //   const SliverPadding(padding: EdgeInsets.only(top: 48)),
              //   for (final widget in _buildYearAndCharactersWidgets(
              //     context,
              //     characterGroupList: pagingState.data.characterGroupList,
              //     onCharacterClick: (String id) => AfRouterDelegate.of(context)
              //         .backStack
              //         .navigateToDetailCharacter(id),
              //     onMediaClick: (String id) => AfRouterDelegate.of(context)
              //         .backStack
              //         .navigateToDetailMedia(id),
              //   ))
              //     SliverPadding(
              //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //       sliver: widget,
              //     ),
              //   buildSliverPagingVisibilityDetector<CharacterAndMediaConnection,
              //       VoiceActorContentsPagingBloc>(
              //     context: context,
              //     pagingState: pagingState,
              //   ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/design_system/widget/anime_track_item.dart';
import 'package:anime_tracker/feature/anime_track/bloc/track_bloc.dart';
import 'package:anime_tracker/feature/anime_track/bloc/track_ui_state.dart';
import 'package:anime_tracker/feature/anime_track/bloc/user_anime_list_load_state.dart';
import 'package:flutter/material.dart';
import 'package:anime_tracker/core/design_system/animetion/page_transaction_animetion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeTrackPage extends Page {
  const AnimeTrackPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeTrackRoute(settings: this);
  }
}

class AnimeTrackRoute extends PageRoute with MaterialRouteTransitionMixin {
  AnimeTrackRoute({super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackBloc(
        userAnimeListRepository: context.read<UserAnimeListRepository>(),
        authRepository: context.read<AuthRepository>(),
      ),
      child: const Scaffold(
        body: _AnimeTrackPageContent(),
      ),
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
  bool get maintainState => true;
}

class _AnimeTrackPageContent extends StatelessWidget {
  const _AnimeTrackPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackUiState>(builder: (context, state) {
      // final isLoading = state.isLoading;
      final animeLoadState = state.animeLoadState;

      return CustomScrollView(
        slivers: [
          _buildAppBar(),
          ..._buildTrackSectionContents(context, animeLoadState),
        ],
      );
    });
  }

  List<Widget> _buildTrackSectionContents(
      BuildContext context, UserAnimeLoadState animeLoadState) {
    if (animeLoadState is UserAnimeNoUser) {
      return [
        _buildNoUserHint(),
      ];
    } else if (animeLoadState is UserAnimeInitState) {
      return [
        _buildInitialDummyView(),
      ];
    } else {
      final animeList = (animeLoadState as UserAnimeLoaded).watchingAnimeList;
      return [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildAnimeListItem(context, animeList[index]),
            childCount: animeList.length,
          ),
        )
      ];
    }
  }

  Widget? _buildAnimeListItem(BuildContext context, AnimeListItemModel item) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        child: AnimeTrackItem(
          model: item,
          onClick: () {
            AnimeTrackerRouterDelegate.of(context).navigateToDetailAnime(
              item.animeModel!.id,
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() => SliverAppBar(
        title: const Text('Track'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(Icons.schedule_rounded),
              onPressed: () {},
            ),
          )
        ],
        pinned: true,
        automaticallyImplyLeading: false,
      );

  Widget _buildNoUserHint() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('No user'),
      ),
    );
  }

  Widget _buildInitialDummyView() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('Dummy'),
      ),
    );
  }
}

import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/data/ani_list_repository.dart';
import 'package:anime_tracker/core/data/auth_repository.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/design_system/animetion/page_transaction_animetion.dart';
import 'package:anime_tracker/core/design_system/widget/anime_preview_item.dart';
import 'package:anime_tracker/feature/anime_page/bloc/anime_page_bloc.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:anime_tracker/feature/common/paging_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeListPage extends Page {
  final AnimeCategory category;

  const AnimeListPage({required this.category, super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeListRoute(settings: this, category: category);
  }
}

class AnimeListRoute extends PageRoute with MaterialRouteTransitionMixin {
  final AnimeCategory category;

  AnimeListRoute({required this.category, super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimePageBloc(
        category: category,
        aniListRepository: context.read<MediaInformationRepository>(),
        authRepository: context.read<AuthRepository>(),
        animeTrackListRepository: context.read<AniListRepository>(),
      ),
      child: const _AnimeListPageContent(),
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

class _AnimeListPageContent extends StatelessWidget {
  const _AnimeListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimePageBloc, PagingState<List<AnimeModel>>>(
        builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            _getAppBarTitle(context, context.read<AnimePageBloc>().category),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent(
          pagingState: pagingState,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.0 / 5.0,
          ),
          onBuildItem: (context, model) => _buildGridItems(context, model),
          onRequestNewPage: () {
            context.read<AnimePageBloc>().add(OnRequestLoadPageEvent());
          },
          onRetryLoadPage: () {
            context.read<AnimePageBloc>().add(OnRetryLoadPageEvent());
          },
        ),
      );
    });
  }

  Widget _buildGridItems(BuildContext context, AnimeModel model) {
    return AnimePreviewItem(
      model: model,
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AnimeTrackerRouterDelegate.of(context).navigateToDetailAnime(
          model.id,
        );
      },
    );
  }

  String _getAppBarTitle(BuildContext context, AnimeCategory category) {
    String title;
    switch (category) {
      case AnimeCategory.currentSeason:
        title = AFLocalizations.of(context).popularThisSeasonLabel;
      case AnimeCategory.nextSeason:
        title = AFLocalizations.of(context).upComingNextSeasonLabel;
      case AnimeCategory.trending:
        title = AFLocalizations.of(context).trendingNowLabel;
      case AnimeCategory.movie:
        title = AFLocalizations.of(context).movieLabel;
    }
    return title;
  }
}

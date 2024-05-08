import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/af_toggle_button.dart';
import 'package:aniflow/core/design_system/widget/search_anime_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/anime_search/bloc/character_search_result_paging_bloc.dart';
import 'package:aniflow/feature/anime_search/bloc/media_search_result_paging_bloc.dart';
import 'package:aniflow/feature/anime_search/bloc/search_bloc.dart';
import 'package:aniflow/feature/anime_search/bloc/search_state.dart';
import 'package:aniflow/feature/anime_search/bloc/search_type.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/design_system/widget/search_character_item.dart';

class SearchPage extends Page {
  const SearchPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return SearchPageRoute(settings: this);
  }
}

class SearchPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  SearchPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<SearchBloc>(),
      child: const _MediaSearchPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _MediaSearchPageContent extends StatelessWidget {
  const _MediaSearchPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final keyword = state.keyword;
        final selectedSearchType = state.selectedSearchType;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            title: _buildSearchArea(context, selectedSearchType),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                _buildSearchTypeSelectArea(context, selectedSearchType),
                const SizedBox(height: 12),
                Expanded(
                  child: keyword != null
                      ? SearchResultPagingBlocProvider(
                          key: ValueKey('${keyword}_$selectedSearchType'),
                          keyword: keyword,
                          selectedSearchType: selectedSearchType,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchTypeSelectArea(
      BuildContext context, SearchType selectedSearchType) {
    Widget buildSearchTypeWidget(SearchType e) => AniFlowToggleButton(
          selected: e == selectedSearchType,
          onClick: () {
            if (e != selectedSearchType) {
              context.read<SearchBloc>().add(OnSearchTypeSelected(e));
            }
          },
          label: AFLocalizations.of(context).getSearchTypeString(e),
        );

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SearchType.values
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: buildSearchTypeWidget(e),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSearchArea(BuildContext context, SearchType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        autofocus: true,
        onSubmitted: (content) {
          if (content.isNotEmpty) {
            context.read<SearchBloc>().add(OnSearchStringCommit(content));
          }
        },
        decoration: InputDecoration(
          labelText: AFLocalizations.of(context).getSearchTypeString(type),
        ),
      ),
    );
  }
}

class SearchResultPagingBlocProvider extends StatelessWidget {
  const SearchResultPagingBlocProvider({
    super.key,
    required this.keyword,
    required this.selectedSearchType,
  });

  final String keyword;
  final SearchType selectedSearchType;

  @override
  Widget build(BuildContext context) {
    switch (selectedSearchType) {
      case SearchType.anime:
        return BlocProvider(
          create: (context) => getIt.get<MediaSearchResultPagingBloc>(
            param1: MediaType.anime,
            param2: keyword,
          ),
          child: const _MediaSearchResultPagingContent(),
        );
      case SearchType.manga:
        return BlocProvider(
          create: (context) => getIt.get<MediaSearchResultPagingBloc>(
            param1: MediaType.manga,
            param2: keyword,
          ),
          child: const _MediaSearchResultPagingContent(),
        );
      case SearchType.character:
        return BlocProvider(
          create: (context) => getIt.get<CharacterSearchResultPagingBloc>(
            param1: keyword,
          ),
          child: const _CharacterSearchResultPagingContent(),
        );
      case SearchType.staff:
      // TODO: Handle this case.
      case SearchType.studio:
      // TODO: Handle this case.
      case SearchType.user:
        // TODO: Handle this case.
        return const Placeholder();
    }
  }
}

class _MediaSearchResultPagingContent extends StatelessWidget {
  const _MediaSearchResultPagingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaSearchResultPagingBloc,
        PagingState<List<MediaModel>>>(
      builder: (context, state) {
        return PagingContent(onBuildItem: _buildListItems, pagingState: state);
      },
    );
  }

  Widget _buildListItems(BuildContext context, MediaModel model) {
    final userTitleLanguage = context
        .read<SearchBloc>()
        .userDataRepository
        .userData
        .userTitleLanguage;
    return SearchMediaItem(
      userTitleLanguage: userTitleLanguage,
      model: model,
      onClick: () {
        RootRouterDelegate.get().navigateToDetailMedia(model.id);
      },
    );
  }
}

class _CharacterSearchResultPagingContent extends StatelessWidget {
  const _CharacterSearchResultPagingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterSearchResultPagingBloc,
        PagingState<List<CharacterModel>>>(
      builder: (context, state) {
        return PagingContent(onBuildItem: _buildListItems, pagingState: state);
      },
    );
  }

  Widget _buildListItems(BuildContext context, CharacterModel model) {
    final userStaffNameLanguage = context
        .read<SearchBloc>()
        .userDataRepository
        .userData
        .userStaffNameLanguage;
    return SearchCharacterItem(
      userStaffNameLanguage: userStaffNameLanguage,
      model: model,
      onClick: () {
        RootRouterDelegate.get().navigateToDetailCharacter(model.id);
      },
    );
  }
}
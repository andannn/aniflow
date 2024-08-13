import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/widget/af_toggle_button.dart';
import 'package:aniflow/feature/search/bloc/search_bloc.dart';
import 'package:aniflow/feature/search/bloc/search_state.dart';
import 'package:aniflow/feature/search/bloc/search_type.dart';
import 'package:aniflow/feature/search/paging/character_search_result_paging_bloc.dart';
import 'package:aniflow/feature/search/paging/character_search_result_paging_content.dart';
import 'package:aniflow/feature/search/paging/media_search_result_paging_bloc.dart';
import 'package:aniflow/feature/search/paging/media_search_result_paging_content.dart';
import 'package:aniflow/feature/search/paging/staff_search_result_paging_bloc.dart';
import 'package:aniflow/feature/search/paging/staff_search_result_paging_content.dart';
import 'package:aniflow/feature/search/paging/studio_search_result_paging_bloc.dart';
import 'package:aniflow/feature/search/paging/studio_search_result_paging_content.dart';
import 'package:aniflow/feature/search/paging/user_search_result_paging_bloc.dart';
import 'package:aniflow/feature/search/paging/user_search_result_paging_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (BuildContext context) =>
          GetItScope.of(context).get<SearchBloc>(),
      child: const ScaffoldMessenger(
        child: _MediaSearchPageContent(),
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _MediaSearchPageContent extends StatefulWidget {
  const _MediaSearchPageContent();

  @override
  State<_MediaSearchPageContent> createState() =>
      _MediaSearchPageContentState();
}

class _MediaSearchPageContentState extends State<_MediaSearchPageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final keyword = state.keyword;
        final selectedSearchType = state.selectedSearchType;

        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
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
                      ? _SearchResultPagingBlocProvider(
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
          label: e.translated(context),
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
          labelText: type.translated(context),
        ),
      ),
    );
  }
}

class _SearchResultPagingBlocProvider extends StatelessWidget {
  const _SearchResultPagingBlocProvider({
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
          create: (context) =>
              GetItScope.of(context).get<MediaSearchResultPagingBloc>(
            param1: MediaType.anime,
            param2: keyword,
          ),
          child: const MediaSearchResultPagingContent(),
        );
      case SearchType.manga:
        return BlocProvider(
          create: (context) =>
              GetItScope.of(context).get<MediaSearchResultPagingBloc>(
            param1: MediaType.manga,
            param2: keyword,
          ),
          child: const MediaSearchResultPagingContent(),
        );
      case SearchType.character:
        return BlocProvider(
          create: (context) =>
              GetItScope.of(context).get<CharacterSearchResultPagingBloc>(
            param1: keyword,
          ),
          child: const CharacterSearchResultPagingContent(),
        );
      case SearchType.staff:
        return BlocProvider(
          create: (context) =>
              GetItScope.of(context).get<StaffSearchResultPagingBloc>(
            param1: keyword,
          ),
          child: const StaffSearchResultPagingContent(),
        );
      case SearchType.studio:
        return BlocProvider(
          create: (context) =>
              GetItScope.of(context).get<StudioSearchResultPagingBloc>(
            param1: keyword,
          ),
          child: const StudioSearchResultPagingContent(),
        );
      case SearchType.user:
        return BlocProvider(
          create: (context) =>
              GetItScope.of(context).get<UserSearchResultPagingBloc>(
            param1: keyword,
          ),
          child: const UserSearchResultPagingContent(),
        );
    }
  }
}

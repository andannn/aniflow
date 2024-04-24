import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/core/data/aniflow_preferences_repository.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCharacterListPage extends Page {
  const FavoriteCharacterListPage({super.key, required this.userId});

  final String userId;

  @override
  Route createRoute(BuildContext context) {
    return FavoriteCharacterListRoute(settings: this, userId: userId);
  }
}

class FavoriteCharacterListRoute extends PageRoute
    with MaterialRouteTransitionMixin {
  FavoriteCharacterListRoute({
    super.settings,
    required this.userId,
  }) : super(allowSnapshotting: false);
  final String userId;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FavoriteCharacterPagingBloc>(
        param1: userId,
        param2: AfConfig.defaultPerPageCount,
      ),
      child: const _FavoriteCharacterListPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _FavoriteCharacterListPageContent extends StatelessWidget {
  const _FavoriteCharacterListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCharacterPagingBloc,
        PagingState<List<CharacterModel>>>(builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite character'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent<CharacterModel, FavoriteCharacterPagingBloc>(
          pagingState: pagingState,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.0 / 5.2,
          ),
          onBuildItem: (context, model) => _buildListItems(context, model),
        ),
      );
    });
  }

  Widget _buildListItems(BuildContext context, CharacterModel model) {
    final language =
        getIt.get<AfPreferencesRepository>().userData.userStaffNameLanguage;
    return MediaPreviewItem(
      coverImage: model.mediumImage,
      title: model.name!.getNameByUserSetting(language),
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AfRouterDelegate.of(context)
            .backStack
            .navigateToDetailCharacter(model.id);
      },
    );
  }
}

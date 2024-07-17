import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/character_with_media_item_widget.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/birthday_characters_page/birthday_character_page_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BirthdayCharactersPage extends Page {
  const BirthdayCharactersPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return MediaListRoute(settings: this);
  }
}

class MediaListRoute extends PageRoute with MaterialRouteTransitionMixin {
  MediaListRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<BirthdayCharacterPageBloc>(),
      child: const _BirthdayCharactersPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _BirthdayCharactersPageContent extends StatelessWidget {
  const _BirthdayCharactersPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BirthdayCharacterPageBloc,
        PagingState<List<CharacterModel>>>(builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: Text(context.appLocal.todayBirthdayCharacter(
              context.materialLocal.formatMediumDate(DateTime.now()))),
        ),
        body: PagingContent<CharacterModel, BirthdayCharacterPageBloc>(
          pagingState: pagingState,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.0 / 6.2,
          ),
          onBuildItem: (context, model) => _buildGridItems(context, model),
        ),
      );
    });
  }

  Widget _buildGridItems(BuildContext context, CharacterModel model) {
    final staffNameLanguage =
        GetIt.instance.get<UserDataRepository>().userStaffNameLanguage;
    final titleLanguage =
        GetIt.instance.get<UserDataRepository>().userTitleLanguage;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CharacterWithMediaItemWidget(
          onCharacterClick: (String id) {
            RootRouterDelegate.get().navigateToDetailCharacter(id);
          },
          onMediaClick: (String id) {
            RootRouterDelegate.get().navigateToDetailMedia(id);
          },
          character: model,
          media: model.relatedMedias.firstOrNull,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.name!.getNameByUserSetting(staffNameLanguage),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 2,
                  softWrap: true,
                ),
                Expanded(
                  child: Opacity(
                    opacity: 0.7,
                    child: AutoSizeText(
                      model.relatedMedias.firstOrNull?.title
                              ?.getTitle(titleLanguage) ??
                          '',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

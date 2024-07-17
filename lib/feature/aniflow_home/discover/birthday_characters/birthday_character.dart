import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/character_with_media_item_widget.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BirthdayCharactersBlocProvider extends StatelessWidget {
  const BirthdayCharactersBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: const ValueKey('birthday_character'),
      create: (context) => GetIt.instance.get<BirthdayCharactersBloc>(),
      child: const BirthdayCharactersContent(),
    );
  }
}

class BirthdayCharactersContent extends StatelessWidget {
  const BirthdayCharactersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BirthdayCharactersBloc, BirthdayCharactersState>(
      builder: (context, state) {
        return BirthdayCharactersWidget(
          models: state.data,
          staffNameLanguage:
              GetIt.instance.get<UserDataRepository>().userStaffNameLanguage,
          titleLanguage:
              GetIt.instance.get<UserDataRepository>().userTitleLanguage,
        );
      },
    );
  }
}

class BirthdayCharactersWidget extends StatelessWidget {
  const BirthdayCharactersWidget({
    super.key,
    required this.models,
    required this.staffNameLanguage,
    required this.titleLanguage,
  });

  final List<CharacterModel> models;
  final UserStaffNameLanguage staffNameLanguage;
  final UserTitleLanguage titleLanguage;

  @override
  Widget build(BuildContext context) {
    Widget itemBuilder(CharacterModel model) {
      return SizedBox(
        width: 165,
        child: Column(
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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                    Expanded(
                      child: Opacity(
                        opacity: 0.7,
                        child: AutoSizeText(
                          model.relatedMedias.firstOrNull?.title
                                  ?.getTitle(titleLanguage) ??
                              '',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Visibility(
      visible: models.isNotEmpty,
      child: Column(
        children: [
          CategoryTitleBar(
            title: context.appLocal.todayBirthdayCharacter(''),
            onMoreClick: () {
              RootRouterDelegate.get().navigateToBirthdayCharacterPage();
            },
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 320,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  sliver: SliverList.builder(
                    itemCount: models.length,
                    itemBuilder: (BuildContext context, int index) {
                      return itemBuilder(models[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class CategoryTitleBar extends StatelessWidget {
  const CategoryTitleBar({
    super.key,
    required this.title,
    required this.onMoreClick,
  });

  final String title;
  final VoidCallback onMoreClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        TextButton(
          onPressed: onMoreClick,
          child: Text(
            context.materialLocal.moreButtonTooltip,
          ),
        ),
      ]),
    );
  }
}

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
          staffNameLanguage: GetIt.instance
              .get<UserDataRepository>()
              .userData
              .userStaffNameLanguage,
          titleLanguage: GetIt.instance
              .get<UserDataRepository>()
              .userData
              .userTitleLanguage,
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
        width: 150,
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
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        model.relatedMedias.firstOrNull?.title
                                ?.getTitle(titleLanguage) ??
                            '',
                        softWrap: true,
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

    return AnimatedScaleSwitcher(
      visible: models.isNotEmpty,
      builder: () => Column(
        children: [
          _buildTitleBar(context),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: models.map((item) => itemBuilder(item)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(children: [
        AutoSizeText(
          context.appLocal.todayBirthdayCharacter(
            context.materialLocal.formatMediumDate(DateTime.now()),
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Expanded(flex: 1, child: SizedBox()),
        TextButton(
          onPressed: () {},
          child: Text(
            context.materialLocal.moreButtonTooltip,
          ),
        ),
      ]),
    );
  }
}

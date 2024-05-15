import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/search/bloc/search_bloc.dart';
import 'package:aniflow/feature/search/paging/character_search_result_paging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterSearchResultPagingContent extends StatelessWidget {
  const CharacterSearchResultPagingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterSearchResultPagingBloc,
        PagingState<List<CharacterModel>>>(
      builder: (context, state) {
        return PagingContent<CharacterModel, CharacterSearchResultPagingBloc>(
          onBuildItem: _buildListItems,
          pagingState: state,
        );
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

class SearchCharacterItem extends StatelessWidget {
  const SearchCharacterItem({
    required this.model,
    required this.onClick,
    super.key,
    required this.userStaffNameLanguage,
  });

  final CharacterModel model;
  final VoidCallback onClick;
  final UserStaffNameLanguage userStaffNameLanguage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceTextColor = colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 85,
              width: 85,
              child: AFNetworkImage(
                imageUrl: model.mediumImage,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Text(
                model.name!.getNameByUserSetting(userStaffNameLanguage),
                style: textTheme.titleMedium?.copyWith(color: surfaceTextColor),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

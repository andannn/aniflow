import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/design_system/widget/reactive_profile_with_description.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_state.dart';
import 'package:aniflow/feature/image_preview/util/preview_source_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCharacterPage extends Page {
  final String id;

  const DetailCharacterPage({required this.id, super.key, super.onPopInvoked});

  @override
  Route createRoute(BuildContext context) {
    return DetailCharacterRoute(settings: this, id: id);
  }
}

class DetailCharacterRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String id;

  DetailCharacterRoute({required this.id, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetItScope.of(context).get<DetailCharacterBloc>(param1: id),
      child: const ScaffoldMessenger(
        child: _DetailCharacterContent(),
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailCharacterContent extends StatefulWidget {
  const _DetailCharacterContent();

  @override
  State<_DetailCharacterContent> createState() =>
      _DetailCharacterContentState();
}

class _DetailCharacterContentState extends State<_DetailCharacterContent>
    with ShowSnackBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
        builder: (BuildContext context, state) {
      final character = state.characterModel;
      final isLoading = state.isLoading;
      final relatedMedias = state.characterModel?.relatedMedias ?? [];

      if (character == null) {
        return const LoadingDummyScaffold();
      }

      final isFavourite = character.isFavourite;
      final language = state.userStaffNameLanguage;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(character.name!.getNameByUserSetting(language)),
          actions: [
            isLoading
                ? LoadingIndicator(isLoading: isLoading)
                : const SizedBox(),
            const SizedBox(width: 10),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: IconButton(
            onPressed: () {
              context.read<DetailCharacterBloc>().add(OnToggleLike());
            },
            icon: isFavourite
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_outline),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverToBoxAdapter(
                child: ReactiveProfileWithDescription(
                  model: character,
                  previewSource: character.previewSource,
                  onImageTap: () {
                    RootRouterDelegate.get().navigateImagePreviewPage(
                      character.previewSource,
                    );
                  },
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 48)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: SliverGrid.builder(
                itemCount: relatedMedias.length,
                gridDelegate: AfConfig.commonGridDelegate,
                itemBuilder: (context, index) {
                  return _buildGridItems(context, relatedMedias[index]);
                },
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 32)),
          ],
        ),
      );
    });
  }

  Widget _buildGridItems(BuildContext context, MediaModel model) {
    final userTitleLanguage =
        context.read<DetailCharacterBloc>().state.userTitleLanguage;
    return MediaPreviewItem(
      textStyle: Theme.of(context).textTheme.labelMedium,
      coverImage: model.coverImage?.large ?? '',
      title: model.title!.getTitle(userTitleLanguage),
      isFollowing: model.isFollowing,
      onClick: () {
        RootRouterDelegate.get().navigateToDetailMedia(model.id);
      },
    );
  }
}


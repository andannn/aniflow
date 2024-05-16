import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/description_item_util.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_state.dart';
import 'package:aniflow/feature/image_preview/image_preview.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCharacterPage extends Page {
  final String id;

  const DetailCharacterPage({required this.id, super.key});

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
      create: (context) => getIt.get<DetailCharacterBloc>(param1: id),
      child: const _DetailCharacterContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailCharacterContent extends StatelessWidget {
  const _DetailCharacterContent();

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
                : IconButton(
                    onPressed: () {
                      context.read<DetailCharacterBloc>().add(OnToggleLike());
                    },
                    icon: isFavourite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_outline),
                  ),
            const SizedBox(width: 10),
          ],
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverToBoxAdapter(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: InkWell(
                    onTap: () {
                      RootRouterDelegate.get().navigateImagePreviewPage(
                        character.largeImage,
                        PreviewSource(character.id, PreviewType.character),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )),
                      child: Hero(
                        tag: PreviewSource(character.id, PreviewType.character),
                        child: AFNetworkImage(
                          imageUrl: character.largeImage,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverToBoxAdapter(
                child: _buildDescriptionSection(context, character),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 48)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: SliverGrid.builder(
                itemCount: relatedMedias.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3.0 / 5.2,
                ),
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

  Widget _buildDescriptionSection(
      BuildContext context, CharacterModel character) {
    final textTheme = Theme.of(context).textTheme;
    final items = character.createDescriptionItem(context);
    final description = character.description ?? '';
    return VerticalScaleSwitcher(
      visible: items.isNotEmpty || description.isNotEmpty,
      builder: () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...items.map(
            (item) => RichText(
              text: TextSpan(
                text: item.key,
                style: textTheme.titleSmall,
                children: [
                  TextSpan(
                    text: item.value,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          AfHtmlWidget(html: description)
        ],
      ),
    );
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

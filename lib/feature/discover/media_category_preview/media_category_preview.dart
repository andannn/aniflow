import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/feature/discover/birthday_characters/birthday_character.dart';
import 'package:aniflow/feature/discover/media_category_preview/media_category_preview_bloc.dart';
import 'package:aniflow/feature/discover/media_category_preview/media_category_preview_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaPreviewBlocProvider extends StatelessWidget {
  const MediaPreviewBlocProvider({
    required this.mediaCategory,
    super.key,
    required this.userId,
    required this.mediaType,
  });

  final MediaCategory mediaCategory;
  final String? userId;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey('$mediaCategory+$userId+$mediaType'),
      create: (BuildContext context) =>
          GetItScope.of(context).get<MediaCategoryPreviewBloc>(
        param1: MediaCategoryPreviewParams(
          category: mediaCategory,
          userId: userId,
          mediaType: mediaType,
        ),
      ),
      child: _MediaCategoryPreviewContent(
        category: mediaCategory,
      ),
    );
  }
}

class _MediaCategoryPreviewContent extends StatefulWidget {
  const _MediaCategoryPreviewContent({required this.category});

  final MediaCategory category;

  @override
  State<_MediaCategoryPreviewContent> createState() =>
      _MediaCategoryPreviewContentState();
}

class _MediaCategoryPreviewContentState
    extends State<_MediaCategoryPreviewContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCategoryPreviewBloc, MediaCategoryPreviewState>(
      builder: (BuildContext context, MediaCategoryPreviewState state) {
        return _MediaCategoryPreview(
          category: widget.category,
          animeModels: state.data,
          isLoading: true,
          onMoreClick: () {
            RootRouterDelegate.get().navigateToAnimeList(widget.category);
          },
          onAnimeClick: (id) {
            RootRouterDelegate.get().navigateToDetailMedia(id);
          },
        );
      },
    );
  }
}

class _MediaCategoryPreview extends StatelessWidget {
  const _MediaCategoryPreview({
    required this.category,
    required this.animeModels,
    required this.isLoading,
    required this.onMoreClick,
    this.onAnimeClick,
  });

  final MediaCategory category;
  final bool isLoading;
  final List<MediaModel> animeModels;
  final VoidCallback onMoreClick;
  final Function(String animeId)? onAnimeClick;

  @override
  Widget build(BuildContext context) {
    Widget itemBuilder(MediaModel model) {
      final language =
          GetItScope.of(context).get<UserDataRepository>().userTitleLanguage;
      return MediaPreviewItemV2(
        coverImage: model.coverImage?.extraLarge ?? '',
        title: model.title!.getTitle(language),
        isFollowing: model.isFollowing,
        // onAnimeClick?.call(model.id);
      );
    }

    return Column(
      children: [
        CategoryTitleBar(
          title: category.translated(context),
          onMoreClick: onMoreClick,
        ),
        const SizedBox(height: 4),
        Container(
          constraints: const BoxConstraints(maxHeight: 270),
          child: isLoading && animeModels.isEmpty
              ? _buildLoadingDummyWidget()
              : CarouselView(
                  itemExtent: 185,
                  shrinkExtent: 100,
                  children:
                      animeModels.map((model) => itemBuilder(model)).toList(),
                  onTap: (index) {
                    onAnimeClick?.call(animeModels[index].id);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildLoadingDummyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const Card.filled(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(width: 160, height: 280),
          );
        },
      ),
    );
  }
}

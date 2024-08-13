import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/character_role.dart';
import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/description_item_util.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/character_with_media_item_widget.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_state.dart';
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart';
import 'package:aniflow/feature/image_preview/util/preview_source_extensions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStaffPage extends Page {
  final String id;

  const DetailStaffPage({required this.id, super.key});

  @override
  Route createRoute(BuildContext context) {
    return DetailStaffRoute(settings: this, id: id);
  }
}

class DetailStaffRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String id;

  DetailStaffRoute({required this.id, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetItScope.of(context).get<DetailStaffBloc>(param1: id),
        ),
        BlocProvider(
          create: (context) => GetItScope.of(context).get<VoiceActorContentsPagingBloc>(
              param1: id, param2: MediaSort.newest),
        ),
      ],
      child: const ScaffoldMessenger(
        child: _DetailStaffContent(),
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailStaffContent extends StatefulWidget {
  const _DetailStaffContent();

  @override
  State<_DetailStaffContent> createState() => _DetailStaffContentState();
}

class _DetailStaffContentState extends State<_DetailStaffContent>
    with ShowSnackBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailStaffBloc, DetailStaffState>(
      builder: (BuildContext context, state) {
        final staff = state.staffModel;
        final mediaSort = state.mediaSort;

        if (staff == null) {
          return const LoadingDummyScaffold();
        }

        final isFavourite = staff.isFavourite;
        final language = state.userStaffNameLanguage;
        final isLoading = state.isLoading;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<DetailStaffBloc>().add(OnToggleLike());
            },
            child: isFavourite
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_outline),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(staff.name!.getNameByUserSetting(language)),
            actions: [
              isLoading
                  ? LoadingIndicator(isLoading: isLoading)
                  : const SizedBox(),
              const SizedBox(width: 10),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: InkWell(
                    onTap: () {
                      RootRouterDelegate.get().navigateImagePreviewPage(
                        staff.previewSource,
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )),
                      child: Hero(
                        tag: staff.previewSource,
                        child: AFNetworkImage(imageUrl: staff.largeImage),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                sliver: SliverToBoxAdapter(
                  child: _buildDescriptionSection(context, staff),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 48)),
              ..._buildCharacterListSection(
                context,
                mediaSort,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescriptionSection(BuildContext context, StaffModel staff) {
    final textTheme = Theme.of(context).textTheme;
    final items = staff.createDescriptionItem(context);
    final description = staff.description ?? '';
    return AnimatedScaleSwitcher(
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

  List<Widget> _buildCharacterListSection(
      BuildContext context, MediaSort mediaSort) {
    final bloc = context.watch<VoiceActorContentsPagingBloc>();
    final pagingState = bloc.state;

    // Set mediaSort value to paging source, update paging source if media
    // sort changed.
    bloc.mediaSort = mediaSort;

    void onCharacterClick(String id) =>
        RootRouterDelegate.get().navigateToDetailCharacter(id);

    void onMediaClick(String id) =>
        RootRouterDelegate.get().navigateToDetailMedia(id);

    List<Widget> buildItemListWidget() {
      if (mediaSort == MediaSort.newest || mediaSort == MediaSort.oldest) {
        // divided by years.
        return _buildYearAndCharactersWidgets(context,
                characterGroupList: pagingState.data.characterGroupList,
                onCharacterClick: onCharacterClick,
                onMediaClick: onMediaClick)
            .map(
              (widget) => SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                sliver: widget,
              ),
            )
            .toList();
      } else {
        // common grid list.
        return [
          SliverGrid.builder(
            itemCount: pagingState.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3.0 / 6.2,
            ),
            itemBuilder: (context, index) => _buildCharacterWithMediaItem(
              context,
              item: pagingState.data[index],
              onCharacterClick: onCharacterClick,
              onMediaClick: onMediaClick,
            ),
          )
        ];
      }
    }

    return [
      SliverToBoxAdapter(
        child: _buildMediaSortSelector(
          context: context,
          mediaSort: mediaSort,
          onMediaSortChanged: (mediaSort) {
            context
                .read<DetailStaffBloc>()
                .add(OnMediaSortChanged(mediaSort: mediaSort));
          },
        ),
      ),
      ...buildItemListWidget(),
      buildSliverPagingVisibilityDetector<CharacterAndMediaConnection,
          VoiceActorContentsPagingBloc>(
        context: context,
        pagingState: pagingState,
      ),
    ];
  }

  List<Widget> _buildYearAndCharactersWidgets(
    BuildContext context, {
    required List<CharacterItemsWithYear> characterGroupList,
    required Function(String id) onCharacterClick,
    required Function(String id) onMediaClick,
  }) {
    final widgetList = characterGroupList
        .map(
          (e) => _buildItemsWithSeasonYearSection(
            context,
            e: e,
            onCharacterClick: onCharacterClick,
            onMediaClick: onMediaClick,
          ),
        )
        .toList();
    return widgetList.flattened.toList();
  }

  List<Widget> _buildItemsWithSeasonYearSection(
    BuildContext context, {
    required CharacterItemsWithYear e,
    required Function(String id) onCharacterClick,
    required Function(String id) onMediaClick,
  }) {
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        sliver: SliverToBoxAdapter(
          child: Text(
            e.year?.toString() ?? 'TBA',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      SliverGrid.builder(
        itemCount: e.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3.0 / 6.2,
        ),
        itemBuilder: (context, index) => _buildCharacterWithMediaItem(
          context,
          item: e.items[index],
          onCharacterClick: onCharacterClick,
          onMediaClick: onMediaClick,
        ),
      )
    ];
  }

  Widget _buildCharacterWithMediaItem(
    BuildContext context, {
    required CharacterAndMediaConnection item,
    required Function(String id) onCharacterClick,
    required Function(String id) onMediaClick,
  }) {
    final staffLanguage =
        context.read<DetailStaffBloc>().state.userStaffNameLanguage;
    final titleLanguage =
        context.read<DetailStaffBloc>().state.userTitleLanguage;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final role = item.role;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharacterWithMediaItemWidget(
          character: item.character,
          media: item.media,
          onCharacterClick: onCharacterClick,
          onMediaClick: onMediaClick,
        ),
        RichText(
          text: TextSpan(
            text: item.character.name!.getNameByUserSetting(staffLanguage),
            style: textTheme.titleSmall,
            children: role == CharacterRole.main
                ? [
                    TextSpan(
                      text: ' Main',
                      style: textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.primary),
                    )
                  ]
                : [],
          ),
        ),
        Expanded(
          child: Opacity(
            opacity: 0.7,
            child: AutoSizeText(
              item.media?.title?.getTitle(titleLanguage) ?? '',
              minFontSize: 1,
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaSortSelector(
      {required BuildContext context,
      required MediaSort mediaSort,
      required Function(MediaSort) onMediaSortChanged}) {
    final items = [
      MediaSort.popularity,
      MediaSort.averageScore,
      MediaSort.favorite,
      MediaSort.newest,
      MediaSort.oldest,
    ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(child: SizedBox()),
        PopupMenuAnchor(
          menuItems: items,
          builder: (context, controller, child) {
            return TextButton.icon(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.filter_alt),
              label: Text(
                mediaSort.translated(context),
              ),
            );
          },
          menuItemBuilder: (context, item) {
            return MenuItemButton(
              child: Container(
                constraints: const BoxConstraints(minWidth: 80),
                child: Text(
                  item.translated(context),
                ),
              ),
              onPressed: () {
                onMediaSortChanged.call(item);
              },
            );
          },
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

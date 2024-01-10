import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/model/character_role.dart';
import 'package:aniflow/core/common/model/media_sort.dart';
import 'package:aniflow/core/common/util/description_item_util.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_state.dart';
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart';
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
          create: (context) => DetailStaffBloc(
            staffId: id,
            mediaRepository: context.read<MediaInformationRepository>(),
            favoriteRepository: context.read<FavoriteRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => VoiceActorContentsPagingBloc(
            id,
            mediaRepository: context.read<MediaInformationRepository>(),
          ),
        ),
      ],
      child: const _DetailStaffContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailStaffContent extends StatelessWidget {
  const _DetailStaffContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailStaffBloc, DetailStaffState>(
      builder: (BuildContext context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final staff = state.staffModel;
        final isLoading = state.isLoading;
        final mediaSort = state.mediaSort;

        if (staff == null) {
          return const LoadingDummyScaffold();
        }

        final isFavourite = staff.isFavourite;
        final language =
            AniFlowPreferences().getAniListSettings().userStaffNameLanguage;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(staff.name!.getNameByUserSetting(language)),
            actions: [
              isLoading
                  ? LoadingIndicator(isLoading: isLoading)
                  : IconButton(
                      onPressed: () {
                        context.read<DetailStaffBloc>().add(OnToggleLike());
                      },
                      icon: isFavourite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_outline),
                    ),
              const SizedBox(width: 10),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: Card(
                    elevation: 0,
                    color: colorScheme.surfaceVariant,
                    clipBehavior: Clip.antiAlias,
                    child: AFNetworkImage(imageUrl: staff.image),
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
    return VerticalScaleSwitcher(
      visible: items.isNotEmpty || description.isNotEmpty,
      child: Column(
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
        AfRouterDelegate.of(context).backStack.navigateToDetailCharacter(id);

    void onMediaClick(String id) =>
        AfRouterDelegate.of(context).backStack.navigateToDetailMedia(id);

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
        AniFlowPreferences().getAniListSettings().userStaffNameLanguage;
    final titleLanguage =
        AniFlowPreferences().getAniListSettings().userTitleLanguage;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final role = item.role;
    const borderColor = Colors.white;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onCharacterClick.call(item.character.id),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 3.0 / 4,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: AFNetworkImage(
                      imageUrl: item.character.image,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () => onMediaClick.call(item.media!.id),
                      child: SizedBox(
                        width: 50,
                        child: AspectRatio(
                          aspectRatio: 4.0 / 5,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: borderColor,
                                  width: 2,
                                  strokeAlign: 1.0,
                                ),
                                left: BorderSide(
                                  color: borderColor,
                                  width: 2,
                                  strokeAlign: 1.0,
                                ),
                              ),
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(15),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: AFNetworkImage(
                              imageUrl: item.media?.coverImage?.medium ?? '',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            child:
                AutoSizeText(item.media?.title?.getTitle(titleLanguage) ?? ''),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaSortSelector(
      {required BuildContext context,
      required MediaSort mediaSort,
      required Function(MediaSort) onMediaSortChanged}) {
    final afLocalizations = AFLocalizations.of(context);
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
                afLocalizations.getMediaSortString(mediaSort),
              ),
            );
          },
          menuItemBuilder: (context, item) {
            return MenuItemButton(
              child: Container(
                constraints: const BoxConstraints(minWidth: 80),
                child: Text(afLocalizations.getMediaSortString(item)),
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

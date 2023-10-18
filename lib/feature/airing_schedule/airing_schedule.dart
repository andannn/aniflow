import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/common/util/logger.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/design_system/widget/airing_anime_item.dart';
import 'package:anime_tracker/core/design_system/widget/loading_indicator.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/airing_schedule_bloc.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/airing_schedule_state.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/airing_schedule_state_extension.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_category.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_page_key.dart';
import 'package:anime_tracker/feature/airing_schedule/bloc/schedule_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiringSchedule extends Page {
  const AiringSchedule({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AiringScheduleRoute(settings: this);
  }
}

class AiringScheduleRoute extends PageRoute with MaterialRouteTransitionMixin {
  AiringScheduleRoute({super.settings}): super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AiringScheduleBloc(
        mediaInfoRepository: context.read<MediaInformationRepository>(),
      ),
      lazy: false,
      child: const Scaffold(
        body: _AiringScheduleContent(),
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _AiringScheduleContent extends StatefulWidget {
  const _AiringScheduleContent();

  @override
  State<_AiringScheduleContent> createState() => _AiringScheduleContentState();
}

class _AiringScheduleContentState extends State<_AiringScheduleContent>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  AiringScheduleBloc? _bloc;

  int get _currentPageIndex => _tabController.index;

  final int _pageCount = 13;
  final int _initPageIndex = 6;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: _initPageIndex, length: 13, vsync: this);

    _tabController.addListener(() {
      _bloc?.add(OnRequestScheduleData(_currentPageIndex));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<AiringScheduleBloc>();
    return BlocBuilder<AiringScheduleBloc, AiringScheduleState>(
      builder: (context, state) {
        final scheduleKeys = state.scheduleKeys;
        final schedulePages = state.schedulePages;

        logger.d(schedulePages);
        if (scheduleKeys.isEmpty) {
          return const SizedBox();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Schedule"),
            bottom: _buildAiringScheduleTabs(context, scheduleKeys),
          ),
          body: TabBarView(
            controller: _tabController,
            children: List.generate(
              _pageCount,
              (index) => _SchedulePageWidget(
                schedulePage: schedulePages[index],
              ),
            ),
          ),
        );
      },
    );
  }

  TabBar _buildAiringScheduleTabs(
      BuildContext context, List<SchedulePageKey> scheduleKeys) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: scheduleKeys.map((e) => _buildTabBarItems(context, e)).toList(),
    );
  }

  Widget _buildTabBarItems(BuildContext context, SchedulePageKey key) {
    final localization = Localizations.of<MaterialLocalizations>(
        context, MaterialLocalizations)!;
    final isToday = key.isToday;
    final backgroundColor =
        isToday ? Theme.of(context).colorScheme.tertiaryContainer : null;
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: const StadiumBorder(),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Text(localization.formatMediumDate(key.dateTime)),
      ),
    );
  }
}

class _SchedulePageWidget extends StatelessWidget {
  const _SchedulePageWidget({required this.schedulePage});

  final SchedulePageState schedulePage;

  @override
  Widget build(BuildContext context) {
    switch (schedulePage) {
      case SchedulePageInit():
      case SchedulePageLoading():
        return _buildLoadingWidget();
      case SchedulePageError():
        return const Placeholder();
      case SchedulePageReady(schedules: final _):
        final categories = (schedulePage as SchedulePageReady).categories;
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => _TimeLineItem(
                category: categories[index],
              ),
            )
          ],
        );
    }
  }

  Widget _buildLoadingWidget() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        LoadingIndicator(isLoading: true),
      ],
    );
  }
}

class _TimeLineItem extends StatefulWidget {
  const _TimeLineItem({required this.category});

  final ScheduleCategory category;

  @override
  State<_TimeLineItem> createState() => _TimeLineItemState();
}

class _TimeLineItemState extends State<_TimeLineItem> {
  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<MaterialLocalizations>(
        context, MaterialLocalizations)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(size: 16, Icons.circle_outlined, color: colorScheme.primary),
              const SizedBox(width: 16),
              Text(
                localization.formatTimeOfDay(widget.category.timeOfDayHeader!),
                style: textTheme.labelLarge,
              ),
            ],
          ),
          Stack(
            children: [
              Positioned.fill(
                child: _buildTimeLineDecoration(
                  color: colorScheme.tertiary.withAlpha(128),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.category.schedules.length,
                itemBuilder: (BuildContext context, int index) {
                  final schedule = widget.category.schedules[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 2.0, bottom: 2.0, left: 16.0, right: 8.0),
                    child: SizedBox(
                      height: 120,
                      child: AiringAnimeItem(
                        model: schedule,
                        onClick: () {
                          AFRouterDelegate.of(context)
                              .navigateToDetailAnime(schedule.animeModel.id);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLineDecoration({required Color color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 6),
        Container(
          width: 4,
          color: color,
        ),
      ],
    );
  }
}

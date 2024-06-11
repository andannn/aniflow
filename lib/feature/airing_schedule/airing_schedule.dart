import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day.dart';
import 'package:aniflow/feature/airing_schedule/schedule_page_key.dart';
import 'package:flutter/material.dart';

class AiringSchedule extends Page {
  const AiringSchedule({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AiringScheduleRoute(settings: this);
  }
}

class AiringScheduleRoute extends PageRoute with MaterialRouteTransitionMixin {
  AiringScheduleRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _AiringScheduleContent(),
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
    with TickerProviderStateMixin, ShowSnackBarMixin {
  late final TabController _tabController;

  List<SchedulePageKey> keys = SchedulePageKey.createScheduleKeys(
      DateTime.now(),
      daysAgo: 6,
      daysAfter: 6);

  final int _pageCount = 13;
  final int _initPageIndex = 6;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: _initPageIndex, length: 13, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.appLocal.schedule),
        bottom: _buildAiringScheduleTabs(context, keys),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _pageCount,
          (index) => AiringScheduleOfDayBlocProvider(
            key: ValueKey("airing_schedule_page_$index"),
            dateTime: keys[index].dateTime,
          ),
        ),
      ),
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

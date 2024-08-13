import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/airing_media_item.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/airing_schedule_of_day_bloc.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/schedule_page_key.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/schedule_page_state.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AiringScheduleOfDayPage extends StatefulWidget {
  const AiringScheduleOfDayPage({super.key});

  @override
  State<AiringScheduleOfDayPage> createState() =>
      _AiringScheduleOfDayPageState();
}

class _AiringScheduleOfDayPageState extends State<AiringScheduleOfDayPage>
    with TickerProviderStateMixin {
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

class AiringScheduleOfDayBlocProvider extends StatelessWidget {
  const AiringScheduleOfDayBlocProvider({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetItScope.of(context).get<AiringScheduleOfDayBloc>(param1: dateTime),
      child: const _SchedulePageWidget(),
    );
  }
}

class _SchedulePageWidget extends StatelessWidget {
  const _SchedulePageWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiringScheduleOfDayBloc, SchedulePageState>(
        builder: (context, state) {
      final schedulePage = state;
      switch (schedulePage) {
        case SchedulePageInit():
        case SchedulePageLoading():
          return _buildLoadingWidget();
        case SchedulePageError():
          return const Placeholder();
        case SchedulePageReady(schedules: final _):
          final categories = (schedulePage).categories;
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    TimeLineItem<TimeOfDay, AiringScheduleAndAnimeModel>(
                  category: categories[index],
                  onBuildItem: (schedule) {
                    final userTitleLanguage = GetIt.instance
                        .get<UserDataRepository>()
                        .userTitleLanguage;
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, left: 16.0, right: 8.0),
                      child: AiringMediaItem(
                        model: schedule.animeModel,
                        userTitleLanguage: userTitleLanguage,
                        description: 'EP.${schedule.airingSchedule.episode}',
                        onClick: () {
                          RootRouterDelegate.get()
                              .navigateToDetailMedia(schedule.animeModel.id);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          );
      }
    });
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

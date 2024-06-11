import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/airing_media_item.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day_bloc.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:aniflow/feature/airing_schedule/schedule_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AiringScheduleOfDayBlocProvider extends StatelessWidget {
  const AiringScheduleOfDayBlocProvider({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetIt.instance.get<AiringScheduleOfDayBloc>(param1: dateTime),
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
                itemBuilder: (context, index) => _TimeLineItem(
                  category: categories[index],
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
    final userTitleLanguage =
        GetIt.instance.get<UserDataRepository>().userData.userTitleLanguage;

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
                    child: AiringMediaItem(
                      model: schedule,
                      userTitleLanguage: userTitleLanguage,
                      onClick: () {
                        RootRouterDelegate.get()
                            .navigateToDetailMedia(schedule.animeModel.id);
                      },
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

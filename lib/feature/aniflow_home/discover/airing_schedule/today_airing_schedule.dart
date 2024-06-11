import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:aniflow/feature/airing_schedule/schedule_page_state.dart';
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule_state.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TodayAiringScheduleBlocProvider extends StatelessWidget {
  const TodayAiringScheduleBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetIt.instance.get<TodayAiringScheduleBloc>(),
      child: const TodayAiringSchedule(),
    );
  }
}

class TodayAiringSchedule extends StatelessWidget {
  const TodayAiringSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayAiringScheduleBloc, TodayAiringScheduleState>(
      builder: (context, state) {
        final categories = state.schedules.toScheduleCategory();
        if (categories.isEmpty) {
          return const SizedBox();
        }

        return Column(
          children: [
            CategoryTitleBar(
              title: context.appLocal.animeSchedule(
                context.materialLocal.formatMediumDate(DateTime.now()),
              ),
              onMoreClick: () {
                RootRouterDelegate.get().navigateToAiringSchedule();
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: categories.map(_buildItem).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildItem(ScheduleCategory category) {
    final isFutureSchedule =
        TimeOfDay.now().hour <= category.timeOfDayHeader!.hour;
    return Opacity(
      opacity: isFutureSchedule ? 1 : 0.4,
      child: _TimeLineItem(category: category),
    );
  }
}

class _TimeLineItem extends StatelessWidget {
  const _TimeLineItem({required this.category});

  final ScheduleCategory category;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 48),
          child: Row(
            children: category.schedules
                .map((e) => e.animeModel)
                .map(
                  (media) => mediaItemBuilder(context, media),
                )
                .toList(),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 48,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.materialLocal
                      .formatTimeOfDay(category.timeOfDayHeader!),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Icon(
                        size: 16,
                        Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.primary),
                    Expanded(
                      child: _buildTimeLineDecoration(
                        color: colorScheme.tertiary.withAlpha(128),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mediaItemBuilder(BuildContext context, MediaModel media) {
    final userTitleLanguage =
        GetIt.instance.get<UserDataRepository>().userData.userTitleLanguage;
    return SizedBox(
      width: 160,
      child: MediaPreviewItem(
        onClick: () {},
        coverImage: media.coverImage!.extraLarge!,
        titleVerticalPadding: 5,
        title: media.title?.getTitle(userTitleLanguage) ?? '',
      ),
    );
  }

  Widget _buildTimeLineDecoration({required Color color}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 6),
        Container(
          height: 4,
          color: color,
        ),
      ],
    );
  }
}

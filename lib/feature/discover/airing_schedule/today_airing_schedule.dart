import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/schedule_page_state.dart';
import 'package:aniflow/feature/discover/airing_schedule/dummy_schedule_category_data.dart';
import 'package:aniflow/feature/discover/airing_schedule/today_airing_schedule_bloc.dart';
import 'package:aniflow/feature/discover/airing_schedule/today_airing_schedule_state.dart';
import 'package:aniflow/feature/discover/birthday_characters/birthday_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TodayAiringScheduleBlocProvider extends StatelessWidget {
  const TodayAiringScheduleBlocProvider({super.key, required this.userId});

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey('TodayAiringScheduleBlocProvider+$userId'),
      create: (BuildContext context) =>
          GetItScope.of(context).get<TodayAiringScheduleBloc>(param1: userId),
      child: const TodayAiringSchedule(),
    );
  }
}

class TodayAiringSchedule extends StatefulWidget {
  const TodayAiringSchedule({super.key});

  @override
  State<TodayAiringSchedule> createState() => _TodayAiringScheduleState();
}

class _TodayAiringScheduleState extends State<TodayAiringSchedule> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    context
        .read<TodayAiringScheduleBloc>()
        .stream
        .firstWhere((state) => state.schedules.isNotEmpty)
        .then((state) {
      final group = state.schedules.toScheduleCategory();
      final initialIndex = group.indexWhere(
            (element) => element.key!.hour > DateTime.now().hour,
          );
      WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
        itemScrollController.jumpTo(
          index: (initialIndex - 1).clamp(0, group.length - 1),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayAiringScheduleBloc, TodayAiringScheduleState>(
      builder: (context, state) {
        final categories = state.schedules.toScheduleCategory();
        final airingSchedules =
            categories.isNotEmpty ? categories : dummyScheduleCategoryData;

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
            SizedBox(
              height: 320,
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: airingSchedules.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(airingSchedules[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildItem(DayScheduleCategoryModel category) {
    // final isFutureSchedule = TimeOfDay.now().hour <= category.key!.hour;
    return _TimeLineItem(category: category);
  }
}

class _TimeLineItem extends StatelessWidget {
  const _TimeLineItem({required this.category});

  final DayScheduleCategoryModel category;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 48),
          child: Row(
            children: category.schedules
                .map((e) => e.mediaModel)
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
                  context.materialLocal.formatTimeOfDay(category.key!),
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
        GetItScope.of(context).get<UserDataRepository>().userTitleLanguage;
    return SizedBox(
      width: 160,
      height: 270,
      child: MediaPreviewItem(
        onClick: () {
          RootRouterDelegate.get().navigateToDetailMedia(media.id);
        },
        coverImage: media.coverImage?.extraLarge ?? '',
        titleVerticalPadding: 5,
        isFollowing: media.isFollowing,
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

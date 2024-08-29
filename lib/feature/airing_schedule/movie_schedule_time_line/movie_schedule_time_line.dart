import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/airing_media_item.dart';
import 'package:aniflow/feature/airing_schedule/movie_schedule_time_line/movie_schedule_time_line_bloc.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MovieScheduleTimeLine extends StatelessWidget {
  const MovieScheduleTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieScheduleTimeLineBlocProvider();
  }
}

class MovieScheduleTimeLineBlocProvider extends StatelessWidget {
  const MovieScheduleTimeLineBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetItScope.of(context).get<MovieScheduleTimeLineBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.appLocal.movieSchedule),
        ),
        body: const MovieScheduleTimeContent(),
      ),
    );
  }
}

class MovieScheduleTimeContent extends StatefulWidget {
  const MovieScheduleTimeContent({super.key});

  @override
  State<MovieScheduleTimeContent> createState() =>
      _MovieScheduleTimeContentState();
}

class _MovieScheduleTimeContentState extends State<MovieScheduleTimeContent> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    context
        .read<MovieScheduleTimeLineBloc>()
        .stream
        .firstWhere((state) => state.categories.isNotEmpty)
        .then((state) {
      final group = state.categories;
      final initialIndex = group.indexWhere(
            (element) => element.key!.month > DateTime.now().month,
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
    return BlocBuilder<MovieScheduleTimeLineBloc, MovieScheduleState>(
      builder: (context, state) {
        final categories = state.categories;
        return ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return TimeLineItem<DateTime, MediaModel>(
              category: category,
              onBuildItem: (media) {
                final userTitleLanguage =
                    GetIt.instance.get<UserDataRepository>().userTitleLanguage;
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, left: 16.0, right: 8.0),
                  child: AiringMediaItem(
                    model: media,
                    userTitleLanguage: userTitleLanguage,
                    description: media.getStartDateDescription(context),
                    onClick: () {
                      RootRouterDelegate.get().navigateToDetailMedia(media.id);
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/airing_media_item.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/airing_schedule/movie_schedule_time_line/movie_schedule_time_line_bloc.dart';
import 'package:aniflow/feature/airing_schedule/schedule_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
          GetIt.instance.get<MovieScheduleTimeLineBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.appLocal.movieSchedule),
        ),
        body: const MovieScheduleTimeContent(),
      ),
    );
  }
}

class MovieScheduleTimeContent extends StatelessWidget {
  const MovieScheduleTimeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieScheduleTimeLineBloc, MovieScheduleState>(
      builder: (context, state) {
        switch (state) {
          case Loading():
            return const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  LoadingIndicator(isLoading: true),
                ],
              ),
            );
          case Ready():
            final categories = state.categories;
            return CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return TimeLineItem<DateTime, MediaModel>(
                      category: category,
                      onBuildItem: (media) {
                        final userTitleLanguage = GetIt.instance
                            .get<UserDataRepository>()
                            .userData
                            .userTitleLanguage;
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2.0, left: 16.0, right: 8.0),
                          child: AiringMediaItem(
                            model: media,
                            userTitleLanguage: userTitleLanguage,
                            description: media.getStartDateDescription(context),
                            onClick: () {
                              RootRouterDelegate.get()
                                  .navigateToDetailMedia(media.id);
                            },
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            );
        }
      },
    );
  }
}

import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/discover/birthday_characters/birthday_character.dart';
import 'package:aniflow/feature/discover/recent_movies/dummy_movies_data.dart';
import 'package:aniflow/feature/discover/recent_movies/recent_movies_bloc.dart';
import 'package:aniflow/feature/discover/recent_movies/recent_movies_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentMoviesBlocProvider extends StatelessWidget {
  const RecentMoviesBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: const ValueKey('recent_movies'),
      create: (context) => GetItScope.of(context).get<RecentMoviesBloc>(),
      child: const RecentMoviesContent(),
    );
  }
}

class RecentMoviesContent extends StatelessWidget {
  const RecentMoviesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentMoviesBloc, RecentMoviesState>(
      builder: (context, state) {
        return RecentMoviesWidget(
          models: state.movies,
          titleLanguage:
              GetItScope.of(context).get<UserDataRepository>().userTitleLanguage,
        );
      },
    );
  }
}

class RecentMoviesWidget extends StatelessWidget {
  const RecentMoviesWidget({
    super.key,
    required this.models,
    required this.titleLanguage,
  });

  final List<MediaModel> models;
  final UserTitleLanguage titleLanguage;

  @override
  Widget build(BuildContext context) {
    final movies = models.isNotEmpty ? models : dummyMoviesData;
    return Column(
      children: [
        CategoryTitleBar(
          title: context.appLocal.recentMovies,
          onMoreClick: () {
            RootRouterDelegate.get()
                .navigateToAiringSchedule(type: ScheduleType.movie);
          },
        ),
        SizedBox(
          height: 450,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.7,
              initialPage: movies.length > 1 ? 1 : 0,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final model = movies[index];
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card.filled(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        RootRouterDelegate.get()
                            .navigateToDetailMedia(model.id);
                      },
                      child: AspectRatio(
                        aspectRatio: 1 / 1.414,
                        child: AFNetworkImage(
                          imageUrl: model.coverImage?.extraLarge ?? '',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Opacity(
                        opacity: 0.7,
                        child: AutoSizeText(
                          model.title?.getTitle(titleLanguage) ?? '',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Opacity(
                        opacity: 0.7,
                        child: model.startDate != null
                            ? AutoSizeText(
                                context.materialLocal
                                    .formatMediumDate(model.startDate!),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

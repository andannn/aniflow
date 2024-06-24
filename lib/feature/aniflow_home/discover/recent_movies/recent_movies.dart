import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_character.dart';
import 'package:aniflow/feature/aniflow_home/discover/recent_movies/recent_movies_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/recent_movies/recent_movies_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RecentMoviesBlocProvider extends StatelessWidget {
  const RecentMoviesBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: const ValueKey('recent_movies'),
      create: (context) => GetIt.instance.get<RecentMoviesBloc>(),
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
          titleLanguage: GetIt.instance
              .get<UserDataRepository>()
              .userData
              .userTitleLanguage,
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
    return AnimatedScaleSwitcher(
      visible: models.isNotEmpty,
      builder: () => Column(
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
                initialPage: models.length > 1 ? 1 : 0,
              ),
              itemCount: models.length,
              itemBuilder: (context, index) {
                final model = models[index];
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
                          child: AutoSizeText(
                            context.materialLocal
                                .formatMediumDate(model.startDate!),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

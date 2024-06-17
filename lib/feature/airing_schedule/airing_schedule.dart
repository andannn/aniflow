import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/airing_schedule_of_day.dart';
import 'package:aniflow/feature/airing_schedule/movie_schedule_time_line/movie_schedule_time_line.dart';
import 'package:flutter/material.dart';

enum ScheduleType {
  bangumi,
  movie;

  ScheduleType toggle() =>
      this == ScheduleType.bangumi ? ScheduleType.movie : ScheduleType.bangumi;
}

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
    with ShowSnackBarMixin {
  var _selectedBangumi = ScheduleType.bangumi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedBangumi = _selectedBangumi.toggle();
          });
        },
        child: _selectedBangumi == ScheduleType.bangumi
            ? const Icon(Icons.palette_rounded)
            : const Icon(Icons.local_movies),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => switch (_selectedBangumi) {
        ScheduleType.bangumi => const AiringScheduleOfDayPage(),
        ScheduleType.movie => const MovieScheduleTimeLine(),
      };
}

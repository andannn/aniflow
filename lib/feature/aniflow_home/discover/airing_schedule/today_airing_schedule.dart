import 'package:aniflow/feature/airing_schedule/schedule_page_state.dart';
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule_state.dart';
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

        return Column(
          children: categories.map((e) => Card(
            child: Text(e.toString()),
          )).toList(),
        );
      }
    );
  }
}

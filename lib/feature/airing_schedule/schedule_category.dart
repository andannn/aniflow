import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ScheduleCategoryModel<K, V> extends Equatable {
  final K? key;
  final List<V> schedules;

  const ScheduleCategoryModel(this.key, this.schedules);

  @override
  List<Object?> get props => [key, schedules];

  ScheduleCategoryModel<K, V> appendValue(V value);

  String translatedTitle(BuildContext context);
}

class TimeLineItem<K, V> extends StatelessWidget {
  const TimeLineItem(
      {super.key, required this.category, required this.onBuildItem});

  final ScheduleCategoryModel<K, V> category;
  final Widget Function(V) onBuildItem;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
                category.translatedTitle(context),
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
                itemCount: category.schedules.length,
                itemBuilder: (BuildContext context, int index) {
                  return onBuildItem(category.schedules[index]);
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

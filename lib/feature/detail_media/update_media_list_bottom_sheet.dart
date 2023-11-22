import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/date_time_button.dart';
import 'package:aniflow/core/design_system/widget/max_limit_text_filed.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter/material.dart';

class StatusModel {
  StatusModel({required this.status, required this.label, required this.icon});

  final MediaListStatus? status;
  final String label;
  final IconData icon;
}

Future showUpdateMediaListBottomSheet(BuildContext context,
        {required MediaModel media, MediaListItemModel? listItemModel}) =>
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        builder: (BuildContext context) {
          return UpdateMediaListBottomSheet(
            mediaListItem: listItemModel,
            mediaModel: media,
          );
        });

class UpdateMediaListBottomSheet extends StatefulWidget {
  const UpdateMediaListBottomSheet(
      {super.key, required this.mediaModel, this.mediaListItem});

  final MediaListItemModel? mediaListItem;
  final MediaModel mediaModel;

  @override
  State<UpdateMediaListBottomSheet> createState() =>
      _UpdateMediaListBottomSheetState();
}

class _UpdateMediaListBottomSheetState
    extends State<UpdateMediaListBottomSheet> {
  int? score;
  int? progress;
  int? progressVolumes;
  MediaListStatus? status;
  String? notes;
  DateTime? startedAt;
  DateTime? completedAt;

  final List<StatusModel> statusModels = [
    ...MediaListStatus.values.map(
      (e) => StatusModel(
        status: e,
        label: e.stateString,
        icon: e.statusIcon,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    score = widget.mediaListItem?.score;
    progress = widget.mediaListItem?.progress;
    status = widget.mediaListItem?.status;
    notes = widget.mediaListItem?.notes;
    progressVolumes = widget.mediaListItem?.progressVolumes;
    startedAt = widget.mediaListItem?.startedAt;
    completedAt = widget.mediaListItem?.completedAt;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildLabelWithChild({required Widget child, required String label}) {
      final colorScheme = Theme.of(context).colorScheme;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: colorScheme.primary),
            ),
            const SizedBox(width: 24),
            child,
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        _buildTopBarSection(context),
        const Divider(),
        const SizedBox(height: 16),
        buildLabelWithChild(
          label: 'Status',
          child: DropdownButton(
            value: status,
            isExpanded: true,
            hint: const Text('Status'),
            iconSize: 0,
            items: statusModels
                .map(
                  (e) => DropdownMenuItem(
                    value: e.status,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(e.icon),
                          const SizedBox(width: 8),
                          Text(e.label),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (status) {
              setState(() {
                this.status = status;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        buildLabelWithChild(label: 'Score', child: const TextField()),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: buildLabelWithChild(
                label: 'Progress',
                child: MaxLimitTextFiled(
                  initialValue: progress ?? 0,
                  maxValue: widget.mediaModel.episodes,
                ),
              ),
            ),
            Expanded(
              child: buildLabelWithChild(
                  label: 'Total Rewatches', child: const TextField()),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: buildLabelWithChild(
                label: 'Start Date',
                child: DateTimeButton(
                  dateTime: startedAt,
                  onDateTimeChanged: (time) {
                    setState(() {
                      startedAt = time;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: buildLabelWithChild(
                label: 'Finish Date',
                child: DateTimeButton(
                  dateTime: completedAt,
                  onDateTimeChanged: (time) {
                    setState(() {
                      completedAt = time;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        buildLabelWithChild(
          label: 'Notes',
          child: TextFormField(
            initialValue: notes,
            onChanged: (text) {
              notes = text;
            },
          ),
        ),
        const SizedBox(height: 8),
        _buildControlSection(context),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTopBarSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MediaRowItem(
        model: widget.mediaModel,
        language: AniFlowPreferences().getAniListSettings().userTitleLanguage,
      ),
    );
  }

  Widget _buildControlSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: const Text('Apply'),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

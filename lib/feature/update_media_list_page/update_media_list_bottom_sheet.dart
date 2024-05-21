import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/dialog/scoring_dialog.dart';
import 'package:aniflow/core/design_system/widget/date_time_button.dart';
import 'package:aniflow/core/design_system/widget/max_limit_text_filed.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:aniflow/feature/image_preview/image_preview.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';

class MediaListModifyResult {
  MediaListModifyResult({
    required this.score,
    required this.progress,
    required this.progressVolumes,
    required this.repeat,
    required this.status,
    required this.notes,
    required this.startedAt,
    required this.completedAt,
    this.private = false,
  });

  final double? score;
  final int? progress;
  final int? progressVolumes;
  final int? repeat;
  final MediaListStatus? status;
  final String? notes;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final bool private;
}

class StatusModel {
  StatusModel({required this.status, required this.label, required this.icon});

  final MediaListStatus? status;
  final String label;
  final IconData icon;
}

class UpdateMediaListPage extends Page<MediaListModifyResult> {
  final String mediaListId;

  const UpdateMediaListPage({required this.mediaListId, super.key});

  @override
  Route<MediaListModifyResult> createRoute(BuildContext context) {
    return UpdateMediaListRoute(settings: this, mediaListId: mediaListId);
  }
}

class UpdateMediaListRoute extends PageRoute<MediaListModifyResult>
    with MaterialRouteTransitionMixin<MediaListModifyResult> {
  final String mediaListId;

  UpdateMediaListRoute({required this.mediaListId, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MediaListFutureBuilder(mediaListId: mediaListId),
    );
  }

  @override
  bool get maintainState => true;
}

const mediaListUpdatePageHeroTag = 'media_list_update_page_hero_tag';

class MediaListFutureBuilder extends StatelessWidget {
  const MediaListFutureBuilder({super.key, required this.mediaListId});

  final String mediaListId;

  @override
  Widget build(BuildContext context) {
    final mediaListRepo = getIt.get<MediaListRepository>();
    final userDataRepo = getIt.get<UserDataRepository>();

    return FutureBuilder(
      future: mediaListRepo.getMediaListItemByMediaId(mediaListId: mediaListId),
      builder:
          (BuildContext context, AsyncSnapshot<MediaListItemModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final mediaListItem = snapshot.data;
          final mediaModel = mediaListItem?.animeModel;
          if (mediaListItem != null && mediaModel != null) {
            final scoreFormat = userDataRepo.userData.scoreFormat;
            final userTitleLanguage = userDataRepo.userData.userTitleLanguage;
            return UpdateMediaListBottomWidget(
              mediaModel: mediaModel,
              mediaListItem: mediaListItem,
              scoreFormat: scoreFormat,
              userTitleLanguage: userTitleLanguage,
            );
          } else {
            return Scaffold(body: const SizedBox());
          }
        } else {
          return Scaffold(body: const SizedBox());
        }
      },
    );
  }
}

class UpdateMediaListBottomWidget extends StatefulWidget {
  const UpdateMediaListBottomWidget(
      {super.key,
      required this.mediaModel,
      this.mediaListItem,
      required this.scoreFormat,
      required this.userTitleLanguage});

  final MediaListItemModel? mediaListItem;
  final MediaModel mediaModel;
  final ScoreFormat scoreFormat;
  final UserTitleLanguage userTitleLanguage;

  @override
  State<UpdateMediaListBottomWidget> createState() =>
      _UpdateMediaListBottomWidgetState();
}

class _UpdateMediaListBottomWidgetState
    extends State<UpdateMediaListBottomWidget> {
  double? score;
  int? progress;
  int? progressVolumes;
  int? repeat;
  MediaListStatus? status;
  String? notes;
  DateTime? startedAt;
  DateTime? completedAt;
  bool private = false;
  late ScoreFormat scoreFormat;
  late UserTitleLanguage userTitleLanguage;

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

    scoreFormat = widget.scoreFormat;
    userTitleLanguage = widget.userTitleLanguage;
    score = widget.mediaListItem?.score;
    progress = widget.mediaListItem?.progress;
    repeat = widget.mediaListItem?.repeat;
    status = widget.mediaListItem?.status;
    notes = widget.mediaListItem?.notes;
    progressVolumes = widget.mediaListItem?.progressVolumes;
    startedAt = widget.mediaListItem?.startedAt;
    completedAt = widget.mediaListItem?.completedAt;
    private = widget.mediaListItem?.private ?? false;
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
                  ?.copyWith(color: colorScheme.tertiary),
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
        Row(
          children: [
            Expanded(
              child: buildLabelWithChild(
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
            ),
            const Expanded(child: SizedBox())
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: buildLabelWithChild(
                label: 'Score',
                child: ScoringWidget(
                  format: scoreFormat,
                  score: score ?? 0,
                  onScoreChanged: (value) {
                    setState(() {
                      score = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: buildLabelWithChild(
                label: 'Progress',
                child: Builder(
                  builder: (context) {
                    final maxValue = widget.mediaModel.episodes;
                    final suffix =
                        maxValue != null ? '/${maxValue.toString()}' : '/?';
                    return MaxLimitTextFiled(
                      initialValue: progress ?? 0,
                      maxValue: maxValue,
                      suffixText: suffix,
                      onValueApplied: (value) {
                        progress = value;
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: buildLabelWithChild(
                label: 'Total Rewatches',
                child: MaxLimitTextFiled(
                  initialValue: repeat ?? 0,
                  onValueApplied: (value) {
                    repeat = value;
                  },
                ),
              ),
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
        language: userTitleLanguage,
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
            final result = MediaListModifyResult(
              score: score,
              progress: progress,
              progressVolumes: progressVolumes,
              repeat: repeat,
              status: status,
              notes: notes,
              startedAt: startedAt,
              completedAt: completedAt,
              private: private,
            );
            Navigator.of(context).pop(result);
          },
          child: const Text('Apply'),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class ScoringWidget extends StatelessWidget {
  const ScoringWidget(
      {super.key,
      required this.format,
      required this.score,
      required this.onScoreChanged});

  final ScoreFormat format;
  final double score;
  final Function(double) onScoreChanged;

  @override
  Widget build(BuildContext context) {
    String scoreString;
    switch (format) {
      case ScoreFormat.point5:
        scoreString = '${score.toInt()}/5';
      case ScoreFormat.point3:
        scoreString = '${score.toInt()}/3';
      case ScoreFormat.point10Decimal:
        scoreString = '${score.toStringAsFixed(1)}/10';
      case ScoreFormat.point100:
        scoreString = '${score.toInt()}/100';
      case ScoreFormat.point10:
        scoreString = '${score.toInt()}/10';
    }

    void showScoreModifyDialog() async {
      final result = await showScoringDialog(context, format, score);

      if (result != null && result != score) {
        onScoreChanged.call(result);
      }
    }

    Widget buildScoreValueContent() {
      switch (format) {
        case ScoreFormat.point5:
          return TextButton.icon(
            onPressed: showScoreModifyDialog,
            label: Text(scoreString),
            icon: _buildStartScoreRow(),
          );
        case ScoreFormat.point3:
          return TextButton.icon(
            onPressed: showScoreModifyDialog,
            label: Text(scoreString),
            icon: _buildFaceScoreRow(),
          );
        case ScoreFormat.point10Decimal:
        case ScoreFormat.point100:
        case ScoreFormat.point10:
          return TextButton.icon(
            onPressed: showScoreModifyDialog,
            label: Text(scoreString),
            icon: const Icon(Icons.rate_review),
          );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: buildScoreValueContent(),
    );
  }

  Widget _buildStartScoreRow() {
    final fullStartCount = score.toInt();
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          if (i < fullStartCount)
            const Icon(Icons.star)
          else
            const Icon(Icons.star_border_outlined)
      ],
    );
  }

  Widget _buildFaceScoreRow() {
    final scoreInt = score.toInt();
    return switch (scoreInt) {
      1 => const Icon(Icons.mood_bad),
      2 => const Icon(Icons.face),
      3 => const Icon(Icons.mood),
      _ => const SizedBox(),
    };
  }
}

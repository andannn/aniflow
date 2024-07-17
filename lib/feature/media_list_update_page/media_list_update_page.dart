import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/dialog/scoring_dialog.dart';
import 'package:aniflow/core/design_system/widget/date_time_button.dart';
import 'package:aniflow/core/design_system/widget/max_limit_text_filed.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_bloc.dart';
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_page_state.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_modify_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class StatusModel {
  StatusModel({required this.status, required this.label, required this.icon});

  final MediaListStatus? status;
  final String label;
  final IconData icon;
}

class UpdateMediaListPage extends Page<MediaListModifyResult> {
  final String mediaId;

  const UpdateMediaListPage({required this.mediaId, super.key});

  @override
  Route<MediaListModifyResult> createRoute(BuildContext context) {
    return MediaListUpdateRoute(settings: this, mediaId: mediaId);
  }
}

class MediaListUpdateRoute extends PageRoute<MediaListModifyResult>
    with MaterialRouteTransitionMixin<MediaListModifyResult> {
  final String mediaId;

  MediaListUpdateRoute({required this.mediaId, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance.get<MediaListUpdateBloc>(param1: mediaId),
      child: const MediaListUpdatePageContent(),
    );
  }

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

const mediaListUpdatePageHeroTag = 'media_list_update_page_hero_tag';

class MediaListUpdatePageContent extends StatelessWidget {
  const MediaListUpdatePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaListUpdateBloc, MediaListUpdatePageState>(
        builder: (context, state) {
      final mediaModel = state.mediaWithListModel?.mediaModel;
      final mediaListItem = state.mediaWithListModel?.mediaListModel;
      if (mediaModel == null) {
        return const Hero(
          tag: mediaListUpdatePageHeroTag,
          child: SizedBox(),
        );
      }

      final userDataRepo = GetIt.instance.get<UserDataRepository>();
      final scoreFormat = userDataRepo.scoreFormat;
      final userTitleLanguage = userDataRepo.userTitleLanguage;

      return GestureDetector(
        onTap: () {
          RootRouterDelegate.get().popBackStack();
        },
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).colorScheme.surfaceDim.withAlpha(200),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Hero(
                    tag: mediaListUpdatePageHeroTag,
                    child: GestureDetector(
                      // intercept click event of the children
                      onTap: () {},
                      child: Card(
                        child: UpdateMediaListBottomWidget(
                          mediaModel: mediaModel,
                          mediaListItem: mediaListItem,
                          scoreFormat: scoreFormat,
                          userTitleLanguage: userTitleLanguage,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
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

  List<StatusModel> getStatusModels(BuildContext context) => [
    ...MediaListStatus.values.map(
      (e) => StatusModel(
        status: e,
        label: e.translated(context),
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
                label: context.appLocal.status,
                child: DropdownButton(
                  value: status,
                  isExpanded: true,
                  hint: Text(context.appLocal.status),
                  iconSize: 0,
                  items: getStatusModels(context)
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
                label: context.appLocal.scoring,
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
                label: context.appLocal.progress,
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
                label: context.appLocal.totalRewatches,
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
                label: context.appLocal.startDate,
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
                label: context.appLocal.finishDate,
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
          label: context.appLocal.notes,
          child: TextFormField(
            initialValue: notes,
            onChanged: (text) {
              notes = text;
            },
          ),
        ),
        const SizedBox(height: 8),
        _buildControlSection(context),
        const SizedBox(height: 16),
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
          child: Text(context.materialLocal.cancelButtonLabel),
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
          child: Text(context.materialLocal.okButtonLabel),
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

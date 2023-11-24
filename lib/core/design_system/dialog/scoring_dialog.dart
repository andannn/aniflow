import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Future<double?> showScoringDialog(
  BuildContext context,
  ScoreFormat format,
  double initialScore,
) =>
    showDialog(
      context: context,
      builder: (context) {
        var currentScore = initialScore;

        void onScoreChanged(double score) {
          currentScore = score;
        }

        Widget buildScoringSelectionWidget() {
          switch (format) {
            case ScoreFormat.point100:
              return ScoringSlider(
                initialValue: initialScore,
                maximum: 100.0,
                divisions: 100,
                fractionDigits: 0,
                onScoreChanged: onScoreChanged,
              );
            case ScoreFormat.point10:
              return ScoringSlider(
                initialValue: initialScore,
                maximum: 10.0,
                divisions: 10,
                fractionDigits: 0,
                onScoreChanged: onScoreChanged,
              );
            case ScoreFormat.point10Decimal:
              return ScoringSlider(
                initialValue: initialScore,
                maximum: 10.0,
                divisions: 100,
                fractionDigits: 1,
                onScoreChanged: onScoreChanged,
              );
            case ScoreFormat.point5:
              return RatingBar.builder(
                initialRating: initialScore,
                maxRating: 5,
                itemCount: 5,
                onRatingUpdate: (double value) {
                  onScoreChanged.call(value);
                },
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              );
            case ScoreFormat.point3:
              return Wrap(
                children: [
                  Center(
                    child: ScorePicker(
                      score: initialScore.toInt(),
                      itemCount: 3,
                      onScoreChanged: (value) {
                        onScoreChanged.call(value.toDouble());
                      },
                      itemBuilder: (BuildContext context, int index) {
                        IconData? icon() {
                          return switch (index) {
                            1 => Icons.mood_bad,
                            2 => Icons.face,
                            3 => Icons.mood,
                            _ => null,
                          };
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(icon(), size: 48),
                        );
                      },
                    ),
                  ),
                ],
              );
          }
        }

        final localization = Localizations.of<MaterialLocalizations>(
            context, MaterialLocalizations)!;
        return AlertDialog(
          title: const Text('Scoring'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildScoringSelectionWidget(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(currentScore);
              },
              child: Text(localization.okButtonLabel),
            )
          ],
        );
      },
    );

class ScoringSlider extends StatefulWidget {
  const ScoringSlider(
      {super.key,
      required this.initialValue,
      required this.maximum,
      required this.divisions,
      required this.fractionDigits,
      required this.onScoreChanged});

  final double initialValue;
  final double maximum;
  final int divisions;
  final int fractionDigits;
  final Function(double) onScoreChanged;

  @override
  State<ScoringSlider> createState() => _ScoringSliderState();
}

class _ScoringSliderState extends State<ScoringSlider> {
  late double value;

  @override
  void initState() {
    super.initState();

    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          value: value,
          max: widget.maximum,
          divisions: widget.divisions,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
            widget.onScoreChanged.call(newValue);
          },
        ),
        Text(
          value.toStringAsFixed(widget.fractionDigits),
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}

class ScorePicker extends StatefulWidget {
  const ScorePicker(
      {super.key,
      required this.itemBuilder,
      required this.score,
      required this.onScoreChanged,
      required this.itemCount});

  final int score;
  final int itemCount;
  final Function(int score) onScoreChanged;
  final Function(BuildContext context, int index) itemBuilder;

  @override
  State<ScorePicker> createState() => _ScorePickerState();
}

class _ScorePickerState extends State<ScorePicker> {

  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.score;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= widget.itemCount; i++)
          InkWell(
            onTap: () {
              setState(() {
                score = i;
              });

              widget.onScoreChanged.call(i);
            },
            customBorder: const StadiumBorder(),
            child: Opacity(
              opacity: i == score ? 1 : 0.5,
              child: widget.itemBuilder.call(context, i),
            ),
          )
      ],
    );
  }
}

import 'package:anime_tracker/core/design_system/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterHashtagWidget extends StatelessWidget {
  const TwitterHashtagWidget(
      {required this.hashtag, super.key});

  final String hashtag;

  String get _hashtagSuffix => hashtag.substring(1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse(
            'https://twitter.com/hashtag/$_hashtagSuffix?src=hashtag_click');

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Baseline(
        baseline: 15,
        baselineType: TextBaseline.alphabetic,
        child: Text(
          hashtag,
          style: const TextStyle(color: hashtagColor, fontSize: 17),
        ),
      ),
    );
  }
}

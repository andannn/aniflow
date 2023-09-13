import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_error_widget.dart';

class AnimePreviewItem extends StatelessWidget {
  const AnimePreviewItem(
      {required this.model,
      required this.onClick,
      super.key,
      this.width,
      this.textStyle});

  final ShortcutAnimeModel model;
  final VoidCallback onClick;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          width: width,
          child: Column(children: [
            AspectRatio(
              aspectRatio: 3.0 / 4,
              child: CachedNetworkImage(
                imageUrl: model.coverImage,
                fit: BoxFit.cover,
                errorWidget: buildErrorWidget,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    getLocalTitle(context, model.title!),
                    textAlign: TextAlign.center,
                    style: textStyle?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String getLocalTitle(BuildContext context, AnimeTitle title) {
    final appLocale = Localizations.localeOf(context);
    switch (appLocale.languageCode) {
      case 'Jpan':
      case 'ja':
      case 'zh':
        return title.native;
      default:
        return title.english.isNotEmpty ? title.english : title.romaji;
    }
  }
}

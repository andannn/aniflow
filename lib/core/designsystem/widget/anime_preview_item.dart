import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimePreviewItem extends StatelessWidget {
  const AnimePreviewItem(
      {super.key, required this.model, required this.onClick, this.width});

  final ShortcutAnimeModel model;
  final VoidCallback onClick;
  final double? width;

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
                errorWidget: _buildErrorWidget,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  getLocalTitle(context, model.title!),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  maxLines: 2,
                  softWrap: true,
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

  Widget _buildErrorWidget(BuildContext context, String url, error) {
    return Center(
      child: Opacity(
        opacity: 0.5,
        child: Icon(Icons.error, color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}

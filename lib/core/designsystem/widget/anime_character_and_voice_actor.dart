import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_error_widget.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_initial_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterAndVoiceActor extends StatelessWidget {
  const CharacterAndVoiceActor(
      {required this.model,
      super.key,
      this.textStyle,
      this.onCharacterTap,
      this.onVoiceActorTop});

  final CharacterAndVoiceActorModel model;
  final VoidCallback? onCharacterTap;
  final VoidCallback? onVoiceActorTop;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final style = textStyle?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant);
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: onCharacterTap,
            child: AspectRatio(
              aspectRatio: 3.0 / 4,
              child: CachedNetworkImage(
                imageUrl: model.characterModel.image,
                fit: BoxFit.cover,
                placeholder: buildImageInitialWidget,
                errorWidget: buildErrorWidget,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.characterModel.nameNative, style: style),
                  const Expanded(flex: 1, child: SizedBox()),
                  Text('Main', style: style),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(model.voiceActorModel.nameNative, style: style),
                  const Expanded(flex: 1, child: SizedBox()),
                  Text('Japanese', style: style),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onVoiceActorTop,
            child: AspectRatio(
              aspectRatio: 3.0 / 4,
              child: CachedNetworkImage(
                imageUrl: model.voiceActorModel.image,
                fit: BoxFit.cover,
                placeholder: buildImageInitialWidget,
                errorWidget: buildErrorWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

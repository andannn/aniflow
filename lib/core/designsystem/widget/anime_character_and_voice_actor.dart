import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_error_widget.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_initial_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterAndVoiceActor extends StatelessWidget {
  const CharacterAndVoiceActor({required this.model, super.key});

  final CharacterAndVoiceActorModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CachedNetworkImage(
            imageUrl: model.characterModel.image,
            fit: BoxFit.cover,
            placeholder: buildImageInitialWidget,
            errorWidget: buildErrorWidget,
          ),
          const Expanded(flex: 1, child: SizedBox()),
          CachedNetworkImage(
            imageUrl: model.voiceActorModel.image,
            fit: BoxFit.cover,
            placeholder: buildImageInitialWidget,
            errorWidget: buildErrorWidget,
          ),
        ],
      ),
    );
  }
}

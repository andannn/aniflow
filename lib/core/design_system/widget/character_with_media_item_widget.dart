import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class CharacterWithMediaItemWidget extends StatelessWidget {
  const CharacterWithMediaItemWidget({
    super.key,
    required this.onCharacterClick,
    required this.onMediaClick,
    required this.character,
    this.media,
  });

  final CharacterModel character;
  final MediaModel? media;
  final Function(String id) onCharacterClick;
  final Function(String id) onMediaClick;

  @override
  Widget build(BuildContext context) {
    const borderColor = Colors.white;
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onCharacterClick.call(character.id),
        child: AspectRatio(
          aspectRatio: 3.0 / 4,
          child: Stack(
            children: [
              SizedBox.expand(
                child: AFNetworkImage(
                  imageUrl: character.largeImage,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: media != null
                    ? InkWell(
                        onTap: () => onMediaClick.call(media!.id),
                        child: SizedBox(
                          width: 50,
                          child: AspectRatio(
                            aspectRatio: 4.0 / 5,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: borderColor,
                                    width: 2,
                                    strokeAlign: 1.0,
                                  ),
                                  left: BorderSide(
                                    color: borderColor,
                                    width: 2,
                                    strokeAlign: 1.0,
                                  ),
                                ),
                                borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(15),
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: AFNetworkImage(
                                imageUrl: media?.coverImage?.medium ?? '',
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

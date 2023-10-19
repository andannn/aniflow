import 'package:aniflow/core/data/model/trailter_model.dart';
import 'package:aniflow/core/design_system/icons/icons.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class TrailerPreview extends StatelessWidget {
  const TrailerPreview(
      {required this.model, required this.onTrailerClick, super.key});

  final TrailerModel? model;
  final VoidCallback onTrailerClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTrailerClick,
        child: AspectRatio(
          aspectRatio: 16 / 9.0,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AFNetworkImage(
                imageUrl: model?.thumbnail ?? '',
              ),
              Center(
                child: SvgPicture.asset(ATIcons.icYoutube),
              )
            ],
          ),
        ),
      ),
    );
  }
}

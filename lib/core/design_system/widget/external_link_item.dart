import 'package:aniflow/core/common/util/color_util.dart';
import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkItem extends StatelessWidget {
  const ExternalLinkItem({super.key, required this.externalLink});

  final MediaExternalLinkModel externalLink;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final url = Uri.parse(externalLink.url);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      icon: externalLink.icon.isNotEmpty
          ? Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: ColorUtil.parseColor(externalLink.color),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AFNetworkImage(imageUrl: externalLink.icon),
        ),
      )
          : const SizedBox(),
      label: Text(externalLink.site),
    );
  }
}

import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

const _bannerHeight = 160.0;
const _userIconSize = 70.0;

enum ImageType { avatar, banner }

enum ChoosePhotoOption {
  camera(label: 'Take from camera'),
  album(label: 'Choose from album');

  final String label;

  const ChoosePhotoOption({required this.label});
}

class EditProfile extends Page {
  const EditProfile({super.key});

  @override
  Route createRoute(BuildContext context) {
    return EditProfileRoute(settings: this);
  }
}

class EditProfileRoute extends PageRoute with MaterialRouteTransitionMixin {
  EditProfileRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetIt.instance.get<EditProfileBloc>(),
      child: const _EditProfileContent(),
    );
  }

  @override
  bool get maintainState => false;
}

class _EditProfileContent extends StatelessWidget {
  const _EditProfileContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
        ),
        body: CustomScrollView(
          slivers: [
            _buildBannerAndUserIcon(context, state.userModel, (type) async {
              final option = await showDialog<ChoosePhotoOption>(
                  context: context, builder: _buildDialog);

              if (option != null) {
                final XFile? file;
                switch (option) {
                  case ChoosePhotoOption.camera:
                    file = await ImagePicker()
                        .pickImage(source: ImageSource.camera);

                    break;
                  case ChoosePhotoOption.album:
                    file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    break;
                }

                if (file != null) {
                }
              }
            })
          ],
        ),
      );
    });
  }

  Widget _buildBannerAndUserIcon(
    BuildContext context,
    UserModel? userModel,
    Function(ImageType type) onImageClick,
  ) {
    final bannerUrl = userModel?.bannerImage;
    final userIconUrl = userModel?.avatar;

    Widget buildCover({required Widget child, onclick}) => Stack(
          fit: StackFit.expand,
          children: [
            child,
            const Align(
              alignment: Alignment.center,
              child: Icon(size: 40, Icons.image_outlined),
            ),
            InkWell(
              onTap: onclick,
              child: Opacity(
                opacity: 0.4,
                child: ColoredBox(
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),
            )
          ],
        );

    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: _bannerHeight + _userIconSize / 2,
        child: Stack(
          children: [
            if (bannerUrl != null)
              SizedBox(
                width: double.infinity,
                height: _bannerHeight,
                child: buildCover(
                    child: AFNetworkImage(imageUrl: bannerUrl),
                    onclick: () {
                      onImageClick.call(ImageType.banner);
                    }),
              ),
            if (userIconUrl != null)
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    width: _userIconSize,
                    height: _userIconSize,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: buildCover(
                        onclick: () {
                          onImageClick.call(ImageType.avatar);
                        },
                        child: AFNetworkImage(
                          imageUrl: userIconUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ChoosePhotoOption.values
              .map((e) => ListTile(
                    title: Text(e.label),
                    onTap: () {
                      Navigator.of(context).pop(e);
                    },
                  ))
              .toList()),
    );
  }
}

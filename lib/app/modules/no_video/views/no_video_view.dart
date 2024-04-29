import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/no_video/controllers/no_video_controller.dart';
import 'package:talentpitch/app/modules/profile/widgets/user_info_label.dart';
import 'package:talentpitch/app/utils/utils.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class NoVideoView extends GetView<NoVideoController> {
  const NoVideoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userPhoto(),
                  const SizedBox(height: 40),
                  _userInfoLabels(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Información del usuario
  _userInfoLabels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfoLabel(
          title: 'Nombre:',
          label: controller.title.value,
        ),
        UserInfoLabel(
          title: 'Descripción:',
          label: controller.subtitle.value,
        ),
        UserInfoLabel(
          title: 'Información adicional:',
          label: controller.label.value,
        ),
      ],
    );
  }

  /// FMuestra la foto del usuario haya cargado o no una
  userPhoto() {
    return Align(
      alignment: Alignment.center,
      child: controller.imageUrl.value != ''
          ? ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: CachedNetworkImage(
                imageUrl: controller.imageUrl.value,
                fit: BoxFit.fill,
                width: 120,
                height: 120,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return LoadingWidget();
                },
              ),
            )
          : Stack(
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Palette.mainColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Palette.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 30,
                      color: Palette.mainColor,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

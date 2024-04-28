import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/profile/controllers/profile_controller.dart';
import 'package:talentpitch/app/modules/profile/widgets/user_info_label.dart';
import 'package:talentpitch/app/utils/palette.dart';
import 'package:talentpitch/app/widgets/widgets.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  userPhoto(),
                  const SizedBox(height: 40),
                  userInfoLabels(),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  userInfoLabels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfoLabel(
          title: 'Nombre:',
          label: controller.user.name! + ' ' + controller.user.lastname!,
        ),
        UserInfoLabel(
          title: 'Correo:',
          label: controller.user.email!,
        ),
      ],
    );
  }

  userPhoto() {
    return Align(
      alignment: Alignment.center,
      child: controller.user.profilePictureUrl != ''
          ? ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: CachedNetworkImage(
                imageUrl: controller.user.profilePictureUrl!,
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

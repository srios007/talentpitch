import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/models/favorite.dart';
import 'package:talentpitch/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:talentpitch/app/routes/app_pages.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
      ),
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Visibility(
                replacement: Center(
                  child: SizedBox(
                    height: Get.height,
                    child: Center(
                      child: Text('Sin favoritos'),
                    ),
                  ),
                ),
                visible: controller.favorites.isNotEmpty,
                child: SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    itemCount: controller.favorites.length,
                    itemBuilder: (context, index) {
                      final request = controller.favorites[index];
                      return _serviceCard(index, request);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _serviceCard(int index, Favorite favorite) {
    return Card(
      child: ListTile(
        title: Text(favorite.name!),
        subtitle: Text(favorite.url!),
        onTap: () {
          Get.toNamed(Routes.VIDEO_PLAYER, arguments: {
            'title': favorite.name,
            'urlVideo': favorite.url,
          });
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            controller.deleteFavorite(index);
          },
        ),
      ),
    );
  }
}

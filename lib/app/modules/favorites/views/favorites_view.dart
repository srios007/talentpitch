import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/favorites/controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.favorites.length.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

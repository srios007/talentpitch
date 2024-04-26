import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/favorites/views/favorites_view.dart';
import 'package:talentpitch/app/modules/home/views/home_view.dart';
import 'package:talentpitch/app/modules/profile/views/profile_view.dart';
import 'package:talentpitch/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:talentpitch/app/utils/utils.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Palette.mainColor,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          currentIndex: controller.currentIndex.value,
          items: [
            bottomNavigationBarCustom(
              label: 'Favoritos',
              icon: Icons.star,
              index: 0,
            ),
            bottomNavigationBarCustom(
              label: 'Inicio',
              icon: Icons.home,
              index: 1,
            ),
            bottomNavigationBarCustom(
              label: 'Perfil',
              icon: Icons.person,
              index: 2,
            ),
          ],
        );
      }),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: <Widget>[
            FavoritesView(),
            HomeView(),
            ProfileView(),
          ],
        );
      }),
    );
  }

  BottomNavigationBarItem bottomNavigationBarCustom({
    required String label,
    required IconData icon,
    required int index,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
        color: controller.currentIndex.value == index
            ? Palette.mainColor
            : Colors.grey,
      ),
    );
  }
}

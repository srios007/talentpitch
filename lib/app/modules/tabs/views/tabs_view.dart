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
            BottomNavigationBarItem(
              label: 'Mis Servicios',
              icon: Icon(
                Icons.my_library_books,
                color: controller.currentIndex.value == 0
                    ? Palette.mainColor
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Inicio',
              icon: Icon(
                Icons.home,
                color: controller.currentIndex.value == 1
                    ? Palette.mainColor
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Ajustes',
              icon: Icon(
                Icons.settings,
                color: controller.currentIndex.value == 2
                    ? Palette.mainColor
                    : Colors.grey,
              ),
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
}
